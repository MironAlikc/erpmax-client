# Quick Start Guide - Integration Tests

## Швидкий старт для запуску інтеграційних тестів

### 1. Підготовка

Переконайтеся, що backend сервер запущений:

```bash
# Перевірте доступність сервера
curl http://localhost:8000/health
```

### 2. Встановлення залежностей

```bash
cd /Users/dsv/Projects/erpmax/erpmax_client
flutter pub get
```

### 3. Запуск всіх тестів

**Простий спосіб** (використовуючи скрипт):

```bash
./integration_test/run_tests.sh
```

**Або вручну**:

```bash
flutter test integration_test/
```

### 4. Запуск окремих тестів

```bash
# Auth API
flutter test integration_test/auth_api_test.dart

# Tenant API
flutter test integration_test/tenant_api_test.dart

# Billing API
flutter test integration_test/billing_api_test.dart

# Provisioning API
flutter test integration_test/provisioning_api_test.dart

# SSO API
flutter test integration_test/sso_api_test.dart
```

### 5. Налаштування (опціонально)

Створіть файл `.env` на основі `.env.example`:

```bash
cp integration_test/.env.example integration_test/.env
```

Відредагуйте параметри за потреби:

```bash
TEST_BASE_URL=http://localhost:8000
VERBOSE_LOGGING=true
SKIP_CLEANUP=false
```

### 6. Запуск з кастомними параметрами

```bash
flutter test test/integration/ \
  --dart-define=TEST_BASE_URL=http://localhost:8000 \
  --dart-define=VERBOSE_LOGGING=true
```

## Що перевіряють тести?

### ✅ Auth API (7 тестів)

- Реєстрація користувача
- Вхід в систему
- Отримання поточного користувача
- Оновлення токена
- Перемикання між tenant
- Вихід з системи
- Конвертація моделей в entity

### ✅ Tenant API (6 тестів)

- Отримання всіх tenant
- Отримання поточного tenant
- Отримання tenant за ID
- Оновлення tenant
- Отримання користувачів tenant
- Запрошення користувача

### ✅ Billing API (6 тестів)

- Отримання планів підписки
- Отримання поточної підписки
- Створення checkout сесії
- Отримання інвойсів
- Скасування підписки
- Конвертація моделей

### ✅ Provisioning API (6 тестів)

- Створення provisioning job
- Отримання всіх jobs
- Отримання job за ID
- Повторна спроба job
- Скасування job
- Конвертація моделей

### ✅ SSO API (5 тестів)

- Генерація SSO токена
- Валідація SSO токена
- Перевірка терміну дії токена
- Обробка невалідного токена
- Конвертація моделей

**Всього: 30 інтеграційних тестів**

## Очікуваний результат

```
✓ All tests passed! 🎉

Test Summary
================================
Passed: 30
Failed: 0
```

## Troubleshooting

### Сервер не відповідає

```
Error: Connection refused
```

**Рішення**: Запустіть backend сервер

### Помилки автентифікації

```
Error: 401 Unauthorized
```

**Рішення**: Перевірте, що токени зберігаються правильно

### Timeout помилки

```
Error: Connection timeout
```

**Рішення**: Збільште timeout в `test_config.dart`

## Додаткова інформація

Детальна документація: `test/integration/README.md`

Шаблон результатів: `test/integration/TEST_RESULTS.md`

---

**Підтримка**: Якщо виникли проблеми, перевірте логи сервера та увімкніть `VERBOSE_LOGGING=true`
