# Integration Tests - Документація

## 📚 Зміст документації

### Швидкий старт

- **[QUICK_START.md](QUICK_START.md)** - Швидкий посібник для запуску тестів
- **[TESTING_SUMMARY.md](TESTING_SUMMARY.md)** - Повний огляд створених тестів

### Детальна документація

- **[README.md](README.md)** - Повна документація з усіма деталями
- **[TEST_RESULTS.md](TEST_RESULTS.md)** - Шаблон для запису результатів тестування

### Конфігурація

- **[.env.example](.env.example)** - Приклад налаштувань середовища
- **[config/test_config.dart](config/test_config.dart)** - Конфігурація тестів

### Тестові файли

1. **[auth_api_test.dart](auth_api_test.dart)** - Auth API (7 тестів)
2. **[tenant_api_test.dart](tenant_api_test.dart)** - Tenant API (6 тестів)
3. **[billing_api_test.dart](billing_api_test.dart)** - Billing API (6 тестів)
4. **[provisioning_api_test.dart](provisioning_api_test.dart)** - Provisioning API (6 тестів)
5. **[sso_api_test.dart](sso_api_test.dart)** - SSO API (5 тестів)

### Допоміжні утиліти

- **[helpers/test_client.dart](helpers/test_client.dart)** - HTTP клієнт з автентифікацією
- **[helpers/test_helpers.dart](helpers/test_helpers.dart)** - Функції валідації та логування

### Скрипти

- **[run_tests.sh](run_tests.sh)** - Скрипт для запуску всіх тестів

---

## 🚀 Швидкий запуск

```bash
# 1. Переконайтеся, що сервер запущений
curl http://localhost:8000/health

# 2. Запустіть тести
./integration_test/run_tests.sh
```

## 📊 Статистика

- **Всього тестів**: 30
- **API endpoints**: 24
- **Покриття**: Auth, Tenant, Billing, Provisioning, SSO
- **Валідація**: Responses, Models, Entities

## ✅ Що перевіряється

Кожен тест перевіряє:

1. ✅ HTTP статус коди
2. ✅ Структуру відповідей від сервера
3. ✅ Десеріалізацію моделей з JSON
4. ✅ Конвертацію моделей в entity
5. ✅ Збереження всіх полів при конвертації
6. ✅ Правильність типів даних
7. ✅ Формати UUID, email, datetime

## 📖 Рекомендований порядок читання

1. **Новачкам**: Почніть з [QUICK_START.md](QUICK_START.md)
2. **Огляд**: Прочитайте [TESTING_SUMMARY.md](TESTING_SUMMARY.md)
3. **Деталі**: Вивчіть [README.md](README.md)
4. **Запуск**: Використовуйте `run_tests.sh`
5. **Результати**: Заповніть [TEST_RESULTS.md](TEST_RESULTS.md)

---

**Версія**: 1.0
**Дата створення**: Січень 2026
**Статус**: ✅ Production Ready
