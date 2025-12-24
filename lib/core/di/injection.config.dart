// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/get_current_user_usecase.dart'
    as _i17;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/domain/usecases/switch_tenant_usecase.dart'
    as _i253;
import '../../features/billing/data/datasources/billing_remote_datasource.dart'
    as _i504;
import '../../features/billing/data/repositories/billing_repository_impl.dart'
    as _i632;
import '../../features/billing/domain/repositories/billing_repository.dart'
    as _i276;
import '../../features/billing/domain/usecases/cancel_subscription_usecase.dart'
    as _i452;
import '../../features/billing/domain/usecases/create_checkout_usecase.dart'
    as _i924;
import '../../features/billing/domain/usecases/get_invoices_usecase.dart'
    as _i834;
import '../../features/billing/domain/usecases/get_plans_usecase.dart' as _i311;
import '../../features/billing/domain/usecases/get_subscription_usecase.dart'
    as _i232;
import '../../features/tenant/data/datasources/tenant_remote_datasource.dart'
    as _i402;
import '../../features/tenant/data/repositories/tenant_repository_impl.dart'
    as _i981;
import '../../features/tenant/domain/repositories/tenant_repository.dart'
    as _i728;
import '../../features/tenant/domain/usecases/get_current_tenant_usecase.dart'
    as _i236;
import '../../features/tenant/domain/usecases/get_tenant_users_usecase.dart'
    as _i834;
import '../../features/tenant/domain/usecases/get_tenants_usecase.dart'
    as _i769;
import '../../features/tenant/domain/usecases/invite_user_usecase.dart'
    as _i612;
import '../../features/tenant/domain/usecases/remove_user_usecase.dart' as _i4;
import '../../features/tenant/domain/usecases/update_tenant_usecase.dart'
    as _i1008;
import '../../features/tenant/domain/usecases/update_user_role_usecase.dart'
    as _i191;
import '../api/api_client.dart' as _i277;
import '../auth/secure_storage.dart' as _i934;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i934.SecureStorage>(() => registerModule.storage);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i277.ApiClient>(() => registerModule.apiClient);
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => registerModule.authRemoteDataSource,
    );
    gh.lazySingleton<_i402.TenantRemoteDataSource>(
      () => registerModule.tenantRemoteDataSource,
    );
    gh.lazySingleton<_i504.BillingRemoteDataSource>(
      () => registerModule.billingRemoteDataSource,
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        remoteDataSource: gh<_i161.AuthRemoteDataSource>(),
        secureStorage: gh<_i934.SecureStorage>(),
      ),
    );
    gh.factory<_i17.GetCurrentUserUseCase>(
      () => _i17.GetCurrentUserUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i941.RegisterUseCase>(
      () => _i941.RegisterUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i253.SwitchTenantUseCase>(
      () => _i253.SwitchTenantUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i728.TenantRepository>(
      () => _i981.TenantRepositoryImpl(
        remoteDataSource: gh<_i402.TenantRemoteDataSource>(),
      ),
    );
    gh.factory<_i236.GetCurrentTenantUseCase>(
      () => _i236.GetCurrentTenantUseCase(gh<_i728.TenantRepository>()),
    );
    gh.factory<_i834.GetTenantUsersUseCase>(
      () => _i834.GetTenantUsersUseCase(gh<_i728.TenantRepository>()),
    );
    gh.factory<_i769.GetTenantsUseCase>(
      () => _i769.GetTenantsUseCase(gh<_i728.TenantRepository>()),
    );
    gh.factory<_i612.InviteUserUseCase>(
      () => _i612.InviteUserUseCase(gh<_i728.TenantRepository>()),
    );
    gh.factory<_i4.RemoveUserUseCase>(
      () => _i4.RemoveUserUseCase(gh<_i728.TenantRepository>()),
    );
    gh.factory<_i1008.UpdateTenantUseCase>(
      () => _i1008.UpdateTenantUseCase(gh<_i728.TenantRepository>()),
    );
    gh.factory<_i191.UpdateUserRoleUseCase>(
      () => _i191.UpdateUserRoleUseCase(gh<_i728.TenantRepository>()),
    );
    gh.lazySingleton<_i276.BillingRepository>(
      () => _i632.BillingRepositoryImpl(
        remoteDataSource: gh<_i504.BillingRemoteDataSource>(),
      ),
    );
    gh.factory<_i452.CancelSubscriptionUseCase>(
      () => _i452.CancelSubscriptionUseCase(gh<_i276.BillingRepository>()),
    );
    gh.factory<_i924.CreateCheckoutUseCase>(
      () => _i924.CreateCheckoutUseCase(gh<_i276.BillingRepository>()),
    );
    gh.factory<_i834.GetInvoicesUseCase>(
      () => _i834.GetInvoicesUseCase(gh<_i276.BillingRepository>()),
    );
    gh.factory<_i311.GetPlansUseCase>(
      () => _i311.GetPlansUseCase(gh<_i276.BillingRepository>()),
    );
    gh.factory<_i232.GetSubscriptionUseCase>(
      () => _i232.GetSubscriptionUseCase(gh<_i276.BillingRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
