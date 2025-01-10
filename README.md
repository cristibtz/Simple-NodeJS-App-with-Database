# Simple-NodeJS-App-with-Database

### Steps to run the project initially

### Setup database with  `crypto-db.sql` file or whatever you want

#### Install node and clone repo, then run in repo folder:
```
npm init
npm install express mysql dotenv express-session ejs nodemon
touch .env
```
#### Add to .env:
```
DB_HOST=localhost
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
npm run dev
```
