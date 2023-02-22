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