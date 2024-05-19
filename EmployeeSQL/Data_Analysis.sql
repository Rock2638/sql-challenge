-- Q1 - Listing the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
FROM 
    employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;


-- Q2 - Listing the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name,
    last_name,
    hire_date
FROM 
    employees
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;


-- Q3 -  Listing the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT 
   	departments.dept_name,
    dept_manager.dept_no,
    employees.emp_no,
    employees.last_name,
    employees.first_name
FROM 
    departments 
INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no
ORDER BY departments.dept_name


-- Q4 - Listing the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT 
   	departments.dept_name,
    dept_emp.dept_no,
    employees.emp_no,
    employees.last_name,
    employees.first_name
FROM 
    departments 
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
ORDER BY departments.dept_name, employees.last_name


-- Q5 - List the first name, last name, and sex of each employee whose first name is 
-- Hercules and whose last name begins with the letter B.
SELECT 
	first_name,
    last_name,
	sex
FROM 
	employees
WHERE 
	first_name='Hercules'
AND
	last_name LIKE 'B%';


-- Q6 - Listing each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
   	departments.dept_name,
    dept_emp.emp_no,
    employees.last_name,
    employees.first_name
FROM 
    departments 
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no

WHERE 
	departments.dept_name = 'Sales';


-- Q7 - Listing each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT 
   	departments.dept_name,
    dept_emp.emp_no,
    employees.last_name,
    employees.first_name
FROM 
    departments 
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no

WHERE 
	departments.dept_name = 'Sales' 
OR 
	departments.dept_name = 'Development';
	
	
--Q8 - Listing the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "total count"
FROM employees
GROUP BY last_name
ORDER BY "total count" DESC;

