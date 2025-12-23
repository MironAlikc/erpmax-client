import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/auth_result.dart';
import '../repositories/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, AuthResult>> call({
    required String email,
    required String password,
    required String fullName,
    required String companyName,
  }) {
    return repository.register(
      email: email,
      password: password,
      fullName: fullName,
      companyName: companyName,
    );
  }
}
