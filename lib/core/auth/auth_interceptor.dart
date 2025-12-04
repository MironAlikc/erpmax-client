import 'package:dio/dio.dart';
import 'package:erpmax_client/core/auth/secure_storage.dart';
import 'dart:developer' as dev;

/// Interceptor for adding authentication token to requests
class AuthInterceptor extends Interceptor {
  const AuthInterceptor({required this.secureStorage});

  /// Stub constructor for cases when authentication is not required
  const AuthInterceptor.stub() : secureStorage = null;

  final SecureStorage? secureStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      if (secureStorage != null) {
        final String? token = await secureStorage!.getToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
      }
      handler.next(options);
    } catch (e) {
      dev.log('Error in AuthInterceptor: $e', name: 'AuthInterceptor');
      handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized errors
    if (err.response?.statusCode == 401) {
      dev.log('Unauthorized request', name: 'AuthInterceptor');
      // TODO: Implement token refresh or logout logic
    }
    handler.next(err);
  }
}
