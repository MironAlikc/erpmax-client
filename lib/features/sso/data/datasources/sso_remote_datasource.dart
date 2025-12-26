import 'package:dio/dio.dart';
import 'package:erpmax_client/features/sso/data/models/sso_token_model.dart';
import 'package:retrofit/retrofit.dart';

part 'sso_remote_datasource.g.dart';

@RestApi(baseUrl: '/api/v1')
abstract class SSORemoteDataSource {
  factory SSORemoteDataSource(Dio dio, {String baseUrl}) = _SSORemoteDataSource;

  @POST('/sso/token')
  Future<HttpResponse<SSOTokenModel>> generateToken();
}
