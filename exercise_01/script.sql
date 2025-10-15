DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE optica;
CREATE TABLE Supplier (
  supplier_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  street VARCHAR(100),
  number VARCHAR(10),
  floor VARCHAR(10),
  door VARCHAR(10),
  city VARCHAR(50),
  postal_code VARCHAR(10),
  country VARCHAR(50),
  phone VARCHAR(20),
  fax VARCHAR(20),
  nif VARCHAR(20)
);
CREATE TABLE Glasses (
  glasses_id INT AUTO_INCREMENT PRIMARY KEY,
  brand VARCHAR(50) NOT NULL,
  left_graduation DECIMAL(4,2),
  right_graduation DECIMAL(4,2),
  frame_type ENUM('flotant', 'pasta', 'metàl·lica'),
  frame_color VARCHAR(30),
  left_lens_color VARCHAR(30),
  right_lens_color VARCHAR(30),
  price DECIMAL(10,2),
  supplier_id INT,
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);
CREATE TABLE Customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  street VARCHAR(100),
  number VARCHAR(10),
  floor VARCHAR(10),
  door VARCHAR(10),
  city VARCHAR(50),
  postal_code VARCHAR(10),
  country VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(100),
  registration_date DATE,
  recommended_by INT,
  FOREIGN KEY (recommended_by) REFERENCES Customer(customer_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);
CREATE TABLE Employee (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(100),
  hire_date DATE
);
CREATE TABLE Sale (
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  sale_date DATE NOT NULL,
  quantity INT DEFAULT 1,
  total_price DECIMAL(10,2),
  customer_id INT,
  employee_id INT,
  glasses_id INT,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
  FOREIGN KEY (glasses_id) REFERENCES Glasses(glasses_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

-- Proveedores
INSERT INTO Supplier (name, city, nif) VALUES
('OptiProveïdor', 'Barcelona', 'A12345678'),
('VisióTotal', 'Girona', 'B87654321');

-- Gafas
INSERT INTO Glasses (brand, price, frame_type, frame_color, supplier_id)
VALUES
('Ray-Ban', 129.99, 'metàl·lica', 'negro', 1),
('Oakley', 159.99, 'pasta', 'azul', 2);

-- Clientes
INSERT INTO Customer (name, city, email, registration_date)
VALUES
('Laura Pérez', 'Barcelona', 'laura@example.com', '2024-10-01'),
('Marc Rovira', 'Girona', 'marc@example.com', '2024-09-15');

-- Empleados
INSERT INTO Employee (name, phone, email, hire_date)
VALUES
('Anna Torres', '600123456', 'anna@culdampolla.cat', '2023-02-01'),
('Jordi Martí', '600654321', 'jordi@culdampolla.cat', '2022-09-15');

-- Ventas
INSERT INTO Sale (sale_date, quantity, total_price, customer_id, employee_id, glasses_id)
VALUES
('2025-01-15', 1, 129.99, 1, 1, 1),
('2025-02-20', 2, 319.98, 2, 2, 2);

USE optica;
SHOW TABLES;
SELECT * FROM Supplier;
SELECT * FROM Customer;