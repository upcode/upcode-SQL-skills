-- Note: Please consult the directions for this assignment
-- for the most explanatory version of each question.
-- 1. Select all columns for all brands in the Brands table.
SELECT * FROM Brands;

OUTPUT:
sqlite> SELECT * FROM Brands;
1|Ford|1903|Dearborn, MI|
2|Chrysler|1925|Auburn Hills, Michigan|
3|Citroën|1919|Saint-Ouen, France|
4|Hillman|1907|Ryton-on-Dunsmore, England|1981
5|Chevrolet|1911|Detroit, Michigan|
6|Cadillac|1902|New York City, NY|
7|BMW|1916|Munich, Bavaria, Germany|
8|Austin|1905|Longbridge, England|1987
9|Fairthorpe|1954|Chalfont St Peter, Buckinghamshire|1976
10|Studebaker|1852|South Bend, Indiana|1967
11|Pontiac|1926|Detroit, MI|2010
12|Buick|1903|Detroit, MI|
13|Rambler|1901|Kenosha, Washington|1969
14|Plymouth|1928|Auburn Hills, Michigan|2001
15|Tesla|2003|Palo Alto, CA|

-- 2. Select all columns for all car models made by Pontiac in the Models table.
SELECT brand_name, name
FROM Models
WHERE brand_name = 'Pontiac';

OUTPUT:
sqlite> SELECT brand_name,name FROM Models WHERE brand_name = 'Pontiac';
Pontiac|Tempest
Pontiac|Grand Prix
Pontiac|Grand Prix
Pontiac|GTO
Pontiac|LeMans
Pontiac|Bonneville
Pontiac|Grand Prix
-- 3. Select the brand name and model
--    name for all models made in 1964 from the Models table.

SELECT brand_name, name, year
FROM Models
WHERE year = 1964;

OUTPUT:
sqlite> SELECT brand_name, name, year
   ...> FROM Models
   ...> WHERE year = 1964;
Chevrolet|Corvette|1964
Ford|Mustang|1964
Ford|Galaxie|1964
Pontiac|GTO|1964
Pontiac|LeMans|1964
Pontiac|Bonneville|1964
Pontiac|Grand Prix|1964
Plymouth|Fury|1964
Studebaker|Avanti|1964
Austin|Mini Cooper|1964

-- 4. Select the model name, brand name, and headquarters for the Ford Mustang
--    from the Models and Brands tables.
SELECT brand_name, Models.name, headquarters
FROM Models
INNER JOIN Brands
ON Models.brand_name = Brands.name
WHERE Models.name = 'Mustang';

sqlite> SELECT brand_name, Models.name, headquarters
   ...> FROM Models
   ...> INNER JOIN Brands
   ...> ON Models.brand_name = Brands.name
   ...> WHERE Models.name = 'Mustang';
brand_name  name        headquarters
----------  ----------  ------------
Ford        Mustang     Dearborn, MI

-- 5. Select all rows for the three oldest brands
--    from the Brands table (Hint: you can use LIMIT and ORDER BY).
SELECT founded, name
FROM Brands
ORDER BY founded DESC
LIMIT 3;

OUTPUT:
sqlite> SELECT founded, name
   ...> FROM Brands
   ...> ORDER BY founded DESC
   ...> LIMIT 3;
2003|Tesla
1954|Fairthorpe
1928|Plymouth


-- 6. Count the Ford models in the database (output should be a number).
-- SELECT COUNT(brand_name)
-- FROM Models;
-- SELECT COUNT(name)
-- FROM Brands;
-- sqlite> SELECT COUNT(brand_name)
--    ...> FROM Models;
-- 48
-- sqlite> SELECT COUNT(name)
--    ...> FROM Brands;
-- 15

SECOND TRY:
SELECT COUNT(brand_name)
FROM Models
WHERE brand_name = 'Ford';

OUTPUT:
sqlite> SELECT COUNT(brand_name)
   ...> FROM Models
   ...> WHERE brand_name = 'Ford';
COUNT(brand_name)
-----------------
6
-- 7. Select the name of any and all car brands that are not discontinued.
-- SELECT Brands.name
-- FROM Brands
-- LEFT JOIN Models
-- ON Brands.name = Models.brand_name
-- WHERE Brands.name <> discountinuded;

-- SELECT brand_name, Models.name, discountinuded
-- FROM Models
-- INNER JOIN Brands
-- ON Models.brand_name = Brands.name
-- WHERE Models.name = 'discountinuded';

-- SELECT name
-- FROM Brands
-- WHERE name <> discontinued;
-- NOT IN (SELECT discontinued FROM Brands);

OUTPUT:
SELECT name
FROM Brands
WHERE name <> Brands.discontinued;

sqlite> SELECT name
   ...> FROM Brands
   ...> WHERE name <> Brands.discontinued;
name
----------
Hillman
Austin
Fairthorpe
Studebaker
Pontiac
Rambler
Plymouth


-- 8. Select rows 15-25 of the DB in alphabetical order by model name.
SELECT id, year, brand_name, name
FROM Models
ORDER BY name ASC
LIMIT 11 OFFSET 14;

OUTPUT:
sqlite> SELECT id, year, brand_name, name
   ...> FROM Models
   ...> ORDER BY name ASC
   ...> LIMIT 11 OFFSET 14;
id          year        brand_name  name
----------  ----------  ----------  ----------
8           1955        Chevrolet   Corvette
10          1956        Chevrolet   Corvette
11          1957        Chevrolet   Corvette
13          1958        Chevrolet   Corvette
17          1959        Chevrolet   Corvette
20          1960        Chevrolet   Corvette
26          1961        Chevrolet   Corvette
28          1962        Chevrolet   Corvette
38          1963        Chevrolet   Corvette
39          1964        Chevrolet   Corvette
34          1963        Ford        E-Series

-- 9. Select the brand, name, and year the model's brand was
--    founded for all of the models from 1960. Include row(s)
--    for model(s) even if its brand is not in the Brands table.
--    (The year the brand was founded should be NULL if
--    the brand is not in the Brands table.)

-- SELECT Models.year, Models.brand_name, Models.name
-- FROM Models
-- LEFT JOIN Brands
-- ON Models.year = Brands.founded
-- WHERE Brands.name <> founded is null
-- AND (year = 1960 or Brands.name <> founded is null);


SELECT Brands.name, Models.name, brand_name, year, founded
FROM Models
LEFT JOIN Brands
ON Brands.name = Models.brand_name
WHERE Models.year = 1960;

OUTPUT:

sqlite> SELECT Brands.name, Models.name, brand_name, year, founded
   ...> FROM Models
   ...> LEFT JOIN Brands
   ...> ON Brands.name = Models.brand_name
   ...> WHERE Models.year = 1960;
name        name        brand_name  year        founded
----------  ----------  ----------  ----------  ----------
Chevrolet   Corvair     Chevrolet   1960        1911
Chevrolet   Corvette    Chevrolet   1960        1911
            Fillmore    Fillmore    1960
Fairthorpe  Rockette    Fairthorpe  1960        1954

-- Part 2: Change the following queries according to the specifications.
-- Include the answers to the follow up questions in a comment below your
-- query.

-- 1. Modify this query so it shows all brands that are not discontinued
-- regardless of whether they have any models in the models table.
-- before:
    SELECT Brands.name,
           Brands.founded,
           Models.name
    FROM Brands
      LEFT JOIN Models
        ON Brands.name = Models.brand_name
    WHERE Brands.discontinued IS NULL;

OUTPUT:
    sqlite>     SELECT Brands.name,
   ...>            Brands.founded,
   ...>            Models.name
   ...>     FROM Brands
   ...>       LEFT JOIN Models
   ...>         ON Brands.name = Models.brand_name
   ...>     WHERE Brands.discontinued IS NULL;
name        founded     name
----------  ----------  ----------
Ford        1903        E-Series
Ford        1903        Galaxie
Ford        1903        Model T
Ford        1903        Mustang
Ford        1903        Thunderbir
Ford        1903        Thunderbir
Chrysler    1925        Imperial
Citroën    1919        2CV
Chevrolet   1911        Corvair
Chevrolet   1911        Corvair 50
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Chevrolet   1911        Corvette
Cadillac    1902        Fleetwood
BMW         1916        600
BMW         1916        600
BMW         1916        600
Buick       1903        Special
Tesla       2003

-- 2. Modify this left join so it only selects models that have brands in the Brands table.
-- before:
    SELECT Models.name,
           Models.brand_name,
           Brands.founded,
           Brands.name
    FROM Brands
      LEFT JOIN Models
        ON Brands.name = Models.brand_name;

    sqlite>     SELECT Models.name,
   ...>            Models.brand_name,
   ...>            Brands.founded,
   ...>            Brands.name
   ...>     FROM Brands
   ...>       LEFT JOIN Models
   ...>         ON Brands.name = Models.brand_name;
name        brand_name  founded     name
----------  ----------  ----------  ----------
E-Series    Ford        1903        Ford
Galaxie     Ford        1903        Ford
Model T     Ford        1903        Ford
Mustang     Ford        1903        Ford
Thunderbir  Ford        1903        Ford
Thunderbir  Ford        1903        Ford
Imperial    Chrysler    1925        Chrysler
2CV         Citroën    1919        Citroën
Minx Magni  Hillman     1907        Hillman
Corvair     Chevrolet   1911        Chevrolet
Corvair 50  Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Corvette    Chevrolet   1911        Chevrolet
Fleetwood   Cadillac    1902        Cadillac
600         BMW         1916        BMW
600         BMW         1916        BMW
600         BMW         1916        BMW
Mini        Austin      1905        Austin
Mini        Austin      1905        Austin
Mini Coope  Austin      1905        Austin
Mini Coope  Austin      1905        Austin
Mini Coope  Austin      1905        Austin
Rockette    Fairthorpe  1954        Fairthorpe
Avanti      Studebaker  1852        Studebaker
Avanti      Studebaker  1852        Studebaker
Avanti      Studebaker  1852        Studebaker
Avanti      Studebaker  1852        Studebaker
Bonneville  Pontiac     1926        Pontiac
GTO         Pontiac     1926        Pontiac
Grand Prix  Pontiac     1926        Pontiac
Grand Prix  Pontiac     1926        Pontiac
Grand Prix  Pontiac     1926        Pontiac
LeMans      Pontiac     1926        Pontiac
Tempest     Pontiac     1926        Pontiac
Special     Buick       1903        Buick
Classic     Rambler     1901        Rambler
Fury        Plymouth    1928        Plymouth
                        2003        Tesla

-- followup question: In your own words, describe the difference between
-- left joins and inner joins.
# an inner join is all the contents of table 1 and tabl2 that have items in common
# left join all contents from table one that excludes items that are in common in table 2

-- 3. Modify the query so that it only selects brands that don't have any models in the models table.
-- (Hint: it should only show Tesla's row.)
-- before:
    -- SELECT founded,
    --     Models.brand_name,
    --     Models.name,
    --     Brands.name,
    -- FROM Brands
    --   LEFT JOIN Models
    --     ON brands.name = Models.brand_name
    -- WHERE founded > 1940;

    SELECT founded,
    Brands.name,
    Models.brand_name
    FROM Brands
    LEFT JOIN Models
    ON Brands.name = Models.brand_name
    WHERE founded > 1954;

    sqlite>  SELECT founded,
   ...>     Brands.name,
   ...>     Models.brand_name
   ...>     FROM Brands
   ...>     LEFT JOIN Models
   ...>     ON Brands.name = Models.brand_name
   ...>     WHERE founded > 1954;
founded     name        brand_name
----------  ----------  ----------
2003        Tesla

-- 4. Modify the query to add another column to the results to show
-- the number of years from the year of the model until the brand becomes discontinued
-- Display this column with the name years_until_brand_discontinued.
-- before:
    SELECT
        Models.name,
        Models.year,
        Models.brand_name,
        Brands.name,
        Brands.discontinued AS discontinued
    FROM Models
      LEFT JOIN Brands
        ON Models.brand_name = Brands.name
    WHERE founded = Brands.discontinued NOT NULL;


    sqlite>     SELECT
   ...>         Models.name,
   ...>         Models.year,
   ...>         Models.brand_name,
   ...>         Brands.name,
   ...>         Brands.discontinued AS discontinued
   ...>     FROM Models
   ...>       LEFT JOIN Brands
   ...>         ON Models.brand_name = Brands.name
   ...>     WHERE founded = Brands.discontinued NOT NULL;
name              year        brand_name  name        discontinued
----------------  ----------  ----------  ----------  ------------
Minx Magnificent  1950        Hillman     Hillman     1981
Mini              1959        Austin      Austin      1987
Rockette          1960        Fairthorpe  Fairthorpe  1976
Mini Cooper       1961        Austin      Austin      1987
Avanti            1961        Studebaker  Studebaker  1967
Tempest           1961        Pontiac     Pontiac     2010
Grand Prix        1962        Pontiac     Pontiac     2010
Avanti            1962        Studebaker  Studebaker  1967
Mini              1963        Austin      Austin      1987
Mini Cooper S     1963        Austin      Austin      1987
Classic           1963        Rambler     Rambler     1969
Avanti            1963        Studebaker  Studebaker  1967
Grand Prix        1963        Pontiac     Pontiac     2010
GTO               1964        Pontiac     Pontiac     2010
LeMans            1964        Pontiac     Pontiac     2010
Bonneville        1964        Pontiac     Pontiac     2010
Grand Prix        1964        Pontiac     Pontiac     2010
Fury              1964        Plymouth    Plymouth    2001
Avanti            1964        Studebaker  Studebaker  1967
Mini Cooper       1964        Austin      Austin      1987




-- Part 3: Further Study

-- 1. Select the name of any brand with more than 5 models in the database.

-- 2. Add the following rows to the Models table.

-- year    name       brand_name
-- ----    ----       ----------
-- 2015    Chevrolet  Malibu
-- 2015    Subaru     Outback

-- 3. Write a SQL statement to crate a table called `Awards`
--    with columns `name`, `year`, and `winner`. Choose
--    an appropriate datatype and nullability for each column
--   (no need to do subqueries here).

-- 4. Write a SQL statement that adds the following rows to the Awards table:

--   name                 year      winner_model_id
--   ----                 ----      ---------------
--   IIHS Safety Award    2015      the id for the 2015 Chevrolet Malibu
--   IIHS Safety Award    2015      the id for the 2015 Subaru Outback

-- 5. Using a subquery, select only the *name* of any model whose
-- year is the same year that *any* brand was founded.





