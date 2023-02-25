/* Populate database with sample data. */
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Agumon', '2020-02-03', 0, true, 10.00),
    ('Gabumon', '2018-11-15', 2, true, 8.00),
    ('Pikachu', '2021-01-07', 1, false, 15.04),
    ('Devimon', '2017-03-12', 5, true, 11.00);

INSERT INTO
    animals (
        name,
        neutered,
        escape_attempts,
        date_of_birth,
        weight_kg
    )
VALUES
    ('Charmander', FALSE, 0, '2020-02-08', -11),
    ('Plantmon', TRUE, 2, '2021-12-15', -5.7),
    ('Squirtle', FALSE, 3, '1993-04-02', -12.13),
    ('Angemon', TRUE, 1, '2005-06-12', -45),
    ('Squirtle', FALSE, 3, '1993-04-02', -12.13),
    ('Boarmon', TRUE, 7, '2005-06-07', 20.4),
    ('Blossom', FALSE, 3, '1998-10-13', 17),
    ('Ditto', TRUE, 4, '2022-05-14', 22);

INSERT INTO
    owners (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittake', 38);

INSERT INTO
    species (name)
VALUES
    ('Pokemon'),
    ('Digimon');

UPDATE
    animals
SET
    species_id = 2
where
    name LIKE '%mon';

UPDATE
    animals
SET
    species_id = 1
where
    name NOT LIKE '%mon';

UPDATE
    animals
SET
    owner_id = 1
where
    name = 'Agumon';

UPDATE
    animals
SET
    owner_id = 2
where
    name IN ('Gabumon', 'Pikachu');

UPDATE
    animals
SET
    owner_id = 3
where
    name IN ('Devimon', 'Plantmon');

UPDATE
    animals
SET
    owner_id = 4
where
    name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE
    animals
SET
    owner_id = 5
where
    name IN ('Angemon', 'Boarmon');

INSERT INTO
    vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

INSERT INTO
    specializations (vets_id, species_id)
VALUES
    (1, 1),
    (3, 1),
    (3, 2),
    (4, 2);

INSERT INTO
    VISITS(animals_id, vets_id, visist_date)
VALUES
    (1, 1, '2020-07-22'),
    (1, 3, '2020-07-22'),
    (2, 4, '2021-02-02'),
    (3, 2, '2020-01-05'),
    (3, 2, '2020-03-08'),
    (3, 2, '2020-06-14'),
    (4, 3, '2021-05-04'),
    (5, 4, '2021-02-24'),
    (6, 2, '2019-12-21'),
    (6, 1, '2020-08-10'),
    (6, 2, '2021-04-07'),
    (7, 3, '2019-09-29'),
    (8, 4, '2020-10-03'),
    (8, 4, '2020-11-04'),
    (9, 2, '2019-01-24'),
    (9, 2, '2019-05-15'),
    (9, 2, '2020-02-27'),
    (9, 2, '2020-08-03'),
    (10, 3, '2020-05-24'),
    (10, 1, '2021-01-11');