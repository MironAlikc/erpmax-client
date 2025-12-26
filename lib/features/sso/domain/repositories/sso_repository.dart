import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/sso/domain/entities/sso_token_entity.dart';

abstract class SSORepository {
  Future<Either<Failure, SSOTokenEntity>> generateToken();
}
