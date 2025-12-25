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
}
