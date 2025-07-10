const db = require('../config/db');
const bcrypt = require('bcryptjs');

exports.register = async ({ name, email, password, license_id = 1 }) => {
  // Verifica si el email ya existe
  const [existing] = await db.query('SELECT id FROM users WHERE email = ?', [email]);
  if (existing.length > 0) {
    const error = new Error('Email is already in use');
    error.status = 409;
    throw error;
  }

  // Encriptar la contraseña
  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(password, salt);

  // Insertar usuario
  const [result] = await db.query(
    'INSERT INTO users (name, email, password_hash, license_id) VALUES (?, ?, ?, ?)',
    [name, email, hashedPassword, license_id]
  );

  return {
    id: result.insertId,
    name,
    email
  };
};

exports.verifyCredentials = async (email, password) => {
  const [rows] = await db.query('SELECT * FROM users WHERE email = ?', [email]);

  if (rows.length === 0) {
    const error = new Error('Invalid email or password');
    error.status = 401;
    throw error;
  }

  const user = rows[0];
  const isMatch = await bcrypt.compare(password, user.password_hash);

  if (!isMatch) {
    const error = new Error('Invalid email or password');
    error.status = 401;
    throw error;
  }

  return {
    id: user.id,
    name: user.name,
    email: user.email
  };
};
