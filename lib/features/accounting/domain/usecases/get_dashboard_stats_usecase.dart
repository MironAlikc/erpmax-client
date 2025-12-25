import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/stat_entity.dart';
import '../repositories/accounting_repository.dart';

class GetDashboardStatsUseCase implements UseCase<List<StatEntity>, NoParams> {
  final AccountingRepository repository;

  GetDashboardStatsUseCase(this.repository);

  @override
  Future<Either<Failure, List<StatEntity>>> call(NoParams params) async {
    return await repository.getDashboardStats();
  }
}
