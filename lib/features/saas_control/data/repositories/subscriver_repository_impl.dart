import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/auth/data/models/tenant_model.dart';
import 'package:erpmax_client/features/saas_control/data/models/subscriber_model.dart';
import 'package:erpmax_client/features/saas_control/domain/repositories/subscriver_repository.dart';
import 'package:erpmax_client/features/tenant/data/datasources/tenant_remote_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubscriberRepository)
class SubscriberRepositoryImpl implements SubscriberRepository {
  final TenantRemoteDataSource remoteDataSource;

  SubscriberRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<SubscriberModel>>> getSubscribers({
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await remoteDataSource.getTenants();
      final List<TenantModel> tenants = response.data;

      final entities = tenants.map((tenant) {
        return SubscriberModel(
          company: tenant.name,
          email: 'no-email',
          plan: 'Standart',
          status: _mapStatus('Active'),
          startDate: tenant.createdAt.toString().split(' ')[0],
          endDate: "2026-12-31",
          currentStorage: 15.0,
          maxStorage: 100.0,
          price: '0',
          currentUsers: 1,
          maxUsers: 10,
        );
      }).toList();

      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  SubscriberStatus _mapStatus(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
        return SubscriberStatus.active;
      case 'trial':
        return SubscriberStatus.trial;
      case 'expired':
        return SubscriberStatus.expired;
      case 'suspended':
        return SubscriberStatus.suspended;
      default:
        return SubscriberStatus.active;
    }
  }
}
