# ERPMax Web Deployment Guide

## Передумови

### 1. Встановіть sshpass (для автоматичної аутентифікації)

**macOS:**

```bash
brew install hudochenkov/sshpass/sshpass
```

**Linux:**

```bash
sudo apt-get install sshpass
```

### 2. Альтернатива: SSH ключі (рекомендовано)

Замість використання паролів, можна налаштувати SSH ключі:

```bash
# Генерація SSH ключа (якщо немає)
ssh-keygen -t rsa -b 4096

# Копіювання ключа на сервер
ssh-copy-id feras1960@192.168.0.83
```

Якщо використовуєте SSH ключі, відредагуйте `deploy_web.sh` та замініть команди `sshpass` на звичайні `ssh` та `scp`.

## Швидкий старт

### 1. Запустіть скрипт розгортання

```bash
./deploy_web.sh
```

Скрипт автоматично:

- ✅ Перевірить Flutter встановлення
- ✅ Очистить попередню збірку
- ✅ Отримає залежності
- ✅ Зібере веб-додаток
- ✅ Створить резервну копію на сервері
- ✅ Завантажить файли на сервер
- ✅ Встановить правильні дозволи
- ✅ Перезавантажить Nginx (якщо встановлено)

### 2. Налаштуйте Nginx на сервері

Дивіться детальні інструкції в файлі `NGINX_SETUP.md`

Коротко:

```bash
# Підключіться до сервера
ssh feras1960@192.168.0.83

# Створіть конфігурацію Nginx
sudo nano /etc/nginx/sites-available/erpmax

# Активуйте сайт
sudo ln -s /etc/nginx/sites-available/erpmax /etc/nginx/sites-enabled/

# Перезавантажте Nginx
sudo nginx -t
sudo systemctl reload nginx
```

### 3. Відкрийте додаток

```text
http://192.168.0.83
```

## Структура на сервері

```text
/opt/
├── erpmax_web/          # Веб-додаток
│   ├── index.html
│   ├── main.dart.js
│   ├── assets/
│   └── ...
└── backups/
    └── erpmax_web/      # Резервні копії
        ├── backup_20241222_142530/
        └── ...
```

## Налаштування скрипта

Відредагуйте змінні в `deploy_web.sh`:

```bash
SERVER_IP="192.168.0.83"        # IP сервера
SERVER_USER="feras1960"         # Користувач
SERVER_PASSWORD="bF8ayJJJu"     # Пароль (або видаліть для SSH ключів)
APP_PATH="/opt/erpmax_web"      # Шлях до додатку
BACKUP_PATH="/opt/backups/erpmax_web"  # Шлях до резервних копій
```

## Підключення до Backend API

Якщо ваш backend працює на тому ж сервері, додайте в конфігурацію Nginx:

```nginx
location /api {
    proxy_pass http://localhost:BACKEND_PORT;
    proxy_http_version 1.1;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
```

Або налаштуйте URL API в Flutter додатку для прямого підключення до backend.

## Усунення проблем

### Помилка: sshpass не знайдено

```bash
# macOS
brew install hudochenkov/sshpass/sshpass

# Linux
sudo apt-get install sshpass
```

### Помилка: Permission denied

```bash
# Перевірте дозволи на сервері
ssh feras1960@192.168.0.83
ls -la /opt/erpmax_web
```

### Помилка: Nginx не перезавантажується

```bash
# Підключіться до сервера
ssh feras1960@192.168.0.83

# Перевірте конфігурацію
sudo nginx -t

# Перегляньте логи
sudo tail -f /var/log/nginx/error.log
```

### Додаток не відкривається

1. Перевірте, чи працює Nginx: `sudo systemctl status nginx`
2. Перевірте логи: `sudo tail -f /var/log/nginx/erpmax_error.log`
3. Перевірте файли: `ls -la /opt/erpmax_web`
4. Перевірте firewall: `sudo ufw status`

## Корисні команди

```bash
# Перегляд логів на сервері
ssh feras1960@192.168.0.83 "sudo tail -f /var/log/nginx/erpmax_error.log"

# Перезапуск Nginx
ssh feras1960@192.168.0.83 "sudo systemctl restart nginx"

# Перегляд файлів додатку
ssh feras1960@192.168.0.83 "ls -lah /opt/erpmax_web"

# Відновлення з резервної копії
ssh feras1960@192.168.0.83 "cp -r /opt/backups/erpmax_web/backup_YYYYMMDD_HHMMSS/* /opt/erpmax_web/"
```

## Безпека

⚠️ **Важливо:**

- Не зберігайте паролі в git репозиторії
- Використовуйте SSH ключі замість паролів
- Налаштуйте SSL сертифікат для production
- Обмежте доступ до сервера через firewall

## Наступні кроки

1. ✅ Налаштуйте доменне ім'я (опціонально)
2. ✅ Встановіть SSL сертифікат (Let's Encrypt)
3. ✅ Налаштуйте автоматичне резервне копіювання
4. ✅ Налаштуйте моніторинг та логування
5. ✅ Налаштуйте CI/CD для автоматичного розгортання
