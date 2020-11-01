
-- Deliverable 1: The Number of Retiring Employees by Title

--Retrieve and filter birth date data from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees as e
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--Retrieve data from the titles table.
SELECT emp_no, title, from_date, to_date
FROM titles as t

--- Create a new table using the INTO clause
SELECT emp_no,title, from_date, to_date
INTO retirement_t
FROM titles as t

------Join both tables on the primary key &
------ & Renaming the joint table as retirement_titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	rt.title,
	rt.from_date,
	rt.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN retirement_t as rt
ON (e.emp_no = rt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

-- Use Distinct with ORDER BY to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,
first_name, 
last_name, 
title
INTO unique_titles
FROM retirement_titles as rtt
ORDER BY rtt.emp_no ASC, rtt.to_date DESC;

--Exporting the Unique Titles table as unique_titles.csv and saving
-- it to the Data folder in the Pewlett-Hackard-Analysis folder.

-- Number of employees about to retire by their most recent job title
SELECT COUNT (ut.title) , ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY ut.count DESC;

-- Deliverable 2: The Employees Eligible for the Mentorship Program

-- Create a Mentorship Eligibility table that holds the employees 
-- who are eligible to participate in a mentorship program.

-- -- Retrieve data from the Employees Table
SELECT emp_no,
first_name
last_name
birth_date
FROM employees as e

--Retrieve data from the Department_Employees.
SELECT from_date, to_date
FROM Dept_emp as de

--Retrieve data from the Titles Table.
SELECT title
FROM titles as t

-- Use Distinct to retrieve the first occurence of emp_no
-- The Distinct select all the rows in the columns
--  A new table "mentorship_eligibility" will also be created in the same code below.

SELECT DISTINCT e.emp_no,e.first_name, e.last_name, e.birth_date,
t.from_date, t.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE t.to_date = '9999-01-01' and 
(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY e.emp_no






