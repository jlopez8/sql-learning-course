# Create...
CREATE SCHEMA `myschema`;

CREATE DATABASE IF NOT EXISTS NetflixDB;

# We can specify which schema with "." : SCHEMA.TABLE
CREATE TABLE `BlogDB`.`Usarios` (
	`UserID` INT NOT NULL AUTO_INCREMENT,
    `Nombre` VARCHAR(45) NULL,
    `Email` VARCHAR(45) NULL,
    `FechaRegistro` DATE NULL,
    PRIMARY KEY (`UserID`)
);

## Another example: look at how we don't need string-type quotes.
CREATE TABLE IF NOT EXISTS Series (
	serie_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT, 
    año_lanzamiento INT,
    genero VARCHAR(255)
);

 -- You can have multiple primary keys
CREATE TABLE IF NOT EXISTS Actuaciones (
	actor_id INT,
    serie_id INT,
    personaje VARCHAR(255),
    CONSTRAINT actor_id_fk FOREIGN KEY (actor_id) REFERENCES Actores(actor_id),
    CONSTRAINT serie_id_fk FOREIGN KEY (serie_id) REFERENCES Series(serie_id),
    PRIMARY KEY (actor_id, serie_id)
);

# DROP / delete...
DROP SCHEMA `myschema`;

ALTER TABLE blogDB.Comentarios
DROP FOREIGN KEY comentarios_ibfk_1

# ALTER / MODIFY. MySQL uses modify.
ALTER TABLE `BlogDB`.`Comentarios` MODIFY COLUMN `UserID` INT;

# Specify Foreign Key
ALTER TABLE `BlogDB`.`Comentarios` 
ADD CONSTRAINT fk_user_id # descriptive name
FOREIGN KEY (UserID) REFERENCES Usarios(UserId);

# Inserting Datos
## The pattern is: table (<COL1> <COL2> <COL3>) VALUES (<VAL1>, <VAL2>, <VAL3>)
INSERT INTO usarios (Nombre, Email, FechaRegistro) VALUES
("Juan", "juan.ejemplo@hotmail.com", "2024-06-01")

