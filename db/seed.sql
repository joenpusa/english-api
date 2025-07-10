-- Licenses
INSERT INTO licenses (id, name, description) VALUES
  (1, 'free', 'Limited access to selected content'),
  (2, 'premium', 'Full access for individual users'),
  (3, 'institutional', 'Access for organizations and institutions');

-- Categories
INSERT INTO categories (id, name) VALUES
  (1, 'Vocabulary'),
  (2, 'Grammar'),
  (3, 'Reading'),
  (4, 'Listening');

-- Levels (si usas tabla levels)
INSERT INTO levels (id, name) VALUES
  (1, 'A1'),
  (2, 'A2'),
  (3, 'B1'),
  (4, 'B2'),
  (5, 'C1'),
  (6, 'C2');
