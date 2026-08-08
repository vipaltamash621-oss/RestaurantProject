# Railway Deployment Guide

## ✅ Step 1: Push to GitHub

```powershell
# Navigate to project folder
cd c:\Users\vivan\Downloads\RestaurantProject-main\RestaurantProject-main

# Initialize git
git init

# Add all files
git add .

# Commit
git commit -m "Restaurant POS System - Initial commit"

# Create repository on GitHub.com first, then:
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/RestaurantProject.git
git push -u origin main
```

---

## ✅ Step 2: Railway Deployment (3 clicks!)

### Visit: https://railway.app

### Step 2A: Sign Up with GitHub
1. Click "**Deploy Now**" button
2. Sign in with **GitHub**
3. Authorize Railway to access GitHub

### Step 2B: Create New Project
1. Click "**New Project**"
2. Select "**Deploy from GitHub Repo**"
3. Select your **RestaurantProject** repository
4. Click "**Deploy**"

### Step 2C: Add MySQL Database
1. In Railway Dashboard, click "**Add Service**"
2. Select "**Database**" → "**MySQL**"
3. Railway will automatically link it

### Step 2D: Set Environment Variables
Go to your Web service settings and set:
```
DB_HOST=db          # or Railway MySQL host
DB_USER=railway
DB_PASS=<Railway generated password>
DB_NAME=railway
```

---

## 🔄 Update config.php for Railway

Railway automatically injects these variables. Update your config files:

**File: adminSide/config.php**
```php
<?php
$db_host = getenv('RAILWAY_MYSQL_HOST') ?: 'db';
$db_user = getenv('RAILWAY_MYSQL_USER') ?: 'railway';
$db_pass = getenv('RAILWAY_MYSQL_PASSWORD') ?: '';
$db_name = getenv('RAILWAY_MYSQL_DB') ?: 'railway';

define('DB_HOST', $db_host);
define('DB_USER', $db_user);
define('DB_PASS', $db_pass);
define('DB_NAME', $db_name);

$link = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
if($link->connect_error) {
    die('Connection Failed: ' . $link->connect_error);
}
?>
```

**File: customerSide/config.php** - Same as above

---

## 🌐 Access Your App

After deployment completes:
- **Main Site:** `https://your-project.railway.app`
- **PhpMyAdmin:** `https://your-project.railway.app/phpmyadmin`

---

## ⚠️ Important: Dockerfile for Railway

Your Dockerfile already works! Railway will:
1. Read the Dockerfile
2. Build the image
3. Deploy on their infrastructure
4. Give you a live URL in 3-5 minutes

---

## 🚀 Deploy Updates

After making changes:
```powershell
git add .
git commit -m "Your changes"
git push origin main
```

Railway automatically redeploys! (takes 2-3 minutes)

---

## 📋 Test Accounts

| Role | Email/ID | Password |
|------|----------|----------|
| Customer | dadsvawvid@gmail.com | david4pass |
| Staff | 1 | password123 |
| Admin | 99999 | 12345 |

---

## ❓ Troubleshooting

**App shows blank page:**
- Check logs in Railway dashboard
- Verify database variables are set
- Check if Dockerfile is correct

**Database connection failed:**
- Verify environment variables match Railway's MySQL
- Check database credentials in Railway dashboard
- Restart the service

**Files not updated:**
- Make sure you pushed to main branch
- Railway auto-redeploys (wait 2-3 min)
- Check deployment logs

---

## 💡 Tips

- Railway gives $5 free credit monthly
- MySQL database is included
- Email support available
- Very beginner-friendly

Enjoy! 🎉
