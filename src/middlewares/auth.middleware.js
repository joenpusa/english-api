const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
  const auth = req.headers.authorization;

  if (!auth || !auth.startsWith('Bearer ')) {
    return res.status(401).json({ error: 'Token missing or invalid' });
  }

  const token = auth.split(' ')[1];

  try {
    const payload = jwt.verify(token, process.env.JWT_SECRET);
    req.user = payload; // puedes usarlo en controladores
    next();
  } catch (err) {
    return res.status(401).json({ error: 'Invalid token' });
  }
};
