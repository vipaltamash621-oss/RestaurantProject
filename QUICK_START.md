# 🚀 Quick Start - Deploy to Railway

## Step 1: Create GitHub Repository

1. Go to **https://github.com/new**
2. Fill in:
   - **Repository name:** `RestaurantProject`
   - **Description:** Restaurant POS System
   - Select **Public** (free)
   - Click **Create repository**

3. Copy the repository URL (looks like: `https://github.com/YOUR_USERNAME/RestaurantProject.git`)

## Step 2: Push Code to GitHub

Run this in PowerShell (in project folder):

```powershell
cd c:\Users\vivan\Downloads\RestaurantProject-main\RestaurantProject-main

# Add remote URL (replace with your repo URL)
git remote add origin https://github.com/YOUR_USERNAME/RestaurantProject.git

# Rename branch to main
git branch -M main

# Push to GitHub
git push -u origin main
```

Done! Your code is now on GitHub. ✅

---

## Step 3: Deploy on Railway (Most Important!)

### 3A: Visit Railway
- Go to **https://railway.app**

### 3B: Sign Up with GitHub
- Click **"Sign Up"** (top right)
- Click **"Continue with GitHub"**
- Authorize Railway
- Complete sign up

### 3C: Create New Project
1. Click **"New Project"** (or **+ button**)
2. Select **"Deploy from GitHub Repo"**
3. **Connect GitHub** (if not already connected)
4. **Select your repository** → `RestaurantProject`
5. Click **"Deploy"**

### 3D: Add MySQL Database (IMPORTANT!)
1. Railway Dashboard opens
2. Click **"+ Add Service"**
3. Select **"Database"** → **"MySQL"**
4. Railway creates database automatically! ✅

### 3E: Configure Environment Variables
1. Go to your **Web** service (in Railway dashboard)
2. Click **"Variables"** tab
3. Railway should auto-detect from Dockerfile
4. **Leave as default** (it will work!)

### 3F: Deploy!
- Click **"Deploy"** button
- Wait 3-5 minutes
- You'll get a live URL! 🎉

---

## 🌐 Access Your App

After deployment completes:
- **Main Website:** `https://your-railway-domain.up.railway.app`
- Click the domain URL to open it

---

## 📝 Test Accounts

| Role | Email/ID | Password |
|------|----------|----------|
| **Customer** | dadsvawvid@gmail.com | david4pass |
| **Staff** | 1 | password123 |
| **Admin** | 99999 | 12345 |

---

## ⚠️ Troubleshooting

### App shows blank page?
- Check Railway logs (Deployments tab)
- Wait 5 minutes for full startup
- Refresh browser (Ctrl+F5)

### Database not connecting?
- Go to Railway MySQL service
- Get credentials from "Connect" tab
- They're auto-injected in config.php ✅

### Need to redeploy?
Just push to GitHub and Railway auto-deploys:
```powershell
git add .
git commit -m "Changes"
git push origin main
```

---

## 💡 Tips

- **$5 free credit monthly** on Railway
- MySQL included (no extra cost)
- First deployment is slowest, next ones are faster
- Check "Logs" tab if anything goes wrong

---

## 🎉 Done!

Your Restaurant POS System is now **LIVE ONLINE** for FREE! 

Share the link with others! 🚀
