const { validationResult } = require('express-validator');
const { generateAccessToken, generateRefreshToken } = require('../utils/jwt');
const db = require('../config/db');
const userService = require('../services/user.service');
const jwt = require('jsonwebtoken');

// Ruta para registrar un usuario
exports.registerUser = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const user = await userService.register(req.body);
    res.status(201).json({ message: 'User created', user });
  } catch (err) {
    next(err);
  }
};

// Login
exports.loginUser = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    const user = await userService.verifyCredentials(email, password);

    const accessToken = generateAccessToken({ id: user.id, email: user.email });
    const refreshToken = generateRefreshToken({ id: user.id, email: user.email });

    // Guarda el refresh token en la base de datos
    const expiresAt = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000); // 7 días
    await db.query(
      'INSERT INTO refresh_tokens (user_id, token, expires_at) VALUES (?, ?, ?)',
      [user.id, refreshToken, expiresAt]
    );

    res.json({
      accessToken,
      refreshToken,
      user
    });
  } catch (err) {
    next(err);
  }
};

// Ruta de actualización de token
exports.refreshToken = async (req, res, next) => {
  try {
    const { token } = req.body;
    if (!token) return res.status(400).json({ error: 'Refresh token is required' });

    const payload = jwt.verify(token, process.env.JWT_SECRET);

    // Verificar en la base de datos si el token está registrado y vigente
    const [rows] = await db.query(
      'SELECT * FROM refresh_tokens WHERE user_id = ? AND token = ? AND expires_at > NOW()',
      [payload.id, token]
    );

    if (rows.length === 0) return res.status(403).json({ error: 'Invalid refresh token' });

    const newAccessToken = generateAccessToken({ id: payload.id, email: payload.email });
    res.json({ accessToken: newAccessToken });
  } catch (err) {
    next(err);
  }
};

// Ruta para cerrar sesión
exports.logoutUser = async (req, res, next) => {
  try {
    const { token } = req.body;
    if (!token) return res.status(400).json({ error: 'Token is required' });

    await db.query('DELETE FROM refresh_tokens WHERE token = ?', [token]);
    res.json({ message: 'Logged out successfully' });
  } catch (err) {
    next(err);
  }
};
