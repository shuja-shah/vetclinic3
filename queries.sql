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
LIMIT
    1;

/* Q Who was the last animal seen by William Tatcher? */
SELECT
    a.name,
    v.name,
    vi.visist_date
from
    animals a,
    vets v,
    visits vi
where
    vi.animals_id = a.id
    and vi.vets_id = v.id
    and v.id = 1
order by
    vi.visist_date desc
limit
    1;

/* Q How many different animals did Stephanie Mendez see? */
SELECT
    count(a.name),
    a.name,
    v.name as vet_name
from
    animals a,
    vets v,
    visits vi
where
    vi.animals_id = a.id
    and vi.vets_id = v.id
    and v.id = 3
GROUP BY
    a.name,
    v.name;

/* Q List all vets and their specialties, including vets with no specialties. */
SELECT
    v.name,
    s.name
from
    species s full
    join specializations spe on spe.species_id = s.id FULL
    JOIN vets v on v.id = spe.vets_id;

/*List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT
    a.name,
    v.name,
    vi.visist_date
from
    animals a,
    vets v,
    visits vi
where
    vi.animals_id = a.id
    and vi.vets_id = v.id
    and v.id = 3
    and vi.visist_date between '2020-04-01'
    and '2020-08-30';

/* What animal has the most visits to vets? */
SELECT
    a.name,
    count(a.name)
from
    animals a,
    vets v,
    visits vi
where
    vi.animals_id = a.id
    and vi.vets_id = v.id
GROUP BY
    a.name
ORDER BY
    count(a.name) DESC
LIMIT
    1;

/* Who was Maisy Smith's first visit? */
SELECT
    a.name,
    v.name,
    vi.visist_date
from
    animals a,
    vets v,
    visits vi
where
    vi.animals_id = a.id
    and vi.vets_id = v.id
    and v.id = 2
ORDER BY
    vi.visist_date
LIMIT
    1;

/* Details for most recent visit: animal information, vet information, and date of visit. */
SELECT
    a.name as animal_name,
    v.name as vet_name,
    v.age,
    vi.visist_date
from
    animals a,
    vets v,
    visits vi
where
    vi.animals_id = a.id
    and vi.vets_id = v.id
ORDER BY
    vi.visist_date DESC;

/*How many visits were with a vet that did not specialize in that animal's species? */
SELECT
    COUNT(v.name),
    v.name
FROM
    visits vi
    RIGHT JOIN vets v ON v.id = vi.vets_id
    JOIN animals a ON a.id = vi.animals_id
    JOIN specializations sp ON sp.vets_id = v.id
WHERE
    sp.species_id != a.species_id
GROUP BY
    v.name;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
SELECT
    V.name as vet_name,
    A.name as animals_name,
    s.name as species_name
from
    visits vi
    join animals a on a.id = vi.animals_id
    join vets v on v.id = vi.vets_id
    join species S on S.id = A.species_id
where
    V.id = 2
GROUP by
    s.name,
    v.name,
    a.name;