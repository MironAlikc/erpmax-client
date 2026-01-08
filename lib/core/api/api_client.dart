import 'package:dio/dio.dart';
import 'package:erpmax_client/core/api/api_interceptors.dart';
import 'package:erpmax_client/core/auth/auth_interceptor.dart';

class ApiClient {
  ApiClient({required this.baseUrl, AuthInterceptor? authInterceptor})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: const <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          validateStatus: (status) {
            return status != null && status >= 200 && status < 300;
          },
        ),
      ) {
    _dio.interceptors.addAll(<Interceptor>{
      authInterceptor ?? const AuthInterceptor.stub(),
      LoggingInterceptor(),
      ErrorInterceptor(),
    });
  }

  final String baseUrl;
  final Dio _dio;

  Dio get client => _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(path, queryParameters: queryParameters);
  }

  Future<Response<T>> post<T>(String path, {dynamic data}) {
    return _dio.post<T>(path, data: data);
  }

  Future<Response<T>> put<T>(String path, {dynamic data}) {
    return _dio.put<T>(path, data: data);
  }

  Future<Response<T>> delete<T>(String path) {
    return _dio.delete<T>(path);
  }
}
