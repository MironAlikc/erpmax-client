class ApiEndpoints {
  // Auth
  static const String login = '/auth/login';
  static const String signup = '/auth/signup';
  static const String refresh = '/auth/refresh';
  static const String logout = '/auth/logout';

  // Tenant
  static const String tenants = '/tenants';
  static String tenant(String id) => '/tenants/$id';
  static String tenantStatus(String id) => '/tenants/$id/status';

  // Billing
  static const String plans = '/billing/plans';
  static const String subscriptions = '/billing/subscriptions';
  static String subscribe(String planId) => '/billing/plans/$planId/subscribe';
  static const String payments = '/billing/payments';
  static const String createCheckout = '/billing/checkout';

  // SSO
  static const String ssoToken = '/sso/token';
  static String erpRedirect(String token) => '/sso/redirect?token=$token';
}

