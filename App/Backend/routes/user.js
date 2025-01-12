const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const traController = require('../controllers/traController');
const isAuthenticated = require('../middlewares/authMiddleware');

router.get('/dashboard', isAuthenticated, userController.dashboard);
router.get('/market', userController.market);
router.get('/wallet', isAuthenticated, userController.wallet);

router.post('/buy/:crypto_id', isAuthenticated, traController.buy);
router.post('/sell/:crypto_id', isAuthenticated, traController.sell);

module.exports = router;