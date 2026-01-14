import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/saas_control/data/models/subscriber_model.dart';

abstract class SubscriberRepository {
  Future<Either<Failure, List<SubscriberModel>>> getSubscribers({
    int page = 1,
    int size = 20,
  });
}
