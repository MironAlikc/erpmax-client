import 'package:dio/dio.dart';
import 'package:erpmax_client/features/auth/data/models/auth_response_model.dart';
import 'package:erpmax_client/features/auth/data/models/switch_tenant_response_model.dart';
import 'package:erpmax_client/features/auth/data/models/user_with_tenants_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_datasource.g.dart';

@RestApi(baseUrl: '/api/v1')
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) =
      _AuthRemoteDataSource;

  @POST('/auth/register')
  Future<HttpResponse<AuthResponseModel>> register(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/login')
  Future<HttpResponse<AuthResponseModel>> login(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/refresh')
  Future<HttpResponse<AuthResponseModel>> refreshToken(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/logout')
  Future<HttpResponse<void>> logout();

  @GET('/auth/me')
  Future<HttpResponse<UserWithTenantsModel>> getCurrentUser();

  @POST('/auth/switch-tenant')
  Future<HttpResponse<SwitchTenantResponseModel>> switchTenant(
    @Body() Map<String, dynamic> body,
  );
}
