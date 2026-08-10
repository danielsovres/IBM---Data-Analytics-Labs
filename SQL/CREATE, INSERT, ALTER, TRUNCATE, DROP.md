![](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/SN_web_lightmode.png)

::page{title="Hands-on Lab: CREATE, ALTER, TRUNCATE, DROP "}

**Estimated time needed:** 20 minutes

In this lab, you will learn how to create tables and load data using the phpMyAdmin graphical user interface (GUI) tool in the MySQL database service.

## Software Used in this Lab

In this lab, you will use <a href="https://www.mysql.com/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDB0110ENSkillsNetwork24601058-2021-01-01" target="_blank">MySQL</a>. MySQL is a Relational Database Management System (RDBMS) designed to efficiently store, manipulate, and retrieve data.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/labs/Lab%20-%20Create%20Tables%20and%20Load%20Data%20in%20MySQL%20using%20phpMyAdmin/images/mysql.png" width="100" height="100">
<p></p>

To complete this lab. you will use MySQL relational database service available as part of IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs is a virtual lab environment used in this course.

## Objectives

After completing this lab, you will be able to use phpMyAdmin with MySQL to:

* Create a database.
* Create a new table in a database.
* Add, delete, or modify columns in an existing table.
* Remove all rows from an existing table without deleting the table itself.
* Delete an existing table in a database.

::page{title="Task 1: Create a database"}

Follow the steps below to create a new database in the phpMyAdmin GUI of MySQL.

1.  Click on **Skills Network Toolbox**. In the **Database** section, click **MySQL**.

    To start the MySQL, click **Create**.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/QW5QxD1zJGONPlavurQVdg/My-SQL-Start-1.png)

2.  Once **MySQL** has started, click the **phpMyAdmin button** to open **phpMyAdmin** in the same window. Alternatively, click the **toggle button** next to the phpMyAdmin button to open phpMyAdmin in a new browser tab.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/6TNgJ-wrZFAduL6G3j1hVg/My-SQL-Start-2.png)

3.  You will see the phpMyAdmin GUI tool.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/labs/Lab%20-%20Create%20Tables%20and%20Load%20Data%20in%20MySQL%20using%20phpMyAdmin/images/2.4.png)

4.  In the tree view, click `New` to create a new empty database. Then, enter `Mysql_Learners` as the name of the database, leave the default `utf8` encoding, and click `Create`.

    UTF-8 is the most commonly used character encoding for content or data.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/MwfdVBYjDiHvc1yF8fW2sg/db1.png)

::page{title="Task 2a : CREATE statement"}

Now, you will use the CREATE statement to create two new tables.
Follow the instructions to complete this task.

1.  You need to create two tables, `PETSALE` and `PET`. To create the two tables, copy the code below and paste it into the text area of the `SQL` tab. Click `Go`.

```
CREATE TABLE PETSALE (
        ID INTEGER NOT NULL,
        PET CHAR(20),
        SALEPRICE DECIMAL(6,2),
        PROFIT DECIMAL(6,2),
        SALEDATE DATE
        );

CREATE TABLE PET (
        ID INTEGER NOT NULL,
        ANIMAL VARCHAR(20),
        QUANTITY INTEGER
        );
```

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/createtable.png" width="800">
</p>
Verify that the two tables are now available in the tree structure on the left, as shown in the image below.
</p>

![](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/images/mysql_lab_create.png)

::page{title="Task 2b: INSERT statement"}

Now, insert some records into the two newly created tables. You can also add SELECT statements to print the contents of the tables once they are loaded with data.

Copy the code below and paste it into the text area of the `SQL` tab. Then, click `Go`.

```sql
INSERT INTO PETSALE VALUES
        (1,'Cat',450.09,100.47,'2018-05-29'),
        (2,'Dog',666.66,150.76,'2018-06-01'),
        (3,'Parrot',50.00,8.9,'2018-06-04'),
        (4,'Hamster',60.60,12,'2018-06-11'),
        (5,'Goldfish',48.48,3.5,'2018-06-14');
        
INSERT INTO PET VALUES
        (1,'Cat',3),
        (2,'Dog',4),
        (3,'Hamster',2);

SELECT * FROM PETSALE;
SELECT * FROM PET;
```

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/insert.png" width="800">

::page{title="Task 3: ALTER statement"}

In this exercise, you will use the ALTER statement to add, delete, or modify columns in the existing tables.

#### 1. Adding a column
   Add a new column named `QUANTITY` to the `PETSALE` table and display the altered table. 
   For this, copy the code below and paste it into the text area of the **SQL** page. Click **Go**..

```
ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;

SELECT * FROM PETSALE;
```

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/alter.png" width="800">

</P>

Now update the newly added **QUANTITY** column of the **PETSALE** table with some values and show all the table records. Copy the code below and paste it into text area of the **SQL** page. Click **Go**.

</P>


```
UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;

SELECT * FROM PETSALE;
```

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/update.png" width="800">

#### 2. Deleting a column

   Delete the **PROFIT** column from the **PETSALE** table and show the altered table. Copy the code below and paste it into the text area of the **SQL** page. Click **Go**.

```
ALTER TABLE PETSALE
DROP COLUMN PROFIT;

SELECT * FROM PETSALE;
```

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/alter_drop.png">

#### 3. Modify a column

Change the data type to `VARCHAR(20)` type of the column `PET` of the table `PETSALE` and show the altered table. Copy the code below and paste it into the text area of the `SQL` page. Click `Go`.

```
ALTER TABLE PETSALE
MODIFY PET VARCHAR(20);
SELECT * FROM PETSALE;
```

You can click on the table name `PETSALE` in the tree structure on the left and then click on the `Structure` tab in the interface. You can then see the table structure shows the modified column data type, as shown in the image below.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/changedatatype.png">

#### 4. Rename a Column

Rename the column `PET` to `ANIMAL` of the `PETSALE` table and show the altered table. Copy the code below and paste it into the text area of the `SQL` page. Click `Go`.

```
ALTER TABLE `PETSALE` CHANGE `PET` `ANIMAL` varchar(20);

SELECT * FROM PETSALE;
```

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/renamecolumn.png">

::page{title="Task 4: TRUNCATE statement"}

In this exercise, you will use the TRUNCATE statement to remove all rows from an existing table without deleting it.

Let\'s remove all rows from the `PET` table and show the empty table. Copy the code below and paste it into the text area of the `SQL` page. Click `Go`.

```
TRUNCATE TABLE PET ;

SELECT * FROM PET;
```

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/truncate.png">

::page{title="Task 5: DROP statement"}

Finally, you will use the DROP statement to delete an existing table. Let\'s delete the `PET` table and verify if the table still exists or not (the SELECT statement should give an error if a table doesn\'t exist). Copy the code below and paste it into the text area of the `SQL` page. Click `Go`.
```
DROP TABLE PET;

SELECT * FROM PET;
```

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/drop.png">

::page{title="Practice problems"}

Try the following problems for an enhanced practice of the concepts learned in this lab.

1. Create a new table in the database named `Toys` with attributes as ID (integer), Variety (variable length string), and Quantity (integer). Make sure the ID is not Null.

<details>
<summary>Click here for the solution</summary>

```
CREATE TABLE Toys (
        ID INTEGER NOT NULL,
        Variety VARCHAR(20),
        Quantity INTEGER
        );
```
</details>

2. Add the below-mentioned entries to the table using the INSERT statement.

| ID | Variety | Quantity
| - | - | - |
|1|Chew toy | 20|
|2|Balls|50|
|3|Bowls|30|
|4|Foldable bed| 40|

<details>
<summary>Click here for the solution</summary>

```
INSERT INTO Toys VALUES
        (1, 'Chew toy', 20),
        (2, 'Balls', 50),
        (3, 'Bowls', 30),
        (4, 'Foldable bed', 40);
```
</details>

3. ALTER the length of &#39;Variety&#39; in the table to 30 characters.

<details>
<summary>Click here for the solution</summary>

```
ALTER TABLE Toys
MODIFY Variety VARCHAR(30);
```
</details>

4. TRUNCATE the table &#39;Toys&#39;

<details>
<summary>Click here for the solution</summary>

```
TRUNCATE TABLE Toys;
```
</details>

5. DROP the table &#39;Toys&#39;

<details>
<summary>Click here for the solution</summary>

```
DROP TABLE Toys;
```
</details>

::page{title="Conclusion"}

Congratulations on successfully completing this lab.

By now, you have learned how to:

* Create a database in phpMyAdmin GUI on MySQL.

* Use the CREATE statement to create new tables in the database.

* Use the INSERT statement to add records to the tables.

* Use the ALTER statement to add, delete, rename, or modify the columns of an existing table.

* Use the TRUNCATE statement to delete the contents of an existing table (but not the table).

* Use the DROP statement to delete an entire table.

## Author(s)
[Lakshmi Holla](https://www.linkedin.com/in/lakshmi-holla-b39062149/) 

[Malika Singla](https://www.linkedin.com/in/malika-goyal-04798622/)

## Additional Contributor(s)

[Abhishek Gagneja](https://www.linkedin.com/in/abhishek-gagneja-23051987/)

## <h3 align="center"> © IBM Corporation 2023. All rights reserved. <h3/>

<!-- ## Changelog

| Date       | Version | Changed by | Change Description                   |
| ---------- | ------- | ---------- | ------------------------------------ |
| 2023-10-10 | 0.7 | Mercedes Schneider | QA Pass w/Edits |
| 2023-10-07 | 0.6 | Misty Taylor | ID Check |
| 2023-09-09 | 0.5 | Abhishek Gagneja | Updated instructions |
| 2022-10-28 | 0.4 | Appalabhaktula Hema | Updated instructions |
| 2022-07-27 | 0.3 | Lakshmi Holla | updated html tag|
| 2022-06-04 | 0.2  | Lakshmi Holla, Malika Singla | Updated the MySQL starting commands      |
| 2021-11-01 | 0.1  | Lakshmi Holla, Malika Singla | Initial Version       | --!>

## <h3 align="center"> © IBM Corporation 2023. All rights reserved. <h3/>

