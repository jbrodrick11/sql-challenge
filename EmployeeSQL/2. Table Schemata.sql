/*Create Titles table*/
CREATE TABLE titles (
	title_id VARCHAR(30) NOT NULL PRIMARY KEY,
	title VARCHAR(30) NOT NULL
	);

/*Create Employees table*/
CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL REFERENCES titles(title_id),
	birth_date VARCHAR(30) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no)
	);

/*Create Salaries table*/
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL PRIMARY KEY REFERENCES employees(emp_no),
	salary INTEGER NOT NULL
	);

/*Create Department Manager table*/
CREATE TABLE dept_manager (
	dept_no VARCHAR(30),
	emp_no INTEGER NOT NULL PRIMARY KEY REFERENCES employees(emp_no)
	);

/*Create Departments table*/
CREATE TABLE departments (
	dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL	
	);

/*Create Department Employees table
NOTE - when importing CSV, remember to remove 'ID' column from Import Options*/
CREATE TABLE dept_emp (
	id SERIAL PRIMARY KEY,
	emp_no INTEGER NOT NULL REFERENCES employees(emp_no),
	dept_no VARCHAR(30) NOT NULL REFERENCES departments(dept_no)
	);
	