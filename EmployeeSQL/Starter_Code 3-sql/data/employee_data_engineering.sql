DROP TABLE IF EXISTS titles, employees, departments, dept_emp, dept_manager, salaries;

CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY,
  title VARCHAR
);

CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR NOT NULL,
  birth_date DATE,
  first_name VARCHAR,
  last_name VARCHAR,
  sex VARCHAR(1), -- Assuming sex is a single character (M/F)
  hire_date DATE,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
  dept_no VARCHAR PRIMARY KEY,
  dept_name VARCHAR
);

CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR NOT NULL,
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL,
  emp_no INT NOT NULL,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
  salary_id SERIAL PRIMARY KEY,
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
