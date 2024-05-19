# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^AEIOU]' 
AND CITY REGEXP '[^AEIOU]$';

# Query a count of the number of cities in CITY having a Population larger than 100000 .

SELECT COUNT(*)
FROM CITY
WHERE Population > 100000;

# Query the total population of all cities in CITY where District is California.

SELECT SUM(Population) AS TotalPopulation
FROM CITY
WHERE District = 'California';


# Query the average population of all cities in CITY where District is California.

SELECT AVG(Population) AS AveragePopulation
FROM CITY
WHERE District = 'California';


# Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT FLOOR(AVG(Population)) AS AveragePopulation
FROM CITY;


# Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(Population) AS TotalPopulation
FROM CITY
WHERE COUNTRYCODE = 'JPN';


# Query the difference between the maximum and minimum populations in CITY.

SELECT MAX(Population) - MIN(Population) AS PopulationDifference
FROM CITY;


# Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

# Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.


WITH SalariesWithZerosRemoved AS (
    SELECT
        CAST(REPLACE(CAST(Salary AS CHAR), '0', '') AS DECIMAL) AS ModifiedSalary
    FROM EMPLOYEES
),
ActualAverage AS (
    SELECT AVG(Salary) AS AvgActualSalary
    FROM EMPLOYEES
),
ModifiedAverage AS (
    SELECT AVG(ModifiedSalary) AS AvgModifiedSalary
    FROM SalariesWithZerosRemoved
)
SELECT CEIL(ABS(ActualAverage.AvgActualSalary - ModifiedAverage.AvgModifiedSalary)) AS ErrorAmount
FROM ActualAverage, ModifiedAverage;


# We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees 
as well as the total number of employees who have maximum total earnings. Then print these values as 2  space-separated integers.


select months*salary, count(*) from employee
group by months*salary
order by months*salary desc
limit 1;


# Query the following two values from the STATION table:
# The sum of all values in LAT_N rounded to a scale of  2 decimal places.
# The sum of all values in LONG_W rounded to a scale of 2 decimal places.

SELECT ROUND(SUM(LAT_N), 2) AS SumLat_N_Rounded,
       ROUND(SUM(LONG_W), 2) AS SumLong_W_Rounded
FROM STATION;


# Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880  and less than 137.2345. Truncate your answer to  4 decimal places.


SELECT TRUNCATE(SUM(LAT_N), 4) AS SumNorthernLatitudes
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;







