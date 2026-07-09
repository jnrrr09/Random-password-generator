-- Run this script in MySQL (e.g. via phpMyAdmin in XAMPP, or the MySQL command line)
-- It creates the database and table used by the Password Generator app.

CREATE DATABASE IF NOT EXISTS password_generator_db;

USE password_generator_db;

CREATE TABLE IF NOT EXISTS password_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
