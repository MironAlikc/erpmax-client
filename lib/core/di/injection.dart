import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../auth/secure_storage.dart';
import '../api/api_client.dart';
import '../config/api_config.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/tenant/data/datasources/tenant_remote_datasource.dart';
import '../../features/billing/data/datasources/billing_remote_datasource.dart';
import '../../features/provisioning/data/datasources/provisioning_remote_datasource.dart';
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
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      headers: ApiConfig.defaultHeaders,
    ),
  );

  @lazySingleton
  ApiClient get apiClient => ApiClient(baseUrl: ApiConfig.apiBaseUrl);

  @lazySingleton
  AuthRemoteDataSource get authRemoteDataSource => AuthRemoteDataSource(dio);

  @lazySingleton
  TenantRemoteDataSource get tenantRemoteDataSource =>
      TenantRemoteDataSource(dio);

  @lazySingleton
  BillingRemoteDataSource get billingRemoteDataSource =>
      BillingRemoteDataSource(dio);

  @lazySingleton
  ProvisioningRemoteDataSource get provisioningRemoteDataSource =>
      ProvisioningRemoteDataSource(dio);
}
