::page{title="Hands-on Lab: COUNT, DISTINCT, LIMIT"}

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/images/IBM_logo.png" width="300" alt="cognitiveai.class logo"> <br>
**Estimated time needed:** 30 minutes

In this lab, you will learn a few useful expressions that are used with SELECT statements. First, you will learn COUNT, which is an aggregate function that retrieves the number of rows that matches the query criteria. Next, you will learn DISTINCT, which is used to remove duplicate values from a specified result set and only return the unique values. Lastly, you will learn LIMIT, which is used for restricting the number of rows retrieved from the table.

### Software used in this lab

In this lab, you will use <a href="https://github.com/simonw/datasette" target="_blank">Datasette</a>, an open-source multi-tool for exploring and publishing data.

### Database used in this lab

The database used in this lab comes from the following data set source: <a href="https://data.sfgov.org/Culture-and-Recreation/Film-Locations-in-San-Francisco/yitu-d5am" target="_blank">Film Locations in San Francisco</a> under a <a href="https://opendatacommons.org/licenses/pddl/1-0/" target="_blank">PDDL: Public Domain Dedication and License</a>.

### Objectives

After completing this lab, you will be able to:

- Retrieve the number of rows that match a query criteria
- Remove duplicate values from a result set and return the unique values
- Restrict the number of rows retrieved from a table

<br>

::page{title="Exploring the Database"}

Let us first explore the **SanFranciscoFilmLocations** database using the **Datasette** tool:

1. If the first statement listed below is not already in the Datasette textbox on the right, then copy the code below by clicking the little copy button on the bottom right of the code block and then paste it into the textbox of the Datasette tool using either **Ctrl+V** or right-click in the text box and choose **Paste**.

```
SELECT * FROM FilmLocations;
```
<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/ExploringDB.1.png" width="520" height="180" alt="Datasette tool.">


2. Click **Submit Query**.

3. Now, you can scroll down the table and explore all the columns and rows of the **FilmLocations** table to get an overall idea of the table.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/ExploringDB.2.png" width="520" height="400" alt="FilmLocations table with headers, columns, and rows."> <br>

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

::page{title="Using COUNT statement"}

Let us go through some examples of COUNT-related queries.

1. Suppose we want to count the number of records or rows of the &#34;FilmLocations&#34; table. The query for this would be:

```
SELECT COUNT(*) FROM FilmLocations;
```
Copy the code above and paste it to the query box of the Datasette tool. Then click **Submit query**.
Your output result set should look like the image below:

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/1.A.1.4.png" width="520" height="400" alt="Datasette tool output results."> <br>

2. We want to count the number of locations of the films. But we also want to restrict the output result set so that we only retrieve the number of locations of the films written by a certain writer. The query for this can be written as:

```
SELECT COUNT(Locations) FROM FilmLocations WHERE Writer="James Cameron";
```

Copy the code above and paste it to the textbox of the Datasette tool. Then click **Submit query**.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/1.A.2.4.png" width="520" height="400" alt="Datasette tool with latest sort results.">

::page{title="Using DISTINCT statement"}

In this exercise, you will go through some examples of using DISTINCT in queries.

1. Assume that we want to retrieve the titles of all films in the table so that duplicates will be discarded in the output result set.
```
SELECT DISTINCT Title FROM FilmLocations;
```

Copy the code above and paste it to the textbox of the Datasette tool. Then click **Submit query**.

Your output resultset should look like the image below:

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/2.A.1.4.png" width="520" height="400" alt="Datasette tool with latest query results."> <br>

2. We want to retrieve the count of release years of the films produced by a specific company so that duplicate release years of those films will be discarded in the count.

```
SELECT COUNT(DISTINCT ReleaseYear) FROM FilmLocations WHERE ProductionCompany="Warner Bros. Pictures";
```

Copy the code above and paste it to the textbox of the Datasette tool. Then click **Submit query**.

Your output resultset should look like the image below:

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/2.A.2.4.png" width="520" height="400" alt="Datasette tool with latest query results.">

::page{title="Using LIMIT statement"}

In this exercise, you will first go through some examples of using LIMIT in queries.

1. Retrieve only the first 25 rows from the table so that rows other than those are not in the output result set.

```
SELECT * FROM FilmLocations LIMIT 25;
```
Copy the code above and paste it to the textbox of the Datasette tool. Then click **Submit query**.

Your output resultset should look like the image below:

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/3.A.1.4.png" width="520" height="400" alt="Datasette tool with latest query resultset."> <br>

2. Now, we want to retrieve 15 rows from the table starting from row 11.
```
SELECT * FROM FilmLocations LIMIT 15 OFFSET 10;
```

Copy the code above and paste it to the textbox of the Datasette tool. Then click **Submit query**.

Your output resultset should look like the image below:
<br><img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/3.A.2.4.png" width="520" height="400" alt="Datasette tool with latest query resultset.">

::page{title="Practice exercises"}

## COUNT

1. Retrieve the number of locations of the films which are directed by Woody Allen.

<details>
<summary>Hint</summary>

Follow example 2 of the COUNT exercise. Use the WHERE clause comparison operator `=`, which means **Equal to**.
	
</details>

<details>
<summary>Query Solution</summary>

```
SELECT COUNT(Locations) FROM FilmLocations WHERE Director="Woody Allen";
```
</details>

<details>
<summary>Output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/1.B.1.O.png" width="520" height="400" alt="Datasette tool with latest query resultset.">
</details>

2. Retrieve the number of films shot at Russian Hill.

<details>
<summary>Hint</summary>

Follow example 2 of the COUNT exercise. Use the WHERE clause comparison operator `=`, which means **Equal to**.

</details>

<details>
<summary>Query Solution</summary>

```
SELECT Count(Title) FROM FilmLocations WHERE Locations="Russian Hill";
```
</details>

<details>
<summary>Output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/1.B.2.O.png" width="520" height="400" alt="Datasette tool with latest query resultset.">

</details>

3. Retrieve the number of rows having a release year older than 1950 from the &#34;FilmLocations&#34; table.

<details>
<summary>Hint</summary>

Follow example 1 of the COUNT exercise. Use the WHERE clause comparison operator `<`, which means **Less than.**

</details>

<details>
<summary>Query Solution</summary>

```
SELECT Count(*) FROM FilmLocations WHERE ReleaseYear<1950;
```
</details>

<details>
<summary>Output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/1.B.3.O.png" width="520" height="400" alt="Datasette tool with latest query resultset.">

</details>

::page{title="Practice exercises"}

## DISTINCT

1. Retrieve the names of all unique films released in the 21st century and onwards, along with their release years.

<details>
<summary>Hint</summary>

Follow example 1 of DISTINCT. Use WHERE clause comparison operator `>=`, which means **Greater than or equal to.**

</details>

<details>
<summary>Query Solution</summary>

```
SELECT DISTINCT Title, ReleaseYear FROM FilmLocations WHERE ReleaseYear>=2001;
```

</details>

<details>
<summary>Output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/2.B.1.O.png" width="520" height="400" alt="Datasette tool with latest query resultset.">

</details>

2. Retrieve the directors&#39; names and their distinct films shot at City Hall.

<details>
<summary>Hint</summary>

Follow example 1 of DISTINCT. Use WHERE clause comparison operator `=`, which means **Equal to.**

</details>

<details>
<summary>Query Solution</summary>

```
SELECT DISTINCT Title, Director FROM FilmLocations WHERE Locations="City Hall";
```
</details>

<details>
<summary>Output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/2.B.2.O.png" width="520" height="400" alt="Datasette tool with latest query resultset.">

</details>

3. Retrieve the number of distributors who distributed films with the 1st actor, Clint Eastwood.

<details>
<summary>Hint</summary>

Follow example 2 of DISTINCT. Use the WHERE clause comparison operator `=`, which means **Equal to.**

</details>

<details>
<summary>Query Solution</summary>
```
SELECT COUNT(DISTINCT Distributor) FROM FilmLocations WHERE Actor1="Clint Eastwood";
```
</details>

<details>
<summary>Output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/2.B.3.O.png" width="520" height="400" alt="Datasette tool with latest query resultset.">

</details>

::page{title="Practice exercises"}

## LIMIT

1. Retrieve the names of the first 50 films.

<details>
<summary>Hint</summary>

Follow example 1 of LIMIT. Use DISTINCT.
</details>

<details>
<summary>Query Solution</summary>
```
SELECT DISTINCT Title FROM FilmLocations LIMIT 50;
```
</details>
    
<details>
<summary>Output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/3.B.1.O.png" width="520" height="400" alt="Datasette tool with latest query resultset.">

</details>

2. Retrieve the first 10 film names released in 2015.

<details>
<summary>Hint</summary>

Follow example 1 of LIMIT. Use DISTINCT. Use WHERE clause comparison operator `=`, which means **Equal to.**

</details>

<details>
<summary>Query Solution</summary>
```
SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear=2015 LIMIT 10;
```
</details>
    
<details>
<summary>Output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/3.B.2.O.png" width="520" height="400" alt="Datasette tool with latest query resultset.">

</details>

3. Retrieve the next 3 film names that follow after the first 5 films released in 2015.

<details>
<summary>Hint</summary>

Follow example 2 of the LIMIT exercise to learn how to use OFFSET. Use DISTINCT and use the WHERE clause comparison operator `=`, which means **Equal to.**

</details>

<details>
<summary>Query Solution</summary>

```
SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear=2015 LIMIT 3 OFFSET 5;
```

</details>
    
<details>
<summary>Output</summary>

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20COUNT%20-%20DISTINCT%20-%20LIMIT/images/3.B.3.O.png" width="520" height="400" alt="Datasette tool with latest query resultset.">

</details>

::page{title="Conclusion"}

Congratulations! You have completed this lab.

You are now able to:
* Use COUNT statements to determine the number of entries in a database based on filtering conditions.
* Use DISTINCT statements to determine the unique entries in a database based on filtering conditions.
* Use LIMIT statements to restrict the response to a desired set of rows based on filtering conditions.
* Use a combination of these statements to execute more complex queries on the database.

### Author(s)

<a href="https://www.linkedin.com/in/sandipsahajoy/" target="_blank">Sandip Saha Joy</a>


### Other Contributor(s)

<a href="https://www.coursera.org/instructor/~129186572" target="_blank">Abhishek Gagneja</a>

## <h3 align="center"> © IBM Corporation 2023. All rights reserved. <h3/>
	
<!--	
### Changelog
| Date | Version | Changed by | Change Description |
|------|--------|--------|---------|
| 2023-10-11| 1.8| Steve Hord | QA pass with edits |
| 2023-10-01| 1.7| Abhishek Gagneja| Updated instruction set|
|2023-05-11| 1.6 | Eric Hao & Vladislav Boyko | Updated Page Frames |
|2023-05-10| 1.5 | Eric Hao & Vladislav Boyko | Updated Page Frames |
|2023-05-10| 1.4 | Eric Hao & Vladislav Boyko | Updated Page Frames |
| 2023-05-05 | 1.3 | Benny Li | Reformatted and republished|
| 2022-07-27 | 1.2 | Lakshmi Holla | Updated html tag|
| 2020-12-23 | 1.1 | Steve Ryan | ID Review|
| 2020-11-24 | 1.0 | Sandip Saha Joy | Initial version created|
-->

