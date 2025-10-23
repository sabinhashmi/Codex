# Flutter Web Deployment on Oracle Linux 10 (Nginx Server)

This guide explains how to deploy a Flutter web application on **Oracle Linux 10** using **Nginx**.

## Step 1: Network Configuration

### Ingress Rules (HTTP and HTTPS)

Add the following rules to your **Subnet** or **Network Security Group (NSG)** to allow public access to your web server:

| Source Type | Source CIDR | Protocol | Destination Port | Description         |
|--------------|-------------|-----------|------------------|---------------------|
| CIDR         | 0.0.0.0/0   | TCP       | 80               | Allow HTTP traffic  |
| CIDR         | 0.0.0.0/0   | TCP       | 443              | Allow HTTPS traffic |

> **Important:**  
> Only configure the **destination port** (80/443). Do **not** set the source port.

## Step 2: Connect to Your Instance

Get your SSH connection details from Oracle Cloud and connect to the instance:

```bash
ssh -i <your-key> opc@<your-public-ip>
```

## Step 3: System Update

```bash
sudo dnf update -y
```

## Step 4: Verify Public IP

You can verify your public IP with:

```bash
sudo curl ifconfig.me
```

## Step 5: Install Nginx

Install and configure **Nginx** to serve the Flutter web application.

```bash
sudo dnf install nginx -y
```

Check Nginx service status:

```bash
sudo systemctl status nginx
```

Start Nginx:

```bash
sudo systemctl start nginx
```

Enable Nginx to start automatically on boot:

```bash
sudo systemctl enable nginx
```

Verify status again:

```bash
sudo systemctl status nginx
```

## Step 6: Configure Firewall

Allow HTTP traffic through the system firewall:

```bash
sudo firewall-cmd --permanent --add-service=http
```

Reload the firewall to apply the changes:

```bash
sudo firewall-cmd --reload
```

Verify the firewall configuration:

```bash
sudo firewall-cmd --list-all
```

> At this point, you should be able to access the default **Oracle Nginx test page** by visiting your public IP in a browser:  
> **http://<your-public-ip>**

## Step 7: Build Flutter Web App

Navigate to your Flutter project directory and build the web app in release mode:

```bash
cd <your-flutter-project>
flutter build web --release
```

## Step 8: Deploy Flutter Web to Nginx

Create a directory for your Flutter app inside the Nginx web root:

```bash
sudo mkdir -p /usr/share/nginx/html/flutter_app
```

Copy the Flutter build output to the Nginx directory:

```bash
sudo cp -r /home/opc/flutter_app/build/web/* /usr/share/nginx/html/flutter_app/
```

Set ownership and permissions:

```bash
sudo chown -R nginx:nginx /usr/share/nginx/html/flutter_app
sudo chmod -R 755 /usr/share/nginx/html/flutter_app
```

## Step 9: Configure Nginx for Flutter

Edit the Nginx configuration file to serve the Flutter app:

```bash
sudo vim /etc/nginx/conf.d/flutter_app.conf
```

Paste the following configuration:

```nginx
server {
    listen       80;
    server_name  _;   # Replace with your domain name if available

    root /usr/share/nginx/html/flutter_app;
    index index.html;

    location / {
        try_files $uri /index.html;
    }

    error_page 404 /index.html;
}
```

Save and exit (`:wq` in vim).

## Step 10: Reload Nginx

Reload Nginx to apply the new configuration:

```bash
sudo nginx -t
sudo systemctl reload nginx
```

## Step 11: Test Your Deployment

Open your browser and visit:

```
http://<your-public-ip>
```

You should now see your **Flutter web app** running successfully on **Oracle Linux 10** via **Nginx**.

---

✅ **Setup Complete**

You’ve successfully deployed your Flutter web application on Oracle Linux 10 with Nginx.
