import 'package:dio/dio.dart';
import '../config/test_config.dart';
import 'dart:developer' as dev;

/// Simple in-memory token storage for integration tests
class TestTokenStorage {
  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  void saveTokens({required String accessToken, required String refreshToken}) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  void clearTokens() {
    _accessToken = null;
    _refreshToken = null;
  }
}

class TestClient {
  late final Dio _dio;
  final TestTokenStorage tokenStorage = TestTokenStorage();

  TestClient() {
    // Create Dio client with interceptor that adds auth token
    _dio = Dio(
      BaseOptions(
        baseUrl: TestConfig.apiBaseUrl,
        connectTimeout: TestConfig.defaultTimeout,
        receiveTimeout: TestConfig.defaultTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add auth interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = tokenStorage.accessToken;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    // Add logging if verbose
    if (TestConfig.verboseLogging) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
          logPrint: (obj) => dev.log(obj.toString()),
        ),
      );
    }
  }

  Dio get client => _dio;

  Future<void> clearTokens() async {
    tokenStorage.clearTokens();
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    tokenStorage.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  String? getAccessToken() {
    return tokenStorage.accessToken;
  }

  String? getRefreshToken() {
    return tokenStorage.refreshToken;
  }
}
