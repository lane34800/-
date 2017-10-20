# Stuctured Query Language, Pt. 1

## Learning Objectives:
- What is SQL?
- Why do we need to know it?
- How do we use it?

## Setup

##### 1. create a database from the console
``createdb world``

##### 2. import our sample database, the cities, countries, and languages of the world
``psql world -f ./world.sql``

##### 3. use psql to open up our database
``psql world``

##### 4. navigate into just our country table
``\d country``

## Selecting

    Notes: Only single quotes work. If you get an error, make sure you're using single quotes.

###### select everything from this table
```SQL
SELECT * FROM country;
```

###### select just certain columns
```SQL
SELECT code,name,continent,population FROM country;
```

###### find one row, based on a country code
```SQL
SELECT code,name,continent,population FROM country WHERE code='ARG';
```

###### find any rows that are similar
```SQL
SELECT code,name,continent,population FROM country WHERE code LIKE 'AR%';
```

###### find all countries where there's a population of at least 100 million people
```SQL
SELECT code,name,continent,population FROM country WHERE population >= 100000000;
```


###### find only European countries whose population is more than 40 million
```SQL
SELECT code,name,continent,population FROM country WHERE continent='Europe' AND population > 40000000;
```

###### sort those countries by population, from most to least
```SQL
SELECT code,name,continent,population FROM country WHERE continent='Europe' AND population > 40000000 ORDER BY population DESC;
```
