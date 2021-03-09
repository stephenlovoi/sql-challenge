DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments(
	dept_no VARCHAR NOT NULL, 
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);


CREATE TABLE dept_emp(
	emp_no INT NOT NULL, 
	dept_no VARCHAR NOT NULL
);

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL
);

CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

/* Run above code to create tables, then run code below after importing data */

ALTER TABLE "employees" ADD CONSTRAINT "fk_emp_title" FOREIGN KEY(emp_title_id)
REFERENCES "titles" (title_id);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_no" FOREIGN KEY(emp_no)
REFERENCES "employees" (emp_no);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_dept_no" FOREIGN KEY(dept_no)
REFERENCES "departments" (dept_no);

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_man_dept_no" FOREIGN KEY(dept_no)
REFERENCES "departments" (dept_no);

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_man_emp_no" FOREIGN KEY(emp_no)
REFERENCES "employees" (emp_no);

ALTER TABLE "salaries" ADD CONSTRAINT "fk_sal_emp_no" FOREIGN KEY(emp_no)
REFERENCES "employees" (emp_no);

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;