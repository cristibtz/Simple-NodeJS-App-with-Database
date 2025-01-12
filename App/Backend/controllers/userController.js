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
                cryptocurrencies: results,
                req: req
            });
        } else {
            res.status(404).send('No cryptocurrencies found');
        }
    });
} 

exports.wallet = (req, res)=>{
    const username =  req.session.username
    const user_id =  req.session.user_id
    
    const query = `
    SELECT c.Crypto_ID, c.Name, c.Price, c.\`Launch Date\`, c.\`Blockchain Type\`, oc.Amount \
    FROM cryptocurrencies c \
    JOIN \`owned crypto\` oc \
    ON c.Crypto_ID = oc.Crypto_ID \
    WHERE oc.User_ID = ?`;

    db.query(query, [user_id], (err, results) => {
        if (err) {
            console.error('Error fetching cryptocurrencies:', err);
            return res.status(500).send('Error fetching cryptocurrencies');
        }

        if (results.length > 0) {
            
            res.status(200).render('wallet', {
                cryptocurrencies: results,
                req: req
            });
        } else {
            res.status(404).send('No cryptocurrencies found');
        }
    });
}
