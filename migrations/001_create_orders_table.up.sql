CREATE TABLE IF NOT EXISTS orders (
  id VARCHAR(255) PRIMARY KEY,
  price DECIMAL(10, 5) NOT NULL,
  tax DECIMAL(10, 5) NOT NULL,
  final_price DECIMAL(10, 5) NOT NULL
);
