-- Note: Please consult the directions for this assignment
-- for the most explanatory version of each question.

CREATE TABLE Models (
    id INTEGER PRIMARY KEY,
    year INT(4) NOT NULL,
    brand_name VARCHAR(50) NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Brands (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    founded INT(4),
    headquarters VARCHAR(50),
    discontinued INT(4)
);


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

-- 5. Select all rows for the three oldest brands
--    from the Brands table (Hint: you can use LIMIT and ORDER BY).

-- 6. Count the Ford models in the database (output should be a number).

-- 7. Select the name of any and all car brands that are not discontinued.

-- 8. Select rows 15-25 of the DB in alphabetical order by model name.

-- 9. Select the brand, name, and year the model's brand was
--    founded for all of the models from 1960. Include row(s)
--    for model(s) even if its brand is not in the Brands table.
--    (The year the brand was founded should be NULL if
--    the brand is not in the Brands table.)



-- Part 2: Change the following queries according to the specifications.
-- Include the answers to the follow up questions in a comment below your
-- query.

-- 1. Modify this query so it shows all brands that are not discontinued
-- regardless of whether they have any models in the models table.
-- before:
    -- SELECT b.name,
    --        b.founded,
    --        m.name
    -- FROM Model AS m
    --   LEFT JOIN brands AS b
    --     ON b.name = m.brand_name
    -- WHERE b.discontinued IS NULL;

-- 2. Modify this left join so it only selects models that have brands in the Brands table.
-- before:
    -- SELECT m.name,
    --        m.brand_name,
    --        b.founded
    -- FROM Models AS m
    --   LEFT JOIN Brands AS b
    --     ON b.name = m.brand_name;

-- followup question: In your own words, describe the difference between
-- left joins and inner joins.

-- 3. Modify the query so that it only selects brands that don't have any models in the models table.
-- (Hint: it should only show Tesla's row.)
-- before:
    -- SELECT name,
    --        founded
    -- FROM Brands
    --   LEFT JOIN Models
    --     ON brands.name = Models.brand_name
    -- WHERE Models.year > 1940;

-- 4. Modify the query to add another column to the results to show
-- the number of years from the year of the model until the brand becomes discontinued
-- Display this column with the name years_until_brand_discontinued.
-- before:
    -- SELECT b.name,
    --        m.name,
    --        m.year,
    --        b.discontinued
    -- FROM Models AS m
    --   LEFT JOIN brands AS b
    --     ON m.brand_name = b.name
    -- WHERE b.discontinued NOT NULL;




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





