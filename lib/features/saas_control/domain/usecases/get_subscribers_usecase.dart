import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/saas_control/data/models/subscriber_model.dart';
import 'package:erpmax_client/features/saas_control/domain/repositories/subscriver_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubscribersUseCase {
  final SubscriberRepository repository;

  GetSubscribersUseCase(this.repository);

  Future<Either<Failure, List<SubscriberModel>>> call() {
    return repository.getSubscribers();
  }
}
