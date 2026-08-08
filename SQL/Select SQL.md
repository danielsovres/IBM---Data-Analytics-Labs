::page{title="Hands-on Lab: Simple SELECT Statements"}

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/SN_web_lightmode.png" width="300"><br/>


**Estimated time needed:** 20 minutes

In this lab, you will learn one of the most commonly used statements of SQL (Structured Query Language), the SELECT statement. The SELECT statement is used to select data from a database.

## Objectives

After completing this lab, you will be able to:

- Query a database to obtain a response as a result set
- Retrieve all or selected columns of a dataset
- Apply criteria commands to filter the result set

## Software Used in this Lab

In this lab, you will use Datasette, an open source-tool for exploring and publishing data. You can visit the <a href="https://github.com/simonw/datasette" target="_blank">Datasette GitHub repository here</a>.

#### Working with Datasette
The **Datasette** tool offers a platform to input and execute SQL queries. By clicking the **Submit query** button, you can execute the SQL query.

![](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/images/datasette.png)


## Database Used in this Lab

The database used in this lab comes from the following dataset source: <a href="https://data.sfgov.org/Culture-and-Recreation/Film-Locations-in-San-Francisco/yitu-d5am" target="_blank">Film Locations in San Francisco</a> under a <a href="https://opendatacommons.org/licenses/pddl/1-0/" target="_blank">PDDL: Public Domain Dedication and License</a>.

::page{title="Exploring the Database"}

Let\'s first explore the **SanFranciscoFilmLocations** database using the **Datasette** tool:

1. If the first statement listed below is not already in the Datasette textbox on the right, then copy the code below by clicking on the little copy button on the bottom right of the code block below and then paste it into the textbox of the Datasette tool using either **Ctrl+V** or right-click in the text box and choose **Paste**.

```
SELECT * FROM FilmLocations;
```

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/A.1.png" width="520" height="180">

2. Click **Submit Query**.
3. Now, you can scroll down the table and explore all the columns and rows of the **FilmLocations** table to get an overall idea of the table contents.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/A.2.png" width="520" height="400">

4. These are the column attribute descriptions from the **FilmLocations** table:
```
FilmLocations(
Title:              titles of the films, 
ReleaseYear:        time of public release of the films, 
Locations:          locations of San Francisco where the films were shot, 
FunFacts:           funny facts about the filming locations, 
ProductionCompany:  companies who produced the films, 
Distributor:        companies who distributed the films, 
Director:           people who directed the films, 
Writer:             people who wrote the films, 
Actor1:             person 1 who acted in the films, 
Actor2:             person 2 who acted in the films, 
Actor3:             person 3 who acted in the films
)
```

::page{title="Using SELECT statement"}

Now, let\'s go through some examples of SELECT queries.

1. Suppose we want to retrieve details of all the films from the **FilmLocations** table. The details of each film record should contain all the columns. The query statement for this is:

```
SELECT * FROM FilmLocations;
```

Copy the solution code above and paste it to the textbox of the Datasette tool. Then click **Submit query**.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/B.1.3.png" width="520" height="180">

Your output resultset should match like the image below:

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/B.1.4.png" width="520" height="400">

2. We want to retrieve the film names and director and writer names. The query now would be:

```
SELECT Title, Director, Writer FROM FilmLocations;
```

Copy the solution code above and paste it to the textbox of the Datasette tool. Then click **Submit query**.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/B.2.3.png" width="520" height="180">

Your output resultset should match the image below:

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/B.2.4.png" width="520" height="400">


3. We want to retrieve film names along with filming locations and release years. But we also want to restrict the output resultset to retrieve only the film records released in 2001 and onwards (release years after 2001, including 2001).

```
SELECT Title, ReleaseYear, Locations FROM FilmLocations WHERE ReleaseYear>=2001;
```

Copy the solution code above and paste it to the textbox of the Datasette tool. Then click **Submit query**.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/B.3.3.png" width="520" height="180">

Your output resultset should match the image below:

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/B.3.4.png" width="520" height="400">

::page{title="Practice exercises on the SELECT statement"}

1. Retrieve the fun facts and filming locations of all films.

<details>
<summary>Click here for a hint</summary>

Follow example 2 of SELECT, where records containing details of some particular columns have been retrieved.
</details>

<details>
<summary>Click here for the solution</summary>

```
SELECT Locations, FunFacts FROM FilmLocations;
```
</details>

<details>
<summary>Click here for the output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/C.1.O.png">

</details>

2. Retrieve the names of all films released in the 20th century and before (release years before 2000 including 2000), along with filming locations and release years.

<details>
<summary>Click here for a hint</summary>

Follow example 3 of SELECT, where we restricted the output resultset to retrieve only the film records with certain release years. Use WHERE clause comparison operator `<=`, which means **Less than or equal to**.

</details>

<details>
<summary>Click here for the solution</summary>

```
SELECT Title, ReleaseYear, Locations FROM FilmLocations WHERE ReleaseYear<=2000;
```
</details>

<details>
<summary>Click here for the output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/C.4.O.png">
</details>

3. Retrieve the names, production company names, filming locations, and release years of the films not written by James Cameron.

<details>
<summary>Click here for a hint</summary>

Use WHERE clause comparison operator `<>`, which means **Not equal to**.
</details>

<details>
<summary>Click here for the solution</summary>

```
SELECT Title, ProductionCompany, Locations, ReleaseYear FROM FilmLocations WHERE Writer<>"James Cameron";
```
</details>

<details>
<summary>Click here for the output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Basics%20of%20SQL%20SELECT%20Statement/images/C.3.O.png">

</details>

::page{title="Conclusion"}

Congratulations on completing this lab!

You are now able to:

- Query a database using SELECT statements
- Retrieve all or selected columns of data
- Filter the query response to meet a defined criteria


### Author(s)

<a href="https://www.linkedin.com/in/sandipsahajoy/" target="_blank">Sandip Saha Joy</a>

### Other Contributor(s)

<a href="https://www.linkedin.com/in/abhishek-gagneja-23051987/" target="_blank">Abhishek Gagneja</a>

<h3 align="center"> &copy; IBM Corporation 2023. All rights reserved. <h3/>

<!--
### Changelog
| Date | Version | Changed by | Change Description |
|------|--------|--------|---------|
| 2023-10-12|1.9| Mercedes Schneider | QA Pass w/Edits |
| 2023-10-11|1.8| Misty Taylor | ID Check|
| 2023-10-01|1.7| Abhishek Gagneja | Updated Lab instructions|
|2023-07-11| 1.6 | Lakshmi Holla | Updated labs |
|2023-06-02| 1.5 | Eric Hao | Fixed Page Styles |
|2023-05-10| 1.4 | Eric Hao & Vladislav Boyko | Updated Page Frames |
| 2023-05-04 | 1.3 | Benny Li | Republished|
| 2022-07-27 | 1.2 | Lakshmi Holla | Updated html tag|
| 2020-11-23 | 1.1 | Steve Ryan | ID Review|
| 2020-11-20 | 1.0 | Sandip Saha Joy | Initial version created|
-->

