import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/sso_token_entity.dart';
import '../repositories/sso_repository.dart';

@injectable
class GenerateSSOTokenUseCase {
  final SSORepository repository;

  GenerateSSOTokenUseCase(this.repository);

  Future<Either<Failure, SSOTokenEntity>> call() {
    return repository.generateToken();
  }
}
