import 'package:dio/dio.dart';
import 'package:erpmax_client/features/provisioning/data/models/provisioning_job_model.dart';
import 'package:retrofit/retrofit.dart';

part 'provisioning_remote_datasource.g.dart';

@RestApi(baseUrl: '/api/v1')
abstract class ProvisioningRemoteDataSource {
  factory ProvisioningRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProvisioningRemoteDataSource;

  @GET('/provisioning/jobs')
  Future<HttpResponse<List<ProvisioningJobModel>>> getJobs({
    @Query('page') int page = 1,
    @Query('size') int size = 20,
  });

  @GET('/provisioning/jobs/{id}')
  Future<HttpResponse<ProvisioningJobModel>> getJobById(@Path('id') String id);

  @POST('/provisioning/jobs')
  Future<HttpResponse<ProvisioningJobModel>> createJob(
    @Body() Map<String, dynamic> body,
  );

  @POST('/provisioning/jobs/{id}/retry')
  Future<HttpResponse<ProvisioningJobModel>> retryJob(@Path('id') String id);

  @POST('/provisioning/jobs/{id}/cancel')
  Future<HttpResponse<void>> cancelJob(@Path('id') String id);
}
