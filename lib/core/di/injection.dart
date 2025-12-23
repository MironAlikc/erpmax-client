import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../auth/secure_storage.dart';
import '../api/api_client.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  SecureStorage get storage => SecureStorage(secureStorage);

  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8000',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  @lazySingleton
  ApiClient get apiClient => ApiClient(baseUrl: 'http://localhost:8000/api/v1');

  @lazySingleton
  AuthRemoteDataSource get authRemoteDataSource => AuthRemoteDataSource(dio);
}
