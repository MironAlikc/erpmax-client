# Integration Testing Summary

## Огляд створених тестів

Створено повний набір інтеграційних тестів для перевірки всіх API endpoints з підключенням до реального сервера.

## Структура тестів

### 📁 Конфігурація

- `config/test_config.dart` - Налаштування тестів (URL сервера, credentials, timeouts)
- `.env.example` - Приклад файлу з environment змінними

### 🛠 Допоміжні утиліти

- `helpers/test_client.dart` - HTTP клієнт з автентифікацією
- `helpers/test_helpers.dart` - Функції для валідації та логування

### 🧪 Тестові набори

#### 1. Auth API Tests (`auth_api_test.dart`)

**Покриття**: 7 тестів

- ✅ POST `/auth/register` - Реєстрація нового користувача
- ✅ POST `/auth/login` - Вхід користувача
- ✅ GET `/auth/me` - Отримання інформації про поточного користувача
- ✅ POST `/auth/refresh` - Оновлення access token
- ✅ POST `/auth/switch-tenant` - Перемикання між tenant
- ✅ POST `/auth/logout` - Вихід користувача
- ✅ Model to Entity conversion - Перевірка конвертації

**Валідація**:

- Структура JWT токенів
- Формат email та ID
- Дати створення/оновлення
- Відповідність моделей та entity

#### 2. Tenant API Tests (`tenant_api_test.dart`)

**Покриття**: 6 тестів

- ✅ GET `/tenants` - Отримання всіх tenant користувача
- ✅ GET `/tenants/current` - Отримання поточного tenant
- ✅ GET `/tenants/{id}` - Отримання tenant за ID
- ✅ PATCH `/tenants/{id}` - Оновлення tenant
- ✅ GET `/tenants/{id}/users` - Отримання користувачів tenant
- ✅ POST `/tenants/{id}/users/invite` - Запрошення користувача
- ✅ Model to Entity conversion

**Валідація**:

- UUID формат ID
- Статуси tenant
- Ролі користувачів
- Дати приєднання

#### 3. Billing API Tests (`billing_api_test.dart`)

**Покриття**: 6 тестів

- ✅ GET `/billing/plans` - Отримання доступних планів
- ✅ GET `/billing/subscription` - Отримання поточної підписки
- ✅ POST `/billing/checkout` - Створення checkout сесії
- ✅ GET `/billing/invoices` - Отримання історії платежів
- ✅ POST `/billing/cancel` - Скасування підписки
- ✅ Model to Entity conversion

**Валідація**:

- Ціни та валюта
- Статуси підписки
- URL checkout сесії
- Періоди підписки

#### 4. Provisioning API Tests (`provisioning_api_test.dart`)

**Покриття**: 6 тестів

- ✅ POST `/provisioning/jobs` - Створення provisioning job
- ✅ GET `/provisioning/jobs` - Отримання всіх jobs
- ✅ GET `/provisioning/jobs/{id}` - Отримання job за ID
- ✅ POST `/provisioning/jobs/{id}/retry` - Повторна спроба job
- ✅ POST `/provisioning/jobs/{id}/cancel` - Скасування job
- ✅ Model to Entity conversion

**Валідація**:

- Типи jobs (create_site, delete_site, backup_site)
- Статуси jobs (pending, running, completed, failed)
- Дати початку/завершення
- Повідомлення про помилки

#### 5. SSO API Tests (`sso_api_test.dart`)

**Покриття**: 5 тестів

- ✅ POST `/sso/token` - Генерація SSO токена
- ✅ GET `/sso/erpnext/validate/{token}` - Валідація токена
- ✅ Token expiration - Перевірка терміну дії
- ✅ Invalid token handling - Обробка невалідного токена
- ✅ Model to Entity conversion

**Валідація**:

- Формат SSO URL
- TTL токена (60 секунд)
- Валідність токена
- Обробка помилок

## Загальна статистика

- **Всього тестів**: 30
- **API endpoints**: 24
- **Тестових файлів**: 5
- **Допоміжних файлів**: 7

## Особливості тестів

### 🔐 Автентифікація

- Автоматичне створення унікальних користувачів
- Збереження та використання JWT токенів
- Очищення токенів після тестів

### 📊 Валідація

- HTTP статус коди
- Структура відповідей
- Типи даних
- Формати UUID, email, datetime
- Відповідність моделей та entity

### 🧹 Cleanup

- Автоматичне очищення даних
- Опція `SKIP_CLEANUP` для debugging
- Ізоляція тестів

### 📝 Логування

- Детальне логування кроків
- Опція `VERBOSE_LOGGING`
- Інформаційні повідомлення

## Як запустити

### Всі тести

```bash
./test/integration/run_tests.sh
```

### Окремий набір

```bash
flutter test test/integration/auth_api_test.dart
```

### З кастомними параметрами

```bash
flutter test test/integration/ \
  --dart-define=TEST_BASE_URL=http://localhost:8000 \
  --dart-define=VERBOSE_LOGGING=true
```

## Перевірка відповідності

Кожен тест перевіряє:

1. **Відповідь сервера**
   - Правильний HTTP статус код
   - Наявність обов'язкових полів
   - Правильні типи даних

2. **Модель (Model)**
   - Десеріалізація з JSON
   - Всі поля присутні
   - Правильні типи

3. **Entity**
   - Конвертація з моделі
   - Збереження всіх даних
   - Відповідність полів

## Документація

- `README.md` - Повна документація
- `QUICK_START.md` - Швидкий старт
- `TEST_RESULTS.md` - Шаблон результатів
- `.env.example` - Приклад конфігурації

## Інтеграція з CI/CD

Тести готові для інтеграції з:

- GitHub Actions
- GitLab CI
- Jenkins
- CircleCI

Приклад конфігурації наведено в `README.md`

## Підтримка

При виникненні проблем:

1. Перевірте, що сервер запущений
2. Увімкніть `VERBOSE_LOGGING=true`
3. Перегляньте логи тестів
4. Перевірте логи сервера

---

**Створено**: Січень 2026
**Версія API**: v1
**Flutter**: 3.8.1+
**Статус**: ✅ Ready for use
