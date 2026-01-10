import 'package:flutter_test/flutter_test.dart';
import 'package:erpmax_client/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:erpmax_client/features/sso/data/datasources/sso_remote_datasource.dart';
import 'package:erpmax_client/features/sso/data/models/sso_token_model.dart';
import 'package:erpmax_client/features/sso/data/models/sso_token_validation_model.dart';
import 'config/test_config.dart';
import 'helpers/test_client.dart';
import 'helpers/test_helpers.dart';

void main() {
  late TestClient testClient;
  late AuthRemoteDataSource authDataSource;
  late SSORemoteDataSource ssoDataSource;

  setUpAll(() async {
    testClient = TestClient();
    authDataSource = AuthRemoteDataSource(testClient.client);
    ssoDataSource = SSORemoteDataSource(testClient.client);

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final email = 'sso_test_$timestamp@example.com';

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
  });

  tearDownAll(() async {
    if (!TestConfig.skipCleanup) {
      await testClient.clearTokens();
    }
  });

  group('SSO API Integration Tests', () {
    test('POST /sso/token - should generate SSO token', () async {
      logTestStep('Testing generate SSO token');

      final response = await ssoDataSource.generateToken();

      logTestInfo(
        'Generate token response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final ssoToken = response.data;
      expect(ssoToken, isA<SSOTokenModel>());

      expect(ssoToken.ssoUrl, isNotEmpty);
      expect(ssoToken.ssoUrl, startsWith('http'));
      expectValidToken(ssoToken.token);
      expectValidDateTime(ssoToken.expiresAt);

      expect(
        ssoToken.expiresAt.isAfter(DateTime.now()),
        isTrue,
        reason: 'Token should not be expired',
      );

      final entity = ssoToken.toEntity();
      expect(entity.ssoUrl, equals(ssoToken.ssoUrl));
      expect(entity.token, equals(ssoToken.token));
      expect(entity.expiresAt, equals(ssoToken.expiresAt));

      logTestInfo('SSO token generated: ${ssoToken.token.substring(0, 10)}...');
    });

    test(
      'GET /sso/erpnext/validate/{token} - should validate SSO token',
      () async {
        logTestStep('Testing validate SSO token');

        final generateResponse = await ssoDataSource.generateToken();
        final token = generateResponse.data.token;

        final response = await ssoDataSource.validateToken(token);

        logTestInfo(
          'Validate token response status: ${response.response.statusCode}',
        );

        expect(response.response.statusCode, equals(200));

        final validation = response.data;
        expect(validation, isA<SSOTokenValidationModel>());

        expect(validation.valid, isTrue);
        expectValidId(validation.userId);
        expectValidId(validation.tenantId);
        expectValidDateTime(validation.createdAt);

        final entity = validation.toEntity();
        expect(entity.valid, equals(validation.valid));
        expect(entity.userId, equals(validation.userId));
        expect(entity.tenantId, equals(validation.tenantId));
        expect(entity.createdAt, equals(validation.createdAt));

        logTestInfo(
          'Token validated successfully for user: ${validation.userId}',
        );
      },
    );

    test(
      'GET /sso/erpnext/validate/{token} - should reject invalid token',
      () async {
        logTestStep('Testing validate invalid SSO token');

        final invalidToken = 'invalid-token-12345';

        try {
          await ssoDataSource.validateToken(invalidToken);
          fail('Should have thrown an exception for invalid token');
        } catch (e) {
          logTestInfo('Invalid token correctly rejected: $e');
          expect(e.toString(), contains('404'));
        }
      },
    );

    test('SSO token expiration - should be in future', () async {
      logTestStep('Testing SSO token expiration time');

      final response = await ssoDataSource.generateToken();
      final ssoToken = response.data;

      final now = DateTime.now();
      final expiresAt = ssoToken.expiresAt;

      expect(
        expiresAt.isAfter(now),
        isTrue,
        reason: 'Token expiration should be in the future',
      );

      final difference = expiresAt.difference(now);
      expect(
        difference.inSeconds,
        greaterThan(0),
        reason: 'Token should have positive TTL',
      );
      expect(
        difference.inSeconds,
        lessThanOrEqualTo(120),
        reason: 'Token TTL should be reasonable (max 2 minutes)',
      );

      logTestInfo('Token expires in ${difference.inSeconds} seconds');
    });

    test('Model to Entity conversion - should preserve all fields', () async {
      logTestStep('Testing SSO model to entity conversions');

      final tokenResponse = await ssoDataSource.generateToken();
      final ssoToken = tokenResponse.data;

      final tokenEntity = ssoToken.toEntity();
      expect(tokenEntity.ssoUrl, equals(ssoToken.ssoUrl));
      expect(tokenEntity.token, equals(ssoToken.token));
      expect(tokenEntity.expiresAt, equals(ssoToken.expiresAt));

      final validationResponse = await ssoDataSource.validateToken(
        ssoToken.token,
      );
      final validation = validationResponse.data;

      final validationEntity = validation.toEntity();
      expect(validationEntity.valid, equals(validation.valid));
      expect(validationEntity.userId, equals(validation.userId));
      expect(validationEntity.tenantId, equals(validation.tenantId));
      expect(validationEntity.createdAt, equals(validation.createdAt));

      logTestInfo('SSO model to entity conversions validated');
    });
  });
}
