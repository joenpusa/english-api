const express = require('express');
const router = express.Router();
const userController = require('../controllers/user.controller');
const { check } = require('express-validator');
const auth = require('../middlewares/auth.middleware');

/**
 * @swagger
 * /users/register:
 *   post:
 *     summary: Registro de un nuevo usuario
 *     tags: [Users]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - name
 *               - email
 *               - password
 *             properties:
 *               name:
 *                 type: string
 *                 example: John Doe
 *               email:
 *                 type: string
 *                 example: john@example.com
 *               password:
 *                 type: string
 *                 example: Password123
 *     responses:
 *       201:
 *         description: Usuario registrado exitosamente
 *       400:
 *         description: Datos inválidos
 *       409:
 *         description: El correo ya está en uso
 */
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


/**
 * @swagger
 * /users/login:
 *   post:
 *     summary: Login del usuario
 *     tags: [Users]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - email
 *               - password
 *             properties:
 *               email:
 *                 type: string
 *                 example: john@example.com
 *               password:
 *                 type: string
 *                 example: Password123
 *     responses:
 *       200:
 *         description: Usuario autenticado correctamente
 *       401:
 *         description: Credenciales inválidas
 */
router.post('/login', userController.loginUser);

router.post('/logout', userController.logoutUser);

/**
 * @swagger
 * /users/refresh-token:
 *   post:
 *     summary: Obtener un nuevo access token usando un refresh token válido
 *     tags: [Users]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - token
 *             properties:
 *               token:
 *                 type: string
 *                 example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
 *     responses:
 *       200:
 *         description: Access token renovado
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 accessToken:
 *                   type: string
 *       400:
 *         description: Token no proporcionado
 *       403:
 *         description: Token inválido o expirado
 */
router.post('/refresh-token', userController.refreshToken);

/**
 * @swagger
 * /users/profile:
 *   get:
 *     summary: Obtener el perfil del usuario autenticado
 *     tags: [Users]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Datos del perfil del usuario
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Welcome, john@example.com
 *       401:
 *         description: Token faltante o inválido
 */
router.get('/profile', auth, (req, res) => {
  res.json({ message: `Welcome, ${req.user.email}` });
});

module.exports = router;
