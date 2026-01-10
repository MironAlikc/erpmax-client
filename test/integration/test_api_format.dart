import 'package:dio/dio.dart';
import 'dart:developer' as dev;

void main() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8000/api/v1',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => dev.log(obj.toString()),
    ),
  );

  try {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final email = 'format_test_$timestamp@example.com';

    dev.log('Testing registration with email: $email');

    final response = await dio.post(
      '/auth/register',
      data: {
        'email': email,
        'password': 'TestPassword123!',
        'full_name': 'Test User',
        'company_name': 'Test Company',
      },
    );

    dev.log('Status Code: ${response.statusCode}');
    dev.log('Response Type: ${response.data.runtimeType}');
    dev.log('Response Data: ${response.data}');

    if (response.data is Map) {
      final data = response.data as Map<String, dynamic>;
      dev.log('Keys: ${data.keys.toList()}');

      if (data.containsKey('status')) {
        dev.log('Has "status" field: ${data['status']}');
      }
      if (data.containsKey('data')) {
        dev.log('Has "data" field: ${data['data']}');
      }
      if (data.containsKey('access_token')) {
        dev.log('Has "access_token" at root level');
      }
    }
  } catch (e) {
    if (e is DioException) {
      dev.log('Error Status: ${e.response?.statusCode}');
      dev.log('Error Data: ${e.response?.data}');
      dev.log('Error Type: ${e.response?.data.runtimeType}');
    }
    dev.log('Error: $e');
  }
}
