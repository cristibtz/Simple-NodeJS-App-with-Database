const path = require('path');
const db = require('../database.js');


//User features
exports.dashboard = (req, res)=>{
    res.status(200).render('dashboard', {
        username: req.session.username,
        profile_info: req.session.profile_info,
        funds: req.session.funds
    });
}

exports.market = async (req, res)=>{
    const query = 'SELECT * FROM cryptocurrencies';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching cryptocurrencies:', err);
            return res.status(500).send('Error fetching cryptocurrencies');
        }

        if (results.length > 0) {
            res.status(200).render('market', {
                cryptocurrencies: results
            });
        } else {
            res.status(404).send('No cryptocurrencies found');
        }
    });
} 

exports.wallet = (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../../Frontend/views/', 'wallet.html'));
}