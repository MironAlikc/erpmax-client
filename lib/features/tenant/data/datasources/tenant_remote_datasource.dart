import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../auth/data/models/tenant_model.dart';
import '../models/tenant_user_model.dart';

part 'tenant_remote_datasource.g.dart';

@RestApi(baseUrl: '/api/v1')
abstract class TenantRemoteDataSource {
  factory TenantRemoteDataSource(Dio dio, {String baseUrl}) =
      _TenantRemoteDataSource;

  @GET('/tenants')
  Future<HttpResponse<List<TenantModel>>> getTenants({
    @Query('page') int page = 1,
    @Query('size') int size = 20,
  });

  @GET('/tenants/current')
  Future<HttpResponse<TenantModel>> getCurrentTenant();

  @GET('/tenants/{id}')
  Future<HttpResponse<TenantModel>> getTenantById(
    @Path('id') String id,
  );

  @PATCH('/tenants/{id}')
  Future<HttpResponse<TenantModel>> updateTenant(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @GET('/tenants/{id}/users')
  Future<HttpResponse<List<TenantUserModel>>> getTenantUsers(
    @Path('id') String tenantId, {
    @Query('page') int page = 1,
    @Query('size') int size = 20,
  });

  @POST('/tenants/{id}/users/invite')
  Future<HttpResponse<void>> inviteUser(
    @Path('id') String tenantId,
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/tenants/{tenantId}/users/{userId}')
  Future<HttpResponse<void>> updateUserRole(
    @Path('tenantId') String tenantId,
    @Path('userId') String userId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/tenants/{tenantId}/users/{userId}')
  Future<HttpResponse<void>> removeUser(
    @Path('tenantId') String tenantId,
    @Path('userId') String userId,
  );
}
