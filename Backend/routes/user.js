const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const isAuthenticated = require('../middlewares/authMiddleware');

router.get('/dashboard', isAuthenticated, userController.dashboard);
router.get('/market', isAuthenticated, userController.market);
router.get('/wallet', isAuthenticated, userController.wallet);

module.exports = router;