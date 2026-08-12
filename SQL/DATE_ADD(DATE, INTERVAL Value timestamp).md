::page{title="Hands-on Lab: Built-in Functions"}

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%203/images/IDSNlogo.png" width="300">

#

**Estimated time needed:** 20 minutes

In SQL, you can access many built-in functions that may be used to get more variety in our data analysis. These functions include aggregation functions (like `MAX`, `MIN`, `SUM`, and `AVG`), string functions (like `LENGTH`, `UCASE`, and `LCASE`), scalar functions (like `ROUND`), and a variety of date functions as well. In this tab, you\'ll get hands-on practice on how to use all of them.

## Software Used in this Lab

In this lab, you will use <a href="https://www.mysql.com/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDB0110ENSkillsNetwork24601058-2021-01-01" target="_blank">MySQL</a>. MySQL is a Relational Database Management System (RDBMS) designed to store, manipulate, and retrieve data efficiently.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/labs/Lab%20-%20Create%20Tables%20and%20Load%20Data%20in%20MySQL%20using%20phpMyAdmin/images/mysql.png" width="100" height="100">
<p></p>

To complete this lab, you will use MySQL relational database service available as part of IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs is a virtual lab environment used in this course.

## Objectives

After completing this lab, you will be able to compose queries in phpMyAdmin with MySQL using:

* Aggregation Functions
* Scalar Functions
* String Functions
* Date Functions

::page{title="Create the database"}

Click on **Skills Network Toolbox**. In the **Database** section, click **MySQL**.

To start the MySQL, click **Create**.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/QW5QxD1zJGONPlavurQVdg/My-SQL-Start-1.png)

Once **MySQL** has started, click the **phpMyAdmin button** to open **phpMyAdmin** in the same window. Alternatively, click the **toggle button** next to the phpMyAdmin button to open phpMyAdmin in a new browser tab.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/6TNgJ-wrZFAduL6G3j1hVg/My-SQL-Start-2.png)

You will see the phpMyAdmin GUI tool.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/labs/Lab%20-%20Create%20Tables%20and%20Load%20Data%20in%20MySQL%20using%20phpMyAdmin/images/2.4.png)

In the tree view, click **New** to create a new empty database. Then, enter **Mysql_Learners** as the name of the database and click **Create**.

   Leave the default **utf8** encoding. UTF-8 is the most commonly used character encoding for content or data.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week3/images/db1.png)

::page{title="Create the PETRESCUE table"}

Rather than create the table manually by typing the DDL commands in the SQL editor, you will execute a script containing the create table command.

Download the script file [PETRESCUE-CREATE.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week3/PETRESCUE-CREATE.sql)

> **Note**: To download, right-click on the link above and click on **Save As** or **Save Link As** depending on your browser. Remember to save the file as a .sql file and not HTML.

Next, load the `.sql` file to your database using the `Import` option as shown in the image below.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week3/images/loadpetrescue.png">

Upon execution, the table PETRESCUE will be created in the `Mysql_Learners` database and loaded with a set of values as well. The attributes of the PETRESCUE table are:

|Column Name | Data Type | Description |
|---|---|---|
|ID |INTEGER | ID of the entry |
|ANIMAL| VARCHAR(20)| Type of animal |
|QUANTITY |INTEGER| Number of animals |
|COST |DECIMAL(6,2)| Cost incurred |
|RESCUEDATE| DATE| Date of Rescue |

Once the table is loaded, you may open the sql editor to start executing the queries.

::page{title="Aggregation Functions"}

1. Write a query that calculates the total cost of all animal rescues in the PETRESCUE table.

For this query, we will use the function `SUM(COLUMN_NAME)`. The output of this query will be the total value of all elements in the column. The query for this question can be written as:

```SQL
SELECT SUM(COST) FROM PETRESCUE;
```
You can further assign a label to the query `SUM_OF_COST`.

```SQL
SELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE;
```

2. Write a query that displays the maximum quantity of animals rescued (of any kind).

For this query, we will use the function `MAX(COLUMN_NAME)`. The output of this query will be the maximum value of all elements in the column. The query for this question can be written as:

```SQL
SELECT MAX(QUANTITY) FROM PETRESCUE;
```

The query can easily be changed to display the minimum quantity using the `MIN` function instead.

```SQL
SELECT MIN(QUANTITY) FROM PETRESCUE;
```

3. Write a query that displays the average cost of animals rescued.

For this query, we will use `AVG(COLUMN_NAME)`. The output of this query will be the average of all elements in the column. The query for this question can be written as

```SQL
SELECT AVG(COST) FROM PETRESCUE;
```

::page{title="Scalar Functions and String Functions"}

1. Write a query that displays the rounded integral cost of each rescue.

For this query, we will use the function `ROUND(COLUMN_NAME, NUMBER_OF_DECIMALS)`. The output of this query will be the value of each element in the column rounded to the specified number of decimal places. Note that the second argument is optional and, if omitted, results in rounding to an integer value. The query for this question can be written as:

```SQL
SELECT ROUND(COST) FROM PETRESCUE;
```

The query could also be written as:

```SQL
SELECT ROUND(COST, 0) FROM PETRESCUE;
```

In case the question was to round the value to 2 decimal places, the query would change to:

```SQL
SELECT ROUND(COST, 2) FROM PETRESCUE;
```

2. Write a query that displays the length of each animal name.

For this query, we will use the function `LENGTH(COLUMN_NAME)`. The output of this query will be the length of each element in the column. The query for this question can be written as:

```SQL
SELECT LENGTH(ANIMAL) FROM PETRESCUE;
```

3. Write a query that displays the animal name in each rescue in uppercase.

For this query, we will use the function `UCASE(COLUMN_NAME)`. The output of this query will be each element in the column in upper case letters. The query for this question can be written as:

```SQL
SELECT UCASE(ANIMAL) FROM PETRESCUE;
```

Just as easily, the user could ask for a lower case representation, and the query would be changed to:

```SQL
SELECT LCASE(ANIMAL) FROM PETRESCUE;
```

::page{title="Date Functions"}

1. Write a query that displays the rescue date.

For this query, we will use the function `DAY(COLUMN_NAME)`. The output of this query will be only the `DAY` part of the date in the column. The query for this question can be written as:

```SQL
SELECT DAY(RESCUEDATE) FROM PETRESCUE;
```

In case the query was asking for `MONTH` of rescue, the query would change to:

```SQL
SELECT MONTH(RESCUEDATE) FROM PETRESCUE;
```

In case the query was asking for `YEAR` of rescue, the query would change to:

```SQL
SELECT YEAR(RESCUEDATE) FROM PETRESCUE;
```

2. Animals rescued should see the vet within three days of arrival. Write a query that displays the third day of each rescue.

For this query, we will use the function `DATE_ADD(COLUMN_NAME, INTERVAL Number Date_element)`. Here, the quantity in `Number` and in `Date_element` will combine to form the interval to be added to the date in the column. For the given question, the query would be:

```SQL
SELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE
```

If the question was to add 2 months to the date, the query would change to:

```SQL
SELECT DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) FROM PETRESCUE
```

Similarly, we can retrieve a date before the one given in the column by a given number using the function `DATE_SUB`. By modifying the same example, the following query would provide the date 3 days before the rescue.

```SQL
SELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE
```

3. Write a query that displays the length of time the animals have been rescued, for example, the difference between the current date and the rescue date.

For this query, we will use the function `DATEDIFF(Date_1, Date_2)`. This function calculates the difference between the two given dates and gives the output in number of days. For the given question, the query would be:

```SQL
SELECT DATEDIFF(CURRENT_DATE, RESCUEDATE) FROM PETRESCUE
```

CURRENT_DATE is also an inbuilt function that returns the present date as known to the server.

To present the output in a YYYY-MM-DD format, another function `FROM_DAYS(number_of_days)`can be used. This function takes a number of days and returns the required formatted output. The query above would thus be modified to

```SQL
SELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) FROM PETRESCUE
```

::page{title="Practice Problems"}

1. Write a query that displays the average cost of rescuing a single dog. Note that the cost per dog would not be the same in different instances.

<details>
<summary>Click here for a hint</summary>
For such a problem, you must use the `AVG` function on `COST/QUANTITY`, for example, cost per unit quantity.
</details>

<details>
<summary>Click here for the solution</summary>

```
SELECT AVG(COST/QUANTITY) FROM PETRESCUE WHERE ANIMAL = 'Dog';
```
</details>

2. Write a query that displays the animal name in each rescue in uppercase without duplications.

<details>
<summary>Click here for a hint</summary>
To write this query, you must use the `DISTINCT` and `UCASE` functions.
</details>

<details>
<summary>Click here for the solution</summary>

```
SELECT DISTINCT UCASE(ANIMAL) FROM PETRESCUE;
```
</details>

3. Write a query that displays all the columns from the PETRESCUE table where the animal(s) rescued are cats. Use **cat** in lowercase in the query.

<details>
<summary>Click here for a hint</summary>
You have to use `LCASE` function for writing this query.
</details>

<details>
<summary>Click here for the solution</summary>

```
SELECT * FROM PETRESCUE WHERE LCASE(ANIMAL)="cat";
```
</details>

4. Write a query that displays the number of rescues in the 5<sup>th</sup> month.

<details>
<summary>Click here for a hint</summary>
You must use the `SUM` AND `MONTH` function to write this query.
</details>

<details>
<summary>Click here for the solution</summary>

```
SELECT SUM(QUANTITY) FROM PETRESCUE WHERE MONTH(RESCUEDATE)="05";
```
</details>

5. The rescue shelter is supposed to find good homes for all animals within 1 year of their rescue. Write a query that displays the ID and the target date.

<details>
<summary>Click here for a hint</summary>
You have to use the `DATE_ADD` function for writing this query.
</details>

<details>
<summary>Click here for Solution</summary>

```
SELECT ID, DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) FROM PETRESCUE;
```
</details>

::page{title="Conclusion"}

Congratulations on completing this lab.

You are now able to:
* Use aggregation functions to calculate total, maximum, minimum, and average values of numerical attributes.
* Use scalar functions to round a floating value to the desired number of decimal places.
* Use string functions to convert text into upper or lower cases.
* Use date operations to manipulate data columns with the attribute as date.

### Author(s)

[Lakshmi Holla](https://www.linkedin.com/in/lakshmi-holla-b39062149/) 

[Malika Singla](https://www.linkedin.com/in/malika-goyal-04798622/)

[Abhishek Gagneja](https://www.linkedin.com/in/abhishek-gagneja-23051987/)

## <h3 align="center"> © IBM Corporation 2023. All rights reserved. <h3/>
<br>
<!--
### Changelog

| Date       | Version | Changed by | Change Description                   |
| ---------- | ------- | ---------- | ------------------------------------ |
|2023-10-12  | 0.8 | Mercedes Schneider | QA Pass w/Edits |
| 2023-10-11 | 0.7 | Misty Taylor | ID Check |
| 2023-10-10 | 0.6 | Abhishek Gagneja | Updated instruction set |
| 2023-05-05 | 0.5 | Rahul Jaideep | Updated Markdown file |
| 2022-10-28 | 0.4 | Appalabhaktula Hema | Corrected the query|
| 2022-07-27 | 0.3 | Lakshmi Holla | Updated HTML tag|
| 2022-07-04 | 0.2 | Malika | Updated screenshot |
| 2021-11-01 | 0.1 | Lakshmi Holla, Malika Singla | Initial Version       |
-->

