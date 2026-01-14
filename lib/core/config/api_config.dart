class ApiConfig {
  // static const String baseUrl = 'http://localhost:8000';
  // static const String apiBaseUrl = 'http://localhost:8000/api/v1';

  static const String baseUrl = 'http://153.92.222.17:8000';
  static const String apiBaseUrl = 'http://153.92.222.17:8000/api/v1';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
