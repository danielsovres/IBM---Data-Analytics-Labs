-- Sub Query = realizar um (SELECT) dentro de outro
-- dentro da condição WHERE (como comparação) - SELECT * FROM Employees WHERE Salary < (SELECT AVG(Salary) FROM Employees) 
-- dentro do SELECT (como dado) - SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY FROM Employees)
-- dentro do FROM - criar sub-tabelas - SELECT AVG(SALARY) FROM (SELECT SALARY FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 5) AS SALARY_TABLE;

-- Write a query to find the average salary of the five least-earning employees.
-- SUB consulta no FROM (seleciono os 5 que ganham mais) - depois pego o AVG (salary)
SELECT AVG(Salary)
FROM (SELECT Salary
      FROM EMPLOYEES
      ORDER BY SALARY ASC
      LIMIT 5) AS lowest_paid;


-- Write a query to find the records of employees older than the average age of all employees.
-- no WHERE deve ter uma sub-query com ANO (idade) > média (idade)
SELECT F_NAME, L_NAME, B_DATE, (YEAR(CURRENT_DATE) - YEAR(B_DATE)) AS AGE 
FROM EMPLOYEES
WHERE YEAR(CURRENT_DATE) - YEAR(B_DATE) > (SELECT AVG(YEAR(CURRENT_DATE) - YEAR(B_DATE))
                                           FROM EMPLOYEES)
ORDER BY B_DATE;

-- From the Job_History table, display the list of Employee IDs, years of service, and average years of service for all entries.
-- STAR_DATE - tem que virar YEARS_SERVICE
-- SELECT dentro do SELECT - como dado geral
SELECT EMPL_ID, 
YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE))) AS YEARS_SERVICE, 
	(SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE)))) 
	FROM JOB_HISTORY) AS AVG_JOBS
FROM JOB_HISTORY;