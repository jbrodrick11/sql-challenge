/*List the employee number, last name, first name, sex, and salary of each employee*/
SELECT employees.emp_no,employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

/*List the first name, last name, and hire date for the employees who were hired in 1986*/
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

/*List the manager of each department along with their department number, department name, employee number, last name, and first name.
Rearranged columns to ensure it made sense in regards to the question asked*/
SELECT employees.first_name, employees.last_name,dept_manager.dept_no, departments.dept_name,dept_manager.emp_no
FROM dept_manager
JOIN departments ON dept_manager.dept_no=departments.dept_no
JOIN employees ON dept_manager.emp_no=employees.emp_no;

/*List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Rearranged columns to ensure it made sense in regards to the question asked*/
SELECT employees.first_name, employees.last_name,dept_emp.dept_no, departments.dept_name,dept_emp.emp_no
FROM dept_emp
JOIN departments ON dept_emp.dept_no=departments.dept_no
JOIN employees ON dept_emp.emp_no=employees.emp_no;

/*List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B*/
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

/*List each employee in the Sales department, including their employee number, last name, and first name*/
SELECT employees.first_name, employees.last_name, departments.dept_name,dept_emp.emp_no
FROM dept_emp
JOIN departments ON dept_emp.dept_no=departments.dept_no
JOIN employees ON dept_emp.emp_no=employees.emp_no
WHERE dept_name = 'Sales';

/*List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name*/
SELECT employees.first_name, employees.last_name, departments.dept_name,dept_emp.emp_no
FROM dept_emp
JOIN departments ON dept_emp.dept_no=departments.dept_no
JOIN employees ON dept_emp.emp_no=employees.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

/*List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)*/
SELECT last_name, COUNT(last_name)AS Frequency
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;