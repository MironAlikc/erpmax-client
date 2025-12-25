import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/billing/domain/entities/invoice_entity.dart';
import 'package:erpmax_client/features/billing/domain/repositories/billing_repository.dart';
import 'package:injectable/injectable.dart';

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
