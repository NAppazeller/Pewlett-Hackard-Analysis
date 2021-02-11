--Create new table for retirement titles PART 1A
SELECT e.emp_no,
    e.first_name,
	  e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')


-- Use Distinct with Orderby to remove duplicate rows PART 1B
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.first_name,
	  rt.last_name,
    rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, to_date DESC;

-- Employee count by department number PART 1C
SELECT COUNT(ut.title), ut.title
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count(ut.title) DESC;
