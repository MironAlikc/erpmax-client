import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/sso/domain/entities/sso_token_entity.dart';
import 'package:erpmax_client/features/sso/domain/entities/sso_token_validation_entity.dart';

abstract class SSORepository {
  Future<Either<Failure, SSOTokenEntity>> generateToken();

  Future<Either<Failure, SSOTokenValidationEntity>> validateToken(String token);
}
