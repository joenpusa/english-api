const express = require('express');
require('dotenv').config();
const cors = require('cors');
const userRoutes = require('./routes/user.routes'); // 👈 importa tus rutas

const app = express();

// Middlewares
app.use(cors());
app.use(express.json());

// Ruta base para probar si el servidor responde
app.get('/', (req, res) => {
  res.send('API is running...');
});

// Rutas de usuarios
app.use('/api/users', userRoutes); // 👈 aquí agregas el router

// Manejo de errores centralizado
app.use((err, req, res, next) => {
  console.error(err.stack); // opcional: para debug
  const status = err.status || 500;
  res.status(status).json({
    error: err.message || 'Internal Server Error'
  });
});

// Levantar el servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`🚀 API running on port ${PORT}`));
