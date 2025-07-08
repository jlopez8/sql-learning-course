# Create...
CREATE SCHEMA `myschema`;

# We can specify which schema with "." : SCHEMA.TABLE
CREATE TABLE `BlogDB`.`Usarios` (
	`UserID` INT NOT NULL AUTO_INCREMENT,
    `Nombre` VARCHAR(45) NULL,
    `Email` VARCHAR(45) NULL,
    `FechaRegistro` DATE NULL,
    PRIMARY KEY (`UserID`)
);

# DROP / delete...
DROP SCHEMA `myschema`;

ALTER TABLE blogDB.Comentarios
DROP FOREIGN KEY comentarios_ibfk_1

# ALTER / MODIFY. MySQL uses modify.
ALTER TABLE `BlogDB`.`Comentarios` MODIFY COLUMN `UserID` INT;

## Change TABLE NAME
ALTER TABLE jeugos RENAME TO juegos;alter

## CHANGE COLUMN NAME
ALTER TABLE juegos RENAME COLUMN DesarroladorID TO DesarrolladorID;

# Specify Foreign Key
ALTER TABLE `BlogDB`.`Comentarios` 
ADD CONSTRAINT fk_user_id # descriptive name
FOREIGN KEY (UserID) REFERENCES Usarios(UserId);

# Inserting Datos
## The pattern is: table (<COL1> <COL2> <COL3>) VALUES (<VAL1>, <VAL2>, <VAL3>)
INSERT INTO usarios (Nombre, Email, FechaRegistro) VALUES
("Juan", "juan.ejemplo@hotmail.com", "2024-06-01")

# Quering

## selections
select titulo, temporada from Episodios;

SELECT DISTINCT genero FROM series;

## ORDERING
select titulo, duracion from episodios order by duracion;
select titulo, duracion from episodios order by duracion asc;
select titulo, duracion from episodios order by duracion desc;
select distinct año_lanzamiento from series order by año_lanzamiento desc;

## LIMIT
SELECT * FROM EPISODIOS limit 10;
select titulo, duracion from episodios order by duracion desc limit 5;
select nombre from actores order by actor_id asc limit 5;

## WHERE
select * from series where genero = "Drama";

## COMPARISONS >, < GREATER THAN LESS THAN !=
select titulo, año_lanzamiento from series where año_lanzamiento > 2020;
select titulo, año_lanzamiento from series where año_lanzamiento != 2020;

