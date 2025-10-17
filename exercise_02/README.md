PIZZERIA - Pizzeria Database Project
This project models the database of an online food ordering system for a pizzeria. It allows customers to place orders for pizzas, burgers and drinks, which can either be deliveres home or picked up in-store.

DESCRIPTION.
The system stores and manages information about:
    -Clients: id, name, surname, full adress (street, number, floor, door, city, postal code, country), phone.
    -Orders: id, date, time, delivery type, price, store id, delivery employee, delivery date time.
    -Category: defines pizza categories ("classic", "special", "vegan", etc) and the name.
    -Product: name, description, image, price, type.
    -Store: id, adress, city, province.
    -Employee: id, store id, name, surname, nif, phone, role (cook or delivery).
    -Order Item: order id, product id, quantity, subtotal.
    
    STRUCTURE.
    This repository includes:
    -relational_schema.png - entity-relation diagram (EER)
    -script.sql - SQL script to create and load the database structure and example data
    
    TECHOLOGIES.
    -Database: MySQL
    -Modeling Tool: MySQL Workbench
