const jwt = require('jsonwebtoken');

exports.generateAccessToken = (payload) => {
    return jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '15m' });
  };
  
  exports.generateRefreshToken = (payload) => {
    return jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '7d' });
  };
  
  exports.verifyToken = (token) => {
    return jwt.verify(token, process.env.JWT_SECRET);
  };