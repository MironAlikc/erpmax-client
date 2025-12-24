import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/sso_token_model.dart';

part 'sso_remote_datasource.g.dart';

@RestApi(baseUrl: '/api/v1')
abstract class SSORemoteDataSource {
  factory SSORemoteDataSource(Dio dio, {String baseUrl}) = _SSORemoteDataSource;

  @POST('/sso/token')
  Future<HttpResponse<SSOTokenModel>> generateToken();
}
