import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/checkout_response_model.dart';
import '../models/invoices_response_model.dart';
import '../models/plans_response_model.dart';
import '../models/subscription_model.dart';

part 'billing_remote_datasource.g.dart';

@RestApi(baseUrl: '/api/v1')
abstract class BillingRemoteDataSource {
  factory BillingRemoteDataSource(Dio dio, {String baseUrl}) =
      _BillingRemoteDataSource;

  @GET('/billing/plans')
  Future<HttpResponse<PlansResponseModel>> getPlans();

  @GET('/billing/subscription')
  Future<HttpResponse<SubscriptionModel>> getSubscription();

  @POST('/billing/checkout')
  Future<HttpResponse<CheckoutResponseModel>> createCheckout(
    @Body() Map<String, dynamic> body,
  );

  @POST('/billing/cancel')
  Future<HttpResponse<void>> cancelSubscription(
    @Body() Map<String, dynamic> body,
  );

  @GET('/billing/invoices')
  Future<HttpResponse<InvoicesResponseModel>> getInvoices({
    @Query('page') int page = 1,
    @Query('size') int size = 20,
  });
}
