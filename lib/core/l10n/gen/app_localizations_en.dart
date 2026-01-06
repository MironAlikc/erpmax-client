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
  String get searchHint => 'Search my name, code...';

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

  @override
  String get filterAllSub => 'All SUB';

  @override
  String get filterClient => 'Client';

  @override
  String get filterAllDate => 'All Date';

  @override
  String get filterAllPackages => 'All Packages';

  @override
  String get filterAllStatuses => 'All Statuses';

  @override
  String get filterMore => 'More Filters';

  @override
  String get packagePricing => 'Package & Pricing';

  @override
  String get moduleManagement => 'Module Management';

  @override
  String get profiles => 'Profiles';

  @override
  String get resetFilters => 'Reset Filters';

  @override
  String get newSubscription => 'New Subscription';

  @override
  String get searchSubscriptions => 'Search subscriptions...';

  @override
  String get columnCompanyName => 'Company Name';

  @override
  String get columnEndDate => 'End Date';

  @override
  String get columnTags => 'Tags';

  @override
  String get columnPaymentStatus => 'Payment Status';

  @override
  String get search => 'Search...';

  @override
  String get print => 'Print';

  @override
  String get export => 'Export';

  @override
  String get newModule => 'New Module';

  @override
  String get createPackage => 'Create Package';

  @override
  String get addSubscriber => 'Add Subscriber';

  @override
  String get action => 'Action';

  @override
  String get success => 'Success';

  @override
  String get failed => 'Failed';

  @override
  String get device => 'Device';

  @override
  String get accessLogs => 'Access Logs';

  @override
  String get company => 'Company';

  @override
  String get moduleDescriptionStandard =>
      'Standard ERP module with full functionality.';

  @override
  String get moduleName => 'Module Name';

  @override
  String get assignedPackages => 'Assigned Packages';

  @override
  String get version => 'Version';

  @override
  String get active => 'Active';

  @override
  String get inactive => 'Inactive';

  @override
  String get historyLogs => 'History Logs';

  @override
  String get moduleProfile => 'Module Profile';

  @override
  String get editModule => 'Edit Module';

  @override
  String versionFormat(Object version) {
    return 'Version: $version';
  }

  @override
  String basePriceFormat(Object price) {
    return 'Base Price: $price SAR';
  }

  @override
  String get updateHistory => 'Update History';

  @override
  String get blocked => 'Blocked';

  @override
  String ipDetails(Object ipAddress) {
    return 'IP Details: $ipAddress';
  }

  @override
  String visitorStats(Object count, Object country) {
    return 'Visitor from $country has visited $count times.';
  }

  @override
  String get close => 'Close';

  @override
  String get columnTenant => 'Tenant';

  @override
  String get columnPlan => 'Plan';

  @override
  String get columnUsers => 'Users';

  @override
  String get columnRenewalDate => 'Renewal Date';

  @override
  String get columnStorage => 'Storage';

  @override
  String get searchTenants => 'Search tenants...';

  @override
  String get statusExpired => 'Expired';

  @override
  String get statusTrial => 'Trial';

  @override
  String get statusSuspended => 'Suspended';

  @override
  String get errorGeneral => 'Something went wrong. Please refresh.';

  @override
  String paginationShowing(Object current, Object total) {
    return 'Showing $current of $total Tenants';
  }

  @override
  String totalUsersCount(Object count) {
    return '$count Total Users';
  }

  @override
  String get clickForDetails => 'Click for details';

  @override
  String get statTotalTenants => 'Total Tenants';

  @override
  String get statTrialAccounts => 'Trial Accounts';

  @override
  String get statMRR => 'MRR';

  @override
  String get reportSubscriptions => 'Subscriptions Report';

  @override
  String get reportRevenue => 'Revenue Report';

  @override
  String get reportCustomers => 'Customers Report';

  @override
  String get reportUsage => 'Usage Report';

  @override
  String get reportPerformance => 'Performance Report';

  @override
  String get totalRevenue => 'Total Revenue';

  @override
  String get subscriptionStatus => 'Subscription Status';

  @override
  String get currentPlan => 'Current Plan';

  @override
  String get planStarter => 'Starter';

  @override
  String get perMonth => ' / Month';

  @override
  String get upgradePlan => 'Upgrade Plan';

  @override
  String get getMoreFeatures => 'Get more features';

  @override
  String get downgradePlan => 'Downgrade Plan';

  @override
  String get reduceCosts => 'Reduce costs';

  @override
  String get renewalDate => 'Renewal Date';

  @override
  String daysOverdue(Object count) {
    return '$count days overdue';
  }

  @override
  String get mrr => 'MRR';

  @override
  String get billingCycle => 'Billing Cycle';

  @override
  String get monthly => 'Monthly';

  @override
  String get yearly => 'Yearly';

  @override
  String amountSAR(Object amount) {
    return '$amount SAR';
  }

  @override
  String get accountsWatchlist => 'Accounts Watchlist';

  @override
  String get accountCashOnHand => 'Cash on Hand';

  @override
  String get accountBankAlBilad => 'Bank Al-Bilad';

  @override
  String get accountReceivable => 'Accounts Receivable';

  @override
  String get categoryCurrentAssets => 'Current Assets';

  @override
  String get categoryBankAccounts => 'Bank Accounts';

  @override
  String get quickActions => 'Quick Actions';

  @override
  String get newInvoice => 'New Invoice';

  @override
  String get recordExpense => 'Record Expense';

  @override
  String get transfer => 'Transfer';

  @override
  String get importStatement => 'Import Statement';

  @override
  String get recentTransactions => 'Recent Transactions';

  @override
  String get recentTransactionsSubtitle =>
      'Latest financial activities and journal entries.';

  @override
  String get totalExpenses => 'Total Expenses';

  @override
  String get netProfit => 'Net Profit';

  @override
  String get cashFlow => 'Cash Flow';

  @override
  String get verifyEmailClickLink =>
      'Please click the link sent to your email ';

  @override
  String get verifyEmailFinish => ' to verify your account. Thank you';

  @override
  String get didntReceiveEmail => 'Didn\'t receive an email?';

  @override
  String get verifyEmailSimple => 'Please click the link sent to your email';

  @override
  String get activeUsers => 'Active Users';

  @override
  String get churnRate => 'Churn Rate';

  @override
  String get avgSession => 'Avg. Session';

  @override
  String get supportCenter => 'Support Center';

  @override
  String get getHelp => 'Get Help';

  @override
  String get moduleInventory => 'Inventory';

  @override
  String get moduleHrPayroll => 'HR & Payroll';

  @override
  String get moduleCrm => 'CRM';

  @override
  String get pkgProfessional => 'Professional';

  @override
  String get pkgEnterprise => 'Enterprise';

  @override
  String get createBackup => 'Create Backup';

  @override
  String get automatedDailyBackup => 'Automated Daily Backup';

  @override
  String get backupSize => 'Backup Size';

  @override
  String totalStorageUsed(Object size) {
    return 'Total storage used: $size';
  }

  @override
  String get nextScheduled => 'Next Scheduled';

  @override
  String get dailyAtMidnight => 'Daily at midnight';

  @override
  String hoursAgo(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String get unitGb => 'GB';

  @override
  String get accDashboard => 'Accounting Dashboard';

  @override
  String get accLedger => 'General Ledger';

  @override
  String get accJournal => 'Journal Entries';

  @override
  String get accChart => 'Chart of Accounts';

  @override
  String get accFunds => 'Funds & Banks';

  @override
  String get accParties => 'Parties';

  @override
  String get accAssets => 'Fixed\nAssets';

  @override
  String get accAssetsCenters => 'Assets & Centers';

  @override
  String get accPeriodClosing => 'Period Closing';

  @override
  String get accReports => 'Accounting Reports';

  @override
  String get accCustomize => 'Customize';

  @override
  String get accReceipts => 'Receipts';

  @override
  String get accPayments => 'Payments';

  @override
  String get accCashJournal => 'Cash Journal';

  @override
  String get accExchange => 'Exchange';

  @override
  String get accJournalEntry => 'Journal Entry';

  @override
  String get accCurrentRatio => 'Current Ratio';

  @override
  String get accNetMargin => 'Net Margin';

  @override
  String get accAvgCollection => 'Avg. Collection';

  @override
  String get accAvgPayment => 'Avg. Payment';

  @override
  String get accOverdueReceivables => 'Overdue\nReceivables';

  @override
  String get accPendingItems => 'Pending Items';

  @override
  String get accJournalsPendingReview => 'Journals pending review';

  @override
  String get accBankReconciliationsPending => 'Bank reconciliations pending';

  @override
  String get accInvoicesAwaitingApproval => 'Invoices awaiting approval';

  @override
  String get accExpenseBreakdown => 'Expense Breakdown';

  @override
  String get accSalaries => 'Salaries';

  @override
  String get accRent => 'Rent';

  @override
  String get accUtilities => 'Utilities';

  @override
  String get accMarketing => 'Marketing';

  @override
  String get accOthers => 'Others';

  @override
  String get accVatSummary => 'VAT Summary';

  @override
  String get accVatCollectedLabel => 'Collected:';

  @override
  String get accVatPaidLabel => 'Paid:';

  @override
  String get accVatNetLabel => 'Net:';

  @override
  String accVatDueLabel(Object date) {
    return 'Due: $date';
  }

  @override
  String get accPleaseSelectAccount =>
      'Please select an account from the list above';

  @override
  String get viewAll => 'View All';

  @override
  String get accAccountsPayable => 'Accounts Payable';

  @override
  String get accAddAccount => 'Add Account';

  @override
  String get accAccountingSettings => 'Accounting Settings';

  @override
  String get commonSearchPlaceholder => 'Search by name, code, or serial...';

  @override
  String get orgMainCompany => 'Main Company';

  @override
  String get orgBranchCompany => 'Branch Company';

  @override
  String get orgDistributionCompany => 'Distribution Company';

  @override
  String get book_type_main => 'Main Book';

  @override
  String get book_type_tax => 'Tax Book';

  @override
  String get book_type_internal => 'Internal Book';

  @override
  String get all_cost_centers => 'All Cost Centers';

  @override
  String get dept_headquarters => 'Headquarters';

  @override
  String get dept_sales => 'Sales Department';

  @override
  String get dept_marketing => 'Marketing';

  @override
  String get dept_operations => 'Operations';

  @override
  String get project_all => 'All Projects';

  @override
  String get project_expansion => 'Expansion Project';

  @override
  String get project_development => 'Development Project';

  @override
  String get project_modernization => 'Modernization Project';

  @override
  String get period_today => 'Today';

  @override
  String get period_this_week => 'This Week';

  @override
  String get period_this_month => 'This Month';

  @override
  String get period_this_quarter => 'This Quarter';

  @override
  String get period_this_year => 'This Year';

  @override
  String get action_export => 'Export';

  @override
  String get label_drafts => 'Drafts:';

  @override
  String get label_posted => 'Posted:';

  @override
  String get label_total_credit => 'Total Credit:';

  @override
  String get label_total_debit => 'Total Debit:';

  @override
  String get label_entries => 'Entries:';

  @override
  String get search_placeholder => 'Search entries...';

  @override
  String get column_debit => 'Debit';

  @override
  String get column_credit => 'Credit';

  @override
  String get column_ref => 'Ref';

  @override
  String get column_entry_no => 'Entry #';

  @override
  String get action_filter => 'Filter';

  @override
  String get label_count => 'Count:';

  @override
  String statusSummary(int postedCount, int draftCount, int pendingCount) {
    String _temp0 = intl.Intl.pluralLogic(
      draftCount,
      locale: localeName,
      other: 'drafts',
      one: 'draft',
    );
    return '$postedCount posted · $draftCount $_temp0 · $pendingCount pending';
  }

  @override
  String get label_materials => 'Materials';

  @override
  String get greeting_morning => 'Good Morning';

  @override
  String get greeting_afternoon => 'Good Afternoon';

  @override
  String get greeting_evening => 'Good Evening';

  @override
  String get greeting_night => 'Good Night';

  @override
  String get theme_title => 'Theme';

  @override
  String get theme_light => 'Light';

  @override
  String get theme_dark => 'Dark';

  @override
  String get theme_system => 'System';

  @override
  String get layout_topbar => 'Topbar';

  @override
  String get action_sign_out => 'Sign out';

  @override
  String get setting_nav_style => 'Navigation Style';

  @override
  String get view_tree => 'Tree View';

  @override
  String get view_table => 'Table';

  @override
  String get action_expand => 'Expand';

  @override
  String get action_collapse => 'Collapse';

  @override
  String get action_add_group => 'Add Group';

  @override
  String get column_account_code => 'Account Code';

  @override
  String get column_account_name => 'Account Name';

  @override
  String get column_account_type => 'Account Type';

  @override
  String get column_balance => 'Balance';

  @override
  String get desc_manage_accounts => 'Manage cash funds and bank accounts.';

  @override
  String get labelFundBank => 'Fund/Bank';

  @override
  String get label_all => 'All';

  @override
  String totalBalanceWithLabel(Object label) {
    return 'Total Balance ($label)';
  }

  @override
  String get total_receipts => 'Total Receipts';

  @override
  String get total_payments => 'Total Payments';

  @override
  String get todays_net_flow => 'Today\'s Net Flow';

  @override
  String get title_funds_and_banks => 'Funds & Banks';

  @override
  String get view_grid => 'Grid';

  @override
  String get labelCashFund => 'Cash Fund';

  @override
  String get labelConv => 'conv';

  @override
  String balanceWithCurrency(Object currentCurrency) {
    return 'Balance ($currentCurrency)';
  }

  @override
  String get currencyDetails => 'Currency Details';

  @override
  String get todaysChange => 'Today\'s Change';

  @override
  String get lastActivity => 'Last Activity';

  @override
  String get labelConverted => 'converted';

  @override
  String get actionWithdraw => 'Withdraw';

  @override
  String get actionDeposit => 'Deposit';

  @override
  String get actionMore => 'More';

  @override
  String get accountsCount => 'Count: ';

  @override
  String get totalCustomers => 'Total Customers';

  @override
  String get totalReceivables => 'Total Receivables';

  @override
  String get totalSuppliers => 'Total Suppliers';

  @override
  String get totalPayables => 'Total Payables';

  @override
  String get labelPhoneNumber => 'Phone Number';

  @override
  String get labelCity => 'City';

  @override
  String get labelName => 'Name';

  @override
  String get labelAccountNumber => 'Account Number';

  @override
  String get labelActiveWithColon => 'active: ';

  @override
  String get labelActivity => 'Activity';

  @override
  String get contactInfo => 'Contact Info';

  @override
  String get labelGroup => 'Group';

  @override
  String get labelNameId => 'Name / ID';
}
