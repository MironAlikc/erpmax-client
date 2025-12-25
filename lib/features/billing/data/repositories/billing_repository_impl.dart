import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/plan_entity.dart';
import '../../domain/entities/subscription_entity.dart';
import '../../domain/entities/checkout_response_entity.dart';
import '../../domain/entities/invoice_entity.dart';
import '../../domain/repositories/billing_repository.dart';
import '../datasources/billing_remote_datasource.dart';

@LazySingleton(as: BillingRepository)
class BillingRepositoryImpl implements BillingRepository {
  final BillingRemoteDataSource remoteDataSource;

  BillingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PlanEntity>>> getPlans() async {
    try {
      final response = await remoteDataSource.getPlans();
      final plans = response.data.map((model) => model.toEntity()).toList();
      return Right(plans);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SubscriptionEntity>> getSubscription() async {
    try {
      final response = await remoteDataSource.getSubscription();
      return Right(response.data.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CheckoutResponseEntity>> createCheckout({
    required String planId,
    required String billingPeriod,
    required String successUrl,
    required String cancelUrl,
  }) async {
    try {
      final response = await remoteDataSource.createCheckout({
        'plan_id': planId,
        'billing_period': billingPeriod,
        'success_url': successUrl,
        'cancel_url': cancelUrl,
      });

      return Right(response.data.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelSubscription() async {
    try {
      await remoteDataSource.cancelSubscription();
      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<InvoiceEntity>>> getInvoices({
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await remoteDataSource.getInvoices(
        page: page,
        size: size,
      );

      final invoices = response.data.map((model) => model.toEntity()).toList();
      return Right(invoices);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Failure _handleDioException(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final message = e.response!.data?['message'] ?? e.message;

      switch (statusCode) {
        case 400:
          return ValidationFailure(message: message ?? 'Invalid request');
        case 401:
          return AuthenticationFailure(message: message ?? 'Unauthorized');
        case 403:
          return AuthorizationFailure(message: message ?? 'Forbidden');
        case 404:
          return NotFoundFailure(message: message ?? 'Resource not found');
        case 500:
          return ServerFailure(message: message ?? 'Server error');
        default:
          return ServerFailure(message: message ?? 'Unknown error');
      }
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return NetworkFailure(message: 'Connection timeout');
    }

    if (e.type == DioExceptionType.connectionError) {
      return NetworkFailure(message: 'No internet connection');
    }

    return ServerFailure(message: e.message ?? 'Unknown error');
  }
}
