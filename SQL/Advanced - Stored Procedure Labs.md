::page{title="Hands-on Lab: Stored Procedures"}

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/SN_web_lightmode.png" width="300">

#

**Estimated time needed:** 20 minutes

Stored Procedures in SQL are a type of database object that allow you to encapsulate a series of SQL statements into a single routine. They are stored in the database data dictionary and can be invoked from an application program or from the database command interface. Stored procedures can accept input parameters and return multiple values of output parameters. They can also include control-of-flow constructs such as loops and conditional statements. Stored procedures offer several benefits including improved performance, higher productivity, ease of use, and increased scalability. They also provide a mechanism for enforcing business rules and data integrity in the database system.

## Objectives

After completing this lab, you will be able to:

*   Create stored procedures
*   Execute stored procedures

## Software Used in this Lab

In this lab, you will use <a href="https://www.mysql.com/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDB0110ENSkillsNetwork24601058-2021-01-01" target="_blank">MySQL</a>. MySQL is a Relational Database Management System (RDBMS) designed to efficiently store, manipulate, and retrieve data.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/labs/Lab%20-%20Create%20Tables%20and%20Load%20Data%20in%20MySQL%20using%20phpMyAdmin/images/mysql.png" width="100" height="100">
<p></p>

To complete this lab you will utilize MySQL relational database service available as part of IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs is a virtual lab environment used in this course.

## Database Used in this Lab

**Mysql_learners** database has been used in this lab.

::page{title="Data Used in this Lab"}

The data used in this lab is internal data. You will be working on the **PETSALE** table.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Stored%20Procedures/images/PETSALE_table_v2.png)

This lab requires you to have the PETSALE table populated with sample data on mysql phpadmin interface. You might have created and populated a PETSALE table in a previous lab. 

For this lab, you need to create a database `PETS` in the phpMyAdmin interface. Download the `PETSALE-CREATE-v2.sql` script below, upload it to console under the `PETS` database. Upon execution, the script will create a new PETSALE table dropping any previous PETSALE table if exists, and will populate it with the required sample data.

*   [PETSALE-CREATE-v2.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/PETSALE-CREATE-v2.sql)

::page{title="Stored Procedure: Exercise 1"}

In this exercise, you will create and execute a stored procedure to read data from a table on mysql phpadmin using SQL.

1. You will create a stored procedure routine named **RETRIEVE_ALL**.
    *   This **RETRIEVE_ALL** routine will contain an SQL query to retrieve all the records from the PETSALE table, so you don\'t need to write the same query over and over again. You just call the stored procedure routine to execute the query everytime.
    *   To create the stored procedure routine, copy the code below and paste it to the textarea of the **SQL** page. Click **Go**.


```
DELIMITER //

CREATE PROCEDURE RETRIEVE_ALL()

BEGIN
   SELECT *  FROM PETSALE;
END //
DELIMITER ;
```

 ![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc1.png)

2.  To call the RETRIEVE_ALL routine, open another **SQL** tab by clicking **Open in new Tab**

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc2.png)

Delete the default line which appears so that you will get a blank window.

Copy the code below and paste it to the textarea of the **SQL** page. Click **Go**.

```
CALL RETRIEVE_ALL;
```

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc3.png)

3. You can view the created stored procedure routine RETRIEVE_ALL. On the left panel, expand the **PETS** database option and click on **Procedures** to view the procedure.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc4.png)

4.  If you wish to drop the stored procedure routine RETRIEVE_ALL, copy the code below and paste it to the textarea of the **SQL** page. Click **Go**.

```
DROP PROCEDURE RETRIEVE_ALL;

CALL RETRIEVE_ALL;
```

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc5.png)


::page{title="Stored Procedure: Exercise 2"}

In this exercise, you will create and execute a stored procedure to write/modify data in a table on MySQL using SQL.

You will create a stored procedure routine named **UPDATE_SALEPRICE** with parameters **Animal_ID** and **Animal_Health**.

*   This **UPDATE_SALEPRICE** routine will contain SQL queries to update the sale price of the animals in the PETSALE table depending on their health conditions, **BAD** or **WORSE**.
*   This procedure routine will take animal ID and health conditon as parameters which will be used to update the sale price of animal in the PETSALE table by an amount depending on their health condition. Suppose that:
       *   For animal with ID XX having BAD health condition, the sale price will be reduced further by 25%.
       *   For animal with ID YY having WORSE health condition, the sale price will be reduced further by 50%.
       *   For animal with ID ZZ having other health condition, the sale price won\'t change.

*   To create the stored procedure routine, copy the code below and paste it to the textarea of the **SQL** page. Click **Go**.

```
DELIMITER @
CREATE PROCEDURE UPDATE_SALEPRICE (IN Animal_ID INTEGER, IN Animal_Health VARCHAR(5))
BEGIN
    IF Animal_Health = 'BAD' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.25)
        WHERE ID = Animal_ID;
    ELSEIF Animal_Health = 'WORSE' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.5)
        WHERE ID = Animal_ID;
    ELSE
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE
        WHERE ID = Animal_ID;
    END IF;
END @

DELIMITER ;
```

 ![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc6.png)

1.  Let\'s call the UPDATE_SALEPRICE routine. We want to update the sale price of animal with ID **1** having **BAD** health condition in the PETSALE table. open another **SQL** tab by clicking **Open in new Tab**
 

 ![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc2.png)

 Delete the default line which appears so that you will get a blank window.

 Copy the code below and paste it to the textarea of the **SQL** page. Click **Go**.

 > Note if you have dropped RETREIVE_ALL procedure rerun the creation script of that procedure before executing these lines.

 ```
    CALL RETRIEVE_ALL;

    CALL UPDATE_SALEPRICE(1, 'BAD');

    CALL RETRIEVE_ALL;
 ```

 ![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc7.png)

2.  Let\'s call the UPDATE_SALEPRICE routine once again. We want to update the sale price of animal with ID **3** having **WORSE** health condition in the PETSALE table. copy the code below and paste it to the textarea of the **SQL** page. Click **Go**. You will have all the records retrieved from the PETSALE table.

 ```
    CALL RETRIEVE_ALL;

    CALL UPDATE_SALEPRICE(3, 'WORSE');

    CALL RETRIEVE_ALL;
 ```

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc8.png)


3. You can view the created stored procedure routine UPDATE_SALEPRICE. Click on the **Routines**  and view the procedure.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc10.png)

4. If you wish to drop the stored procedure routine UPDATE_SALEPRICE, copy the code below and paste it to the textarea of the **SQL** page. Click **Go**.

 ```
 DROP PROCEDURE UPDATE_SALEPRICE;

 CALL UPDATE_SALEPRICE;
 ```

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/images/proc11.png)


::page{title="Conclusion"}

Congratulations! You have completed this lab on creating stored procedures in MySQL.

You are now able to:
* Write a stored procedure as per requirement
* Call or Exectue a stored procedure
* Drop a stored procedure once its utility is over

## Author(s)

[Lakshmi Holla](https://www.linkedin.com/in/lakshmi-holla-b39062149/) 

[Malika Singla](https://www.linkedin.com/in/malika-goyal-04798622/)

[Abhishek Gagneja](https://www.linkedin.com/in/abhishek-gagneja-23051987/)

## <h3 align="center"> © IBM Corporation 2023. All rights reserved. <h3/>

<!-- ## Changelog

| Date       | Version | Changed by | Change Description                    |
| ---------- | ------- | ---------- | ------------------------------------ |
| 2023-10-31 | 0.4 | Mercedes Schneider | QA Edits |
| 2023-10-16 | 0.3 | Abhishek Gagneja | Updated the instructions |
| 2021-08-09 | 0.2  | Sathya Priya | Updated HTML tags and SQL link      |
| 2021-11-01 | 0.1  | Lakshmi Holla, Malika Singla | Initial Version       | --!>

