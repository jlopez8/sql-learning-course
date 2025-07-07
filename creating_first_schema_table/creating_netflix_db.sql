-- CREATE SCHEMA `netflixdb`

Create database if not exists NetflixDB;

USE netflixdb;

CREATE TABLE IF NOT EXISTS Series (
	serie_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT, 
    año_lanzamiento INT,
    genero VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Episodios (
	episodio_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    serie_id INT, -- will be used as foreign key
	titulo VARCHAR(255) NOT NULL,
    duracion INT,
    rating_imdb DECIMAL(3, 1),
    temporada INT,
    descripcion TEXT,
    fecha_estreno DATE,
    -- You can name the constraint NOW. Or you can add it then do a drop-and-alter operation.
    CONSTRAINT  episodios_fk FOREIGN KEY (serie_id) REFERENCES Series(serie_id) 
);

-- This is the drop-and-alter operation with just the alter part.
ALTER TABLE Episodios
ADD CONSTRAINT episodios_fk
FOREIGN Key (serie_id) REFERENCES Series(serie_id);

CREATE TABLE IF NOT EXISTS Actores (
	actor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE
);

-- I believe this table is what will link actors to episodes (possibly just series).
CREATE TABLE IF NOT EXISTS Actuaciones (
	actor_id INT,
    serie_id INT,
    personaje VARCHAR(255),
    CONSTRAINT actor_id_fk FOREIGN KEY (actor_id) REFERENCES Actores(actor_id),
    CONSTRAINT serie_id_fk FOREIGN KEY (serie_id) REFERENCES Series(serie_id),
    -- You can have multiple primary keys
    PRIMARY KEY (actor_id, serie_id)
);

-- YOU can run this before and after you impor the data to check that the tables were populated correctly.
SELECT * FRom Actores