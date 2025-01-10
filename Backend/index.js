const express = require('express');
const path = require('path');
const db = require('./database.js');
const session = require('express-session');
const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/user');
require("dotenv").config();

const app = express();
const PORT = 5000;

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, '../Frontend/views'));

app.use("/static", express.static(path.join(__dirname, '../Frontend/static/')));

app.use(express.urlencoded({ extended: true }));

app.use(session({
    secret: process.env.SECRET_KEY,
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false } // Set to true if using HTTPS
}));

app.use(authRoutes);
app.use(userRoutes);

//Landing page
app.get('/', (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../Frontend/views/', 'index.html'));
});

app.listen(PORT, '0.0.0.0',(error) =>{
    if(!error)
        console.log("Server is Successfully Running, and App is listening on port "+ PORT);
    else 
        console.log("Error occurred, server can't start", error);
    }
);