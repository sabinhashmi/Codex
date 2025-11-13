# Secure SSL Setup with Let’s Encrypt on Oracle Linux / Fedora

This guide explains how to install Certbot, generate an SSL certificate for your domain, and configure automatic renewal on Nginx.

---

## 1. Enable EPEL Repository
Install the Extra Packages for Enterprise Linux (EPEL) repository:

```bash
sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
sudo dnf -y update


## 2. Install Certbot and Nginx Plugin
```bash
sudo dnf install -y certbot python3-certbot-nginx

## 3. Generate SSL Certificate
Replace yourdomain.com with your actual domain:
```bash
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

Notes:
If you don’t have a www DNS record yet, run:
```bash
sudo certbot --nginx -d yourdomain.com

## 4. Fix Nginx Server Name Issues
If you encounter errors like:
Could not automatically find a matching server block for yourdomain.com
```bash
sudo vi /etc/nginx/nginx.conf

Ensure your server block contains the correct server_name:
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;
    root /path/to/your/site;
    index index.html;
}

```bash
sudo nginx -t
sudo systemctl reload nginx

## 5. Renewing Certificates
Let’s Encrypt certificates expire every 90 days. Test renewal with:
```bash
sudo certbot renew --dry-run

### Now you have a secure site with SSL certificate

