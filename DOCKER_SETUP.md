# Docker Setup Guide - Restaurant POS System

## Prerequisites
- Docker Desktop installed and running
- Docker Compose (comes with Docker Desktop)

## How to Run with Docker

### Step 1: Open Terminal/PowerShell
Navigate to the project folder:
```powershell
cd c:\Users\vivan\Downloads\RestaurantProject-main\RestaurantProject-main
```

### Step 2: Start Docker Containers
```powershell
docker-compose up -d
```

This will:
- Build the PHP/Apache web server
- Start MySQL database
- Start PhpMyAdmin for database management
- Set up networking between all services

### Step 3: Wait for Database Setup
Wait about 30-60 seconds for the database to fully initialize.

Check status:
```powershell
docker-compose ps
```

### Step 4: Access the Application

**Main Application:**
- http://localhost:8080

**PhpMyAdmin (Database Management):**
- http://localhost:8081
- Username: `root`
- Password: `root`

## Test Accounts

### Customer Accounts
| Email | Password |
|-------|----------|
| dadsvawvid@gmail.com | david4pass |
| zoe@gmail.com | passworddef |
| jackie@gmail.com | passwordstu |

### Staff Accounts
| Staff ID | Password |
|----------|----------|
| 1 | password123 |
| 10 | davidpa2ss |
| 7 | robertpass |

### Admin Account
| Admin ID | Password |
|----------|----------|
| 99999 | 12345 |

## Useful Docker Commands

### View Logs
```powershell
docker-compose logs -f
```

### Stop Containers
```powershell
docker-compose down
```

### Stop and Remove Everything (including database)
```powershell
docker-compose down -v
```

### Restart Services
```powershell
docker-compose restart
```

### View Specific Service Logs
```powershell
docker-compose logs db     # Database logs
docker-compose logs web    # Web server logs
```

## Troubleshooting

### Port Already in Use
If port 8080 or 8081 is in use, edit `docker-compose.yml` and change:
```yaml
ports:
  - "8080:80"    # Change first number to different port like "9090:80"
```

### Database Connection Error
1. Wait 30 seconds for database to initialize
2. Check database logs: `docker-compose logs db`
3. Verify containers are running: `docker-compose ps`

### Rebuild Everything Fresh
```powershell
docker-compose down -v
docker-compose up -d --build
```

## File Structure
```
RestaurantProject-main/
├── Dockerfile              # PHP/Apache configuration
├── docker-compose.yml      # Docker services definition
├── adminSide/              # Staff/Admin panel
├── customerSide/           # Customer facing website
├── index.php               # Main entry point
└── restaurantDB.txt        # Database schema
```

## Project Info
- **PHP Version:** 7.4
- **MySQL Version:** 5.7
- **Built With:** HTML5, CSS3, JavaScript, PHP, MySQL

## Next Steps
1. Start Docker: `docker-compose up -d`
2. Open browser: http://localhost:8080
3. Explore the application!
