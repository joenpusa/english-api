const express = require('express');
const router = express.Router();
const userController = require('../controllers/user.controller');
const { check } = require('express-validator');
const { loginUser } = require('../controllers/user.controller');
const auth = require('../middlewares/auth.middleware');

// Registro
router.post(
  '/register',
  [
    check('name').notEmpty().withMessage('Name is required'),
    check('email').isEmail().withMessage('Valid email is required'),
    check('password')
      .matches(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/)
      .withMessage('Password must have at least 8 characters, one uppercase, one lowercase and one number')
  ],
  userController.registerUser
);

// Login
router.post('/login', loginUser);
router.post('/logout', userController.logoutUser);

// Refresh token
router.post('/refresh-token', userController.refreshToken);

// Ruta protegida: requiere token válido
router.get('/profile', auth, (req, res) => {
  res.json({ message: `Welcome, ${req.user.email}` });
});

module.exports = router;
