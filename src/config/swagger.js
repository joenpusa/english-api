const swaggerJSDoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'English Learning API',
      version: '1.0.0',
      description: 'API para el aprendizaje de inglés-español',
    },
    servers: [
      {
        url: 'http://localhost:3000/api',
      },
    ],
    components: {
        securitySchemes: {
          bearerAuth: {
            type: 'http',
            scheme: 'bearer',
            bearerFormat: 'JWT'
          }
        }
      },
      security: [
        {
          bearerAuth: []
        }
      ],
  },
  apis: ['./src/routes/*.js'], // Documentación en los archivos de rutas
};

const swaggerSpec = swaggerJSDoc(options);

module.exports = {
  swaggerUi,
  swaggerSpec,
};
