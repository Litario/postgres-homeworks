-- SQL-команды для создания таблиц

CREATE TABLE employees
(
    employee_id serial PRIMARY KEY,
    first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	title varchar(100) NOT NULL,
	birth_date date,
	notes text
);


CREATE TABLE customers
(
    customer_id varchar(50) PRIMARY KEY,
    company_name varchar(100) NOT NULL,
	contact_name varchar(50) NOT NULL
);


CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id varchar(50) UNIQUE REFERENCES customers(customer_id) NOT NULL,
	employee_id serial UNIQUE REFERENCES employees(employee_id) NOT NULL,
	order_date date,
	ship_city varchar(50)
);

SELECT * FROM employees

DROP TABLE employees, customers, orders;



