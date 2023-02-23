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
/* Q: How many animals are there? */
SELECT
    COUNT(*)
FROM
    animals;

/* Q: How many animals have never tried to escape? */
SELECT
    COUNT(*)
FROM
    animals
WHERE
    escape_attempts = 0;

/* Q: What is the average weight of animals? */
SELECT
    AVG(weight_kg)
FROM
    animals;

/* Q Who escapes the most, neutered or not neutered animals? */
SELECT
    neutered,
    MAX(escape_attempts)
FROM
    animals
GROUP BY
    neutered;

/*What is the minimum and maximum weight of each type of animal? */
SELECT
    species,
    MIN(weight_kg),
    MAX(weight_kg)
FROM
    animals
GROUP BY
    species;

/* Q: What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT
    species,
    AVG(escape_attempts)
FROM
    animals
WHERE
    date_of_birth BETWEEN '1990-01-01'
    AND '2000-12-31'
GROUP BY
    species;



    /*Q What animal belongs to Melody Pond? */
SELECT
    animals.name
FROM
    animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE
    owners.full_name = 'Melody Pond';

    /* Q List all animals whose species is pokemon */
SELECT
    *

FROM
    animals
INNER JOIN species ON animals.species_id = species.id
WHERE
    species = 'pokemon';

    /* Q: List all owners and their animals, remember to include those that don't own any animal. */


SELECT
    owners.full_name,
    animals.name
FROM
    owners
LEFT JOIN animals ON owners.id = animals.owner_id;


/* Q: How many animals are there per species? */
SELECT
    species,
    COUNT(*)
FROM
    animals
GROUP BY
    species;

/* Q: List all Digimon owned by Jennifer Orwell. */

SELECT
    animals.name
FROM
    animals
INNER JOIN owners ON animals.owner_id = owners.id
INNER JOIN species ON animals.species_id = species.id
WHERE
    owners.full_name = 'Jennifer Orwell'
    AND species = 'digimon';


/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT
    animals.name
FROM
    animals

INNER JOIN owners ON animals.owner_id = owners.id
WHERE
    owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;


/* Q: Who holds the most animals? */

SELECT
    owners.full_name,
    COUNT(*)
FROM
    owners
INNER JOIN animals ON owners.id = animals.owner_id
GROUP BY
    owners.full_name
ORDER BY
    COUNT(*) DESC
LIMIT 1;

