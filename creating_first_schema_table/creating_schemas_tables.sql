CREATE TABLE `BlogDB`.`Usarios` (
	`UserID` INT NOT NULL AUTO_INCREMENT,
    `Nombre` VARCHAR(45) NULL,
    `Email` VARCHAR(45) NULL,
    `FechaRegistro` DATE NULL,
    PRIMARY KEY (`UserID`)
);

CREATE TABLE `BlogDB`.`Publicaciones` (
	`PostID` INT NOT NULL  AUTO_INCREMENT,
    `Titulo` VARCHAR(45),
    `Contenido` VARCHAR(45),
    `FechaPublicacion` DATE,
	PRIMARY KEY (`PostID`)
);

CREATE TABLE `BlogDB`.`Comentarios` (
	`CommentID` INT NOT NULL AUTO_INCREMENT,
    `PostID` VARCHAR(45),
    `UserID` VARCHAR(45),
    `Contenido` VARCHAR(45),
    `FechaComentario` DATE,
	PRIMARY KEY(`CommentID`)
);

# Change datatype (this is so we can reference the foreign key with the same datatype
ALTER TABLE `BlogDB`.`Comentarios` MODIFY COLUMN `UserID` INT;

ALTER TABLE Comentarios MODIFY COLUMN PostID INT; 

# Specify Foreign Key
ALTER TABLE `BlogDB`.`Comentarios` 
ADD CONSTRAINT fk_user_id # descriptive name
FOREIGN KEY (UserID) REFERENCES Usarios(UserId);

ALTER TABLE `BlogDB`.`Comentarios`
ADD CONSTRAINT fk_post_id
FOREIGN KEY (PostID) REFERENCES Publicaciones(PostID)

## Drop a Foreign Key
ALTER TABLE blogDB.Comentarios
DROP FOREIGN KEY comentarios_ibfk_1

# Inserting Datos
INSERT INTO usarios (Nombre, Email, FechaRegistro) VALUES
("Juan", "juan.ejemplo@hotmail.com", "2024-06-01")

# 
