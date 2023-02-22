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

/* First Transaction Update */
BEGIN;

UPDATE
    animals
SET
    species = 'unspecified';

select
    *
from
    animals;

ROLLBACK;

select
    *
from
    animals;

/* Second Transaction Update */
BEGIN;

UPDATE
    animals
SET
    species = 'digimon'
WHERE
    name LIKE '%mon';

UPDATE
    animals
SET
    species = 'pokemon'
WHERE
    species IS NULL;

COMMIT;

/* Third Transaction Update */
BEGIN;

DELETE FROM
    animals;

SELECT
    *
FROM
    animals;

ROLLBACK;

SELECT
    *
FROM
    animals;

/* Fourth Transaction Update */
BEGIN;

DELETE FROM
    animals
WHERE
    date_of_birth > '2022-01-01';

SAVEPOINT delete_after_2022;

UPDATE
    animals
SET
    weight_kg = weight_kg * -1;

ROLLBACK TO delete_after_2022;

UPDATE
    animals
SET
    weight_kg = weight_kg * -1
WHERE
    weight_kg < 0;

COMMIT;


/* MIlestone 2 Questions */
