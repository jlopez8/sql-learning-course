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
