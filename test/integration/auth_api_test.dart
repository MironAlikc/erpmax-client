import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:erpmax_client/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:erpmax_client/features/auth/data/models/user_model.dart';
import 'package:erpmax_client/features/auth/data/models/tenant_model.dart';
import 'package:erpmax_client/features/auth/data/models/user_tenant_model.dart';
import 'package:erpmax_client/features/auth/data/models/user_with_tenants_model.dart';
import 'package:erpmax_client/features/auth/data/models/switch_tenant_response_model.dart';
import 'config/test_config.dart';
import 'helpers/test_client.dart';
import 'helpers/test_helpers.dart';

void main() {
  late TestClient testClient;
  late AuthRemoteDataSource authDataSource;
  String? testAccessToken;
  String? testRefreshToken;
  String? testUserId;

  setUpAll(() {
    testClient = TestClient();
    authDataSource = AuthRemoteDataSource(testClient.client);
  });

  tearDownAll(() async {
    if (!TestConfig.skipCleanup) {
      await testClient.clearTokens();
    }
  });

  group('Auth API Integration Tests', () {
    test('POST /auth/register - should register new user successfully', () async {
      logTestStep('Testing user registration');

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final uniqueEmail = 'test_$timestamp@example.com';

      logTestInfo(
        'Request data: email=$uniqueEmail, password=${TestConfig.testPassword}, full_name=${TestConfig.testFullName}, company_name=${TestConfig.testCompanyName}',
      );

      try {
        final response = await authDataSource.register({
          'email': uniqueEmail,
          'password': TestConfig.testPassword,
          'full_name': TestConfig.testFullName,
          'company_name': TestConfig.testCompanyName,
        });

        logTestInfo(
          'Registration response status: ${response.response.statusCode}',
        );
        logTestInfo('Response data type: ${response.data.runtimeType}');
        logTestInfo('Response data: ${response.data}');

        expect(response.response.statusCode, equals(200));

        final baseResponse = response.data;
        expect(baseResponse.status, equals('success'));
        expect(baseResponse.data, isNotNull);

        final authResponse = baseResponse.data!;

        expectValidToken(authResponse.accessToken);
        expectValidToken(authResponse.refreshToken);

        testAccessToken = authResponse.accessToken;
        testRefreshToken = authResponse.refreshToken;

        expect(authResponse.user, isA<UserModel>());
        expectValidId(authResponse.user.id);
        expectValidEmail(authResponse.user.email);
        expect(authResponse.user.email, equals(uniqueEmail));
        expect(authResponse.user.fullName, equals(TestConfig.testFullName));
        expect(authResponse.user.isActive, isTrue);
        expectValidDateTime(authResponse.user.createdAt);
        expectValidDateTime(authResponse.user.updatedAt);

        testUserId = authResponse.user.id;

        expect(authResponse.tenants, isA<List<UserTenantModel>>());
        expect(authResponse.tenants, isNotEmpty);

        final firstTenant = authResponse.tenants.first;
        expectValidId(firstTenant.tenantId);
        expect(firstTenant.tenantName, isNotEmpty);
        expect(firstTenant.role, isNotEmpty);

        expect(authResponse.currentTenant, isA<TenantModel>());
        expectValidId(authResponse.currentTenant.id);
        expect(authResponse.currentTenant.name, isNotEmpty);
        expect(authResponse.currentTenant.slug, isNotEmpty);
        expectValidDateTime(authResponse.currentTenant.createdAt);
        expectValidDateTime(authResponse.currentTenant.updatedAt);

        final userEntity = authResponse.user.toEntity();
        expect(userEntity.id, equals(authResponse.user.id));
        expect(userEntity.email, equals(authResponse.user.email));
        expect(userEntity.fullName, equals(authResponse.user.fullName));

        final tenantEntity = authResponse.currentTenant.toEntity();
        expect(tenantEntity.id, equals(authResponse.currentTenant.id));
        expect(tenantEntity.name, equals(authResponse.currentTenant.name));

        logTestInfo('User registered successfully with ID: $testUserId');
      } catch (e) {
        if (e is DioException) {
          logTestError('DioException: ${e.type}');
          logTestError('Status code: ${e.response?.statusCode}');
          logTestError('Response data: ${e.response?.data}');
          logTestError('Request data: ${e.requestOptions.data}');
          logTestError('Request headers: ${e.requestOptions.headers}');
          logTestError('Request path: ${e.requestOptions.path}');
        }
        rethrow;
      }
    });

    test('POST /auth/login - should login user successfully', () async {
      logTestStep('Testing user login');

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final loginEmail = 'login_test_$timestamp@example.com';

      await authDataSource.register({
        'email': loginEmail,
        'password': TestConfig.testPassword,
        'full_name': TestConfig.testFullName,
        'company_name': TestConfig.testCompanyName,
      });

      await testClient.clearTokens();

      final response = await authDataSource.login({
        'email': loginEmail,
        'password': TestConfig.testPassword,
      });

      logTestInfo('Login response status: ${response.response.statusCode}');

      expect(response.response.statusCode, equals(200));

      final baseResponse = response.data;
      expect(baseResponse.status, equals('success'));
      expect(baseResponse.data, isNotNull);

      final authResponse = baseResponse.data!;

      expectValidToken(authResponse.accessToken);
      expectValidToken(authResponse.refreshToken);

      expect(authResponse.user.email, equals(loginEmail));
      expect(authResponse.tenants, isNotEmpty);
      expectValidId(authResponse.currentTenant.id);

      await testClient.saveTokens(
        accessToken: authResponse.accessToken,
        refreshToken: authResponse.refreshToken,
      );

      logTestInfo('User logged in successfully');
    });

    test('GET /auth/me - should get current user info', () async {
      logTestStep('Testing get current user');

      if (testAccessToken == null) {
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final email = 'me_test_$timestamp@example.com';

        final registerResponse = await authDataSource.register({
          'email': email,
          'password': TestConfig.testPassword,
          'full_name': TestConfig.testFullName,
          'company_name': TestConfig.testCompanyName,
        });

        final authData = registerResponse.data.data!;
        await testClient.saveTokens(
          accessToken: authData.accessToken,
          refreshToken: authData.refreshToken,
        );
      }

      final response = await authDataSource.getCurrentUser();

      logTestInfo(
        'Get current user response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final userWithTenants = response.data;
      expect(userWithTenants, isA<UserWithTenantsModel>());

      expect(userWithTenants.user, isA<UserModel>());
      expectValidId(userWithTenants.user.id);
      expectValidEmail(userWithTenants.user.email);
      expect(userWithTenants.user.isActive, isTrue);

      expect(userWithTenants.tenants, isA<List<UserTenantModel>>());
      expect(userWithTenants.tenants, isNotEmpty);

      final entity = userWithTenants.toEntity();
      expect(entity.user.id, equals(userWithTenants.user.id));
      expect(entity.tenants.length, equals(userWithTenants.tenants.length));

      logTestInfo('Current user retrieved successfully');
    });

    test('POST /auth/refresh - should refresh access token', () async {
      logTestStep('Testing token refresh');

      if (testRefreshToken == null) {
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final email = 'refresh_test_$timestamp@example.com';

        final registerResponse = await authDataSource.register({
          'email': email,
          'password': TestConfig.testPassword,
          'full_name': TestConfig.testFullName,
          'company_name': TestConfig.testCompanyName,
        });

        testRefreshToken = registerResponse.data.data!.refreshToken;
      }

      final response = await authDataSource.refreshToken({
        'refresh_token': testRefreshToken,
      });

      logTestInfo(
        'Refresh token response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final authResponse = response.data;
      expectValidToken(authResponse.accessToken);
      expectValidToken(authResponse.refreshToken);

      expect(authResponse.accessToken, isNot(equals(testAccessToken)));

      logTestInfo('Token refreshed successfully');
    });

    test(
      'POST /auth/switch-tenant - should switch tenant successfully',
      () async {
        logTestStep('Testing tenant switch');

        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final email = 'switch_test_$timestamp@example.com';

        final registerResponse = await authDataSource.register({
          'email': email,
          'password': TestConfig.testPassword,
          'full_name': TestConfig.testFullName,
          'company_name': TestConfig.testCompanyName,
        });

        final authData = registerResponse.data.data!;
        await testClient.saveTokens(
          accessToken: authData.accessToken,
          refreshToken: authData.refreshToken,
        );

        if (authData.tenants.length < 2) {
          logTestInfo(
            'Skipping switch tenant test - only one tenant available',
          );
          return;
        }

        final targetTenantId = authData.tenants[1].tenantId;

        final response = await authDataSource.switchTenant({
          'tenant_id': targetTenantId,
        });

        logTestInfo(
          'Switch tenant response status: ${response.response.statusCode}',
        );

        expect(response.response.statusCode, equals(200));

        final switchResponse = response.data;
        expect(switchResponse, isA<SwitchTenantResponseModel>());

        expectValidToken(switchResponse.accessToken);
        expectValidToken(switchResponse.refreshToken);

        expect(switchResponse.tenant, isA<TenantModel>());
        expect(switchResponse.tenant.id, equals(targetTenantId));

        final entity = switchResponse.toEntity();
        expect(entity.tenant.id, equals(switchResponse.tenant.id));

        logTestInfo(
          'Tenant switched successfully to: ${switchResponse.tenant.name}',
        );
      },
    );

    test('POST /auth/logout - should logout user successfully', () async {
      logTestStep('Testing user logout');

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final email = 'logout_test_$timestamp@example.com';

      final registerResponse = await authDataSource.register({
        'email': email,
        'password': TestConfig.testPassword,
        'full_name': TestConfig.testFullName,
        'company_name': TestConfig.testCompanyName,
      });

      final authData = registerResponse.data.data!;
      await testClient.saveTokens(
        accessToken: authData.accessToken,
        refreshToken: authData.refreshToken,
      );

      final response = await authDataSource.logout();

      logTestInfo('Logout response status: ${response.response.statusCode}');

      expect(response.response.statusCode, equals(200));

      await testClient.clearTokens();

      logTestInfo('User logged out successfully');
    });

    test('Model to Entity conversion - should preserve all fields', () async {
      logTestStep('Testing model to entity conversions');

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final email = 'conversion_test_$timestamp@example.com';

      final response = await authDataSource.register({
        'email': email,
        'password': TestConfig.testPassword,
        'full_name': TestConfig.testFullName,
        'company_name': TestConfig.testCompanyName,
      });

      final authResponse = response.data.data!;

      final userEntity = authResponse.user.toEntity();
      expect(userEntity.id, equals(authResponse.user.id));
      expect(userEntity.email, equals(authResponse.user.email));
      expect(userEntity.fullName, equals(authResponse.user.fullName));
      expect(userEntity.isActive, equals(authResponse.user.isActive));
      expect(userEntity.isSuperuser, equals(authResponse.user.isSuperuser));
      expect(userEntity.createdAt, equals(authResponse.user.createdAt));
      expect(userEntity.updatedAt, equals(authResponse.user.updatedAt));

      final tenantEntity = authResponse.currentTenant.toEntity();
      expect(tenantEntity.id, equals(authResponse.currentTenant.id));
      expect(tenantEntity.name, equals(authResponse.currentTenant.name));
      expect(tenantEntity.slug, equals(authResponse.currentTenant.slug));
      expect(tenantEntity.status, equals(authResponse.currentTenant.status));
      expect(
        tenantEntity.createdAt,
        equals(authResponse.currentTenant.createdAt),
      );
      expect(
        tenantEntity.updatedAt,
        equals(authResponse.currentTenant.updatedAt),
      );

      final userTenantEntity = authResponse.tenants.first.toEntity();
      expect(
        userTenantEntity.tenantId,
        equals(authResponse.tenants.first.tenantId),
      );
      expect(
        userTenantEntity.tenantName,
        equals(authResponse.tenants.first.tenantName),
      );
      expect(userTenantEntity.role, equals(authResponse.tenants.first.role));
      expect(
        userTenantEntity.isDefault,
        equals(authResponse.tenants.first.isDefault),
      );

      logTestInfo('All model to entity conversions validated successfully');
    });
  });
}
