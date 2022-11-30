/* DATETIME manipulation, CASE Statement, Left JOIN statement */

SELECT dm.emp_no, dm.dept_no, em.first_name, em.last_name, em.birth_date, 
	YEAR(CURDATE()) - DATE_FORMAT(em.Birth_Date, "%Y ") AS Age , ds.dept_name,
	
	CASE ds.dept_name WHEN 'Marketing' THEN 'MARKETING'
	ELSE 'Other' END 'Just_Marketing',
    
    CASE  WHEN (YEAR(CURDATE()) - DATE_FORMAT(em.Birth_Date, "%Y ")) > 62 
    THEN 'Pensioner' ELSE (YEAR(CURDATE()) - DATE_FORMAT(em.Birth_Date, "%Y ")) END 'Pensioners'
	
FROM dept_manager dm
LEFT JOIN employees em
ON dm.emp_no = em.emp_no
LEFT JOIN departments ds
ON dm.dept_no = ds.dept_no;