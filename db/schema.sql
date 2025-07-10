-- Elimina la base si ya existe (opcional en desarrollo)
DROP DATABASE IF EXISTS english_learning_app;
CREATE DATABASE english_learning_app;
USE english_learning_app;

-- Tabla de licencias
CREATE TABLE licenses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT
);

-- Tabla de categorías
CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de niveles (opcional, pero recomendada)
CREATE TABLE levels (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(10) NOT NULL UNIQUE
);

-- Tabla de vocabulario
CREATE TABLE vocabulary (
  id INT AUTO_INCREMENT PRIMARY KEY,
  word_en VARCHAR(100) NOT NULL,
  word_es VARCHAR(100) NOT NULL,
  level VARCHAR(10),
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Tabla de ejercicios
CREATE TABLE exercises (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type VARCHAR(50) NOT NULL,
  question TEXT NOT NULL,
  options JSON,
  answer VARCHAR(255) NOT NULL,
  explanation TEXT,
  level VARCHAR(10),
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Acceso de ejercicios por licencia
CREATE TABLE exercise_license_access (
  id INT AUTO_INCREMENT PRIMARY KEY,
  exercise_id INT NOT NULL,
  license_id INT NOT NULL,
  UNIQUE KEY (exercise_id, license_id),
  FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE,
  FOREIGN KEY (license_id) REFERENCES licenses(id) ON DELETE CASCADE
);

-- Tabla de usuarios
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  license_id INT,
  FOREIGN KEY (license_id) REFERENCES licenses(id)
);

-- Progreso de vocabulario
CREATE TABLE vocabulary_progress (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  vocabulary_id INT NOT NULL,
  status ENUM('pending', 'learned', 'in_practice') DEFAULT 'pending',
  last_review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY (user_id, vocabulary_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (vocabulary_id) REFERENCES vocabulary(id) ON DELETE CASCADE
);

-- Progreso de ejercicios
CREATE TABLE exercise_progress (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  exercise_id INT NOT NULL,
  status ENUM('pending', 'passed', 'failed') DEFAULT 'pending',
  last_attempt_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY (user_id, exercise_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE
);

-- Exámenes realizados por usuarios
CREATE TABLE exams (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  date DATETIME DEFAULT CURRENT_TIMESTAMP,
  score DECIMAL(5,2),
  level VARCHAR(10),
  status ENUM('completed', 'in_progress') DEFAULT 'in_progress',
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Ejercicios usados en exámenes
CREATE TABLE exam_exercise (
  id INT AUTO_INCREMENT PRIMARY KEY,
  exam_id INT NOT NULL,
  exercise_id INT NOT NULL,
  user_answer TEXT,
  is_correct TINYINT(1),
  FOREIGN KEY (exam_id) REFERENCES exams(id) ON DELETE CASCADE,
  FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE
);

-- Tokens de sesión
CREATE TABLE refresh_tokens (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  token TEXT NOT NULL,
  expires_at DATETIME NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
