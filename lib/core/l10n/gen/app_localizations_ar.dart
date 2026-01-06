// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'ERP Max';

  @override
  String get customers => 'العملاء';

  @override
  String get sales => 'المبيعات';

  @override
  String get purchases => 'المشتريات';

  @override
  String get funds => 'الأموال';

  @override
  String get journal => 'الدفتر اليومي';

  @override
  String get ipAddress => 'عنوان IP';

  @override
  String get country => 'الدولة';

  @override
  String get visits => 'الزيارات';

  @override
  String get lastVisit => 'آخر زيارة';

  @override
  String get status => 'الحالة';

  @override
  String get actions => 'الإجراءات';

  @override
  String get defaultSubtitle => 'يتم إنشاء بيانات مفصلة...';

  @override
  String get searchHint => 'البحث بالاسم، الرمز...';

  @override
  String get noDataAvailable => 'لا توجد بيانات متاحة';

  @override
  String get reference => 'المرجع';

  @override
  String get date => 'التاريخ';

  @override
  String get description => 'الوصف';

  @override
  String get amount => 'المبلغ';

  @override
  String get verifyPhone => 'تحقق من هاتفك';

  @override
  String get enterCodeSent => 'أدخل رمز التحقق الذي أرسلناه إلى\n******7859';

  @override
  String get continueBtn => 'متابعة';

  @override
  String didNotReceiveCode(Object seconds) {
    return 'لم تصلك الرسالة؟ ($seconds ثانية)';
  }

  @override
  String get resend => 'إعادة الإرسال';

  @override
  String get clickLinkSent =>
      'يرجى الضغط على الرابط المرسل إلى بريدك الإلكتروني ';

  @override
  String get toVerifyAccount => ' لتفعيل حسابك. شكراً لك';

  @override
  String get backToHome => 'العودة إلى الرئيسية';

  @override
  String get didNotReceiveEmail => 'لم تصلك الرسالة الإلكترونية؟ ';

  @override
  String get forgotPassword => 'هل نسيت كلمة السر؟';

  @override
  String get enterEmailToReset =>
      'أدخل بريدك الإلكتروني لإعادة تعيين كلمة السر';

  @override
  String get backToSignIn => 'العودة لتسجيل الدخول';

  @override
  String get slide1Title => 'مسح سريع';

  @override
  String get slide1Sub => 'استخدم الأجهزة المحمولة للتتبع الفوري والكفاءة.';

  @override
  String get slide2Title => 'التحكم في المخزون';

  @override
  String get slide2Sub =>
      'مراقبة التحركات في الوقت الفعلي عبر جميع المستودعات.';

  @override
  String get slide3Title => 'بيانات موحدة';

  @override
  String get slide3Sub => 'كل شيء منظم في مكان واحد لاتخاذ قرارات أفضل.';

  @override
  String get slide4Title => 'وصول آمن';

  @override
  String get slide4Sub => 'مصادقة متعددة العوامل للحفاظ على سلامة بياناتك.';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة السر';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get forgot => 'نسيت؟';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get or => 'أو';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get errorEnterEmail => 'يرجى إدخال البريد الإلكتروني';

  @override
  String get errorInvalidEmail => 'أدخل بريداً إلكترونياً صحيحاً';

  @override
  String get errorMinLength => '6 أحرف كحد أدنى';

  @override
  String get checkYourEmail => 'تحقق من بريدك الإلكتروني';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get resetPassword => 'إعادة تعيين كلمة السر';

  @override
  String get resetPassInstruction =>
      'أدخل كلمة السر الجديدة لاستعادة الوصول إلى حسابك.';

  @override
  String get newPassword => 'كلمة السر الجديدة';

  @override
  String get min8Characters => '8 أحرف كحد أدنى';

  @override
  String get passwordTooShort => 'كلمة السر قصيرة جداً';

  @override
  String get confirmPassword => 'تأكيد كلمة السر';

  @override
  String get repeatPassword => 'كرر كلمة السر الخاصة بك';

  @override
  String get passwordsDoNotMatch => 'كلمات السر غير متطابقة';

  @override
  String get submit => 'إرسال';

  @override
  String get passwordChanged => 'تم تغيير كلمة السر';

  @override
  String get passwordChangedDesc =>
      'تم تحديث كلمة السر الخاصة بك بنجاح.\nأمان حسابك هو أولويتنا القصوى.';

  @override
  String get invalidEmail => 'البريد الإلكتروني غير صحيح';

  @override
  String get reEnterPassword => 'أعد إدخال كلمة السر';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get acceptTerms => 'أوافق على الشروط والأحكام';

  @override
  String get enterPassword => 'أدخل كلمة السر';

  @override
  String get errInvalidRequest => 'طلب غير صالح';

  @override
  String get errUnauthorized => 'غير مصرح به';

  @override
  String get errForbidden => 'غير مسموح به';

  @override
  String get errNotFound => 'المورد غير موجود';

  @override
  String get errServerError => 'خطأ في الخادم';

  @override
  String get errUnknown => 'خطأ غير معروف';

  @override
  String get errTimeout => 'انتهت مهلة الاتصال';

  @override
  String get errNoInternet => 'لا يوجد اتصال بالإنترنت';

  @override
  String get colCompanyName => 'اسم الشركة';

  @override
  String get colPackage => 'الباقة';

  @override
  String get colEndDate => 'تاريخ الانتهاء';

  @override
  String get colTags => 'الوسوم';

  @override
  String get subscribers => 'المشتركين';

  @override
  String get searchCompany => 'البحث عن شركة...';

  @override
  String get btnNew => 'جديد';

  @override
  String get btnReset => 'إعادة ضبط';

  @override
  String get overview => 'نظرة عامة';

  @override
  String get analytics => 'التحليلات';

  @override
  String get revenueForecast => 'توقعات الإيرادات';

  @override
  String get monthlyRevenueProjection => 'توقعات الإيرادات الشهرية';

  @override
  String get activeSubscriptions => 'الاشتراكات النشطة';

  @override
  String get growthByPackageType => 'النمو حسب نوع الباقة';

  @override
  String get dashboardSubtitle => 'أهلاً بك من جديد! إليك ما يحدث الآن.';

  @override
  String manageTitle(Object title) {
    return 'إدارة $title';
  }

  @override
  String get support => 'الدعم الفني';

  @override
  String get menuDashboard => 'لوحة القيادة';

  @override
  String get menuAccounting => 'المحاسبة';

  @override
  String get menuInventory => 'المخزون';

  @override
  String get menuSales => 'المبيعات';

  @override
  String get menuCustomerManagement => 'إدارة العملاء';

  @override
  String get menuRealEstate => 'الأصول العقارية';

  @override
  String get menuPOS => 'نقطة البيع';

  @override
  String get menuExchange => 'الصرافة والحوالات';

  @override
  String get menuPurchases => 'المشتريات';

  @override
  String get menuManufacturing => 'التصنيع';

  @override
  String get menuHR => 'إدارة الموارد البشرية';

  @override
  String get menuSaaS => 'التحكم في SaaS';

  @override
  String get menuAI => 'تحليلات الذكاء الاصطناعي';

  @override
  String get menuAuthPages => 'صفحات المصادقة';

  @override
  String get menuSettings => 'الإعدادات';

  @override
  String get saasAnalytics => 'تحليلات SaaS';

  @override
  String get saasAnalyticsDesc => 'نظرة عامة على أداء منصتك';

  @override
  String get exportReport => 'تصدير التقرير';

  @override
  String get statusPosted => 'مُرحّل';

  @override
  String get statusDraft => 'مسودة';

  @override
  String get statusPending => 'قيد الانتظار';

  @override
  String get sidebar => 'الشريط الجانبي';

  @override
  String get business => 'الأعمال';

  @override
  String get system => 'النظام';

  @override
  String get generalLedgerContent => 'محتوى دفتر الأستاذ العام';

  @override
  String get saasAdmin => 'مسؤول SaaS';

  @override
  String get subscriptionManagement => 'إدارة الاشتراكات';

  @override
  String get subscriptionDetails => 'تفاصيل الاشتراك';

  @override
  String get modules => 'الوحدات البرمجية';

  @override
  String get payBook => 'دفتر المدفوعات';

  @override
  String get generalLedger => 'دفتر الاستاذ العام';

  @override
  String get activityLog => 'سجل الأنشطة';

  @override
  String get amendment => 'تعديل';

  @override
  String get cancelSubscription => 'إلغاء الاشتراك';

  @override
  String get customerInformation => 'معلومات العميل';

  @override
  String get package => 'الباقة';

  @override
  String get duration => 'المدة';

  @override
  String get transaction => 'معاملة مالية';

  @override
  String get method => 'الطريقة';

  @override
  String get procedure => 'الإجراء';

  @override
  String get user => 'المستخدم';

  @override
  String get details => 'التفاصيل';

  @override
  String get reports => 'التقارير';

  @override
  String get manufacturing => 'التصنيع';

  @override
  String get comments => 'التعليقات';

  @override
  String get anyAdditionalComments => 'أي تعليقات إضافية';

  @override
  String get labelCustomer => 'العميل:';

  @override
  String get labelEmail => 'البريد الإلكتروني:';

  @override
  String get labelPackage => 'الباقة:';

  @override
  String get labelValue => 'القيمة:';

  @override
  String get labelStatus => 'الحالة:';

  @override
  String get labelStart => 'تاريخ البدء:';

  @override
  String get labelExpiry => 'تاريخ الانتهاء:';

  @override
  String get labelCondition => 'الشرط:';

  @override
  String get includedModules => 'الوحدات المضمنة';

  @override
  String get recentBackups => 'نسخ احتياطية حديثة';

  @override
  String get fileName => 'اسم الملف';

  @override
  String get size => 'الحجم';

  @override
  String get type => 'النوع';

  @override
  String get completed => 'مكتمل';

  @override
  String get partial => 'جزئي';

  @override
  String get lastBackup => 'آخر نسخة احتياطية';

  @override
  String get storageUsed => 'المساحة المستخدمة';

  @override
  String get nextSchedule => 'الجدول القادم';

  @override
  String timeAgo(Object hours) {
    return 'منذ $hours ساعات';
  }

  @override
  String todayAt(Object time) {
    return 'اليوم $time';
  }

  @override
  String get filterAllSub => 'كل الاشتراكات';

  @override
  String get filterClient => 'العميل';

  @override
  String get filterAllDate => 'كل التواريخ';

  @override
  String get filterAllPackages => 'كل الباقات';

  @override
  String get filterAllStatuses => 'كل الحالات';

  @override
  String get filterMore => 'المزيد من الفلاتر';

  @override
  String get packagePricing => 'الباقات والأسعار';

  @override
  String get moduleManagement => 'إدارة الوحدات';

  @override
  String get profiles => 'الملفات الشخصية';

  @override
  String get resetFilters => 'إعادة ضبط الفلاتر';

  @override
  String get newSubscription => 'اشتراك جديد';

  @override
  String get searchSubscriptions => 'البحث في الاشتراكات...';

  @override
  String get columnCompanyName => 'اسم الشركة';

  @override
  String get columnEndDate => 'تاريخ الانتهاء';

  @override
  String get columnTags => 'الوسوم';

  @override
  String get columnPaymentStatus => 'حالة الدفع';

  @override
  String get search => 'بحث...';

  @override
  String get print => 'طباعة';

  @override
  String get export => 'تصدير';

  @override
  String get newModule => 'وحدة جديدة';

  @override
  String get createPackage => 'إنشاء باقة';

  @override
  String get addSubscriber => 'إضافة مشترك';

  @override
  String get action => 'إجراء';

  @override
  String get success => 'تم بنجاح';

  @override
  String get failed => 'فشل';

  @override
  String get device => 'الجهاز';

  @override
  String get accessLogs => 'سجلات الدخول';

  @override
  String get company => 'الشركة';

  @override
  String get moduleDescriptionStandard => 'وحدة ERP القياسية بكامل وظائفها.';

  @override
  String get moduleName => 'اسم الوحدة';

  @override
  String get assignedPackages => 'الباقات المخصصة';

  @override
  String get version => 'الإصدار';

  @override
  String get active => 'نشط';

  @override
  String get inactive => 'غير نشط';

  @override
  String get historyLogs => 'سجلات المحفوظات';

  @override
  String get moduleProfile => 'ملف الوحدة';

  @override
  String get editModule => 'تعديل الوحدة';

  @override
  String versionFormat(Object version) {
    return 'الإصدار: $version';
  }

  @override
  String basePriceFormat(Object price) {
    return 'السعر الأساسي: $price ر.س';
  }

  @override
  String get updateHistory => 'سجل التحديثات';

  @override
  String get blocked => 'محظور';

  @override
  String ipDetails(Object ipAddress) {
    return 'تفاصيل عنوان IP: $ipAddress';
  }

  @override
  String visitorStats(Object count, Object country) {
    return 'قام زائر من $country بالزيارة $count مرات.';
  }

  @override
  String get close => 'إغلاق';

  @override
  String get columnTenant => 'المستأجر';

  @override
  String get columnPlan => 'الخطة';

  @override
  String get columnUsers => 'المستخدمون';

  @override
  String get columnRenewalDate => 'تاريخ التجديد';

  @override
  String get columnStorage => 'المساحة';

  @override
  String get searchTenants => 'البحث عن المستأجرين...';

  @override
  String get statusExpired => 'منتهي الصلاحية';

  @override
  String get statusTrial => 'تجريبي';

  @override
  String get statusSuspended => 'معلق';

  @override
  String get errorGeneral => 'حدث خطأ ما. يرجى التحديث.';

  @override
  String paginationShowing(Object current, Object total) {
    return 'عرض $current من أصل $total من المستأجرين';
  }

  @override
  String totalUsersCount(Object count) {
    return 'إجمالي المستخدمين: $count';
  }

  @override
  String get clickForDetails => 'انقر للتفاصيل';

  @override
  String get statTotalTenants => 'إجمالي المستأجرين';

  @override
  String get statTrialAccounts => 'الحسابات التجريبية';

  @override
  String get statMRR => 'العائد الشهري المتكرر';

  @override
  String get reportSubscriptions => 'تقرير الاشتراكات';

  @override
  String get reportRevenue => 'تقرير الإيرادات';

  @override
  String get reportCustomers => 'تقرير العملاء';

  @override
  String get reportUsage => 'تقرير الاستخدام';

  @override
  String get reportPerformance => 'تقرير الأداء';

  @override
  String get totalRevenue => 'إجمالي الإيرادات';

  @override
  String get subscriptionStatus => 'حالة الاشتراك';

  @override
  String get currentPlan => 'الخطة الحالية';

  @override
  String get planStarter => 'الباقة الأساسية';

  @override
  String get perMonth => ' / شهرياً';

  @override
  String get upgradePlan => 'ترقية الخطة';

  @override
  String get getMoreFeatures => 'الحصول على مزايا أكثر';

  @override
  String get downgradePlan => 'تخفيض الخطة';

  @override
  String get reduceCosts => 'تقليل التكاليف';

  @override
  String get renewalDate => 'تاريخ التجديد';

  @override
  String daysOverdue(Object count) {
    return 'متأخر منذ $count يوم';
  }

  @override
  String get mrr => 'العائد الشهري';

  @override
  String get billingCycle => 'دورة الفوترة';

  @override
  String get monthly => 'شهرياً';

  @override
  String get yearly => 'سنوياً';

  @override
  String amountSAR(Object amount) {
    return '$amount ر.س';
  }

  @override
  String get accountsWatchlist => 'قائمة مراقبة الحسابات';

  @override
  String get accountCashOnHand => 'النقدية في الصندوق';

  @override
  String get accountBankAlBilad => 'بنك البلاد';

  @override
  String get accountReceivable => 'الحسابات المدينة';

  @override
  String get categoryCurrentAssets => 'الأصول المتداولة';

  @override
  String get categoryBankAccounts => 'الحسابات البنكية';

  @override
  String get quickActions => 'إجراءات سريعة';

  @override
  String get newInvoice => 'فاتورة جديدة';

  @override
  String get recordExpense => 'تسجيل مصروف';

  @override
  String get transfer => 'تحويل';

  @override
  String get importStatement => 'استيراد كشف حساب';

  @override
  String get recentTransactions => 'أحدث المعاملات';

  @override
  String get recentTransactionsSubtitle => 'آخر الأنشطة المالية وقيود اليومية.';

  @override
  String get totalExpenses => 'إجمالي المصروفات';

  @override
  String get netProfit => 'صافي الربح';

  @override
  String get cashFlow => 'التدفق النقدي';

  @override
  String get verifyEmailClickLink =>
      'يرجى الضغط على الرابط المرسل إلى بريدك الإلكتروني ';

  @override
  String get verifyEmailFinish => ' لتأكيد حسابك. شكراً لك';

  @override
  String get didntReceiveEmail => 'لم يصلك البريد الإلكتروني؟';

  @override
  String get verifyEmailSimple =>
      'يرجى الضغط على الرابط المرسل إلى بريدك الإلكتروني';

  @override
  String get activeUsers => 'المستخدمون النشطون';

  @override
  String get churnRate => 'معدل الانصراف';

  @override
  String get avgSession => 'متوسط الجلسة';

  @override
  String get supportCenter => 'مركز الدعم';

  @override
  String get getHelp => 'الحصول على المساعدة';

  @override
  String get moduleInventory => 'المخزون';

  @override
  String get moduleHrPayroll => 'الموارد البشرية والرواتب';

  @override
  String get moduleCrm => 'إدارة علاقات العملاء';

  @override
  String get pkgProfessional => 'الباقة الاحترافية';

  @override
  String get pkgEnterprise => 'باقة المؤسسات';

  @override
  String get createBackup => 'إنشاء نسخة احتياطية';

  @override
  String get automatedDailyBackup => 'نسخ احتياطي يومي تلقائي';

  @override
  String get backupSize => 'حجم النسخة الاحتياطية';

  @override
  String totalStorageUsed(Object size) {
    return 'إجمالي المساحة المستخدمة: $size';
  }

  @override
  String get nextScheduled => 'النسخ القادم';

  @override
  String get dailyAtMidnight => 'يومياً عند منتصف الليل';

  @override
  String hoursAgo(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'قبل $count ساعة',
      many: 'قبل $count ساعة',
      few: 'قبل $count ساعات',
      two: 'قبل ساعتين',
      one: 'قبل ساعة',
    );
    return '$_temp0';
  }

  @override
  String get unitGb => 'جيجابايت';

  @override
  String get accDashboard => 'لوحة التحكم';

  @override
  String get accLedger => 'دفتر الأستاذ';

  @override
  String get accJournal => 'قيود اليومية';

  @override
  String get accChart => 'دليل الحسابات';

  @override
  String get accFunds => 'الصناديق والبنوك';

  @override
  String get accParties => 'الأطراف';

  @override
  String get accAssets => 'الأصول الثابتة';

  @override
  String get accAssetsCenters => 'الأصول والمراكز';

  @override
  String get accPeriodClosing => 'إغلاق الفترة';

  @override
  String get accReports => 'تقارير\nالمحاسبة';

  @override
  String get accCustomize => 'تخصيص';

  @override
  String get accReceipts => 'الإيصالات';

  @override
  String get accPayments => 'المدفوعات';

  @override
  String get accCashJournal => 'دفتر الصندوق';

  @override
  String get accExchange => 'صرف\nالعملات';

  @override
  String get accJournalEntry => 'قيد يومي';

  @override
  String get accCurrentRatio => 'نسبة التداول';

  @override
  String get accNetMargin => 'هامش الربح الصافي';

  @override
  String get accAvgCollection => 'متوسط فترة التحصيل';

  @override
  String get accAvgPayment => 'متوسط فترة السداد';

  @override
  String get accOverdueReceivables => 'ذمم مدينة\nمتأخرة';

  @override
  String get accPendingItems => 'عناصر قيد الانتظار';

  @override
  String get accJournalsPendingReview => 'قيود بانتظار المراجعة';

  @override
  String get accBankReconciliationsPending => 'تسويات بنكية معلقة';

  @override
  String get accInvoicesAwaitingApproval => 'فواتير بانتظار الموافقة';

  @override
  String get accExpenseBreakdown => 'توزيع المصروفات';

  @override
  String get accSalaries => 'الرواتب';

  @override
  String get accRent => 'الإيجار';

  @override
  String get accUtilities => 'المرافق';

  @override
  String get accMarketing => 'التسويق';

  @override
  String get accOthers => 'أخرى';

  @override
  String get accVatSummary => 'ملخص ضريبة القيمة المضافة';

  @override
  String get accVatCollectedLabel => 'المحصلة:';

  @override
  String get accVatPaidLabel => 'المدفوعة:';

  @override
  String get accVatNetLabel => 'الصافي:';

  @override
  String accVatDueLabel(Object date) {
    return 'الاستحقاق: $date';
  }

  @override
  String get accPleaseSelectAccount => 'يرجى اختيار حساب من القائمة أعلاه';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get accAccountsPayable => 'ذمم دائنة';

  @override
  String get accAddAccount => 'إضافة حساب';

  @override
  String get accAccountingSettings => 'إعدادات المحاسبة';

  @override
  String get commonSearchPlaceholder =>
      'بحث بالاسم أو الكود أو الرقم التسلسلي...';

  @override
  String get orgMainCompany => 'الشركة الرئيسية';

  @override
  String get orgBranchCompany => 'الفرع';

  @override
  String get orgDistributionCompany => 'شركة توزيع';

  @override
  String get book_type_main => 'الدفتر الرئيسي';

  @override
  String get book_type_tax => 'الدفتر الضريبي';

  @override
  String get book_type_internal => 'الدفتر الداخلي';

  @override
  String get all_cost_centers => 'كافة مراكز التكلفة';

  @override
  String get dept_headquarters => 'المقر الرئيسي';

  @override
  String get dept_sales => 'قسم المبيعات';

  @override
  String get dept_marketing => 'التسويق';

  @override
  String get dept_operations => 'العمليات';

  @override
  String get project_all => 'كافة المشاريع';

  @override
  String get project_expansion => 'مشروع التوسع';

  @override
  String get project_development => 'مشروع التطوير';

  @override
  String get project_modernization => 'مشروع التحديث';

  @override
  String get period_today => 'اليوم';

  @override
  String get period_this_week => 'هذا الأسبوع';

  @override
  String get period_this_month => 'هذا الشهر';

  @override
  String get period_this_quarter => 'هذا الربع';

  @override
  String get period_this_year => 'هذه السنة';

  @override
  String get action_export => 'تصدير';

  @override
  String get label_drafts => 'المسودات:';

  @override
  String get label_posted => 'المُرحّل:';

  @override
  String get label_total_credit => 'إجمالي الدائن:';

  @override
  String get label_total_debit => 'إجمالي المدين:';

  @override
  String get label_entries => 'القيود:';

  @override
  String get search_placeholder => 'بحث في القيود...';

  @override
  String get column_debit => 'مدين';

  @override
  String get column_credit => 'دائن';

  @override
  String get column_ref => 'المرجع';

  @override
  String get column_entry_no => 'رقم القيد';

  @override
  String get action_filter => 'تصفية';

  @override
  String get label_count => 'العدد:';

  @override
  String statusSummary(int postedCount, int draftCount, int pendingCount) {
    String _temp0 = intl.Intl.pluralLogic(
      draftCount,
      locale: localeName,
      other: 'مسودة',
      few: 'مسودات',
      one: 'مسودة',
    );
    return '$postedCount مُرحّل · $draftCount $_temp0 · $pendingCount معلق';
  }

  @override
  String get label_materials => 'المواد';

  @override
  String get greeting_morning => 'صباح الخير';

  @override
  String get greeting_afternoon => 'طاب يومك';

  @override
  String get greeting_evening => 'مساء الخير';

  @override
  String get greeting_night => 'تصبح على خير';

  @override
  String get theme_title => 'المظهر';

  @override
  String get theme_light => 'فاتح';

  @override
  String get theme_dark => 'داكن';

  @override
  String get theme_system => 'تلقائي';

  @override
  String get layout_topbar => 'الشريط العلوي';

  @override
  String get action_sign_out => 'تسجيل الخروج';

  @override
  String get setting_nav_style => 'نمط التنقل';

  @override
  String get view_tree => 'عرض شجري';

  @override
  String get view_table => 'جدول';

  @override
  String get action_expand => 'توسيع';

  @override
  String get action_collapse => 'طي';

  @override
  String get action_add_group => 'إضافة مجموعة';

  @override
  String get column_account_code => 'رمز الحساب';

  @override
  String get column_account_name => 'اسم الحساب';

  @override
  String get column_account_type => 'نوع الحساب';

  @override
  String get column_balance => 'الرصيد';

  @override
  String get desc_manage_accounts =>
      'إدارة الصناديق النقدية والحسابات البنكية.';

  @override
  String get labelFundBank => 'الصندوق/البنك';

  @override
  String get label_all => 'الكل';

  @override
  String totalBalanceWithLabel(Object label) {
    return 'إجمالي الرصيد ($label)';
  }

  @override
  String get total_receipts => 'إجمالي المقبوضات';

  @override
  String get total_payments => 'إجمالي المدفوعات';

  @override
  String get todays_net_flow => 'صافي تدفق اليوم';

  @override
  String get title_funds_and_banks => 'الصناديق والبنوك';

  @override
  String get view_grid => 'شبكة';

  @override
  String get labelCashFund => 'الصندوق النقدي';

  @override
  String get labelConv => 'تحويل';

  @override
  String balanceWithCurrency(Object currentCurrency) {
    return 'الرصيد ($currentCurrency)';
  }

  @override
  String get currencyDetails => 'تفاصيل العملة';

  @override
  String get todaysChange => 'تغير اليوم';

  @override
  String get lastActivity => 'آخر نشاط';

  @override
  String get labelConverted => 'محوّل';

  @override
  String get actionWithdraw => 'سحب';

  @override
  String get actionDeposit => 'إيداع';

  @override
  String get actionMore => 'المزيد';

  @override
  String get accountsCount => 'العدد: ';

  @override
  String get totalCustomers => 'إجمالي العملاء';

  @override
  String get totalReceivables => 'إجمالي الذمم المدينة';

  @override
  String get totalSuppliers => 'إجمالي الموردين';

  @override
  String get totalPayables => 'إجمالي الذمم الدائنة';

  @override
  String get labelPhoneNumber => 'رقم الهاتف';

  @override
  String get labelCity => 'المدينة';

  @override
  String get labelName => 'الاسم';

  @override
  String get labelAccountNumber => 'رقم الحساب';
}
