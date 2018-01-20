## Database final project
## Implementation

##  Create database and tables

# Create database cars and use cars
DROP DATABASE IF EXISTS cars;
CREATE DATABASE cars;
USE cars;

# Create tables
# 1. maker table
CREATE TABLE maker (
    maker_id TINYINT(4) UNSIGNED NOT NULL AUTO_INCREMENT ,
    maker_name CHAR(20) NOT NULL,
    PRIMARY KEY(maker_id)
)ENGINE=InnoDB CHARSET=utf8;

# 2. car table
CREATE TABLE car (
    car_id INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
    year YEAR(4) NOT NULL,
    model CHAR(20) NOT NULL,
    color CHAR(20) NOT NULL,
    price DECIMAL(8,2) NOT NULL DEFAULT 0,
    quantity TINYINT(2) UNSIGNED DEFAULT 0,
    maker_id TINYINT(4) UNSIGNED NOT NULL,
    PRIMARY KEY(car_id),
    FOREIGN KEY(maker_id)
    REFERENCES maker(maker_id)
)ENGINE=InnoDB CHARSET=utf8;

# 3. employee table
CREATE TABLE employee(
    empl_id SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    ssn INT(9) UNSIGNED UNSIGNED NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender ENUM('M', 'F'),
    DOB DATE DEFAULT NULL,
    data_hire DATE DEFAULT NULL,
    PRIMARY KEY(empl_id)
)ENGINE=InnoDB CHARSET=utf8;

# 4. dependent table
CREATE TABLE dependent(
    empl_id SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender ENUM('M', 'F'),
    DOB DATE DEFAULT NULL,
    relationship ENUM('child', 'spouse'),
    PRIMARY KEY(empl_id, first_name, last_name),
    FOREIGN KEY(empl_id)
    REFERENCES employee(empl_id)
    ON DELETE CASCADE
)ENGINE=InnoDB CHARSET=utf8;

# 5. team table
CREATE TABLE team(
    team_id TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    team_name char(20) NOT NULL,
    empl_id SMALLINT(3) UNSIGNED NOT NULL,
    title ENUM('Team Leader', 'Team Member') DEFAULT 'Team Member',
    PRIMARY KEY(team_id, empl_id),
    FOREIGN KEY(empl_id)
    REFERENCES employee(empl_id)
)ENGINE=InnoDB CHARSET=utf8;

# 6. customer_service table
CREATE TABLE customer_service (
    empl_id SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    team_id TINYINT(3) UNSIGNED NOT NULL,
    telephone INT(10) UNSIGNED DEFAULT 0,
    PRIMARY KEY(empl_id, team_id),
    FOREIGN KEY(empl_id)
    REFERENCES employee(empl_id),
    FOREIGN KEY(team_id)
    REFERENCES team(team_id)
)ENGINE=InnoDB CHARSET=utf8;

# 7. salesman table
CREATE TABLE salesman(
    empl_id SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    team_id TINYINT(3) UNSIGNED NOT NULL,
    PRIMARY KEY(empl_id, team_id),
    FOREIGN KEY(team_id)
    REFERENCES team(team_id)
)ENGINE=InnoDB CHARSET=utf8;

# 8. car_sold table
CREATE TABLE car_sold(
    empl_id SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    car_id INT(6) UNSIGNED NOT NULL,
    quantity INT(6) UNSIGNED NOT NULL,
    PRIMARY KEY(empl_id, car_id),
    FOREIGN KEY(empl_id)
    REFERENCES salesman(empl_id),
    FOREIGN KEY (car_id)
    REFERENCES car(car_id)
    ON UPDATE CASCADE
)ENGINE=InnoDB CHARSET=utf8;
