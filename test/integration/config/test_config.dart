class TestConfig {
  static const String baseUrl = String.fromEnvironment(
    'TEST_BASE_URL',
    defaultValue: 'http://localhost:8000',
  );

  static const String apiVersion = '/api/v1';

  static String get apiBaseUrl => '$baseUrl$apiVersion';

  static const String testEmail = String.fromEnvironment(
    'TEST_EMAIL',
    defaultValue: 'test@example.com',
  );

  static const String testPassword = String.fromEnvironment(
    'TEST_PASSWORD',
    defaultValue: 'TestPassword123!',
  );

  static const String testFullName = String.fromEnvironment(
    'TEST_FULL_NAME',
    defaultValue: 'Test User',
  );

  static const String testCompanyName = String.fromEnvironment(
    'TEST_COMPANY_NAME',
    defaultValue: 'Test Company',
  );

  static const Duration defaultTimeout = Duration(seconds: 30);

  static const bool skipCleanup = bool.fromEnvironment(
    'SKIP_CLEANUP',
    defaultValue: false,
  );

  static const bool verboseLogging = bool.fromEnvironment(
    'VERBOSE_LOGGING',
    defaultValue: true,
  );
}
