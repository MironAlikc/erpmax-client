import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/sso_token_validation_entity.dart';
import '../repositories/sso_repository.dart';

@injectable
class ValidateSSOTokenUseCase {
  final SSORepository repository;

  ValidateSSOTokenUseCase(this.repository);

  Future<Either<Failure, SSOTokenValidationEntity>> call(String token) {
    return repository.validateToken(token);
  }
}
