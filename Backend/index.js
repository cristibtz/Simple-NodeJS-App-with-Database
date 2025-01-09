const express = require('express');
const path = require('path');

const app = express();
const PORT = 5000;

app.use(express.static(path.join(__dirname, '../Frontend/views/')));

app.get('/', (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../Frontend/views/', 'index.html'));
});

app.get('/login', (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../Frontend/views/', 'login.html'));
});

app.get('/register', (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../Frontend/views/', 'register.html'));
});

app.get('/dashboard', (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../Frontend/views/', 'dashboard.html'));
});

app.get('/market', (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../Frontend/views/', 'market.html'));
});

app.get('/wallet', (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../Frontend/views/', 'wallet.html'));
});

app.listen(PORT, '0.0.0.0',(error) =>{
    if(!error)
        console.log("Server is Successfully Running, and App is listening on port "+ PORT);
    else 
        console.log("Error occurred, server can't start", error);
    }
);