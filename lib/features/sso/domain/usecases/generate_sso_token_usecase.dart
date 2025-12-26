import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/sso/domain/entities/sso_token_entity.dart';
import 'package:erpmax_client/features/sso/domain/repositories/sso_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GenerateSSOTokenUseCase {
  final SSORepository repository;

  GenerateSSOTokenUseCase(this.repository);

  Future<Either<Failure, SSOTokenEntity>> call() {
    return repository.generateToken();
  }
}
