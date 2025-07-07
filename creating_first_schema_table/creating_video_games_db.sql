drop schema videojuegosdb

create schema videojuegosdb;

use videojuegosdb;

create table juegos (
	juegoID int not null auto_increment primary key,
    Titulo varchar(45),
    AñoLanzamiento int,
    DesarrolladorID VARCHAR(45),
    PlataformaID varchar(45)
);

create table desarrolladores (
	DesarrolladorID int auto_increment primary key,
    Nombre varchar(45),
    Pais varchar(45)
);

create table plataformas (
	plataformaID int auto_increment primary key,
    Nombre varchar(45),
    Tipo varchar(45)
);

-- change keys in the foreign key adaptation
alter table juegos
modify column DesarrolladorID int;

alter table juegos
modify column PlataformaID int;

-- now declare the foreign keys
alter table juegos
add constraint PlataformaID_fk
foreign key (PlataformaID) REFERENCES plataformas(plataformaID);

alter table juegos
add constraint DesarrolladorID_fk
foreign key (DesarrolladorID) REFERENCES desarrolladores(DesarrolladorID);

-- Now lets add some data:

-- Insertar datos en la tabla Desarrolladores
INSERT INTO Desarrolladores (Nombre, Pais) VALUES 
('Naughty Dog', 'Estados Unidos'),
('Nintendo', 'Japón'),
('CD Projekt Red', 'Polonia');

select * from Desarrolladores;

-- Testing auto increment
INSERT INTO Desarrolladores (Nombre, Pais) VALUES
('Square Soft' , 'Japan');

-- Insertar datos en la tabla Plataformas
INSERT INTO Plataformas (Nombre, Tipo) VALUES 
('PlayStation 4', 'Consola'),
('Nintendo Switch', 'Consola'),
('PC', 'Computadora');

-- Insertar datos en la tabla Juegos
INSERT INTO Juegos (Titulo, AñoLanzamiento, DesarrolladorID, PlataformaID) VALUES 
('The Last of Us Part II', 2020, 1, 1),  -- Desarrollado por Naughty Dog para PlayStation 4
('The Legend of Zelda: Breath of the Wild', 2017, 2, 2),  -- Desarrollado por Nintendo para Nintendo Switch
('Cyberpunk 2077', 2020, 3, 3);  -- Desarrollado por CD Projekt Red para PC
