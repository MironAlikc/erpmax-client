// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ERP Max';

  @override
  String get customers => 'Customers';

  @override
  String get sales => 'Sales';

  @override
  String get purchases => 'Purchases';

  @override
  String get funds => 'Funds';

  @override
  String get journal => 'Journal';

  @override
  String get ipAddress => 'IP Address';

  @override
  String get country => 'Country';

  @override
  String get visits => 'Visits';

  @override
  String get lastVisit => 'Last Visit';

  @override
  String get status => 'Status';

  @override
  String get actions => 'Actions';

  @override
  String get defaultSubtitle => 'Detailed data is being generated...';

  @override
  String get searchHint => 'Search by name, code, or serial...';

  @override
  String get noDataAvailable => 'No data available';

  @override
  String get reference => 'Reference';

  @override
  String get date => 'Date';

  @override
  String get description => 'Description';

  @override
  String get amount => 'Amount';

  @override
  String get verifyPhone => 'Verify your phone';

  @override
  String get enterCodeSent =>
      'Enter the verification code we sent to\n******7859';

  @override
  String get continueBtn => 'Continue';

  @override
  String didNotReceiveCode(Object seconds) {
    return 'Didn\'t receive a code? (${seconds}s)';
  }

  @override
  String get resend => 'Resend';

  @override
  String get clickLinkSent => 'Please click the link sent to your email ';

  @override
  String get toVerifyAccount => ' to verify your account. Thank you';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get didNotReceiveEmail => 'Didn\'t receive an email? ';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get enterEmailToReset => 'Enter your email to reset password';

  @override
  String get backToSignIn => 'Back to Sign In';

  @override
  String get slide1Title => 'Fast Scanning';

  @override
  String get slide1Sub =>
      'Use mobile devices for instant tracking and efficiency.';

  @override
  String get slide2Title => 'Inventory Control';

  @override
  String get slide2Sub =>
      'Monitor movements in real time across all warehouses.';

  @override
  String get slide3Title => 'Unified Data';

  @override
  String get slide3Sub =>
      'Everything organized in one place for better decisions.';

  @override
  String get slide4Title => 'Secure Access';

  @override
  String get slide4Sub => 'Multi-factor authentication to keep your data safe.';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign up';

  @override
  String get forgot => 'Forgot?';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get or => 'OR';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get errorEnterEmail => 'Please enter email';

  @override
  String get errorInvalidEmail => 'Enter a valid email';

  @override
  String get errorMinLength => 'Min 6 characters';

  @override
  String get checkYourEmail => 'Check your email';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get resetPassInstruction =>
      'Enter your new password to regain access.';

  @override
  String get newPassword => 'New Password';

  @override
  String get min8Characters => 'Minimum 8 characters';

  @override
  String get passwordTooShort => 'Password too short';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get repeatPassword => 'Repeat your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get submit => 'Submit';

  @override
  String get passwordChanged => 'Your password is changed';

  @override
  String get passwordChangedDesc =>
      'Your password has been successfully updated.\nYour account security is our priority.';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get reEnterPassword => 'Re-enter Password';

  @override
  String get alreadyHaveAccount => 'Already have an Account? ';

  @override
  String get acceptTerms => 'I accept the Terms & Conditions';

  @override
  String get enterPassword => 'Enter Password';

  @override
  String get errInvalidRequest => 'Invalid request';

  @override
  String get errUnauthorized => 'Unauthorized';

  @override
  String get errForbidden => 'Forbidden';

  @override
  String get errNotFound => 'Resource not found';

  @override
  String get errServerError => 'Server error';

  @override
  String get errUnknown => 'Unknown error';

  @override
  String get errTimeout => 'Connection timeout';

  @override
  String get errNoInternet => 'No internet connection';

  @override
  String get colCompanyName => 'Company Name';

  @override
  String get colPackage => 'Package';

  @override
  String get colEndDate => 'End Date';

  @override
  String get colTags => 'Tags';

  @override
  String get subscribers => 'Subscribers';

  @override
  String get searchCompany => 'Search company...';

  @override
  String get btnNew => 'New';

  @override
  String get btnReset => 'Reset';

  @override
  String get overview => 'Overview';

  @override
  String get analytics => 'Analytics';

  @override
  String get revenueForecast => 'Revenue Forecast';

  @override
  String get monthlyRevenueProjection => 'Monthly revenue projection';

  @override
  String get activeSubscriptions => 'Active Subscriptions';

  @override
  String get growthByPackageType => 'Growth by package type';

  @override
  String get dashboardSubtitle => 'Welcome back! Here\'s what\'s happening.';

  @override
  String manageTitle(Object title) {
    return 'Manage $title';
  }

  @override
  String get support => 'Support';

  @override
  String get menuDashboard => 'Dashboard';

  @override
  String get menuAccounting => 'Accounting';

  @override
  String get menuInventory => 'Inventory';

  @override
  String get menuSales => 'Sales';

  @override
  String get menuCustomerManagement => 'Customer Management';

  @override
  String get menuRealEstate => 'Real Estate Asset';

  @override
  String get menuPOS => 'POS';

  @override
  String get menuExchange => 'Exchange & Remittances';

  @override
  String get menuPurchases => 'Purchases';

  @override
  String get menuManufacturing => 'Manufacturing';

  @override
  String get menuHR => 'HR Management';

  @override
  String get menuSaaS => 'SaaS Control';

  @override
  String get menuAI => 'AI Analytics';

  @override
  String get menuAuthPages => 'Auth Pages';

  @override
  String get menuSettings => 'Settings';

  @override
  String get saasAnalytics => 'SaaS Analytics';

  @override
  String get saasAnalyticsDesc => 'Overview of your platform performance';

  @override
  String get exportReport => 'Export Report';

  @override
  String get statusPosted => 'Posted';

  @override
  String get statusDraft => 'Draft';

  @override
  String get statusPending => 'Pending';

  @override
  String get sidebar => 'Sidebar';

  @override
  String get business => 'Business';

  @override
  String get system => 'System';

  @override
  String get generalLedgerContent => 'General Ledger Content';

  @override
  String get saasAdmin => 'SaaS Admin';

  @override
  String get subscriptionManagement => 'Subscription Management';

  @override
  String get subscriptionDetails => 'Subscription Details';

  @override
  String get modules => 'Modules';

  @override
  String get payBook => 'Pay Book';

  @override
  String get generalLedger => 'General Ledger';

  @override
  String get activityLog => 'Activity Log';

  @override
  String get amendment => 'Amendment';

  @override
  String get cancelSubscription => 'Cancel Subscription';

  @override
  String get customerInformation => 'Customer Information';

  @override
  String get package => 'Package';

  @override
  String get duration => 'Duration';

  @override
  String get transaction => 'Transaction';

  @override
  String get method => 'Method';

  @override
  String get procedure => 'Procedure';

  @override
  String get user => 'User';

  @override
  String get details => 'Details';

  @override
  String get reports => 'Reports';

  @override
  String get manufacturing => 'Manufacturing';

  @override
  String get comments => 'Comments';

  @override
  String get anyAdditionalComments => 'Any additional comments';

  @override
  String get labelCustomer => 'Customer:';

  @override
  String get labelEmail => 'E-mail:';

  @override
  String get labelPackage => 'Package:';

  @override
  String get labelValue => 'Value:';

  @override
  String get labelStatus => 'Status:';

  @override
  String get labelStart => 'Start:';

  @override
  String get labelExpiry => 'Expiry:';

  @override
  String get labelCondition => 'Condition:';

  @override
  String get includedModules => 'Included Modules';

  @override
  String get recentBackups => 'Recent Backups';

  @override
  String get fileName => 'File Name';

  @override
  String get size => 'Size';

  @override
  String get type => 'Type';

  @override
  String get completed => 'Completed';

  @override
  String get partial => 'Partial';

  @override
  String get lastBackup => 'Last Backup';

  @override
  String get storageUsed => 'Storage Used';

  @override
  String get nextSchedule => 'Next Schedule';

  @override
  String timeAgo(Object hours) {
    return '$hours hours ago';
  }

  @override
  String todayAt(Object time) {
    return 'Today $time';
  }
}
