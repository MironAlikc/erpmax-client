import 'package:flutter_test/flutter_test.dart';
import 'package:erpmax_client/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:erpmax_client/features/tenant/data/datasources/tenant_remote_datasource.dart';
import 'package:erpmax_client/features/auth/data/models/tenant_model.dart';
import 'package:erpmax_client/features/tenant/data/models/tenant_user_model.dart';
import 'config/test_config.dart';
import 'helpers/test_client.dart';
import 'helpers/test_helpers.dart';

void main() {
  late TestClient testClient;
  late AuthRemoteDataSource authDataSource;
  late TenantRemoteDataSource tenantDataSource;
  String? testTenantId;

  setUpAll(() async {
    testClient = TestClient();
    authDataSource = AuthRemoteDataSource(testClient.client);
    tenantDataSource = TenantRemoteDataSource(testClient.client);

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final email = 'tenant_test_$timestamp@example.com';

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
    testTenantId = authData.currentTenant.id;
  });

  tearDownAll(() async {
    if (!TestConfig.skipCleanup) {
      await testClient.clearTokens();
    }
  });

  group('Tenant API Integration Tests', () {
    test('GET /tenants - should get all user tenants', () async {
      logTestStep('Testing get all tenants');

      final response = await tenantDataSource.getTenants(page: 1, size: 20);

      logTestInfo(
        'Get tenants response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final tenants = response.data;
      expect(tenants, isA<List<TenantModel>>());
      expect(tenants, isNotEmpty);

      final firstTenant = tenants.first;
      expectValidId(firstTenant.id);
      expect(firstTenant.name, isNotEmpty);
      expect(firstTenant.slug, isNotEmpty);
      expectValidDateTime(firstTenant.createdAt);
      expectValidDateTime(firstTenant.updatedAt);

      final entity = firstTenant.toEntity();
      expect(entity.id, equals(firstTenant.id));
      expect(entity.name, equals(firstTenant.name));
      expect(entity.slug, equals(firstTenant.slug));
      expect(entity.status, equals(firstTenant.status));

      logTestInfo('Retrieved ${tenants.length} tenants');
    });

    test('GET /tenants/current - should get current tenant', () async {
      logTestStep('Testing get current tenant');

      final response = await tenantDataSource.getCurrentTenant();

      logTestInfo(
        'Get current tenant response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final tenant = response.data;
      expect(tenant, isA<TenantModel>());

      expectValidId(tenant.id);
      expect(tenant.name, isNotEmpty);
      expect(tenant.slug, isNotEmpty);
      expectValidDateTime(tenant.createdAt);
      expectValidDateTime(tenant.updatedAt);

      final entity = tenant.toEntity();
      expect(entity.id, equals(tenant.id));
      expect(entity.name, equals(tenant.name));

      logTestInfo('Current tenant: ${tenant.name}');
    });

    test('GET /tenants/{id} - should get tenant by ID', () async {
      logTestStep('Testing get tenant by ID');

      if (testTenantId == null) {
        logTestError('No tenant ID available');
        return;
      }

      final response = await tenantDataSource.getTenantById(testTenantId!);

      logTestInfo(
        'Get tenant by ID response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final tenant = response.data;
      expect(tenant, isA<TenantModel>());

      expect(tenant.id, equals(testTenantId));
      expect(tenant.name, isNotEmpty);
      expect(tenant.slug, isNotEmpty);

      final entity = tenant.toEntity();
      expect(entity.id, equals(tenant.id));

      logTestInfo('Retrieved tenant: ${tenant.name}');
    });

    test('PATCH /tenants/{id} - should update tenant', () async {
      logTestStep('Testing update tenant');

      if (testTenantId == null) {
        logTestError('No tenant ID available');
        return;
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final newName = 'Updated Company $timestamp';

      final response = await tenantDataSource.updateTenant(testTenantId!, {
        'name': newName,
      });

      logTestInfo(
        'Update tenant response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final tenant = response.data;
      expect(tenant, isA<TenantModel>());
      expect(tenant.id, equals(testTenantId));
      expect(tenant.name, equals(newName));

      final entity = tenant.toEntity();
      expect(entity.name, equals(newName));

      logTestInfo('Tenant updated to: $newName');
    });

    test('GET /tenants/{id}/users - should get tenant users', () async {
      logTestStep('Testing get tenant users');

      if (testTenantId == null) {
        logTestError('No tenant ID available');
        return;
      }

      final response = await tenantDataSource.getTenantUsers(
        testTenantId!,
        page: 1,
        size: 20,
      );

      logTestInfo(
        'Get tenant users response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final users = response.data;
      expect(users, isA<List<TenantUserModel>>());
      expect(users, isNotEmpty);

      final firstUser = users.first;
      expectValidId(firstUser.userId);
      expectValidEmail(firstUser.email);
      expect(firstUser.fullName, isNotEmpty);
      expect(firstUser.role, isNotEmpty);
      expectValidDateTime(firstUser.joinedAt);

      final entity = firstUser.toEntity();
      expect(entity.userId, equals(firstUser.userId));
      expect(entity.email, equals(firstUser.email));
      expect(entity.role, equals(firstUser.role));

      logTestInfo('Retrieved ${users.length} tenant users');
    });

    test(
      'POST /tenants/{id}/users/invite - should invite user to tenant',
      () async {
        logTestStep('Testing invite user to tenant');

        if (testTenantId == null) {
          logTestError('No tenant ID available');
          return;
        }

        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final inviteEmail = 'invite_$timestamp@example.com';

        final response = await tenantDataSource.inviteUser(testTenantId!, {
          'email': inviteEmail,
          'role': 'member',
        });

        logTestInfo(
          'Invite user response status: ${response.response.statusCode}',
        );

        expect(response.response.statusCode, equals(200));

        logTestInfo('User invited successfully: $inviteEmail');
      },
    );

    test('Model to Entity conversion - should preserve all fields', () async {
      logTestStep('Testing tenant model to entity conversions');

      final response = await tenantDataSource.getCurrentTenant();
      final tenant = response.data;

      final entity = tenant.toEntity();
      expect(entity.id, equals(tenant.id));
      expect(entity.name, equals(tenant.name));
      expect(entity.slug, equals(tenant.slug));
      expect(entity.status, equals(tenant.status));
      expect(entity.erpnextSiteUrl, equals(tenant.erpnextSiteUrl));
      expect(entity.settings, equals(tenant.settings));
      expect(entity.createdAt, equals(tenant.createdAt));
      expect(entity.updatedAt, equals(tenant.updatedAt));

      logTestInfo('Tenant model to entity conversion validated');
    });
  });
}
