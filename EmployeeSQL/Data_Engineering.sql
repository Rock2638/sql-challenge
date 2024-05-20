-- Drop table if exists
DROP TABLE IF EXISTS departments;

-- Create a table departments
CREATE TABLE departments (
  dept_no VARCHAR PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
);

SELECT *
FROM departments

-- Drop table if exists
DROP TABLE IF EXISTS titles;

-- Create a table titles
CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY,
  title VARCHAR(30) NOT NULL
);

SELECT * FROM titles

-- Drop table if exists
DROP TABLE IF EXISTS employees;

-- Create a table employees
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(30) NOT NULL,
  birth_date TEXT NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date TEXT,
  FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees

--Convert birth date text to a new column of type date as import wizard does not convert automatically
ALTER TABLE employees
ADD birth_date_date DATE;

UPDATE employees
SET birth_date_date = TO_DATE(birth_date, 'MM/DD/YYYY')
WHERE birth_date IS NOT NULL;

ALTER TABLE employees
DROP birth_date;

ALTER TABLE employees
RENAME COLUMN birth_date_date TO birth_date;

--Convert hire date text to a new column of type date as import wizard does not convert automatically
ALTER TABLE employees
ADD hire_date_date DATE;

UPDATE employees
SET hire_date_date = TO_DATE(hire_date, 'MM/DD/YYYY')
WHERE hire_date IS NOT NULL;

ALTER TABLE employees
DROP hire_date;

ALTER TABLE employees
RENAME COLUMN hire_date_date TO hire_date;

-- Drop table if exists
DROP TABLE IF EXISTS salaries;

-- Create a table salaries
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries

-- Drop table if exists
DROP TABLE IF EXISTS dept_emp;

-- Create a table dept_emp
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(30)NOT NULL,
  FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY(dept_no) REFERENCES departments(dept_no) 
);

SELECT * FROM dept_emp

-- Drop table if exists
DROP TABLE IF EXISTS dept_manager;

-- Create a table dept_manager
CREATE TABLE dept_manager (
  dept_no VARCHAR(30)NOT NULL,
  emp_no INT NOT NULL,
  FOREIGN KEY(dept_no) REFERENCES departments(dept_no), 
  FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM  dept_manager





