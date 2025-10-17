DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;
CREATE TABLE Client (
  client_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  surname VARCHAR(100) NOT NULL,
  street VARCHAR(100),
  number VARCHAR(10),
  floor VARCHAR(10),
  door VARCHAR(10),
  city VARCHAR(50),
  postal_code VARCHAR(10),
  country VARCHAR(50),
  phone VARCHAR(30) NOT NULL
);
CREATE TABLE Orders ( -- Order is a reserved SQL keyword
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  client_id INT,
  date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  delivery_type ENUM('home_delivery', 'store_pickup') NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (client_id) REFERENCES Client(client_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);
CREATE TABLE Category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);
CREATE TABLE Product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  image_url VARCHAR(200),
  price DECIMAL(10, 2) NOT NULL,
  type ENUM('pizza', 'burger', 'drink') NOT NULL,
  category_id INT,
  CONSTRAINT fk_product_category
	FOREIGN KEY (category_id) REFERENCES Category(category_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);
CREATE TABLE Store (
  store_id INT AUTO_INCREMENT PRIMARY KEY,
  adress VARCHAR(200) NOT NULL,
  postal_code VARCHAR(20),
  city VARCHAR(100),
  province VARCHAR(100)
);
CREATE TABLE Employee (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,
  store_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  surname VARCHAR(100) NOT NULL,
  nif VARCHAR(20) UNIQUE NOT NULL,
  phone VARCHAR(30) NOT NULL,
  role ENUM('cook', 'delivery') NOT NULL,
  CONSTRAINT fk_employee_store
	FOREIGN KEY (store_id) REFERENCES Store(store_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
ALTER TABLE Orders 
  ADD COLUMN store_id INT NOT NULL,
  ADD COLUMN delivery_employee_id INT NULL,
  ADD COLUMN delivery_datetime DATETIME NULL,
  ADD CONSTRAINT fk_orders_store
	FOREIGN KEY (store_id) REFERENCES Store(store_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT fk_orders_delivery_employee
	FOREIGN KEY (delivery_employee_id) REFERENCES Employee(employee_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL;
CREATE TABLE OrderItem (
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL CHECK (quantity > 0),
  subtotal DECIMAL(10, 2),
PRIMARY KEY (order_id, product_id),
CONSTRAINT fk_orderitem_order
	FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
CONSTRAINT fk_orderitem_product
	FOREIGN KEY (product_id) REFERENCES Product(product_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);
SHOW TABLES;