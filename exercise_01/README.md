CUL D'AMPOLLA - Optital Store Database
This project contains the MySQL database desgn and implementation for an optical store that wants to digitize the management of its clientes, suppliers, employees and sales.

DESCRIPTION.
The system stores and manages information about:
    -Suppliers: Name, address (street, number, floor, door, city, postal code, country), phone, fax, and tax ID (NIF).
    -Glasses: Brand, lens graduations (left and right), frame type (floating, plastic, or metal), frame color, lens colors, and price. Each brand of glasses is purchased from a single supplier.
    -Customers: Name, postal address, phone, email, and registration date. Optionally, the system records which existing customer recommended them.
    -Employees: The staff members responsible for sales.
    -Sales: Record of each transaction, including the glasses sold, the customer, the employee, and the date of sale.

STRUCTURE.
This repository includes:
-relational_model.png - the entity-relationship diagram (EER)
-script.sql - SQL script to create and load the database structure and example data

TECHNOLOGIES.
-Database: MySQL
-Modeling Tool: MySQL Workbench
