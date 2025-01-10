const db = require('../database.js');
const path = require('path');

//Authentication
//GET
exports.getLogin = (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../../Frontend/views/', 'login.html'));
}
//POST
exports.postLogin = (req, res)=>{
    const username = req.body.username;
    const password = req.body.password;

    if (!username || !password) {
        return res.status(400).json({ message: 'Username and password are required' });
    }
    
    const alphanumericRegex = /^[a-zA-Z0-9\s]*$/;
    if (!alphanumericRegex.test(username)) {
        return res.status(400).json({ message: 'Invalid data. Please use only alphanumeric chars.' });
    }

    const query = 'SELECT * FROM user WHERE Name = ? AND Password = ?';
    db.query(query, [username, password], (err, results) => {
        if (err) {
            console.error('Error querying user:', err);
            return res.status(500).json({ message: 'Internal server error' });
        }

        if (results.length > 0) {
            // Create user session
            req.session.user_id = results[0].User_ID;
            req.session.profile_info = results[0].Profile_Info;
            req.session.username = results[0].Name;
            req.session.funds = results[0].Funds
            
            return res.redirect('/dashboard');
        } else {
            return res.status(200).json({ message: 'Invalid credentials' });
        }
    });

}
//GET
exports.getRegister = (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../../Frontend/views/', 'register.html'));
}
//POST
exports.postRegister = (req, res)=>{
    
    const username = req.body.username;
    const profile_info = req.body.profile_info;  
    const funds = req.body.funds;  
    const password = req.body.password;
    const confirm_password = req.body.confirm;

    if (!username || !password) {
        return res.status(400).json({ message: 'Username and password are required' });
    } 

    if (password !== confirm_password) {
        return res.json({ message: 'Passwords do not match' });
    } 

    const alphanumericRegex = /^[a-zA-Z0-9\s]*$/;
    if (!alphanumericRegex.test(username) || !alphanumericRegex.test(profile_info) || ! alphanumericRegex.test(funds)) {
        return res.status(400).json({ message: 'Invalid data. Please use only alphanumeric chars.' });
    }

    if (funds <= 0 || funds > 1000) {
        return res.status(400).json({ message: 'Invalid funds. Please enter a value between 0 and 1000. More can be added later...' });
    }

    db.query('SELECT * FROM user WHERE Name = ?', [username], (error, results) => {
        if (error) {
            console.log(error);
        }
        if (results.length > 0) {
            return res.json({ message: 'Username unavailable' });
        } else {
            //If all valid, let's insert the user, I guess
            const insertUserQuery = 'INSERT INTO user (Profile_Info, Name, Password, Funds) VALUES (?, ?, ?, ?)';
            db.query(insertUserQuery, [profile_info,username, password, funds], (err, results) => {
                if (err) {
                    console.error('Error inserting user:', err);
                    return res.status(500).json({ message: 'Internal server error' });
                }
                res.status(201).json({ message: 'User registered successfully' });
            });
        }
    });

}

//Logout
exports.logout = (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            return res.status(500).json({ message: 'Failed to logout' });
        }
        res.redirect('/');
    });
}
