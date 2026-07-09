# Adding a Database to the Password Generator

This project now saves every generated password to a MySQL database, along with
a label (e.g. "Gmail", "Bank") so you know what each one was for. You can view
and delete saved passwords from a "View History" window inside the app.

## What was added

| File | Purpose |
|---|---|
| `DBConnection.java` | Opens the connection to MySQL |
| `PasswordHistoryDAO.java` | Saves / reads / deletes password records (the database logic) |
| `PasswordHistoryGUI.java` | A popup window that lists saved passwords in a table |
| `PasswordGeneratorGUI.java` | Updated: added a Label field, "Save Password" button, and "View History" button |
| `database_setup.sql` | SQL script that creates the database and table |

## Setup steps

### 1. Make sure MySQL is running
If you're using XAMPP, start **Apache** and **MySQL** from the XAMPP control panel.

### 2. Create the database
Open **phpMyAdmin** (`http://localhost/phpmyadmin`) or the MySQL command line, and run
the script in `database_setup.sql`. This creates:
- a database called `password_generator_db`
- a table called `password_history` with columns: `id`, `label`, `password`, `created_at`

### 3. Add the MySQL JDBC driver to your project
IntelliJ needs the **MySQL Connector/J** jar to be able to talk to MySQL.

1. Download it from: https://dev.mysql.com/downloads/connector/j/
   (choose "Platform Independent", download the `.zip` or `.tar.gz`)
2. Extract it and locate the file `mysql-connector-j-x.x.x.jar`
3. In IntelliJ: **File > Project Structure > Modules > Dependencies tab**
4. Click **+ > JARs or Directories**, select the `mysql-connector-j-x.x.x.jar` file
5. Click **OK / Apply**

### 4. Check your credentials
Open `DBConnection.java` and confirm the `USER` and `PASSWORD` values match your
MySQL setup. The defaults (`root` / empty password) work for a fresh XAMPP install.

```java
private static final String URL = "jdbc:mysql://localhost:3306/password_generator_db";
private static final String USER = "root";
private static final String PASSWORD = "";
```

### 5. Run the app
Run `App.java` as before. You'll now see:
- A **Label** field to name the password (e.g. "Gmail")
- A **Save Password** button — saves the currently generated password + label to the database
- A **View History** button — opens a window showing every saved password, with a **Delete Selected** option

## Troubleshooting

- **"MySQL JDBC Driver not found"** → the connector jar wasn't added correctly, redo step 3.
- **"Communications link failure" / connection refused** → MySQL isn't running, or the port isn't 3306.
- **"Access denied for user 'root'"** → your MySQL password isn't empty; update `PASSWORD` in `DBConnection.java`.
- **"Unknown database 'password_generator_db'"** → you haven't run `database_setup.sql` yet.
