import 'package:dio/dio.dart';
import 'package:erpmax_client/core/api/api_client.dart';
import 'package:erpmax_client/core/auth/auth_interceptor.dart';
import 'package:erpmax_client/core/auth/secure_storage.dart';
import 'package:erpmax_client/core/config/api_config.dart';
import 'package:erpmax_client/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:erpmax_client/features/billing/data/datasources/billing_remote_datasource.dart';
import 'package:erpmax_client/features/provisioning/data/datasources/provisioning_remote_datasource.dart';
import 'package:erpmax_client/features/sso/data/datasources/sso_remote_datasource.dart';
import 'package:erpmax_client/features/tenant/data/datasources/tenant_remote_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => await getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  SecureStorage get storage => SecureStorage(secureStorage);

  @lazySingleton
  Dio get dio {
    final dioInstance = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        headers: ApiConfig.defaultHeaders,
      ),
    );

    dioInstance.interceptors.add(AuthInterceptor(secureStorage: storage));

    return dioInstance;
  }

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

  @lazySingleton
  SSORemoteDataSource get ssoRemoteDataSource => SSORemoteDataSource(dio);
}
