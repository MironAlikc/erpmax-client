import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'ERP Max'**
  String get appTitle;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// No description provided for @purchases.
  ///
  /// In en, this message translates to:
  /// **'Purchases'**
  String get purchases;

  /// No description provided for @funds.
  ///
  /// In en, this message translates to:
  /// **'Funds'**
  String get funds;

  /// No description provided for @journal.
  ///
  /// In en, this message translates to:
  /// **'Journal'**
  String get journal;

  /// No description provided for @ipAddress.
  ///
  /// In en, this message translates to:
  /// **'IP Address'**
  String get ipAddress;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @visits.
  ///
  /// In en, this message translates to:
  /// **'Visits'**
  String get visits;

  /// No description provided for @lastVisit.
  ///
  /// In en, this message translates to:
  /// **'Last Visit'**
  String get lastVisit;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @defaultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Detailed data is being generated...'**
  String get defaultSubtitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name, code, or serial...'**
  String get searchHint;

  /// No description provided for @noDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noDataAvailable;

  /// No description provided for @reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get reference;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @verifyPhone.
  ///
  /// In en, this message translates to:
  /// **'Verify your phone'**
  String get verifyPhone;

  /// No description provided for @enterCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code we sent to\n******7859'**
  String get enterCodeSent;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @didNotReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive a code? ({seconds}s)'**
  String didNotReceiveCode(Object seconds);

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @clickLinkSent.
  ///
  /// In en, this message translates to:
  /// **'Please click the link sent to your email '**
  String get clickLinkSent;

  /// No description provided for @toVerifyAccount.
  ///
  /// In en, this message translates to:
  /// **' to verify your account. Thank you'**
  String get toVerifyAccount;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @didNotReceiveEmail.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive an email? '**
  String get didNotReceiveEmail;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @enterEmailToReset.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to reset password'**
  String get enterEmailToReset;

  /// No description provided for @backToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Back to Sign In'**
  String get backToSignIn;

  /// No description provided for @slide1Title.
  ///
  /// In en, this message translates to:
  /// **'Fast Scanning'**
  String get slide1Title;

  /// No description provided for @slide1Sub.
  ///
  /// In en, this message translates to:
  /// **'Use mobile devices for instant tracking and efficiency.'**
  String get slide1Sub;

  /// No description provided for @slide2Title.
  ///
  /// In en, this message translates to:
  /// **'Inventory Control'**
  String get slide2Title;

  /// No description provided for @slide2Sub.
  ///
  /// In en, this message translates to:
  /// **'Monitor movements in real time across all warehouses.'**
  String get slide2Sub;

  /// No description provided for @slide3Title.
  ///
  /// In en, this message translates to:
  /// **'Unified Data'**
  String get slide3Title;

  /// No description provided for @slide3Sub.
  ///
  /// In en, this message translates to:
  /// **'Everything organized in one place for better decisions.'**
  String get slide3Sub;

  /// No description provided for @slide4Title.
  ///
  /// In en, this message translates to:
  /// **'Secure Access'**
  String get slide4Title;

  /// No description provided for @slide4Sub.
  ///
  /// In en, this message translates to:
  /// **'Multi-factor authentication to keep your data safe.'**
  String get slide4Sub;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @forgot.
  ///
  /// In en, this message translates to:
  /// **'Forgot?'**
  String get forgot;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @errorEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter email'**
  String get errorEnterEmail;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get errorInvalidEmail;

  /// No description provided for @errorMinLength.
  ///
  /// In en, this message translates to:
  /// **'Min 6 characters'**
  String get errorMinLength;

  /// No description provided for @checkYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get checkYourEmail;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @resetPassInstruction.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password to regain access.'**
  String get resetPassInstruction;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @min8Characters.
  ///
  /// In en, this message translates to:
  /// **'Minimum 8 characters'**
  String get min8Characters;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password too short'**
  String get passwordTooShort;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @repeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat your password'**
  String get repeatPassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @passwordChanged.
  ///
  /// In en, this message translates to:
  /// **'Your password is changed'**
  String get passwordChanged;

  /// No description provided for @passwordChangedDesc.
  ///
  /// In en, this message translates to:
  /// **'Your password has been successfully updated.\nYour account security is our priority.'**
  String get passwordChangedDesc;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @reEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Re-enter Password'**
  String get reEnterPassword;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an Account? '**
  String get alreadyHaveAccount;

  /// No description provided for @acceptTerms.
  ///
  /// In en, this message translates to:
  /// **'I accept the Terms & Conditions'**
  String get acceptTerms;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterPassword;

  /// No description provided for @errInvalidRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid request'**
  String get errInvalidRequest;

  /// No description provided for @errUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized'**
  String get errUnauthorized;

  /// No description provided for @errForbidden.
  ///
  /// In en, this message translates to:
  /// **'Forbidden'**
  String get errForbidden;

  /// No description provided for @errNotFound.
  ///
  /// In en, this message translates to:
  /// **'Resource not found'**
  String get errNotFound;

  /// No description provided for @errServerError.
  ///
  /// In en, this message translates to:
  /// **'Server error'**
  String get errServerError;

  /// No description provided for @errUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get errUnknown;

  /// No description provided for @errTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout'**
  String get errTimeout;

  /// No description provided for @errNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get errNoInternet;

  /// No description provided for @colCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get colCompanyName;

  /// No description provided for @colPackage.
  ///
  /// In en, this message translates to:
  /// **'Package'**
  String get colPackage;

  /// No description provided for @colEndDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get colEndDate;

  /// No description provided for @colTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get colTags;

  /// No description provided for @subscribers.
  ///
  /// In en, this message translates to:
  /// **'Subscribers'**
  String get subscribers;

  /// No description provided for @searchCompany.
  ///
  /// In en, this message translates to:
  /// **'Search company...'**
  String get searchCompany;

  /// No description provided for @btnNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get btnNew;

  /// No description provided for @btnReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get btnReset;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// No description provided for @revenueForecast.
  ///
  /// In en, this message translates to:
  /// **'Revenue Forecast'**
  String get revenueForecast;

  /// No description provided for @monthlyRevenueProjection.
  ///
  /// In en, this message translates to:
  /// **'Monthly revenue projection'**
  String get monthlyRevenueProjection;

  /// No description provided for @activeSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Active Subscriptions'**
  String get activeSubscriptions;

  /// No description provided for @growthByPackageType.
  ///
  /// In en, this message translates to:
  /// **'Growth by package type'**
  String get growthByPackageType;

  /// No description provided for @dashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Here\'s what\'s happening.'**
  String get dashboardSubtitle;

  /// No description provided for @manageTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage {title}'**
  String manageTitle(Object title);

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @menuDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get menuDashboard;

  /// No description provided for @menuAccounting.
  ///
  /// In en, this message translates to:
  /// **'Accounting'**
  String get menuAccounting;

  /// No description provided for @menuInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get menuInventory;

  /// No description provided for @menuSales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get menuSales;

  /// No description provided for @menuCustomerManagement.
  ///
  /// In en, this message translates to:
  /// **'Customer Management'**
  String get menuCustomerManagement;

  /// No description provided for @menuRealEstate.
  ///
  /// In en, this message translates to:
  /// **'Real Estate Asset'**
  String get menuRealEstate;

  /// No description provided for @menuPOS.
  ///
  /// In en, this message translates to:
  /// **'POS'**
  String get menuPOS;

  /// No description provided for @menuExchange.
  ///
  /// In en, this message translates to:
  /// **'Exchange & Remittances'**
  String get menuExchange;

  /// No description provided for @menuPurchases.
  ///
  /// In en, this message translates to:
  /// **'Purchases'**
  String get menuPurchases;

  /// No description provided for @menuManufacturing.
  ///
  /// In en, this message translates to:
  /// **'Manufacturing'**
  String get menuManufacturing;

  /// No description provided for @menuHR.
  ///
  /// In en, this message translates to:
  /// **'HR Management'**
  String get menuHR;

  /// No description provided for @menuSaaS.
  ///
  /// In en, this message translates to:
  /// **'SaaS Control'**
  String get menuSaaS;

  /// No description provided for @menuAI.
  ///
  /// In en, this message translates to:
  /// **'AI Analytics'**
  String get menuAI;

  /// No description provided for @menuAuthPages.
  ///
  /// In en, this message translates to:
  /// **'Auth Pages'**
  String get menuAuthPages;

  /// No description provided for @menuSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get menuSettings;

  /// No description provided for @saasAnalytics.
  ///
  /// In en, this message translates to:
  /// **'SaaS Analytics'**
  String get saasAnalytics;

  /// No description provided for @saasAnalyticsDesc.
  ///
  /// In en, this message translates to:
  /// **'Overview of your platform performance'**
  String get saasAnalyticsDesc;

  /// No description provided for @exportReport.
  ///
  /// In en, this message translates to:
  /// **'Export Report'**
  String get exportReport;

  /// No description provided for @statusPosted.
  ///
  /// In en, this message translates to:
  /// **'Posted'**
  String get statusPosted;

  /// No description provided for @statusDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get statusDraft;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @sidebar.
  ///
  /// In en, this message translates to:
  /// **'Sidebar'**
  String get sidebar;

  /// No description provided for @business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get business;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @generalLedgerContent.
  ///
  /// In en, this message translates to:
  /// **'General Ledger Content'**
  String get generalLedgerContent;

  /// No description provided for @saasAdmin.
  ///
  /// In en, this message translates to:
  /// **'SaaS Admin'**
  String get saasAdmin;

  /// No description provided for @subscriptionManagement.
  ///
  /// In en, this message translates to:
  /// **'Subscription Management'**
  String get subscriptionManagement;

  /// No description provided for @subscriptionDetails.
  ///
  /// In en, this message translates to:
  /// **'Subscription Details'**
  String get subscriptionDetails;

  /// No description provided for @modules.
  ///
  /// In en, this message translates to:
  /// **'Modules'**
  String get modules;

  /// No description provided for @payBook.
  ///
  /// In en, this message translates to:
  /// **'Pay Book'**
  String get payBook;

  /// No description provided for @generalLedger.
  ///
  /// In en, this message translates to:
  /// **'General Ledger'**
  String get generalLedger;

  /// No description provided for @activityLog.
  ///
  /// In en, this message translates to:
  /// **'Activity Log'**
  String get activityLog;

  /// No description provided for @amendment.
  ///
  /// In en, this message translates to:
  /// **'Amendment'**
  String get amendment;

  /// No description provided for @cancelSubscription.
  ///
  /// In en, this message translates to:
  /// **'Cancel Subscription'**
  String get cancelSubscription;

  /// No description provided for @customerInformation.
  ///
  /// In en, this message translates to:
  /// **'Customer Information'**
  String get customerInformation;

  /// No description provided for @package.
  ///
  /// In en, this message translates to:
  /// **'Package'**
  String get package;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @method.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get method;

  /// No description provided for @procedure.
  ///
  /// In en, this message translates to:
  /// **'Procedure'**
  String get procedure;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @manufacturing.
  ///
  /// In en, this message translates to:
  /// **'Manufacturing'**
  String get manufacturing;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @anyAdditionalComments.
  ///
  /// In en, this message translates to:
  /// **'Any additional comments'**
  String get anyAdditionalComments;

  /// No description provided for @labelCustomer.
  ///
  /// In en, this message translates to:
  /// **'Customer:'**
  String get labelCustomer;

  /// No description provided for @labelEmail.
  ///
  /// In en, this message translates to:
  /// **'E-mail:'**
  String get labelEmail;

  /// No description provided for @labelPackage.
  ///
  /// In en, this message translates to:
  /// **'Package:'**
  String get labelPackage;

  /// No description provided for @labelValue.
  ///
  /// In en, this message translates to:
  /// **'Value:'**
  String get labelValue;

  /// No description provided for @labelStatus.
  ///
  /// In en, this message translates to:
  /// **'Status:'**
  String get labelStatus;

  /// No description provided for @labelStart.
  ///
  /// In en, this message translates to:
  /// **'Start:'**
  String get labelStart;

  /// No description provided for @labelExpiry.
  ///
  /// In en, this message translates to:
  /// **'Expiry:'**
  String get labelExpiry;

  /// No description provided for @labelCondition.
  ///
  /// In en, this message translates to:
  /// **'Condition:'**
  String get labelCondition;

  /// No description provided for @includedModules.
  ///
  /// In en, this message translates to:
  /// **'Included Modules'**
  String get includedModules;

  /// No description provided for @recentBackups.
  ///
  /// In en, this message translates to:
  /// **'Recent Backups'**
  String get recentBackups;

  /// No description provided for @fileName.
  ///
  /// In en, this message translates to:
  /// **'File Name'**
  String get fileName;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @partial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get partial;

  /// No description provided for @lastBackup.
  ///
  /// In en, this message translates to:
  /// **'Last Backup'**
  String get lastBackup;

  /// No description provided for @storageUsed.
  ///
  /// In en, this message translates to:
  /// **'Storage Used'**
  String get storageUsed;

  /// No description provided for @nextSchedule.
  ///
  /// In en, this message translates to:
  /// **'Next Schedule'**
  String get nextSchedule;

  /// No description provided for @timeAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours} hours ago'**
  String timeAgo(Object hours);

  /// No description provided for @todayAt.
  ///
  /// In en, this message translates to:
  /// **'Today {time}'**
  String todayAt(Object time);

  /// No description provided for @filterAllSub.
  ///
  /// In en, this message translates to:
  /// **'All SUB'**
  String get filterAllSub;

  /// No description provided for @filterClient.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get filterClient;

  /// No description provided for @filterAllDate.
  ///
  /// In en, this message translates to:
  /// **'All Date'**
  String get filterAllDate;

  /// No description provided for @filterAllPackages.
  ///
  /// In en, this message translates to:
  /// **'All Packages'**
  String get filterAllPackages;

  /// No description provided for @filterAllStatuses.
  ///
  /// In en, this message translates to:
  /// **'All Statuses'**
  String get filterAllStatuses;

  /// No description provided for @filterMore.
  ///
  /// In en, this message translates to:
  /// **'More Filters'**
  String get filterMore;

  /// No description provided for @packagePricing.
  ///
  /// In en, this message translates to:
  /// **'Package & Pricing'**
  String get packagePricing;

  /// No description provided for @moduleManagement.
  ///
  /// In en, this message translates to:
  /// **'Module Management'**
  String get moduleManagement;

  /// No description provided for @profiles.
  ///
  /// In en, this message translates to:
  /// **'Profiles'**
  String get profiles;

  /// No description provided for @resetFilters.
  ///
  /// In en, this message translates to:
  /// **'Reset Filters'**
  String get resetFilters;

  /// No description provided for @newSubscription.
  ///
  /// In en, this message translates to:
  /// **'New Subscription'**
  String get newSubscription;

  /// No description provided for @searchSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Search subscriptions...'**
  String get searchSubscriptions;

  /// No description provided for @columnCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get columnCompanyName;

  /// No description provided for @columnEndDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get columnEndDate;

  /// No description provided for @columnTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get columnTags;

  /// No description provided for @columnPaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment Status'**
  String get columnPaymentStatus;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @newModule.
  ///
  /// In en, this message translates to:
  /// **'New Module'**
  String get newModule;

  /// No description provided for @createPackage.
  ///
  /// In en, this message translates to:
  /// **'Create Package'**
  String get createPackage;

  /// No description provided for @addSubscriber.
  ///
  /// In en, this message translates to:
  /// **'Add Subscriber'**
  String get addSubscriber;

  /// No description provided for @action.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @device.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// No description provided for @accessLogs.
  ///
  /// In en, this message translates to:
  /// **'Access Logs'**
  String get accessLogs;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @moduleDescriptionStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard ERP module with full functionality.'**
  String get moduleDescriptionStandard;

  /// No description provided for @moduleName.
  ///
  /// In en, this message translates to:
  /// **'Module Name'**
  String get moduleName;

  /// No description provided for @assignedPackages.
  ///
  /// In en, this message translates to:
  /// **'Assigned Packages'**
  String get assignedPackages;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @historyLogs.
  ///
  /// In en, this message translates to:
  /// **'History Logs'**
  String get historyLogs;

  /// No description provided for @moduleProfile.
  ///
  /// In en, this message translates to:
  /// **'Module Profile'**
  String get moduleProfile;

  /// No description provided for @editModule.
  ///
  /// In en, this message translates to:
  /// **'Edit Module'**
  String get editModule;

  /// No description provided for @versionFormat.
  ///
  /// In en, this message translates to:
  /// **'Version: {version}'**
  String versionFormat(Object version);

  /// No description provided for @basePriceFormat.
  ///
  /// In en, this message translates to:
  /// **'Base Price: {price} SAR'**
  String basePriceFormat(Object price);

  /// No description provided for @updateHistory.
  ///
  /// In en, this message translates to:
  /// **'Update History'**
  String get updateHistory;

  /// No description provided for @blocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get blocked;

  /// No description provided for @ipDetails.
  ///
  /// In en, this message translates to:
  /// **'IP Details: {ipAddress}'**
  String ipDetails(Object ipAddress);

  /// No description provided for @visitorStats.
  ///
  /// In en, this message translates to:
  /// **'Visitor from {country} has visited {count} times.'**
  String visitorStats(Object count, Object country);

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @columnTenant.
  ///
  /// In en, this message translates to:
  /// **'Tenant'**
  String get columnTenant;

  /// No description provided for @columnPlan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get columnPlan;

  /// No description provided for @columnUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get columnUsers;

  /// No description provided for @columnRenewalDate.
  ///
  /// In en, this message translates to:
  /// **'Renewal Date'**
  String get columnRenewalDate;

  /// No description provided for @columnStorage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get columnStorage;

  /// No description provided for @searchTenants.
  ///
  /// In en, this message translates to:
  /// **'Search tenants...'**
  String get searchTenants;

  /// No description provided for @statusExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get statusExpired;

  /// No description provided for @statusTrial.
  ///
  /// In en, this message translates to:
  /// **'Trial'**
  String get statusTrial;

  /// No description provided for @statusSuspended.
  ///
  /// In en, this message translates to:
  /// **'Suspended'**
  String get statusSuspended;

  /// No description provided for @errorGeneral.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please refresh.'**
  String get errorGeneral;

  /// No description provided for @paginationShowing.
  ///
  /// In en, this message translates to:
  /// **'Showing {current} of {total} Tenants'**
  String paginationShowing(Object current, Object total);

  /// No description provided for @totalUsersCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Total Users'**
  String totalUsersCount(Object count);

  /// No description provided for @clickForDetails.
  ///
  /// In en, this message translates to:
  /// **'Click for details'**
  String get clickForDetails;

  /// No description provided for @statTotalTenants.
  ///
  /// In en, this message translates to:
  /// **'Total Tenants'**
  String get statTotalTenants;

  /// No description provided for @statTrialAccounts.
  ///
  /// In en, this message translates to:
  /// **'Trial Accounts'**
  String get statTrialAccounts;

  /// No description provided for @statMRR.
  ///
  /// In en, this message translates to:
  /// **'MRR'**
  String get statMRR;

  /// No description provided for @reportSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions Report'**
  String get reportSubscriptions;

  /// No description provided for @reportRevenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue Report'**
  String get reportRevenue;

  /// No description provided for @reportCustomers.
  ///
  /// In en, this message translates to:
  /// **'Customers Report'**
  String get reportCustomers;

  /// No description provided for @reportUsage.
  ///
  /// In en, this message translates to:
  /// **'Usage Report'**
  String get reportUsage;

  /// No description provided for @reportPerformance.
  ///
  /// In en, this message translates to:
  /// **'Performance Report'**
  String get reportPerformance;

  /// No description provided for @totalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total Revenue'**
  String get totalRevenue;

  /// No description provided for @subscriptionStatus.
  ///
  /// In en, this message translates to:
  /// **'Subscription Status'**
  String get subscriptionStatus;

  /// No description provided for @currentPlan.
  ///
  /// In en, this message translates to:
  /// **'Current Plan'**
  String get currentPlan;

  /// No description provided for @planStarter.
  ///
  /// In en, this message translates to:
  /// **'Starter'**
  String get planStarter;

  /// No description provided for @perMonth.
  ///
  /// In en, this message translates to:
  /// **' / Month'**
  String get perMonth;

  /// No description provided for @upgradePlan.
  ///
  /// In en, this message translates to:
  /// **'Upgrade Plan'**
  String get upgradePlan;

  /// No description provided for @getMoreFeatures.
  ///
  /// In en, this message translates to:
  /// **'Get more features'**
  String get getMoreFeatures;

  /// No description provided for @downgradePlan.
  ///
  /// In en, this message translates to:
  /// **'Downgrade Plan'**
  String get downgradePlan;

  /// No description provided for @reduceCosts.
  ///
  /// In en, this message translates to:
  /// **'Reduce costs'**
  String get reduceCosts;

  /// No description provided for @renewalDate.
  ///
  /// In en, this message translates to:
  /// **'Renewal Date'**
  String get renewalDate;

  /// No description provided for @daysOverdue.
  ///
  /// In en, this message translates to:
  /// **'{count} days overdue'**
  String daysOverdue(Object count);

  /// No description provided for @mrr.
  ///
  /// In en, this message translates to:
  /// **'MRR'**
  String get mrr;

  /// No description provided for @billingCycle.
  ///
  /// In en, this message translates to:
  /// **'Billing Cycle'**
  String get billingCycle;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @yearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearly;

  /// No description provided for @amountSAR.
  ///
  /// In en, this message translates to:
  /// **'{amount} SAR'**
  String amountSAR(Object amount);

  /// No description provided for @accountsWatchlist.
  ///
  /// In en, this message translates to:
  /// **'Accounts Watchlist'**
  String get accountsWatchlist;

  /// No description provided for @accountCashOnHand.
  ///
  /// In en, this message translates to:
  /// **'Cash on Hand'**
  String get accountCashOnHand;

  /// No description provided for @accountBankAlBilad.
  ///
  /// In en, this message translates to:
  /// **'Bank Al-Bilad'**
  String get accountBankAlBilad;

  /// No description provided for @accountReceivable.
  ///
  /// In en, this message translates to:
  /// **'Accounts Receivable'**
  String get accountReceivable;

  /// No description provided for @categoryCurrentAssets.
  ///
  /// In en, this message translates to:
  /// **'Current Assets'**
  String get categoryCurrentAssets;

  /// No description provided for @categoryBankAccounts.
  ///
  /// In en, this message translates to:
  /// **'Bank Accounts'**
  String get categoryBankAccounts;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @newInvoice.
  ///
  /// In en, this message translates to:
  /// **'New Invoice'**
  String get newInvoice;

  /// No description provided for @recordExpense.
  ///
  /// In en, this message translates to:
  /// **'Record Expense'**
  String get recordExpense;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @importStatement.
  ///
  /// In en, this message translates to:
  /// **'Import Statement'**
  String get importStatement;

  /// No description provided for @recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recentTransactions;

  /// No description provided for @recentTransactionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Latest financial activities and journal entries.'**
  String get recentTransactionsSubtitle;

  /// No description provided for @totalExpenses.
  ///
  /// In en, this message translates to:
  /// **'Total Expenses'**
  String get totalExpenses;

  /// No description provided for @netProfit.
  ///
  /// In en, this message translates to:
  /// **'Net Profit'**
  String get netProfit;

  /// No description provided for @cashFlow.
  ///
  /// In en, this message translates to:
  /// **'Cash Flow'**
  String get cashFlow;

  /// No description provided for @verifyEmailClickLink.
  ///
  /// In en, this message translates to:
  /// **'Please click the link sent to your email '**
  String get verifyEmailClickLink;

  /// No description provided for @verifyEmailFinish.
  ///
  /// In en, this message translates to:
  /// **' to verify your account. Thank you'**
  String get verifyEmailFinish;

  /// No description provided for @didntReceiveEmail.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive an email?'**
  String get didntReceiveEmail;

  /// No description provided for @verifyEmailSimple.
  ///
  /// In en, this message translates to:
  /// **'Please click the link sent to your email'**
  String get verifyEmailSimple;

  /// No description provided for @activeUsers.
  ///
  /// In en, this message translates to:
  /// **'Active Users'**
  String get activeUsers;

  /// No description provided for @churnRate.
  ///
  /// In en, this message translates to:
  /// **'Churn Rate'**
  String get churnRate;

  /// No description provided for @avgSession.
  ///
  /// In en, this message translates to:
  /// **'Avg. Session'**
  String get avgSession;

  /// No description provided for @supportCenter.
  ///
  /// In en, this message translates to:
  /// **'Support Center'**
  String get supportCenter;

  /// No description provided for @getHelp.
  ///
  /// In en, this message translates to:
  /// **'Get Help'**
  String get getHelp;

  /// No description provided for @moduleInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get moduleInventory;

  /// No description provided for @moduleHrPayroll.
  ///
  /// In en, this message translates to:
  /// **'HR & Payroll'**
  String get moduleHrPayroll;

  /// No description provided for @moduleCrm.
  ///
  /// In en, this message translates to:
  /// **'CRM'**
  String get moduleCrm;

  /// No description provided for @pkgProfessional.
  ///
  /// In en, this message translates to:
  /// **'Professional'**
  String get pkgProfessional;

  /// No description provided for @pkgEnterprise.
  ///
  /// In en, this message translates to:
  /// **'Enterprise'**
  String get pkgEnterprise;

  /// No description provided for @createBackup.
  ///
  /// In en, this message translates to:
  /// **'Create Backup'**
  String get createBackup;

  /// No description provided for @automatedDailyBackup.
  ///
  /// In en, this message translates to:
  /// **'Automated Daily Backup'**
  String get automatedDailyBackup;

  /// No description provided for @backupSize.
  ///
  /// In en, this message translates to:
  /// **'Backup Size'**
  String get backupSize;

  /// No description provided for @totalStorageUsed.
  ///
  /// In en, this message translates to:
  /// **'Total storage used: {size}'**
  String totalStorageUsed(Object size);

  /// No description provided for @nextScheduled.
  ///
  /// In en, this message translates to:
  /// **'Next Scheduled'**
  String get nextScheduled;

  /// No description provided for @dailyAtMidnight.
  ///
  /// In en, this message translates to:
  /// **'Daily at midnight'**
  String get dailyAtMidnight;

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 hour ago} other{{count} hours ago}}'**
  String hoursAgo(num count);

  /// No description provided for @unitGb.
  ///
  /// In en, this message translates to:
  /// **'GB'**
  String get unitGb;

  /// No description provided for @accDashboard.
  ///
  /// In en, this message translates to:
  /// **'Accounting Dashboard'**
  String get accDashboard;

  /// No description provided for @accLedger.
  ///
  /// In en, this message translates to:
  /// **'General Ledger'**
  String get accLedger;

  /// No description provided for @accJournal.
  ///
  /// In en, this message translates to:
  /// **'Journal Entries'**
  String get accJournal;

  /// No description provided for @accChart.
  ///
  /// In en, this message translates to:
  /// **'Chart of Accounts'**
  String get accChart;

  /// No description provided for @accFunds.
  ///
  /// In en, this message translates to:
  /// **'Funds & Banks'**
  String get accFunds;

  /// No description provided for @accParties.
  ///
  /// In en, this message translates to:
  /// **'Parties'**
  String get accParties;

  /// No description provided for @accAssets.
  ///
  /// In en, this message translates to:
  /// **'Fixed\nAssets'**
  String get accAssets;

  /// No description provided for @accAssetsCenters.
  ///
  /// In en, this message translates to:
  /// **'Assets & Centers'**
  String get accAssetsCenters;

  /// No description provided for @accPeriodClosing.
  ///
  /// In en, this message translates to:
  /// **'Period Closing'**
  String get accPeriodClosing;

  /// No description provided for @accReports.
  ///
  /// In en, this message translates to:
  /// **'Accounting Reports'**
  String get accReports;

  /// No description provided for @accCustomize.
  ///
  /// In en, this message translates to:
  /// **'Customize'**
  String get accCustomize;

  /// No description provided for @accReceipts.
  ///
  /// In en, this message translates to:
  /// **'Receipts'**
  String get accReceipts;

  /// No description provided for @accPayments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get accPayments;

  /// No description provided for @accCashJournal.
  ///
  /// In en, this message translates to:
  /// **'Cash Journal'**
  String get accCashJournal;

  /// No description provided for @accExchange.
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get accExchange;

  /// No description provided for @accJournalEntry.
  ///
  /// In en, this message translates to:
  /// **'Journal Entry'**
  String get accJournalEntry;

  /// No description provided for @accCurrentRatio.
  ///
  /// In en, this message translates to:
  /// **'Current Ratio'**
  String get accCurrentRatio;

  /// No description provided for @accNetMargin.
  ///
  /// In en, this message translates to:
  /// **'Net Margin'**
  String get accNetMargin;

  /// No description provided for @accAvgCollection.
  ///
  /// In en, this message translates to:
  /// **'Avg. Collection'**
  String get accAvgCollection;

  /// No description provided for @accAvgPayment.
  ///
  /// In en, this message translates to:
  /// **'Avg. Payment'**
  String get accAvgPayment;

  /// No description provided for @accOverdueReceivables.
  ///
  /// In en, this message translates to:
  /// **'Overdue\nReceivables'**
  String get accOverdueReceivables;

  /// No description provided for @accPendingItems.
  ///
  /// In en, this message translates to:
  /// **'Pending Items'**
  String get accPendingItems;

  /// No description provided for @accJournalsPendingReview.
  ///
  /// In en, this message translates to:
  /// **'Journals pending review'**
  String get accJournalsPendingReview;

  /// No description provided for @accBankReconciliationsPending.
  ///
  /// In en, this message translates to:
  /// **'Bank reconciliations pending'**
  String get accBankReconciliationsPending;

  /// No description provided for @accInvoicesAwaitingApproval.
  ///
  /// In en, this message translates to:
  /// **'Invoices awaiting approval'**
  String get accInvoicesAwaitingApproval;

  /// No description provided for @accExpenseBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Expense Breakdown'**
  String get accExpenseBreakdown;

  /// No description provided for @accSalaries.
  ///
  /// In en, this message translates to:
  /// **'Salaries'**
  String get accSalaries;

  /// No description provided for @accRent.
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get accRent;

  /// No description provided for @accUtilities.
  ///
  /// In en, this message translates to:
  /// **'Utilities'**
  String get accUtilities;

  /// No description provided for @accMarketing.
  ///
  /// In en, this message translates to:
  /// **'Marketing'**
  String get accMarketing;

  /// No description provided for @accOthers.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get accOthers;

  /// No description provided for @accVatSummary.
  ///
  /// In en, this message translates to:
  /// **'VAT Summary'**
  String get accVatSummary;

  /// No description provided for @accVatCollectedLabel.
  ///
  /// In en, this message translates to:
  /// **'Collected:'**
  String get accVatCollectedLabel;

  /// No description provided for @accVatPaidLabel.
  ///
  /// In en, this message translates to:
  /// **'Paid:'**
  String get accVatPaidLabel;

  /// No description provided for @accVatNetLabel.
  ///
  /// In en, this message translates to:
  /// **'Net:'**
  String get accVatNetLabel;

  /// No description provided for @accVatDueLabel.
  ///
  /// In en, this message translates to:
  /// **'Due: {date}'**
  String accVatDueLabel(Object date);

  /// No description provided for @accPleaseSelectAccount.
  ///
  /// In en, this message translates to:
  /// **'Please select an account from the list above'**
  String get accPleaseSelectAccount;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @accAccountsPayable.
  ///
  /// In en, this message translates to:
  /// **'Accounts Payable'**
  String get accAccountsPayable;

  /// No description provided for @accAddAccount.
  ///
  /// In en, this message translates to:
  /// **'Add Account'**
  String get accAddAccount;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
