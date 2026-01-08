import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/auth/domain/entities/user_with_tenants.dart';
import 'package:erpmax_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckAuthStatusUseCase {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  Future<Either<Failure, UserWithTenants>> call() async {
    // First check if tokens exist
    final tokensResult = await repository.getStoredTokens();

    return tokensResult.fold((failure) => Left(failure), (tokens) async {
      // Tokens exist, try to get current user
      return await repository.getCurrentUser();
    });
  }
}
