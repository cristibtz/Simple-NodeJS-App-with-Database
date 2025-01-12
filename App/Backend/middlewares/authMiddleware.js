function isAuthenticated(req, res, next) {
    if (req.session.user_id) {
        return next();
    } else {
        return res.redirect('/login');
    }
}

module.exports = isAuthenticated;