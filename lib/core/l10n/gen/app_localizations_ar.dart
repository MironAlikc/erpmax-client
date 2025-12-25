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
  String get visits => 'Зиярат';

  @override
  String get lastVisit => 'آخر زيارة';

  @override
  String get status => 'الحالة';

  @override
  String get actions => 'الإجراءات';

  @override
  String get defaultSubtitle => 'يتم إنشاء بيانات مفصلة...';

  @override
  String get searchHint => 'البحث حسب الاسم أو الكود أو الرقم التسلسلي...';

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
  String get slide4Sub => 'مصادقة متعددة العوامل للحفاظ на سلامة بياناتك.';

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
}
