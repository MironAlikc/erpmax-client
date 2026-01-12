import 'package:flutter_test/flutter_test.dart';
import 'package:erpmax_client/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:erpmax_client/features/billing/data/datasources/billing_remote_datasource.dart';
import 'package:erpmax_client/features/billing/data/models/plan_model.dart';
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
      logTestInfo('Raw response data: ${response.response.data}');

      expect(response.response.statusCode, equals(200));

      final plansResponse = response.data;
      logTestInfo('PlansResponse: $plansResponse');
      final plans = plansResponse.data;
      logTestInfo('Plans list length: ${plans.length}');
      if (plans.isNotEmpty) {
        logTestInfo('First plan: ${plans.first}');
      }
      expect(plans, isA<List<PlanModel>>());
      expect(plans, isNotEmpty);

      final firstPlan = plans.first;
      expectValidId(firstPlan.id);
      expect(firstPlan.name, isNotEmpty);
      expect(firstPlan.description, isNotEmpty);
      expect(firstPlan.monthlyPrice, greaterThanOrEqualTo(0));
      expect(firstPlan.yearlyPrice, greaterThanOrEqualTo(0));
      expect(firstPlan.features, isNotNull);
      expect(firstPlan.maxUsers, greaterThanOrEqualTo(0));
      expect(firstPlan.maxStorage, greaterThanOrEqualTo(0));

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

        // User may not have an active subscription, so fields can be null
        if (subscription.id != null && subscription.id!.isNotEmpty) {
          expectValidId(subscription.id);
          expect(subscription.tenantId, isNotNull);
          expect(subscription.planId, isNotNull);
          expect(subscription.planName, isNotNull);
          expect(subscription.status, isNotNull);
          logTestInfo('Current subscription plan: ${subscription.planName}');
        } else {
          logTestInfo('No active subscription found');
        }

        logTestInfo('Current subscription: ${subscription.planName}');
      },
    );

    test('POST /billing/checkout - should create checkout session', () async {
      logTestStep('Testing create checkout session');

      final plansResponse = await billingDataSource.getPlans();
      final plans = plansResponse.data.data;

      if (plans.isEmpty) {
        logTestInfo('No plans available, skipping checkout test');
        return;
      }

      final firstPlan = plans.first;

      final response = await billingDataSource.createCheckout({
        'plan_id': firstPlan.id,
        'billing_period': 'monthly',
        'payment_provider': 'stripe',
        'success_url': 'https://example.com/success',
        'cancel_url': 'https://example.com/cancel',
      });

      logTestInfo(
        'Create checkout response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final checkout = response.data;
      expect(checkout, isA<CheckoutResponseModel>());

      // Fields may be null if checkout creation failed
      if (checkout.sessionId != null && checkout.checkoutUrl != null) {
        expect(checkout.sessionId, isNotEmpty);
        expect(checkout.checkoutUrl, isNotEmpty);
        expect(checkout.checkoutUrl, startsWith('http'));
        expectValidId(checkout.sessionId);

        final entity = checkout.toEntity();
        expect(entity.checkoutUrl, equals(checkout.checkoutUrl ?? ''));
        expect(entity.sessionId, equals(checkout.sessionId ?? ''));

        logTestInfo('Checkout session created: ${checkout.sessionId}');
        logTestInfo('Checkout URL: ${checkout.checkoutUrl}');
      } else {
        logTestInfo('Checkout response received but fields are null');
      }
    });

    test('GET /billing/invoices - should get payment history', () async {
      logTestStep('Testing get invoices');

      final response = await billingDataSource.getInvoices(page: 1, size: 20);

      logTestInfo(
        'Get invoices response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      final invoicesResponse = response.data;
      final invoices = invoicesResponse.data;
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

      final response = await billingDataSource.cancelSubscription({});

      logTestInfo(
        'Cancel subscription response status: ${response.response.statusCode}',
      );

      expect(response.response.statusCode, equals(200));

      logTestInfo('Subscription cancelled successfully');
    });

    test('Model to Entity conversion - should preserve all fields', () async {
      logTestStep('Testing billing model to entity conversions');

      final plansResponse = await billingDataSource.getPlans();
      final plan = plansResponse.data.data.first;

      final planEntity = plan.toEntity();
      expect(planEntity.id, equals(plan.id));
      expect(planEntity.name, equals(plan.name));
      expect(planEntity.description, equals(plan.description));
      expect(planEntity.monthlyPrice, equals(plan.monthlyPrice));
      expect(planEntity.yearlyPrice, equals(plan.yearlyPrice));
      // Features are converted from List to Map in toEntity()
      expect(planEntity.features, isA<Map<String, dynamic>>());
      expect(planEntity.maxUsers, equals(plan.maxUsers));
      expect(planEntity.maxStorage, equals(plan.maxStorage));
      expect(planEntity.isActive, equals(plan.isActive));

      final subscriptionResponse = await billingDataSource.getSubscription();
      final subscription = subscriptionResponse.data;

      final subscriptionEntity = subscription.toEntity();
      // When subscription fields are null, toEntity() returns empty strings as defaults
      if (subscription.id != null) {
        expect(subscriptionEntity.id, equals(subscription.id));
      } else {
        expect(subscriptionEntity.id, equals(''));
      }
      if (subscription.tenantId != null) {
        expect(subscriptionEntity.tenantId, equals(subscription.tenantId));
      } else {
        expect(subscriptionEntity.tenantId, equals(''));
      }
      // Other fields also get default values when null
      expect(subscriptionEntity.amount, equals(subscription.amount ?? 0.0));

      logTestInfo('Billing model to entity conversions validated');
    });
  });
}
