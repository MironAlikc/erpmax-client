import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/sso_token_entity.dart';
import '../entities/sso_token_validation_entity.dart';

abstract class SSORepository {
  Future<Either<Failure, SSOTokenEntity>> generateToken();

  Future<Either<Failure, SSOTokenValidationEntity>> validateToken(String token);
}
