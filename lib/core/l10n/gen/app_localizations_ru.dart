// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'ERP Max';

  @override
  String get customers => 'Клиенты';

  @override
  String get sales => 'Продажи';

  @override
  String get purchases => 'Закупки';

  @override
  String get funds => 'Средства';

  @override
  String get journal => 'Журнал';

  @override
  String get ipAddress => 'IP-адрес';

  @override
  String get country => 'Страна';

  @override
  String get visits => 'Визиты';

  @override
  String get lastVisit => 'Последний визит';

  @override
  String get status => 'Статус';

  @override
  String get actions => 'Действия';

  @override
  String get defaultSubtitle => 'Подробные данные генерируются...';

  @override
  String get searchHint => 'Поиск по имени, коду или серийному номеру...';

  @override
  String get noDataAvailable => 'Нет данных';

  @override
  String get reference => 'Ссылка';

  @override
  String get date => 'Дата';

  @override
  String get description => 'Описание';

  @override
  String get amount => 'Сумма';

  @override
  String get verifyPhone => 'Подтвердите номер телефона';

  @override
  String get enterCodeSent =>
      'Введите код подтверждения, отправленный на\n******7859';

  @override
  String get continueBtn => 'Продолжить';

  @override
  String didNotReceiveCode(Object seconds) {
    return 'Не получили код? ($seconds сек.)';
  }

  @override
  String get resend => 'Отправить повторно';

  @override
  String get clickLinkSent =>
      'Пожалуйста, перейдите по ссылке, отправленной на ваш email ';

  @override
  String get toVerifyAccount => ', чтобы подтвердить свой аккаунт. Спасибо';

  @override
  String get backToHome => 'Вернуться на главную';

  @override
  String get didNotReceiveEmail => 'Не получили письмо? ';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get enterEmailToReset => 'Введите ваш email для сброса пароля';

  @override
  String get backToSignIn => 'Вернуться к авторизации';

  @override
  String get slide1Title => 'Быстрое сканирование';

  @override
  String get slide1Sub =>
      'Используйте мобильные устройства для мгновенного отслеживания.';

  @override
  String get slide2Title => 'Контроль запасов';

  @override
  String get slide2Sub =>
      'Отслеживайте перемещения в реальном времени по всем складам.';

  @override
  String get slide3Title => 'Единые данные';

  @override
  String get slide3Sub =>
      'Все организовано в одном месте для принятия лучших решений.';

  @override
  String get slide4Title => 'Безопасный доступ';

  @override
  String get slide4Sub =>
      'Многофакторная аутентификация для защиты ваших данных.';

  @override
  String get email => 'Email';

  @override
  String get password => 'Пароль';

  @override
  String get signIn => 'Войти';

  @override
  String get signUp => 'Регистрация';

  @override
  String get forgot => 'Забыли?';

  @override
  String get rememberMe => 'Запомнить меня';

  @override
  String get or => 'ИЛИ';

  @override
  String get dontHaveAccount => 'Нет аккаунта?';

  @override
  String get errorEnterEmail => 'Пожалуйста, введите email';

  @override
  String get errorInvalidEmail => 'Введите корректный email';

  @override
  String get errorMinLength => 'Минимум 6 символов';
}
