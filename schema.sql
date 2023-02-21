/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id bigint NOT NULL,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg double precision NOT NULL
);
