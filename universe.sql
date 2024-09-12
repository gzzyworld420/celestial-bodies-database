-- Creación de la base de datos
CREATE DATABASE universe;

-- Conectar a la base de datos
\c universe

-- Creación de la tabla galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    has_life BOOLEAN NOT NULL DEFAULT FALSE,
    age_in_millions_of_years NUMERIC,
    galaxy_type INT
);

-- Creación de la tabla star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    distance_from_earth NUMERIC,
    is_spherical BOOLEAN,
    star_age INT
);

-- Creación de la tabla planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    has_life BOOLEAN,
    planet_type TEXT
);

-- Creación de la tabla moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    is_spherical BOOLEAN,
    age_in_millions_of_years NUMERIC
);

-- Creación de la tabla event (opcional)
CREATE TABLE event (
    event_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    event_date DATE NOT NULL,
    observed BOOLEAN
);

-- Inserción de datos en galaxy
INSERT INTO galaxy (name, description, has_life, age_in_millions_of_years, galaxy_type) VALUES
('Milky Way', 'The galaxy that contains our solar system', FALSE, 13000, 1),
('Andromeda', 'Nearest spiral galaxy to the Milky Way', FALSE, 10000, 2),
('Triangulum', 'Small spiral galaxy', FALSE, 3000, 1),
('Sombrero', 'Bright spiral galaxy', FALSE, 10000, 2),
('Whirlpool', 'Spiral galaxy in the constellation Ursa Major', FALSE, 5000, 1),
('Large Magellanic Cloud', 'Irregular galaxy', FALSE, 13000, 3);

-- Inserción de datos en star
INSERT INTO star (name, galaxy_id, distance_from_earth, is_spherical, star_age) VALUES
('Sun', 1, 0, TRUE, 4600),
('Sirius', 1, 8.6, TRUE, 120),
('Betelgeuse', 1, 642, TRUE, 10),
('Proxima Centauri', 1, 4.24, TRUE, 4.8),
('Alpha Centauri A', 1, 4.37, TRUE, 5.4),
('Altair', 1, 16.7, TRUE, 1.2);

-- Inserción de datos en planet
INSERT INTO planet (name, star_id, has_life, planet_type) VALUES
('Earth', 1, TRUE, 'Terrestrial'),
('Mars', 1, FALSE, 'Terrestrial'),
('Jupiter', 1, FALSE, 'Gas Giant'),
('Saturn', 1, FALSE, 'Gas Giant'),
('Uranus', 1, FALSE, 'Ice Giant'),
('Neptune', 1, FALSE, 'Ice Giant'),
('Venus', 1, FALSE, 'Terrestrial'),
('Mercury', 1, FALSE, 'Terrestrial'),
('Pluto', 1, FALSE, 'Dwarf'),
('Eris', 1, FALSE, 'Dwarf'),
('Haumea', 1, FALSE, 'Dwarf'),
('Makemake', 1, FALSE, 'Dwarf');

-- Inserción de datos en moon
INSERT INTO moon (name, planet_id, is_spherical, age_in_millions_of_years) VALUES
('Moon', 1, TRUE, 4500),
('Phobos', 2, TRUE, 450),
('Deimos', 2, TRUE, 450),
('Io', 3, TRUE, 4600),
('Europa', 3, TRUE, 4600),
('Ganymede', 3, TRUE, 4600),
('Callisto', 3, TRUE, 4600),
('Titan', 4, TRUE, 4500),
('Rhea', 4, TRUE, 4500),
('Iapetus', 4, TRUE, 4500),
('Dione', 4, TRUE, 4500),
('Tethys', 4, TRUE, 4500),
('Enceladus', 4, TRUE, 4500),
('Mimas', 4, TRUE, 4500),
('Hyperion', 4, TRUE, 4500),
('Oberon', 5, TRUE, 4500),
('Titania', 5, TRUE, 4500),
('Miranda', 5, TRUE, 4500),
('Ariel', 5, TRUE, 4500),
('Puck', 5, TRUE, 4500),
('Umbriel', 5, TRUE, 4500);

-- Inserción de datos en event (opcional)
INSERT INTO event (name, description, event_date, observed) VALUES
('Supernova SN 1987A', 'A supernova observed in the Large Magellanic Cloud', '1987-02-24', TRUE),
('Total Solar Eclipse', 'A total solar eclipse visible in parts of the world', '2024-08-12', FALSE),
('Comet Halley', 'Comet Halley passing near Earth', '1986-03-09', TRUE);
