# 🔐 SSL/HTTPS Setup Guide

Цей документ описує процес налаштування SSL сертифіката для ERPMax Web Application.

## Варіанти налаштування SSL

### Варіант 1: Self-Signed Certificate (для тестування)

Для локальної мережі або тестування можна використати самопідписаний сертифікат:

```bash
# Підключитися до сервера
ssh feras1960@192.168.0.83

# Створити директорії для сертифікатів
sudo mkdir -p /etc/ssl/private
sudo mkdir -p /etc/ssl/certs

# Згенерувати самопідписаний сертифікат
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/erpmax.key \
  -out /etc/ssl/certs/erpmax.crt \
  -subj "/C=UA/ST=Kyiv/L=Kyiv/O=ERPMax/CN=192.168.0.83"

# Встановити правильні права доступу
sudo chmod 600 /etc/ssl/private/erpmax.key
sudo chmod 644 /etc/ssl/certs/erpmax.crt
```

### Варіант 2: Let's Encrypt (для production з доменом)

Якщо у вас є доменне ім'я, використовуйте безкоштовний Let's Encrypt:

```bash
# Встановити Certbot
sudo apt update
sudo apt install certbot python3-certbot-nginx

# Отримати сертифікат (замініть your-domain.com на ваш домен)
sudo certbot --nginx -d your-domain.com -d www.your-domain.com

# Certbot автоматично налаштує Nginx
```

### Варіант 3: Комерційний SSL сертифікат

Якщо ви придбали SSL сертифікат:

1. Завантажте файли сертифіката на сервер
2. Розмістіть їх у `/etc/ssl/certs/` та `/etc/ssl/private/`
3. Оновіть шляхи в конфігурації Nginx

## Активація HTTPS в Nginx

Після отримання сертифіката:

1. **Відредагуйте конфігурацію Nginx:**

```bash
sudo nano /etc/nginx/sites-available/erpmax
```

1. **Розкоментуйте HTTPS блок:**

Знайдіть закоментований блок `# server {` для HTTPS (рядок ~93) та розкоментуйте його.

1. **Увімкніть редирект з HTTP на HTTPS:**

У HTTP блоці (рядок ~8) розкоментуйте:

```nginx
return 301 https://$server_name$request_uri;
```

1. **Перевірте конфігурацію:**

```bash
sudo nginx -t
```

1. **Перезапустіть Nginx:**

```bash
sudo systemctl reload nginx
```

## Перевірка SSL

Після налаштування перевірте:

```bash
# Перевірити сертифікат
openssl s_client -connect 192.168.0.83:443 -servername 192.168.0.83

# Перевірити через браузер
# Відкрийте https://192.168.0.83
```

## Автоматичне оновлення Let's Encrypt

Якщо використовуєте Let's Encrypt, Certbot автоматично налаштує оновлення:

```bash
# Перевірити таймер оновлення
sudo systemctl status certbot.timer

# Тестове оновлення
sudo certbot renew --dry-run
```

## Налаштування Firewall

Відкрийте порт 443 для HTTPS:

```bash
# UFW
sudo ufw allow 443/tcp
sudo ufw status

# або iptables
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables-save
```

## Troubleshooting

### Помилка "Certificate verify failed"

Для самопідписаних сертифікатів браузер покаже попередження. Це нормально для локальної мережі.

### Помилка "Permission denied" для приватного ключа

```bash
sudo chmod 600 /etc/ssl/private/erpmax.key
sudo chown root:root /etc/ssl/private/erpmax.key
```

### Nginx не запускається після налаштування SSL

Перевірте логи:

```bash
sudo tail -f /var/log/nginx/error.log
```

## Рекомендації безпеки

1. **Використовуйте сильні шифри** - вже налаштовано в конфігурації
2. **Увімкніть HSTS** - вже додано в HTTPS блок
3. **Регулярно оновлюйте сертифікати**
4. **Моніторте термін дії сертифіката:**

```bash
# Перевірити термін дії
openssl x509 -in /etc/ssl/certs/erpmax.crt -noout -dates
```

## Додаткові ресурси

- [Let's Encrypt Documentation](https://letsencrypt.org/docs/)
- [Nginx SSL Configuration](https://nginx.org/en/docs/http/configuring_https_servers.html)
- [SSL Labs Server Test](https://www.ssllabs.com/ssltest/)
