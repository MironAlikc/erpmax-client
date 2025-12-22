# Nginx Configuration for ERPMax Web App

## 1. Connect to Server

```bash
ssh feras1960@192.168.0.83
# Password: bF8ayJJu
```

## 2. Install Nginx (if not installed)

```bash
sudo apt update
sudo apt install nginx -y
```

## 3. Create Nginx Configuration

Create a new configuration file:

```bash
sudo nano /etc/nginx/sites-available/erpmax
```

Add the following configuration:

```nginx
server {
    listen 80;
    listen [::]:80;
    
    server_name 192.168.0.83;  # Replace with your domain if you have one
    
    root /opt/erpmax_web;
    index index.html;
    
    # Logging
    access_log /var/log/nginx/erpmax_access.log;
    error_log /var/log/nginx/erpmax_error.log;
    
    # Main location
    location / {
        try_files $uri $uri/ /index.html;
        
        # CORS headers (if needed for API calls)
        add_header 'Access-Control-Allow-Origin' '*' always;
        add_header 'Access-Control-Allow-Methods' 'GET, POST, PUT, DELETE, OPTIONS' always;
        add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authorization' always;
    }
    
    # Cache static assets
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
    
    # Disable cache for index.html
    location = /index.html {
        add_header Cache-Control "no-cache, no-store, must-revalidate";
        expires 0;
    }
    
    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
}
```

## 4. Enable the Site

```bash
# Create symbolic link
sudo ln -s /etc/nginx/sites-available/erpmax /etc/nginx/sites-enabled/

# Remove default site (optional)
sudo rm /etc/nginx/sites-enabled/default
```

## 5. Test and Reload Nginx

```bash
# Test configuration
sudo nginx -t

# Reload Nginx
sudo systemctl reload nginx

# Check status
sudo systemctl status nginx
```

## 6. Configure Firewall (if needed)

```bash
sudo ufw allow 'Nginx Full'
sudo ufw status
```

## 7. Optional: Setup SSL with Let's Encrypt

If you have a domain name:

```bash
# Install certbot
sudo apt install certbot python3-certbot-nginx -y

# Get certificate
sudo certbot --nginx -d yourdomain.com

# Auto-renewal is configured automatically
```

## 8. Verify Deployment

Open in browser:

- Local network: <http://192.168.0.83>
- If domain configured: <http://yourdomain.com>

## Troubleshooting

### Check Nginx logs

```bash
sudo tail -f /var/log/nginx/erpmax_error.log
sudo tail -f /var/log/nginx/erpmax_access.log
```

### Check Nginx status

```bash
sudo systemctl status nginx
```

### Restart Nginx

```bash
sudo systemctl restart nginx
```

### Check file permissions

```bash
ls -la /opt/erpmax_web
```

### Test Nginx configuration

```bash
sudo nginx -t
```

## Backend API Configuration

Since your backend is in `/opt`, you might want to add a proxy to it:

```nginx
# Add this location block to your Nginx config
location /api {
    proxy_pass http://localhost:YOUR_BACKEND_PORT;  # Replace with actual port
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```

Replace `YOUR_BACKEND_PORT` with the actual port your backend is running on.
