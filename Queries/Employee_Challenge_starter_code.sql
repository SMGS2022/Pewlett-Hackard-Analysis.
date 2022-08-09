Employee_Database_challenge.sql

-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
select emp_no,first_name,last_name from employees;

-- Retrieve the title, from_date, and to_date columns from the Titles table.
select title,from_date,to_date from titles;

-- Create a new table using the INTO clause.
select employees.emp_no, first_name, last_name, title, from_date, to_date 
INTO retirement_info_final
from employees
JOIN titles
on employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

-- Check the retirement_info table
SELECT * FROM retirement_info_final;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_info_final
ORDER BY emp_no ASC, to_date DESC;

-- Check the unique_titles table
SELECT * FROM unique_titles;

-- Order By title count 
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Check the retiring_titles table
SELECT * FROM retiring_titles;


SELECT SUM(Count) AS "Total" FROM retiring_titles;