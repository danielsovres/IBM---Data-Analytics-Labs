::page{title="Hands-on Lab: Sub-queries and Nested Selects"}

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week3/images/SN_web_lightmode.png" width="300">

#

**Estimated time needed:** 20 minutes

## Objectives

After completing this lab, you will be able to:

*   Write SQL queries that demonstrate the necessity of using sub-queries
*   Compose sub-queries in the where clause
*   Build column expressions (for example, sub-query in place of a column)
*   Write table expressions (for example, sub-query in place of a table)


## Software Used in this Lab

In this lab, you will use <a href="https://www.mysql.com/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDB0110ENSkillsNetwork24601058-2021-01-01" target="_blank">MySQL</a>. MySQL is a Relational Database Management System (RDBMS) designed to store, manipulate, and retrieve data efficiently.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/labs/Lab%20-%20Create%20Tables%20and%20Load%20Data%20in%20MySQL%20using%20phpMyAdmin/images/mysql.png" width="100" height="100">
<p></p>

To complete this lab, you will use MySQL relational database service available as part of IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs is a virtual lab environment used in this course.

## Database Used in this Lab

The database used in this lab is internal. You will be working on a sample HR database. This HR database schema consists of 5 tables: **EMPLOYEES**, **JOB_HISTORY**, **JOBS**, **DEPARTMENTS**, and **LOCATIONS**. Each table has a few rows of sample data. The following diagram shows the tables for the HR database:

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Create%20tables%20using%20SQL%20scripts%20and%20Load%20data%20into%20tables/images/Sample_1.PNG" width="670" height="400">

::page{title="Load the database"}

Using the skills acquired in the previous modules, you should first create the database in MySQL. Follow the steps below.

1. Open the phpMyAdmin interface from the Skills Network Toolbox in Cloud IDE. 
2. Create a blank database named \'HR\'. Use the script shared in the link below to create the required tables.
[Script_Create_Tables.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/scripts/Script_Create_Tables.sql "Script_Create_Tables.sql")

3. Download the files in the links below to your local device (if not already done in previous labs)
[Departments.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/a1r9zp7U4g-W3L05Zcsxsg/Departments.csv)
[Jobs.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Jobs.csv)
[JobsHistory.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/JobsHistory.csv)
[Locations.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Locations.csv)
[Employees.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Employees.csv)

4. Use these files in the phpMyAdmin interface as the data for the respective tables  in the \'HR\' database.

::page{title="Sub-queries and Nested Selects"}

Say you are asked to retrieve all employee records whose salary is lower than the average salary. You might use the following query to do this.

```SQL
SELECT * 
FROM EMPLOYEES 
WHERE salary < AVG(salary);
```
However, this query will generate an error stating, \"Illegal use of group function.\" Here, the group function is `AVG` and cannot be used directly in the condition since it has not been retrieved from the data. Therefore, the condition will use a sub-query to retrieve the average salary information to compare the existing salary. The modified query would become:

```SQL
SELECT *
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);
```

Now, consider executing a query that retrieves all employee records with EMP_ID, SALARY, and maximum salary as MAX_SALARY in every row. For this, the maximum salary must be queried and used as one of the columns. This can be done using the query below.

```
SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY 
FROM EMPLOYEES;
```

Now, consider that you wish to extract the first and last names of the oldest employee. Since the oldest employee will be the one with the smallest date of birth, the query can be written as:

```SQL
SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE B_DATE = (SELECT MIN(B_DATE) FROM EMPLOYEES);
```

You may also use sub-queries to create derived tables, which can then be used to query specific information. Say you want to know the average salary of the top 5 earners in the company. You will first have to extract a table of the top five salaries as a table. From that table, you can query the average value of the salary. The query can be written as follows.

```SQL
SELECT AVG(SALARY) 
FROM (SELECT SALARY 
	  FROM EMPLOYEES 
	  ORDER BY SALARY DESC 
	  LIMIT 5) AS SALARY_TABLE;
```
Note that it is necessary to give an alias to any derived tables.

::page{title="Practice Problems"}

1. Write a query to find the average salary of the five least-earning employees.

<details>
<summary>Click here for a hint</summary>
You need to order the data in ascending salary order and limit it to the top five entries, treating this as a derived table. Take the average of these entries.
</details>

<details>
<summary>Click here for the solution</summary>

```SQL
SELECT AVG(SALARY) 
FROM (SELECT SALARY 
	  FROM EMPLOYEES 
	  ORDER BY SALARY 
	  LIMIT 5) AS SALARY_TABLE;
```
</details>

2. Write a query to find the records of employees older than the average age of all employees.

<details>
<summary>Click here for a hint</summary>
Age in years can be calculated as the year component in the difference between DOB and current date. You need to compare the age in years with average age in years. The average age in years will be evaluated as a sub-query.
</details>

<details>
<summary>Click here for the solution</summary>

```SQL
SELECT * 
FROM EMPLOYEES 
WHERE YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE))) > 
	(SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE)))) 
	FROM EMPLOYEES);
```
</details>

3. From the Job_History table, display the list of Employee IDs, years of service, and average years of service for all entries.

<details>
<summary>Click here for hint</summary>
For this, you need to calculate the years of service as a difference between the date of joining and the current date. Average years of service need to be queried separately to be displayed.
</details>

<details>
<summary>Click here for solution</summary>

```SQL
SELECT EMPL_ID, YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE))), 
	(SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE)))) 
	FROM JOB_HISTORY)
FROM JOB_HISTORY;
```
</details>

::page{title="Conclusion"}

Congratulations! You have completed this lab and are ready for the next topic.

You should now be able to:
*   Write SQL queries that demonstrate the necessity of using sub-queries
*   Compose sub-queries in the WHERE clause
*   Build Column Expressions (for example, sub-query in place of a column)
*   Write Table Expressions (for example, sub-query in place of a table)

## Author(s)

[Abhishek Gagneja](https://www.linkedin.com/in/abhishek-gagneja-23051987/)

[Lakshmi Holla](https://www.linkedin.com/in/lakshmi-holla-b39062149/) 

[Malika Singla](https://www.linkedin.com/in/malika-goyal-04798622/)




## <h3 align="center"> © IBM Corporation 2023. All rights reserved. <h3/>
<br>
<!--
## Changelog

| Date       | Version | Changed by | Change Description                   |
| ---------- | ------- | ---------- | ------------------------------------ |
| 2024-02-16 | 1.3 | D.M.Naidu |Minor updates have been made to the queries|
| 2023-10-11 | 1.2 | Beth Larsen | QA pass, minor text edits |
| 2023-10-11 | 1.1 | Misty Taylor | ID Check |
| 2023-10-10 | 1.0 | Abhishek Gagneja | New Version of the lab created |
| 2023-05-04        | 0.3     | Rahul Jaideep | Updated Markdown file |
| 2022-07-27 | 0.2 | Lakshmi Holla | Updated HTML tag|
| 2021-11-01 | 0.1  | Lakshmi Holla, Malika Singla | Initial Version       |
-->