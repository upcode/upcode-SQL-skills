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


sqlite> SELECT * FROM Brands;
id          name        founded     headquarters  discontinued
----------  ----------  ----------  ------------  ------------
1           Ford        1903        Dearborn, MI
2           Chrysler    1925        Auburn Hills
3           Citroën    1919        Saint-Ouen,
4           Hillman     1907        Ryton-on-Dun  1981
5           Chevrolet   1911        Detroit, Mic
6           Cadillac    1902        New York Cit
7           BMW         1916        Munich, Bava
8           Austin      1905        Longbridge,   1987
9           Fairthorpe  1954        Chalfont St   1976
10          Studebaker  1852        South Bend,   1967
11          Pontiac     1926        Detroit, MI   2010
12          Buick       1903        Detroit, MI
13          Rambler     1901        Kenosha, Was  1969
14          Plymouth    1928        Auburn Hills  2001
15          Tesla       2003        Palo Alto, C




sqlite> SELECT * FROM Models;
id          year        brand_name  name
----------  ----------  ----------  ----------
1           1909        Ford        Model T
2           1926        Chrysler    Imperial
3           1948        Citroën    2CV
4           1950        Hillman     Minx Magni
5           1953        Chevrolet   Corvette
6           1954        Chevrolet   Corvette
7           1954        Cadillac    Fleetwood
8           1955        Chevrolet   Corvette
9           1955        Ford        Thunderbir
10          1956        Chevrolet   Corvette
11          1957        Chevrolet   Corvette
12          1957        BMW         600
13          1958        Chevrolet   Corvette
14          1958        BMW         600
15          1958        Ford        Thunderbir
16          1959        Austin      Mini
17          1959        Chevrolet   Corvette
18          1959        BMW         600
19          1960        Chevrolet   Corvair
20          1960        Chevrolet   Corvette
21          1960        Fillmore    Fillmore
22          1960        Fairthorpe  Rockette
23          1961        Austin      Mini Coope
24          1961        Studebaker  Avanti
25          1961        Pontiac     Tempest
26          1961        Chevrolet   Corvette
27          1962        Pontiac     Grand Prix
28          1962        Chevrolet   Corvette
29          1962        Studebaker  Avanti
30          1962        Buick       Special
31          1963        Austin      Mini
32          1963        Austin      Mini Coope
33          1963        Rambler     Classic
34          1963        Ford        E-Series
35          1963        Studebaker  Avanti
36          1963        Pontiac     Grand Prix
37          1963        Chevrolet   Corvair 50
38          1963        Chevrolet   Corvette
39          1964        Chevrolet   Corvette
40          1964        Ford        Mustang
41          1964        Ford        Galaxie
42          1964        Pontiac     GTO
43          1964        Pontiac     LeMans
44          1964        Pontiac     Bonneville
45          1964        Pontiac     Grand Prix
46          1964        Plymouth    Fury
47          1964        Studebaker  Avanti
48          1964        Austin      Mini Coope