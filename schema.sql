/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id SERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

ALTER TABLE
    animals
ADD
    COLUMN species VARCHAR(100);

CREATE TABLE IF NOT EXISTs owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(60),
    age INT
);

CREATE TABLE IF NOT EXISTS species(id SERIAL PRIMARY KEY, name VARCHAR(50));

 ALTER TABLE animals ADD species_id INT;