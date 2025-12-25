import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/invoice_entity.dart';
import '../repositories/billing_repository.dart';

@injectable
class GetInvoicesUseCase {
  final BillingRepository repository;

  GetInvoicesUseCase(this.repository);

  Future<Either<Failure, List<InvoiceEntity>>> call({
    int page = 1,
    int size = 20,
  }) {
    return repository.getInvoices(page: page, size: size);
  }
}
