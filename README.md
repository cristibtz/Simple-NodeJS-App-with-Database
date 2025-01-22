# Simple-NodeJS-App-with-Database

### Steps to run the project initially

### Setup database with  `crypto-db.sql` file or whatever you want

#### Install node and clone repo, then run in repo folder:
```
cd App
npm init
npm install express mysql2 dotenv express-session ejs nodemon
cd ..
touch .env
```
#### Add to .env:
```
DB_HOST=mysql-db
DB_USER=mysql_user
DB_PASSWORD=mysql_pass
DB_DATABASE=mysql_dbname
SECRET_KEY=secret
```

#### Add in package.json:
```
"scripts": {
    "start": "node Backend/index.js",
    "dev": "nodemon Backend/index.js"
  }
```
#### Run project:
```
cd App
npm run dev
```

### Dockerized
```
docker compose up --build
```
