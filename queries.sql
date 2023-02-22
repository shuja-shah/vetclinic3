/*Queries that provide answers to the questions from all projects.*/
/* Q 1 : Find All animals whose name end in mon */
SELECT
    *
from
    animals
WHERE
    name LIKE '%mon';

/* Q 2: List the name of all animals born between 2016 and 2019 */
SELECT
    *
from
    animals
WHERE
    date_of_birth BETWEEN '2016-01-01'
    AND '2019-12-31';

/* Q3 : List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT
    *
from
    animals
WHERE
    neutered = true
    AND escape_attempts < 3;

/* Q4 : List the date of birth of all animals named either 'Agumon' or 'Pikachu'. */
SELECT
    date_of_birth
from
    animals
WHERE
    name = 'Agumon'
    OR name = 'Pikachu';

/* Q5 : List name and escape attempts of animals that weigh more than 10.5kg */
SELECT
    name,
    escape_attempts
from
    animals
WHERE
    weight_kg > 10.5;

/* Q6 : Find all animals that are neutered. */
SELECT
    *
from
    animals
WHERE
    neutered = true;

/* Q7 : Find all animals not named Gabumon. */
SELECT
    *
from
    animals
WHERE
    name != 'Gabumon';

/* Q8 : Find all animals with a weight between 10.4kg and 17.3kg */
SELECT
    *
from
    animals
WHERE
    weight_kg BETWEEN 10.4
    AND 17.3;

