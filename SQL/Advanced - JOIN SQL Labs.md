::page{title="Hands-on Lab: Working with Joins in MySQL using phpMyAdmin"}

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/SN_web_lightmode.png" width="300" alt="cognitiveclass.ai logo">

#

**Estimated time needed:** 20 minutes

SQL JOIN is a clause that combines rows from two or more tables based on a related column between them. The table&#39;s relationship is established by comparing the values in the columns. The purpose of using JOINs is to retrieve data from multiple tables in a single query. There are four types of JOINs in SQL: INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.

* INNER JOIN: Returns only the rows with matching values in both tables.
* LEFT JOIN: Returns all the rows from the left table and matching rows from the right table.
* RIGHT JOIN: Returns all the rows from the right table and matching rows from the left table.
* FULL OUTER JOIN: Returns all the rows when a match in the left or right table.

## Objectives

By the end of this lab, you\'ll be able to:
* Write SQL queries on multiple tables using INNER JOINS
* Write SQL queries on multiple tables using OUTER JOINS

### Software Used in this Lab

In this lab, you will use <a href="https://www.mysql.com/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDB0110ENSkillsNetwork24601058-2021-01-01">MySQL</a>. MySQL is a Relational Database Management System (RDBMS) designed to efficiently store, manipulate, and retrieve data.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/labs/Lab%20-%20Create%20Tables%20and%20Load%20Data%20in%20MySQL%20using%20phpMyAdmin/images/mysql.png" width="100" height="100" alt="MySQL logo.">
<p></p>

To complete this lab, you will utilize MySQL relational database service available as part of IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs is a virtual lab environment used in this course.

### Database Used in this Lab

The database used in this lab is internal. You will be working on a sample HR database. This HR database schema consists of five tables: **EMPLOYEES**, **JOB_HISTORY**, **JOBS**, **DEPARTMENTS**, and **LOCATIONS**. Each table has a few rows of sample data. The following diagram shows the tables for the HR database:

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Create%20tables%20using%20SQL%20scripts%20and%20Load%20data%20into%20tables/images/Sample_1.PNG" width="670" height="400" alt="Sample HR Database Table with the five databases."><br>

In this lab, you will run through some SQL practice problems that will provide hands-on experience with the different kinds of join operations.

**NOTE:** This lab requires you to have all five of these tables of the HR database populated with sample data on MySQL. 

::page{title="Load the database"}

Using the skills acquired in the previous modules, you should first create the database in MySQL. Follow the steps below:

1. Open the phpMyAdmin interface from the Skills Network Toolbox in Cloud IDE. 
2. Create a blank database named \'HR\'. Use the script shared in the link below to create the required tables.
[Script_Create_Tables.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/scripts/Script_Create_Tables.sql "Script_Create_Tables.sql")

3. Download the files in the links below to your local machine (if not already done in previous labs).
[Departments.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/Departments.csv)
[Jobs.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Jobs.csv)
[JobsHistory.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/JobsHistory.csv)
[Locations.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Locations.csv)
[Employees.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Employees.csv)

4. Use these files to the interface as data for respective tables in the \'HR\' database.

::page{title="JOINS"}

Let us see some examples of JOINS being used to query the data.

1.  Retrieve the names and job start dates of all employees who work for department number 5.

We need to use the Inner join operation with the EMPLOYEES table as the left table and the JOB_HISTORY table as the right table. The join will be made over employee ID, and the query response will be filtered for the Department ID value 5.
The query for this question will be as shown below.

```SQL
SELECT E.F_NAME,E.L_NAME, JH.START_DATE 
FROM EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH 
ON E.EMP_ID=JH.EMPL_ID 
WHERE E.DEP_ID ='5';
```

2.  Retrieve employee ID, last name, department ID, and department name for all employees.

For this, you must use the Left Outer Join operation with the EMPLOYEES table as the left table and the DEPARTMENTS table as the right table. The join will happen on the Department ID. 

***Left join query retrieves all employees, including their department details if available. If an employee does not belong to any department, the department fields will be NULL.***

The query will be written as follows:

```SQL
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME
FROM EMPLOYEES AS E 
LEFT OUTER JOIN DEPARTMENTS AS D 
ON E.DEP_ID=D.DEPT_ID_DEP;
```

3. Retrieve the First name, Last name, and Department name of all employees.

For this, you will use the Full Outer Join operation with the EMPLOYEES table as the left table and the DEPARTMENTS table as the right table. A full outer join in MySQL is implemented as a UNION of left and right outer joins.

***Full Outer Join query retrieves all employees and departments, showing all combinations. If an employee is not associated with a department, or a department has no employees, the missing fields will be NULL.***

The query will be written as shown below.

```
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP

UNION

SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
RIGHT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID=D.DEPT_ID_DEP
```

::page{title="Practice Problems"}

1.  Retrieve the names, job start dates, and job titles of all employees who work for department number 5.

     <details>
     <summary>Hint</summary>

    > Perform an INNER JOIN with 3 tables: EMPLOYEES, JOB_HISTORY, JOBS.

     </details>

     <details>
     <summary>Solution</summary>

    ```
    select E.F_NAME,E.L_NAME, JH.START_DATE, J.JOB_TITLE 
    from EMPLOYEES as E 
    INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
    INNER JOIN JOBS as J on E.JOB_ID=J.JOB_IDENT
    where E.DEP_ID ='5';
    ```

     </details>

2.  Retrieve employee ID, last name, and department ID for all employees but department names for only those born before 1980.

	<details>
	<summary>Hint</summary>
	
	> Use an AND in the LEFT OUTER JOIN clause.
	</details>

	<details>
	<summary>Solution</summary>

	```
	SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME
	FROM EMPLOYEES AS E
	LEFT OUTER JOIN DEPARTMENTS AS D
	ON E.DEP_ID = D.DEPT_ID_DEP
	AND YEAR(E.B_DATE) < 1980;
	```
	</details>


3. Retrieve the first name and last name of all employees but department ID and department names only for male employees.

     <details>
     <summary>Hint</summary>

    > Add an AND in Query 3A to filter on male employees in the ON clause. Alternatively, you can also use Left Outer Join.

     </details>

     <details>
     <summary>Solution</summary>

    ```
    SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME
    FROM EMPLOYEES AS E
    LEFT OUTER JOIN DEPARTMENTS AS D
	ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M'

    UNION

    SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME
    from EMPLOYEES AS E
    RIGHT OUTER JOIN DEPARTMENTS AS D
	ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M';
    ```

     </details>


::page{title="Conclusion"}

Congratulations! You have completed this lab and you are ready for the next topic.

You now can:

* Query multiple tables using INNER JOINS

* Query multiple tables using LEFT/RIGHT OUTER JOINS

* Query multiple tables using FULL OUTER JOINS

### Author(s)

[Lakshmi Holla](https://www.linkedin.com/in/lakshmi-holla-b39062149/) 

[Malika Singla](https://www.linkedin.com/in/malika-goyal-04798622/)

[Abhishek Gagneja](https://www.coursera.org/instructor/~129186572)
	
## <h3 align="center"> &#169; IBM Corporation 2023. All rights reserved. <h3/>

<!--  ### Changelog

| Date       | Version | Changed by | Change Description                   |
| ---------- | ------- | ---------- | ------------------------------------ |
| 2023-10-13 | 0.7 | Steve Hord | QA pass |
| 2023-10-13 | 0.6 | Misty Taylor | ID Check |
| 2023-10-12 | 0.5 | Abhishek Gagneja | Instructions updated |
| 2023-05-05        | 0.4     | Rahul Jaideep | Updated Markdown file |
| 2022-10-28 | 0.3  | Appalabhaktula Hema | Updated image links|
| 2021-08-09 | 0.2  |Sathya Priya | Updated SQL link       |
| 2021-11-01 | 0.1  | Lakshmi Holla, Malika Singla | Initial Version       | --!>



