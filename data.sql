# SQL for data insertion into cars database

USE cars;

# 1. data for maker table
INSERT INTO maker
VALUES
    (1, 'BMW'),
    (2, 'BENZ'),
    (3, 'AUDI'),
    (4, 'CADILLAC'),
    (5, 'TOYOTO'),
    (6, 'HYUNDAI'),
    (7, 'FORD'),
    (8, 'HONDA'),
    (9, 'NISSAN'),
    (10, 'CHRYSLER');

# 2. data for car table
INSERT INTO car
VALUES
    (1, '2016', 'Camry', 'silver', 31000, 7, 5),
    (2, '2016', 'Camry', 'green', 29000, 2, 5),
    (3, '2016', 'Camry', 'black', 30500, 8, 5),
    (4, '2016', 'Corolla', 'silver', 18000, 12, 5),
    (5, '2016', 'Corolla', 'black', 19500, 12, 5),
    (6, '2016', 'Highlander', 'black', 32500, 5, 5),
    (7, '2017', 'Highlander', 'black', 38500, 5, 5),
    (8, '2016', 'Highlander', 'silver', 30000, 2, 5),
    (9, '2016', 'Highlander', 'white', 31000, 1, 5),
    (10, '2017', 'Camry', 'silver', 33000, 15, 5);

# 3. data for employee
INSERT INTO employee
VALUES
    (1, 180252547, 'Eric', 'Price', 'M', NULL, NULL),
    (2, 180252548, 'Susan', 'Smith', 'F', NULL, NULL),
    (3, 180252549, 'John', 'Price', 'M', NULL, NULL),
    (4, 180252540, 'Eric', 'Dao', 'M', NULL, NULL),
    (5, 180252541, 'Henry', 'Nixon', 'M', NULL, NULL),
    (6, 180252557, 'Alice', 'Smith', 'F', NULL, NULL),
    (7, 180252587, 'Windy', 'Kim', 'F', NULL, NULL),
    (8, 180252547, 'Alex', 'Gao', 'M', NULL, NULL),
    (9, 180252647, 'Jack', 'Smith', 'M', NULL, NULL),
    (10, 180272547, 'Jude', 'Lee', 'M', NULL, NULL),
    (11, 180222547, 'Rebbecca', 'Clinton', 'F', NULL, NULL),
    (12, 180952522, 'Ella', 'Price', 'F', NULL, NULL),
    (13, 180233647, 'James', 'Zhan', 'M', NULL, NULL),
    (14, 180298547, 'Robin', 'Jackson', 'F', NULL, NULL),
    (15, 180275647, 'Jeanie', 'Lee', 'F', NULL, NULL);

# 4. data for dependent
INSERT INTO dependent
VALUES
    (1, 'Lisa', 'Jackson', 'F', NULL, 'spouse'),
    (1, 'Madison', 'Price', 'M', NULL, 'child'),
    (1, 'Jeany', 'Price', 'F', NULL, 'child'),
    (1, 'Alex', 'Price', 'M', NULL, 'child'),
    (5, 'Emma', 'Lee', 'F', NULL, 'spouse'),
    (5, 'Emily', 'Nixon', 'F', NULL, 'child'),
    (5, 'Jack', 'Nixon', 'M', NULL, 'child'),
    (13, 'Elisabeth', 'Price', 'F', NULL, 'spouse'),
    (14, 'Chad', 'Jackson', 'M', NULL, 'spouse'),
    (15, 'Tom', 'Lee', 'M', NULL, 'spouse');

# 5. data for team
INSERT INTO team
VALUES
    (1, 'Dragon', 1, 'Team Leader'),
    (1, 'Dragon', 2, 'Team Member'),
    (1, 'Dragon', 3, 'Team Member'),
    (1, 'Dragon', 4, 'Team Member'),
    (1, 'Dragon', 5, 'Team Member'),
    (2, 'Tiger', 6, 'Team Leader'),
    (2, 'Tiger', 7, 'Team Member'),
    (2, 'Tiger', 8, 'Team Member'),
    (2, 'Tiger', 9, 'Team Member'),
    (2, 'Tiger', 10, 'Team Member'),
    (3, 'Nurse', 11, 'Team Leader'),
    (3, 'Nurse', 12, 'Team Member'),
    (3, 'Nurse', 13, 'Team Member'),
    (3, 'Nurse', 14, 'Team Member'),
    (3, 'Nurse', 15, 'Team Member');

# 6. data for customer_service
INSERT INTO customer_service
VALUES
    (11, 3, 3012561230),
    (12, 3, 3012561231),
    (13, 3, 3012561232),
    (14, 3, 3012561233),
    (15, 3, 3012561234);

# 7. data for salesman
INSERT INTO salesman
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 2),
    (7, 2),
    (8, 2),
    (9, 2),
    (10, 2);

# 8. data for car_sold
INSERT INTO car_sold
VALUES
    (1, 1, 2),
    (1, 2, 5),
    (1, 3, 5),
    (2, 7, 2),
    (3, 5, 1),
    (4, 6, 2),
    (5, 4, 2),
    (6, 8, 3),
    (7, 3, 5),
    (8, 9, 6);
