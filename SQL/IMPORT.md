::page{title=" Hands-on Lab: Create and Load Tables using SQL Scripts"}

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/images/SN_web_lightmode.png" width="300" alt="cognitiveclass.ai logo">
</p>

**Estimated time needed:** 20 minutes

In this lab, you will learn how to create tables and load data using the phpMyAdmin graphical user interface (GUI) tool in the MySQL database service.

### Objectives

After completing this lab, you will be able to use phpMyAdmin with MySQL to:

*   Create a database on MySQL
*   Create tables using SQL scripts
*   Load data into tables directly from CSV files

### MySQL 

In this lab, you will use <a href="https://www.mysql.com/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDB0110ENSkillsNetwork24601058-2021-01-01">MySQL</a>. MySQL is a Relational Database Management System (RDBMS) designed to efficiently store, manipulate, and retrieve data.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-GPXX031EN/mysql.png" width="100" height="100" alt="MySQL logo.">
<p></p>

To complete this lab, you will use MySQL relational database service available as part of IBM Skills Network Labs (SN Labs) Cloud IDE, the virtual lab environment used in this course.

::page{title="Database Used in this Lab"}

The database used in this lab is internal. You will be working on a sample Cardio-Vascular Diseases (CVD) database. This CVD database schema consists of five tables: `PATIENTS`, `MEDICAL_HISTORY`, `MEDICAL_PROCEDURES`, `MEDICAL_DEPARTMENTS`, and `MEDICAL_LOCATIONS`.

Each table has a few rows of sample data. The following diagram shows the contents of the CVD database:

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-GPXX031EN/Screenshot%201.png" alt="Simple CVD Database tables.">
 

------------


Your task is to create this database in MySQL. This task is divided into three parts.

Task 1: Create the database on MySQL using the phpMyAdmin GUI.

Task 2: Create all the tables in MySQL using an SQL script.

Task 3: Populate each table with the data in respective CSV files.

::page{title="Task 1 : Create the database"}

Follow the instructions shared below to create the database `CVD` in MySQL.

## Launch phpMyAdmin

1.  Click on **Skills Network Toolbox**. In the **Database** section, click **MySQL**.

    To start the MySQL, click **Create**.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/QW5QxD1zJGONPlavurQVdg/My-SQL-Start-1.png)

2.  Once **MySQL** has started, click the **phpMyAdmin button** to open **phpMyAdmin** in the same window. Alternatively, click the **toggle button** next to the phpMyAdmin button to open phpMyAdmin in a new browser tab.

![image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/6TNgJ-wrZFAduL6G3j1hVg/My-SQL-Start-2.png)

3.  You will see the phpMyAdmin GUI tool.

    ![phpMyAdmin GIT tool screen.](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-GPXX031EN/Screenshot%204.png)

4.  In the tree view, click **New** to create a new empty database. Then, enter **CVD** as the name of the database and click **Create**.

    Leave the default **utf8** encoding. UTF-8 is the most commonly used character encoding for content or data.

    ![New database, named CVD.](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-GPXX031EN/Screenshot%205.png)

::page{title="Task 2 : Create tables using SQL script"}

In this exercise, you will learn how to execute a script containing the CREATE TABLE commands for all the tables rather than create each table manually by typing the DDL commands in the SQL editor.

> Note: SQL scripts are basically a set of SQL commands compiled in a single file. Each command must be terminated with a semicolon `;`. The extension of the file is to be kept as `.sql`. Upon importing this file in the phpMyAdmin interface, the commands in the file are run sequentially.

Follow the steps shared below.

* Download the script file to your local machine:

  [CVD_Database_Create_Tables_Script.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/a6tVOpmvznnyz7IrrINc6Q/CVD-Database-Create-Tables-Script.sql)

* Select the CVD database. Then click the **Import** tab.

* Click **Choose File**, browse for the file and upload it.

* Once uploaded, scroll down and click **Go**.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-GPXX031EN/Screenshot%206.png" alt="phpMyAdmin Import screen with CVD and Choose file highlighted and Go button."><br>

* The script then gets executed successfully, and the interface shows entries in the image below.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-GPXX031EN/Screenshot%207.png" alt="phpMyAdmin Import screen show executed script with database properties."><br>

 * Click any of the tables to see its Table Definition (its list of columns, data types, and so on). The image below displays the structure of the table PATIENTS.

 <img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-GPXX031EN/Screenshot%208.png" alt="The details for the PATIENTS table in phpMyAdmin screen.">

::page{title="Task 3 : Load data into tables"}

You now need to load the data to the tables. You could manually insert each row into the table one by one, but that is highly inefficient. Instead, MySQL (and almost every other database) lets you load data from CSV files directly to the tables.

The steps below explain loading data into the tables you created in Task 2.

1.  Download the 5 CSV files below to your local machine.

    *   [Patients.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/pVsjsvE6Yp0FZqUem_sRHQ/PATIENTS.csv)
    *   [MedicalHistory.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/QZV5RNxKu1NzwpWR2NNzEQ/MEDICAL-HISTORY.csv)
    *   [MedicalProcedures.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/jvcmetCeMWqHHgl5Er6uGQ/MEDICAL-PROCEDURES.csv)
    *   [MedicalDepartments.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/Y_Mr0fmk9VivtEYfTk4GgA/MEDICAL-DEPARTMENTS.csv)
    *   [MedicalLocations.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/_3-OnABaAq8eE6huBqmKAQ/MEDICAL-LOCATIONS.csv)

The steps to load a CSV to a table are as follows.

* Select the table.

* Click the Import tab.

* Browse to the location of the CSV file and click 'Go' to load the CSV file.

The images below share how to load the CSV data to the `PATIENTS` table.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-GPXX031EN/Screenshot%209.png" alt="Importing into the table PARTIENTS.">

Once the table is loaded, you will get a message that the records are inserted successfully.

Further, you can click on browse and view the table\'s data.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-GPXX031EN/Screenshot%2011.png" alt="PATIENTS table data with Browse button highlighted.">

### Practice exercise

Repeat the same process for all of the other tables.

::page{title="Conclusion"}

Congratulations on completing this lab.

In this lab, you learned how to :
* Use phpMyAdmin GUI to operate on MySQL servers

* Create a new database in phpMyAdmin.

* Create the tables for the dataset using SQL scripts

* Load data from a CSV file directly to a table in MySQL.

## Author(s)

<a href="https://author.skills.network/instructors/dmytro_yesyp" target="_blank">Dmytro Yesyp</a>

## Additional Contributor(s)

[Abhishek Gagneja](https://www.coursera.org/instructor/~129186572 "Abhishek Gagneja")
<br>

## <h3 align="center"> © IBM Corporation 2023. All rights reserved. <h3/> 

<!--  ## Changelog
| Date | Version | Changed by | Change Description |
|------|--------|--------|---------|
|2023-10-09| 1.3 | Steve Hord | QA pass with edits |
|2023-10-06| 1.2 | Misty Taylor | ID Check |
|2023-09-09| 1.1 | Abhishek Gagneja | Modified the instructions |
|2023-08-02| 1.0 | Dmytro Yesyp | Initial version created | --!>
