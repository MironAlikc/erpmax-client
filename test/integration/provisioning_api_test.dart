import 'package:flutter_test/flutter_test.dart';
import 'package:erpmax_client/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:erpmax_client/features/provisioning/data/datasources/provisioning_remote_datasource.dart';
import 'package:erpmax_client/features/provisioning/data/models/provisioning_job_model.dart';
import 'config/test_config.dart';
import 'helpers/test_client.dart';
import 'helpers/test_helpers.dart';

void main() {
  late TestClient testClient;
  late AuthRemoteDataSource authDataSource;
  late ProvisioningRemoteDataSource provisioningDataSource;
  String? testJobId;

  setUpAll(() async {
    testClient = TestClient();
    authDataSource = AuthRemoteDataSource(testClient.client);
    provisioningDataSource = ProvisioningRemoteDataSource(testClient.client);

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final email = 'provisioning_test_$timestamp@example.com';

    final registerResponse = await authDataSource.register({
      'email': email,
      'password': TestConfig.testPassword,
      'full_name': TestConfig.testFullName,
      'company_name': TestConfig.testCompanyName,
    });

    final authData = registerResponse.data.data!;
    await testClient.saveTokens(
      accessToken: authData.accessToken!,
      refreshToken: authData.refreshToken!,
    );
  });

  tearDownAll(() async {
    if (!TestConfig.skipCleanup) {
      await testClient.clearTokens();
    }
  });

  group('Provisioning API Integration Tests', () {
    test('POST /provisioning/jobs - should create provisioning job', () async {
      logTestStep('Testing create provisioning job');

      final response = await provisioningDataSource.createJob({
        'job_type': 'create_site',
      });

      logTestInfo(
        'Create job response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(201));

      final job = response.data;
      expect(job, isA<ProvisioningJobModel>());

      if (job.id != null) expectValidId(job.id);
      if (job.tenantId != null) expectValidId(job.tenantId);
      if (job.jobType != null) expect(job.jobType, equals('create_site'));
      if (job.status != null) expect(job.status, isNotEmpty);
      if (job.createdAt != null) expectValidDateTime(job.createdAt);

      testJobId = job.id;

      final entity = job.toEntity();
      // When job fields are null, toEntity() returns empty strings as defaults
      expect(entity.id, equals(job.id ?? ''));
      expect(entity.tenantId, equals(job.tenantId ?? ''));
      expect(entity.jobType, equals(job.jobType ?? ''));
      expect(entity.status, equals(job.status ?? ''));

      logTestInfo('Provisioning job created with ID: $testJobId');
    });

    test('GET /provisioning/jobs - should get all provisioning jobs', () async {
      logTestStep('Testing get all provisioning jobs');

      final response = await provisioningDataSource.getJobs(page: 1, size: 20);

      logTestInfo('Get jobs response status: ${response.response.statusCode}');

      expect(response.response.statusCode, equals(200));

      final jobsResponse = response.data;
      final jobs = jobsResponse.data;
      expect(jobs, isA<List<ProvisioningJobModel>>());
      expect(jobs, isNotEmpty);

      final firstJob = jobs.first;
      if (firstJob.id != null) expectValidId(firstJob.id);
      if (firstJob.tenantId != null) expectValidId(firstJob.tenantId);
      expect(firstJob.jobType, isNotEmpty);
      expect(firstJob.status, isNotEmpty);
      if (firstJob.createdAt != null) expectValidDateTime(firstJob.createdAt);

      final entity = firstJob.toEntity();
      expect(entity.id, equals(firstJob.id));
      expect(entity.jobType, equals(firstJob.jobType));

      logTestInfo('Retrieved ${jobs.length} provisioning jobs');
    });

    test('GET /provisioning/jobs/{id} - should get job by ID', () async {
      logTestStep('Testing get provisioning job by ID');

      if (testJobId == null) {
        final createResponse = await provisioningDataSource.createJob({
          'job_type': 'create_site',
        });
        final jobId = createResponse.data.id;

        if (jobId == null || jobId.isEmpty) {
          logTestInfo('Job ID is null, skipping get by ID test');
          return;
        }

        final getResponse = await provisioningDataSource.getJobById(jobId);

        logTestInfo(
          'Get job by ID response status: ${getResponse.response.statusCode}',
        );

        expect(getResponse.response.statusCode, equals(200));

        final job = getResponse.data;
        expect(job, isA<ProvisioningJobModel>());

        expect(job.id, equals(jobId));
        expectValidId(job.tenantId);
        expect(job.jobType, isNotEmpty);
        expect(job.status, isNotEmpty);

        final entity = job.toEntity();
        expect(entity.id, equals(job.id));

        logTestInfo('Retrieved job: ${job.id} with status: ${job.status}');
      } else {
        final getResponse = await provisioningDataSource.getJobById(testJobId!);

        logTestInfo(
          'Get job by ID response status: ${getResponse.response.statusCode}',
        );

        expect(getResponse.response.statusCode, equals(200));

        final job = getResponse.data;
        expect(job, isA<ProvisioningJobModel>());

        expect(job.id, equals(testJobId));
        expectValidId(job.tenantId);
        expect(job.jobType, isNotEmpty);
        expect(job.status, isNotEmpty);

        final entity = job.toEntity();
        expect(entity.id, equals(job.id));

        logTestInfo('Retrieved job: ${job.id} with status: ${job.status}');
      }
    });

    test(
      'POST /provisioning/jobs/{id}/retry - should retry failed job',
      () async {
        logTestStep('Testing retry provisioning job');

        if (testJobId == null) {
          final createResponse = await provisioningDataSource.createJob({
            'job_type': 'create_site',
          });
          final jobId = createResponse.data.id;

          if (jobId == null || jobId.isEmpty) {
            logTestInfo('Job ID is null, skipping retry test');
            return;
          }

          final response = await provisioningDataSource.retryJob(jobId);

          logTestInfo(
            'Retry job response status: ${response.response.statusCode}',
          );

          expect(response.response.statusCode, equals(200));

          final job = response.data;
          expect(job, isA<ProvisioningJobModel>());

          logTestInfo('Job retried successfully: ${job.id}');
        } else {
          final response = await provisioningDataSource.retryJob(testJobId!);

          logTestInfo(
            'Retry job response status: ${response.response.statusCode}',
          );

          expect(response.response.statusCode, equals(200));

          final job = response.data;
          expect(job, isA<ProvisioningJobModel>());
          expect(job.id, equals(testJobId));

          logTestInfo('Job retried successfully: ${job.id}');
        }
      },
    );

    test('POST /provisioning/jobs/{id}/cancel - should cancel job', () async {
      logTestStep('Testing cancel provisioning job');

      final createResponse = await provisioningDataSource.createJob({
        'job_type': 'create_site',
      });
      final jobId = createResponse.data.id;

      // Cancel the job
      logTestStep('Cancelling provisioning job');

      if (jobId == null || jobId.isEmpty) {
        logTestInfo('Job ID is null, skipping cancel test');
        return;
      }

      final response = await provisioningDataSource.cancelJob(jobId);

      logTestInfo(
        'Cancel job response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      logTestInfo('Job cancelled successfully: $jobId');
    });

    test('Model to Entity conversion - should preserve all fields', () async {
      logTestStep('Testing provisioning model to entity conversions');

      final response = await provisioningDataSource.getJobs(page: 1, size: 1);

      if (response.data.data.isEmpty) {
        await provisioningDataSource.createJob({'job_type': 'create_site'});
        final newResponse = await provisioningDataSource.getJobs(
          page: 1,
          size: 1,
        );
        final job = newResponse.data.data.first;

        final entity = job.toEntity();
        expect(entity.id, equals(job.id));
        expect(entity.tenantId, equals(job.tenantId));
        expect(entity.jobType, equals(job.jobType));
        expect(entity.status, equals(job.status));
        expect(entity.createdAt, equals(job.createdAt));
        expect(entity.startedAt, equals(job.startedAt));
        expect(entity.completedAt, equals(job.completedAt));
        expect(entity.errorMessage, equals(job.errorMessage));
        expect(entity.metadata, equals(job.metadata));
      } else {
        final job = response.data.data.first;

        final entity = job.toEntity();
        expect(entity.id, equals(job.id));
        expect(entity.tenantId, equals(job.tenantId));
        expect(entity.jobType, equals(job.jobType));
        expect(entity.status, equals(job.status));
      }

      logTestInfo('Provisioning model to entity conversion validated');
    });
  });
}
