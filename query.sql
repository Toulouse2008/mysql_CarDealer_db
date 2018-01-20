# SQL queries from step 2



# a). The number of cars that sold by Eric Price.

SELECT SUM(quantity) as total
FROM car_sold
WHERE empl_id=(
    SELECT empl_id
    FROM employee
    WHERE first_name='Eric' and last_name='Price'
);

# b). The name of the dependents who are children of Eric Price.

SELECT first_name, last_name
FROM dependent
WHERE relationship='child' and empl_id=(
    SELECT empl_id
    FROM employee
    WHERE first_name='Eric' and last_name='Price'
);

# c). The total number of cars sold by Dragon team.

SELECT SUM(quantity)
FROM car_sold
WHERE empl_id IN (
    SELECT empl_id
    FROM team
    WHERE team_name='Dragon'
);

# d). The names of the salesman who sold more than 10 cars

SELECT first_name, last_name
FROM employee
WHERE empl_id IN (
    SELECT empl_id
    FROM (
        SELECT empl_id, SUM(quantity) AS total
        FROM car_sold
        GROUP BY empl_id
        HAVING total>10
    ) AS temp
);

# e). The car_id, model, color and price of the cars that are lower than $20000

SELECT car_id, model, color, price
FROM car
WHERE price < 20000;

# f). All the names of the customer service in Nurse team.
SELECT CONCAT(first_name, ', ',last_name) AS name
FROM employee
WHERE empl_id in (
    SELECT empl_id
    FROM team
    WHERE team_name='Nurse'
);

# g). The car_id, model, color and quantity of cars in stocks whose quantity is below 3

SELECT car_id, model, color, quantity
FROM car
WHERE quantity < 3;

# h). The car_id, model and color whose quantity is higher than 6

SELECT car_id, model, color, quantity
FROM car
WHERE quantity > 6;

# i).  The total quantity of cars that are made by TOYOTO.

SELECT SUM(quantity) AS total
FROM car
WHERE maker_id=(
    SELECT maker_id
    FROM maker
    WHERE maker_name='TOYOTO'
);

# j). The names of all of the team leaders.

SELECT CONCAT(first_name, ', ', last_name) AS name
FROM employee
WHERE empl_id in (
    SELECT empl_id
    FROM team
    WHERE title='Team Leader'
);
