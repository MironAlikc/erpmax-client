import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/sso_token_entity.dart';

abstract class SSORepository {
  Future<Either<Failure, SSOTokenEntity>> generateToken();
}
