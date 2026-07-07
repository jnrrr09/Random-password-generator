# Password Generator

A desktop password generator built with **Java Swing**, backed by a **MySQL** database.

## Features
- Generate secure random passwords with customizable length
- Toggle uppercase, lowercase, numbers, and special symbols independently
- Save generated passwords with a custom label (e.g. "Gmail", "Bank") to a MySQL database
- View, browse, and delete saved passwords from an in-app history window
- Clean separation between GUI, generation logic, and database access (DAO pattern)

## Tech Stack
- Java (Swing for GUI)
- MySQL + JDBC (MySQL Connector/J)

## Setup
See `DATABASE_SETUP_README.md` for full setup instructions, including database creation and adding the JDBC driver.
