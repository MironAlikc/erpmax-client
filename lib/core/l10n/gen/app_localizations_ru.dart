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
  String get backToHome => 'На главную';

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

  @override
  String get checkYourEmail => 'Проверьте почту';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get resetPassword => 'Сброс пароля';

  @override
  String get resetPassInstruction =>
      'Введите новый пароль, чтобы восстановить доступ.';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get min8Characters => 'Минимум 8 символов';

  @override
  String get passwordTooShort => 'Пароль слишком короткий';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get repeatPassword => 'Повторите ваш пароль';

  @override
  String get passwordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get submit => 'Отправить';

  @override
  String get passwordChanged => 'Пароль изменен';

  @override
  String get passwordChangedDesc =>
      'Ваш пароль был успешно обновлен.\nБезопасность вашего аккаунта — наш приоритет.';

  @override
  String get invalidEmail => 'Некорректный email';

  @override
  String get reEnterPassword => 'Введите пароль еще раз';

  @override
  String get alreadyHaveAccount => 'Уже есть аккаунт? ';

  @override
  String get acceptTerms => 'Я принимаю Условия и Положения';

  @override
  String get enterPassword => 'Введите пароль';

  @override
  String get errInvalidRequest => 'Неверный запрос';

  @override
  String get errUnauthorized => 'Ошибка авторизации';

  @override
  String get errForbidden => 'Доступ запрещен';

  @override
  String get errNotFound => 'Ресурс не найден';

  @override
  String get errServerError => 'Ошибка сервера';

  @override
  String get errUnknown => 'Неизвестная ошибка';

  @override
  String get errTimeout => 'Время ожидания истекло';

  @override
  String get errNoInternet => 'Нет интернет-соединения';

  @override
  String get colCompanyName => 'Название компании';

  @override
  String get colPackage => 'Пакет';

  @override
  String get colEndDate => 'Дата окончания';

  @override
  String get colTags => 'Теги';

  @override
  String get subscribers => 'Подписчики';

  @override
  String get searchCompany => 'Поиск компании...';

  @override
  String get btnNew => 'Создать';

  @override
  String get btnReset => 'Сбросить';

  @override
  String get overview => 'Обзор';

  @override
  String get analytics => 'Аналитика';

  @override
  String get revenueForecast => 'Прогноз выручки';

  @override
  String get monthlyRevenueProjection => 'Прогноз ежемесячной выручки';

  @override
  String get activeSubscriptions => 'Активные подписки';

  @override
  String get growthByPackageType => 'Рост по типам пакетов';

  @override
  String get dashboardSubtitle => 'С возвращением! Вот что происходит.';

  @override
  String manageTitle(Object title) {
    return 'Управление: $title';
  }

  @override
  String get support => 'Поддержка';

  @override
  String get menuDashboard => 'Панель управления';

  @override
  String get menuAccounting => 'Бухгалтерия';

  @override
  String get menuInventory => 'Инвентаризация';

  @override
  String get menuSales => 'Продажи';

  @override
  String get menuCustomerManagement => 'Управление клиентами';

  @override
  String get menuRealEstate => 'Недвижимость';

  @override
  String get menuPOS => 'Точка продаж (POS)';

  @override
  String get menuExchange => 'Обмен и переводы';

  @override
  String get menuPurchases => 'Закупки';

  @override
  String get menuManufacturing => 'Производство';

  @override
  String get menuHR => 'Управление персоналом';

  @override
  String get menuSaaS => 'Управление SaaS';

  @override
  String get menuAI => 'AI Аналитика';

  @override
  String get menuAuthPages => 'Страницы входа';

  @override
  String get menuSettings => 'Настройки';

  @override
  String get saasAnalytics => 'SaaS Аналитика';

  @override
  String get saasAnalyticsDesc => 'Обзор производительности вашей платформы';

  @override
  String get exportReport => 'Экспорт отчета';

  @override
  String get statusPosted => 'Проведено';

  @override
  String get statusDraft => 'Черновик';

  @override
  String get statusPending => 'В ожидании';

  @override
  String get sidebar => 'Боковое меню';

  @override
  String get business => 'Бизнес';

  @override
  String get system => 'Система';

  @override
  String get generalLedgerContent => 'Содержание главной книги';

  @override
  String get saasAdmin => 'SaaS Админ';

  @override
  String get subscriptionManagement => 'Управление подписками';

  @override
  String get subscriptionDetails => 'Детали подписки';

  @override
  String get modules => 'Модули';

  @override
  String get payBook => 'Расчетная книжка';

  @override
  String get generalLedger => 'Главная книга';

  @override
  String get activityLog => 'Журнал активности';

  @override
  String get amendment => 'Поправка';

  @override
  String get cancelSubscription => 'Отменить подписку';

  @override
  String get customerInformation => 'Информация о клиенте';

  @override
  String get package => 'Пакет';

  @override
  String get duration => 'Длительность';

  @override
  String get transaction => 'Транзакция';

  @override
  String get method => 'Метод';

  @override
  String get procedure => 'Процедура';

  @override
  String get user => 'Пользователь';

  @override
  String get details => 'Детали';

  @override
  String get reports => 'Отчеты';

  @override
  String get manufacturing => 'Производство';

  @override
  String get comments => 'Комментарии';

  @override
  String get anyAdditionalComments => 'Любые дополнительные комментарии';

  @override
  String get labelCustomer => 'Клиент:';

  @override
  String get labelEmail => 'E-mail:';

  @override
  String get labelPackage => 'Пакет:';

  @override
  String get labelValue => 'Стоимость:';

  @override
  String get labelStatus => 'Статус:';

  @override
  String get labelStart => 'Начало:';

  @override
  String get labelExpiry => 'Истекает:';

  @override
  String get labelCondition => 'Состояние:';

  @override
  String get includedModules => 'Включенные модули';

  @override
  String get recentBackups => 'Последние копии';

  @override
  String get fileName => 'Имя файла';

  @override
  String get size => 'Размер';

  @override
  String get type => 'Тип';

  @override
  String get completed => 'Завершено';

  @override
  String get partial => 'Частично';

  @override
  String get lastBackup => 'Последний бэкап';

  @override
  String get storageUsed => 'Использовано место';

  @override
  String get nextSchedule => 'След. по графику';

  @override
  String timeAgo(Object hours) {
    return '$hours ч. назад';
  }

  @override
  String todayAt(Object time) {
    return 'Сегодня $time';
  }

  @override
  String get filterAllSub => 'Все подписки';

  @override
  String get filterClient => 'Клиент';

  @override
  String get filterAllDate => 'Все даты';

  @override
  String get filterAllPackages => 'Все пакеты';

  @override
  String get filterAllStatuses => 'Все статусы';

  @override
  String get filterMore => 'Доп. фильтры';

  @override
  String get packagePricing => 'Пакеты и цены';

  @override
  String get moduleManagement => 'Управление модулями';

  @override
  String get profiles => 'Профили';

  @override
  String get resetFilters => 'Сбросить фильтры';

  @override
  String get newSubscription => 'Новая подписка';

  @override
  String get searchSubscriptions => 'Поиск подписок...';

  @override
  String get columnCompanyName => 'Название компании';

  @override
  String get columnEndDate => 'Дата окончания';

  @override
  String get columnTags => 'Теги';

  @override
  String get columnPaymentStatus => 'Статус оплаты';

  @override
  String get search => 'Поиск...';

  @override
  String get print => 'Печать';

  @override
  String get export => 'Экспорт';

  @override
  String get newModule => 'Новый модуль';

  @override
  String get createPackage => 'Создать пакет';

  @override
  String get addSubscriber => 'Добавить подписчика';

  @override
  String get action => 'Действие';

  @override
  String get success => 'Успешно';

  @override
  String get failed => 'Ошибка';

  @override
  String get device => 'Устройство';

  @override
  String get accessLogs => 'Журналы доступа';

  @override
  String get company => 'Компания';

  @override
  String get moduleDescriptionStandard =>
      'Стандартный ERP-модуль с полным функционалом.';

  @override
  String get moduleName => 'Название модуля';

  @override
  String get assignedPackages => 'Назначенные пакеты';

  @override
  String get version => 'Версия';

  @override
  String get active => 'Активен';

  @override
  String get inactive => 'Неактивен';

  @override
  String get historyLogs => 'Журналы истории';

  @override
  String get moduleProfile => 'Профиль модуля';

  @override
  String get editModule => 'Редактировать модуль';

  @override
  String versionFormat(Object version) {
    return 'Версия: $version';
  }

  @override
  String basePriceFormat(Object price) {
    return 'Базовая цена: $price SAR';
  }

  @override
  String get updateHistory => 'История обновлений';

  @override
  String get blocked => 'Заблокирован';

  @override
  String ipDetails(Object ipAddress) {
    return 'Данные IP: $ipAddress';
  }

  @override
  String visitorStats(Object count, Object country) {
    return 'Посетитель из $country заходил $count раз.';
  }

  @override
  String get close => 'Закрыть';

  @override
  String get columnTenant => 'Клиент';

  @override
  String get columnPlan => 'Тариф';

  @override
  String get columnUsers => 'Пользователи';

  @override
  String get columnRenewalDate => 'Дата продления';

  @override
  String get columnStorage => 'Хранилище';

  @override
  String get searchTenants => 'Поиск клиентов...';

  @override
  String get statusExpired => 'Истек';

  @override
  String get statusTrial => 'Пробный';

  @override
  String get statusSuspended => 'Приостановлен';

  @override
  String get errorGeneral =>
      'Что-то пошло не так. Пожалуйста, обновите страницу.';

  @override
  String paginationShowing(Object current, Object total) {
    return 'Показано $current из $total клиентов';
  }

  @override
  String totalUsersCount(Object count) {
    return 'Всего пользователей: $count';
  }

  @override
  String get clickForDetails => 'Нажмите для подробностей';

  @override
  String get statTotalTenants => 'Всего клиентов';

  @override
  String get statTrialAccounts => 'Пробные аккаунты';

  @override
  String get statMRR => 'MRR (Выручка)';

  @override
  String get reportSubscriptions => 'Отчет по подпискам';

  @override
  String get reportRevenue => 'Отчет по выручке';

  @override
  String get reportCustomers => 'Отчет по клиентам';

  @override
  String get reportUsage => 'Отчет по использованию';

  @override
  String get reportPerformance => 'Отчет по производительности';

  @override
  String get totalRevenue => 'Общая выручка';

  @override
  String get subscriptionStatus => 'Статус подписки';

  @override
  String get currentPlan => 'Текущий тариф';

  @override
  String get planStarter => 'Стартовый';

  @override
  String get perMonth => ' / мес.';

  @override
  String get upgradePlan => 'Повысить тариф';

  @override
  String get getMoreFeatures => 'Больше возможностей';

  @override
  String get downgradePlan => 'Понизить тариф';

  @override
  String get reduceCosts => 'Снизить расходы';

  @override
  String get renewalDate => 'Дата продления';

  @override
  String daysOverdue(Object count) {
    return 'Просрочено на $count дн.';
  }

  @override
  String get mrr => 'MRR (Выручка)';

  @override
  String get billingCycle => 'Платежный цикл';

  @override
  String get monthly => 'Ежемесячно';

  @override
  String get yearly => 'Ежегодно';

  @override
  String amountSAR(Object amount) {
    return '$amount SAR';
  }

  @override
  String get accountsWatchlist => 'Избранные счета';

  @override
  String get accountCashOnHand => 'Наличные в кассе';

  @override
  String get accountBankAlBilad => 'Банк Аль-Билад';

  @override
  String get accountReceivable => 'Дебиторская задолженность';

  @override
  String get categoryCurrentAssets => 'Оборотные активы';

  @override
  String get categoryBankAccounts => 'Банковские счета';

  @override
  String get quickActions => 'Быстрые действия';

  @override
  String get newInvoice => 'Новый счет';

  @override
  String get recordExpense => 'Записать расход';

  @override
  String get transfer => 'Перевод';

  @override
  String get importStatement => 'Импорт выписки';

  @override
  String get recentTransactions => 'Последние операции';

  @override
  String get recentTransactionsSubtitle =>
      'Последние финансовые действия и журнальные записи.';

  @override
  String get totalExpenses => 'Общие расходы';

  @override
  String get netProfit => 'Чистая прибыль';

  @override
  String get cashFlow => 'Денежный поток';

  @override
  String get verifyEmailClickLink =>
      'Пожалуйста, нажмите на ссылку, отправленную на вашу почту ';

  @override
  String get verifyEmailFinish => ', чтобы подтвердить ваш аккаунт. Спасибо';

  @override
  String get didntReceiveEmail => 'Не получили письмо?';

  @override
  String get verifyEmailSimple =>
      'Пожалуйста, нажмите на ссылку, отправленную на ваш e-mail';

  @override
  String get activeUsers => 'Активные пользователи';

  @override
  String get churnRate => 'Уровень оттока';

  @override
  String get avgSession => 'Средняя сессия';

  @override
  String get supportCenter => 'Центр поддержки';

  @override
  String get getHelp => 'Помощь';

  @override
  String get moduleInventory => 'Складской учет';

  @override
  String get moduleHrPayroll => 'Кадры и зарплата';

  @override
  String get moduleCrm => 'CRM';

  @override
  String get pkgProfessional => 'Профессиональный';

  @override
  String get pkgEnterprise => 'Корпоративный';

  @override
  String get createBackup => 'Создать резервную копию';

  @override
  String get automatedDailyBackup => 'Автоматический ежедневный бэкап';

  @override
  String get backupSize => 'Размер бэкапа';

  @override
  String totalStorageUsed(Object size) {
    return 'Всего использовано: $size';
  }

  @override
  String get nextScheduled => 'Следующий по расписанию';

  @override
  String get dailyAtMidnight => 'Ежедневно в полночь';

  @override
  String hoursAgo(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count часов назад',
      many: '$count часов назад',
      few: '$count часа назад',
      one: '$count час назад',
    );
    return '$_temp0';
  }

  @override
  String get unitGb => 'ГБ';

  @override
  String get accDashboard => 'Панель управления';

  @override
  String get accLedger => 'Главная книга';

  @override
  String get accJournal => 'Журнальные записи';

  @override
  String get accChart => 'План счетов';

  @override
  String get accFunds => 'Фонды и банки';

  @override
  String get accParties => 'Контрагенты';

  @override
  String get accAssets => 'Основные средства';

  @override
  String get accAssetsCenters => 'Активы и центры';

  @override
  String get accPeriodClosing => 'Закрытие периода';

  @override
  String get accReports => 'Бух. отчеты';

  @override
  String get accCustomize => 'Настроить';

  @override
  String get accReceipts => 'Поступления';

  @override
  String get accPayments => 'Платежи';

  @override
  String get accCashJournal => 'Кассовая книга';

  @override
  String get accExchange => 'Обмен\nвалют';

  @override
  String get accJournalEntry => 'Журнальная запись';

  @override
  String get accCurrentRatio => 'Текущая ликвидность';

  @override
  String get accNetMargin => 'Чистая маржа';

  @override
  String get accAvgCollection => 'Срок сбора деб. задолж.';

  @override
  String get accAvgPayment => 'Срок оплаты кред. задолж.';

  @override
  String get accOverdueReceivables => 'Просроченная\nдебиторка';

  @override
  String get accPendingItems => 'Ожидающие позиции';

  @override
  String get accJournalsPendingReview => 'Журналы на проверке';

  @override
  String get accBankReconciliationsPending => 'Сверки банков на ожидании';

  @override
  String get accInvoicesAwaitingApproval => 'Счета на\nутверждении';

  @override
  String get accExpenseBreakdown => 'Анализ расходов';

  @override
  String get accSalaries => 'Зарплаты';

  @override
  String get accRent => 'Аренда';

  @override
  String get accUtilities => 'Коммунальные услуги';

  @override
  String get accMarketing => 'Маркетинг';

  @override
  String get accOthers => 'Прочее';

  @override
  String get accVatSummary => 'Отчет по НДС';

  @override
  String get accVatCollectedLabel => 'Собрано:';

  @override
  String get accVatPaidLabel => 'Уплачено:';

  @override
  String get accVatNetLabel => 'Итого:';

  @override
  String accVatDueLabel(Object date) {
    return 'Срок: $date';
  }

  @override
  String get accPleaseSelectAccount =>
      'Пожалуйста, выберите счет из списка выше';

  @override
  String get viewAll => 'Посмотреть всё';

  @override
  String get accAccountsPayable => 'Кредиторская задолженность';

  @override
  String get accAddAccount => 'Добавить счет';

  @override
  String get accAccountingSettings => 'Настройки бухгалтерии';

  @override
  String get commonSearchPlaceholder =>
      'Поиск по имени, коду или серийному номеру...';

  @override
  String get orgMainCompany => 'Головная компания';

  @override
  String get orgBranchCompany => 'Филиал';

  @override
  String get orgDistributionCompany => 'Дистрибьюторская компания';

  @override
  String get book_type_main => 'Главная книга';

  @override
  String get book_type_tax => 'Налоговая книга';

  @override
  String get book_type_internal => 'Внутренняя книга';

  @override
  String get all_cost_centers => 'Все центры затрат';

  @override
  String get dept_headquarters => 'Головной офис';

  @override
  String get dept_sales => 'Отдел продаж';

  @override
  String get dept_marketing => 'Маркетинг';

  @override
  String get dept_operations => 'Операционная деятельность';

  @override
  String get project_all => 'Все проекты';

  @override
  String get project_expansion => 'Проект расширения';

  @override
  String get project_development => 'Проект разработки';

  @override
  String get project_modernization => 'Проект модернизации';

  @override
  String get period_today => 'Сегодня';

  @override
  String get period_this_week => 'Эта неделя';

  @override
  String get period_this_month => 'Этот месяц';

  @override
  String get period_this_quarter => 'Этот квартал';

  @override
  String get period_this_year => 'Этот год';

  @override
  String get action_export => 'Экспорт';

  @override
  String get label_drafts => 'Черновики:';

  @override
  String get label_posted => 'Проведено:';

  @override
  String get label_total_credit => 'Всего кредит:';

  @override
  String get label_total_debit => 'Всего дебет:';

  @override
  String get label_entries => 'Записи:';

  @override
  String get search_placeholder => 'Поиск записей...';

  @override
  String get column_debit => 'Дебет';

  @override
  String get column_credit => 'Кредит';

  @override
  String get column_ref => 'Спр.';

  @override
  String get column_entry_no => '№ Записи';

  @override
  String get action_filter => 'Фильтровать';

  @override
  String get label_count => 'Количество:';

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
  String get label_materials => 'Материалы';

  @override
  String get greeting_morning => 'Доброе утро';

  @override
  String get greeting_afternoon => 'Добрый день';

  @override
  String get greeting_evening => 'Добрый вечер';

  @override
  String get greeting_night => 'Доброй ночи';
}
