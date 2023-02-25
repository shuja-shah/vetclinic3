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

ALTER TABLE
    animals DROP COLUMN species;

ALTER TABLE
    animals
ADD
    species_id INT;

ALTER TABLE
    animals
ADD
    owner_id INT;

ALTER TABLE
    animals
ADD
    CONSTRAINT owner_constraint FOREIGN KEY (owner_id) REFERENCES owners (id);

ALTER TABLE
    animals
ADD
    CONSTRAINT species_constraint FOREIGN KEY (species_id) REFERENCES species (id);

CREATE TABLE IF NOT EXISTS vets(
    id SERIAL,
    name VARCHAR(60),
    age INT,
    date_of_graduation date,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS specializations (
    species_id INT,
    vets_id INT,
    CONSTRAINT vets_fk FOREIGN KEY(vets_id) REFERENCES vets (id),
    CONSTRAINT species_fk FOREIGN KEY(species_id) REFERENCES species (id)
);

CREATE TABLE IF NOT EXISTS visits (
    animals_id INT,
    vets_id INT,
    visist_date date,
    CONSTRAINT vets_fk FOREIGN KEY(vets_id) REFERENCES vets (id),
    CONSTRAINT animals_fk FOREIGN KEY(animals_id) REFERENCES animals (id)
);
/* Note :- In order to create visits table i had to update animals and ADD CONTRAINT unique_id to animals table. */
