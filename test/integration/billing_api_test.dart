import 'package:flutter_test/flutter_test.dart';
import 'package:erpmax_client/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:erpmax_client/features/billing/data/datasources/billing_remote_datasource.dart';
import 'package:erpmax_client/features/billing/data/models/plan_model.dart';
import 'package:erpmax_client/features/billing/data/models/subscription_model.dart';
import 'package:erpmax_client/features/billing/data/models/checkout_response_model.dart';
import 'package:erpmax_client/features/billing/data/models/invoice_model.dart';
import 'config/test_config.dart';
import 'helpers/test_client.dart';
import 'helpers/test_helpers.dart';

void main() {
  late TestClient testClient;
  late AuthRemoteDataSource authDataSource;
  late BillingRemoteDataSource billingDataSource;

  setUpAll(() async {
    testClient = TestClient();
    authDataSource = AuthRemoteDataSource(testClient.client);
    billingDataSource = BillingRemoteDataSource(testClient.client);

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final email = 'billing_test_$timestamp@example.com';

    final registerResponse = await authDataSource.register({
      'email': email,
      'password': TestConfig.testPassword,
      'full_name': TestConfig.testFullName,
      'company_name': TestConfig.testCompanyName,
    });

    final authData = registerResponse.data.data!;
    await testClient.saveTokens(
      accessToken: authData.accessToken!,
      refreshToken: authData.refreshToken!,
    );
  });

  tearDownAll(() async {
    if (!TestConfig.skipCleanup) {
      await testClient.clearTokens();
    }
  });

  group('Billing API Integration Tests', () {
    test('GET /billing/plans - should get all available plans', () async {
      logTestStep('Testing get all plans');

      final response = await billingDataSource.getPlans();

      logTestInfo('Get plans response status: ${response.response.statusCode}');

      expect(response.response.statusCode, equals(200));

      final plans = response.data;
      expect(plans, isA<List<PlanModel>>());
      expect(plans, isNotEmpty);

      final firstPlan = plans.first;
      expectValidId(firstPlan.id);
      expect(firstPlan.name, isNotEmpty);
      expect(firstPlan.description, isNotEmpty);
      expect(firstPlan.monthlyPrice, greaterThanOrEqualTo(0));
      expect(firstPlan.yearlyPrice, greaterThanOrEqualTo(0));
      expect(firstPlan.features, isNotEmpty);
      expect(firstPlan.maxUsers, greaterThan(0));
      expect(firstPlan.maxStorage, greaterThan(0));

      final entity = firstPlan.toEntity();
      expect(entity.id, equals(firstPlan.id));
      expect(entity.name, equals(firstPlan.name));
      expect(entity.monthlyPrice, equals(firstPlan.monthlyPrice));
      expect(entity.yearlyPrice, equals(firstPlan.yearlyPrice));

      logTestInfo('Retrieved ${plans.length} plans');
    });

    test(
      'GET /billing/subscription - should get current subscription',
      () async {
        logTestStep('Testing get current subscription');

        final response = await billingDataSource.getSubscription();

        logTestInfo(
          'Get subscription response status: ${response.response.statusCode}',
        );

        expect(response.response.statusCode, equals(200));

        final subscription = response.data;
        expect(subscription, isA<SubscriptionModel>());

        expectValidId(subscription.id);
        expectValidId(subscription.tenantId);
        expectValidId(subscription.planId);
        expect(subscription.planName, isNotEmpty);
        expect(subscription.status, isNotEmpty);
        expect(subscription.billingPeriod, isNotEmpty);
        expect(subscription.amount, greaterThanOrEqualTo(0));
        expectValidDateTime(subscription.currentPeriodStart);
        expectValidDateTime(subscription.currentPeriodEnd);

        final entity = subscription.toEntity();
        expect(entity.id, equals(subscription.id));
        expect(entity.planId, equals(subscription.planId));
        expect(entity.status, equals(subscription.status));
        expect(entity.amount, equals(subscription.amount));

        logTestInfo('Current subscription: ${subscription.planName}');
      },
    );

    test('POST /billing/checkout - should create checkout session', () async {
      logTestStep('Testing create checkout session');

      final plansResponse = await billingDataSource.getPlans();
      final plans = plansResponse.data;

      if (plans.isEmpty) {
        logTestInfo('No plans available, skipping checkout test');
        return;
      }

      final firstPlan = plans.first;

      final response = await billingDataSource.createCheckout({
        'plan_id': firstPlan.id,
        'billing_period': 'monthly',
        'success_url': 'https://example.com/success',
        'cancel_url': 'https://example.com/cancel',
      });

      logTestInfo(
        'Create checkout response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final checkout = response.data;
      expect(checkout, isA<CheckoutResponseModel>());

      expect(checkout.checkoutUrl, isNotEmpty);
      expect(checkout.checkoutUrl, startsWith('http'));
      expectValidId(checkout.sessionId);

      final entity = checkout.toEntity();
      expect(entity.checkoutUrl, equals(checkout.checkoutUrl));
      expect(entity.sessionId, equals(checkout.sessionId));

      logTestInfo('Checkout session created: ${checkout.sessionId}');
    });

    test('GET /billing/invoices - should get payment history', () async {
      logTestStep('Testing get invoices');

      final response = await billingDataSource.getInvoices(page: 1, size: 20);

      logTestInfo(
        'Get invoices response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final invoices = response.data;
      expect(invoices, isA<List<InvoiceModel>>());

      if (invoices.isNotEmpty) {
        final firstInvoice = invoices.first;
        expectValidId(firstInvoice.id);
        expect(firstInvoice.amount, greaterThanOrEqualTo(0));
        expectValidDateTime(firstInvoice.createdAt);

        final entity = firstInvoice.toEntity();
        expect(entity.id, equals(firstInvoice.id));
        expect(entity.amount, equals(firstInvoice.amount));
      }

      logTestInfo('Retrieved ${invoices.length} invoices');
    });

    test('POST /billing/cancel - should cancel subscription', () async {
      logTestStep('Testing cancel subscription');

      final response = await billingDataSource.cancelSubscription();

      logTestInfo(
        'Cancel subscription response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      logTestInfo('Subscription cancelled successfully');
    });

    test('Model to Entity conversion - should preserve all fields', () async {
      logTestStep('Testing billing model to entity conversions');

      final plansResponse = await billingDataSource.getPlans();
      final plan = plansResponse.data.first;

      final planEntity = plan.toEntity();
      expect(planEntity.id, equals(plan.id));
      expect(planEntity.name, equals(plan.name));
      expect(planEntity.description, equals(plan.description));
      expect(planEntity.monthlyPrice, equals(plan.monthlyPrice));
      expect(planEntity.yearlyPrice, equals(plan.yearlyPrice));
      expect(planEntity.features, equals(plan.features));
      expect(planEntity.maxUsers, equals(plan.maxUsers));
      expect(planEntity.maxStorage, equals(plan.maxStorage));
      expect(planEntity.isActive, equals(plan.isActive));

      final subscriptionResponse = await billingDataSource.getSubscription();
      final subscription = subscriptionResponse.data;

      final subscriptionEntity = subscription.toEntity();
      expect(subscriptionEntity.id, equals(subscription.id));
      expect(subscriptionEntity.tenantId, equals(subscription.tenantId));
      expect(subscriptionEntity.planId, equals(subscription.planId));
      expect(subscriptionEntity.planName, equals(subscription.planName));
      expect(subscriptionEntity.status, equals(subscription.status));
      expect(
        subscriptionEntity.billingPeriod,
        equals(subscription.billingPeriod),
      );
      expect(subscriptionEntity.amount, equals(subscription.amount));

      logTestInfo('Billing model to entity conversions validated');
    });
  });
}
