const path = require('path');
const db = require('../database.js');

exports.buy = (req, res) => {
    const crypto_id = req.params.crypto_id;
    const amount = parseInt(req.body.amount);
    const user_id = req.session.user_id;
    const funds = req.session.funds;

    const query = 'SELECT * FROM cryptocurrencies WHERE Crypto_ID = ?';
    db.query(query, [crypto_id], (err, results) => {
        if (err) {
            console.error('Error fetching cryptocurrency:', err);
            return res.status(500).send('Error fetching cryptocurrency');
        }

        if (results.length > 0) {
            const crypto = results[0];
            const total = crypto.Price * amount;

            if (funds >= total) {
                const checkQuery = 'SELECT * FROM `owned crypto` WHERE User_ID = ? AND Crypto_ID = ?';
                db.query(checkQuery, [user_id, crypto_id], (err, ownedResults) => {
                    if (err) {
                        console.error('Error checking owned cryptocurrency:', err);
                        return res.status(500).send('Error checking owned cryptocurrency');
                    }

                    if (ownedResults.length > 0) {
                        // User already owns this cryptocurrency, update the amount
                        const newAmount = parseInt(ownedResults[0].Amount) + amount;
                        const updateQuery = 'UPDATE `owned crypto` SET Amount = ? WHERE User_ID = ? AND Crypto_ID = ?';
                        db.query(updateQuery, [newAmount, user_id, crypto_id], (err, updateResults) => {
                            if (err) {
                                console.error('Error updating cryptocurrency amount:', err);
                                return res.status(500).send('Error updating cryptocurrency amount');
                            }

                            const newFunds = funds - total;
                            req.session.funds = newFunds;

                            // Update funds in user database
                            const fundsQuery = 'UPDATE user SET Funds = ? WHERE User_ID = ?';
                            db.query(fundsQuery, [newFunds, user_id], (err, fundsResults) => {
                                if (err) {
                                    console.error('Error updating funds:', err);
                                    return res.status(500).send('Error updating funds');
                                }
                                res.redirect('/wallet');
                            });
                        });
                    } else {
                        // User does not own this cryptocurrency, insert a new record
                        const insertQuery = 'INSERT INTO `owned crypto` (User_ID, Crypto_ID, Amount) VALUES (?, ?, ?)';
                        db.query(insertQuery, [user_id, crypto_id, amount], (err, insertResults) => {
                            if (err) {
                                console.error('Error buying cryptocurrency:', err);
                                return res.status(500).send('Error buying cryptocurrency');
                            }

                            const newFunds = funds - total;
                            req.session.funds = newFunds;

                            // Update funds in user database
                            const fundsQuery = 'UPDATE user SET Funds = ? WHERE User_ID = ?';
                            db.query(fundsQuery, [newFunds, user_id], (err, fundsResults) => {
                                if (err) {
                                    console.error('Error updating funds:', err);
                                    return res.status(500).send('Error updating funds');
                                }
                                res.redirect('/wallet');
                            });
                        });
                    }
                });
            } else {
                res.status(400).send('Insufficient funds');
            }
        } else {
            res.status(404).send('Cryptocurrency not found');
        }
    });
}
exports.sell = (req, res)=>{
    const crypto_id = req.params.crypto_id;
    const amount = parseInt(req.body.amount);
    const user_id = req.session.user_id;
    const funds = req.session.funds;

    const query = 'SELECT * FROM cryptocurrencies WHERE Crypto_ID = ?';
    db.query(query, [crypto_id], (err, results) => {
        if (err) {
            console.error('Error fetching cryptocurrency:', err);
            return res.status(500).send('Error fetching cryptocurrency');
        }

        if (results.length > 0) {
            const crypto = results[0];
            const total = crypto.Price * amount;

            const checkQuery = 'SELECT * FROM `owned crypto` WHERE User_ID = ? AND Crypto_ID = ?';
            db.query(checkQuery, [user_id, crypto_id], (err, ownedResults) => {
                if (err) {
                    console.error('Error checking owned cryptocurrency:', err);
                    return res.status(500).send('Error checking owned cryptocurrency');
                }

                if (ownedResults.length > 0) {
                    const ownedAmount = parseInt(ownedResults[0].Amount);

                    if (ownedAmount >= amount) {
                        const newAmount = ownedAmount - amount;

                        if (newAmount > 0) {
                            const updateQuery = 'UPDATE `owned crypto` SET Amount = ? WHERE User_ID = ? AND Crypto_ID = ?';
                            db.query(updateQuery, [newAmount, user_id, crypto_id], (err, updateResults) => {
                                if (err) {
                                    console.error('Error updating cryptocurrency amount:', err);
                                    return res.status(500).send('Error updating cryptocurrency amount');
                                }

                                const newFunds = funds + total;
                                req.session.funds = newFunds;

                                // Update funds in user database
                                const fundsQuery = 'UPDATE user SET Funds = ? WHERE User_ID = ?';
                                db.query(fundsQuery, [newFunds, user_id], (err, fundsResults) => {
                                    if (err) {
                                        console.error('Error updating funds:', err);
                                        return res.status(500).send('Error updating funds');
                                    }
                                    res.redirect('/wallet');
                                });
                            });
                        } else {
                            const deleteQuery = 'DELETE FROM `owned crypto` WHERE User_ID = ? AND Crypto_ID = ?';
                            db.query(deleteQuery, [user_id, crypto_id], (err, deleteResults) => {
                                if (err) {
                                    console.error('Error deleting cryptocurrency:', err);
                                    return res.status(500).send('Error deleting cryptocurrency');
                                }

                                const newFunds = funds + total;
                                req.session.funds = newFunds;

                                // Update funds in user database
                                const fundsQuery = 'UPDATE user SET Funds = ? WHERE User_ID = ?';
                                db.query(fundsQuery, [newFunds, user_id], (err, fundsResults) => {
                                    if (err) {
                                        console.error('Error updating funds:', err);
                                        return res.status(500).send('Error updating funds');
                                    }
                                    res.redirect('/wallet');
                                });
                            });
                        }
                    } else {
                        res.status(400).send('Insufficient cryptocurrency amount to sell');
                    }
                } else {
                    res.status(404).send('Cryptocurrency not owned');
                }
            });
        } else {
            res.status(404).send('Cryptocurrency not found');
        }
    });
}