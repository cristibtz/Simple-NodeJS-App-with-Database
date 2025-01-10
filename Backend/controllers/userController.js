const path = require('path');

//User features
exports.dashboard = (req, res)=>{
    res.status(200).render('dashboard', {
        username: req.session.username,
        profile_info: req.session.profile_info,
        funds: req.session.funds
    });
}

exports.market = (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../../Frontend/views/', 'market.html'));
} 

exports.wallet = (req, res)=>{
    res.status(200);
    res.sendFile(path.join(__dirname, '../../Frontend/views/', 'wallet.html'));
}