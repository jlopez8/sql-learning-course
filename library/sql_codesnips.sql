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

## USE
### makes it so you can focus on a particular schema without constantly having
### having to refer to it.
use <TAB_NAME>;

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

## LOGICAL operators
select titulo, duracion, rating_imdb 
from episodios 
where (
	duracion > 45 
    and
	rating_imdb > 9
);

select * 
from series 
where (
    genero = "Drama" 
    or
    genero = "Ciencia ficción"
);

SELECT * 
from series
where (
	genero NOT IN ("COMEDIA", "FANTASIA")
);

## LIKE
select * from series
where titulo like "%The%";

## Aggregates

### SUM. any of these can be applied IMMEDIATELY to column in question.
SELECT SUM(duracion) FROM episodios;
SELECT SUM(duracion) AS suma_duracion from episodios;

select sum(duracion) 
as suma_duracion 
from episodios
where (
	serie_id = 5
);

## Group By
### Group by's must accompany aggregate functions in order to properly attach tthem to desired columns
### for example, avg duracion will compute the average, but when in combination with a group by
### it will do so PER GROUP vs TOTAL. 
select  serie_id, avg(duracion) as avg_duracion, sum(duracion) as suma_duracion from episodios
where serie_id in (1,2)
group by serie_id;

### This group statement allows the selection of the group by column using the order of the selected
### variables in appearance order.
select serie_id, count(episodio_id) as count_episodios from episodios group by 1;

## HAVING
### Having statements follow group by. They are additional conditional.
### Constraint statements 
### order is: WHERE (for non agg), GROUP BY (specify non-agg -> agg relation), HAVING (specify agg condition) 
SELECT serie_id, count(episodio_id) as no_episodios  
from episodios
group by serie_id
having count(episodio_id) > 10;

### Here is a perfect example of the combination of constraints. 
### order is: WHERE (for non agg), GROUP BY (specify non-agg -> agg relation), HAVING (specify agg condition) 
select temporada, sum(duracion) as duracion_total
from episodios
where serie_id = 2
group by temporada
having sum(duracion) > 400;

# Querying - JOINS

## Join
## Supone que queremos unir una tabla de series con la tabla de actuaciones 
## usando un inner join... cual es la clave en comun?
## 'serie_id'
SELECT * From Series
 join actuaciones
on series.serie_id = actuaciones.serie_id;

SELECT 
series.titulo,
actuaciones.personaje 
From Series
join actuaciones
on series.serie_id = actuaciones.serie_id;

SELECT 
s.titulo,
a.personaje 
From Series as s
join actuaciones as a
on s.serie_id = a.serie_id;

## Join / inner join
### join and inner join are the same...
### can also alias for a less verbose query.
SELECT 
s.titulo,
a.personaje 
From Series as s
inner join actuaciones as a
on s.serie_id = a.serie_id;

## Join / adding where
select
s.titulo,
a.personaje
from series as s
inner join actuaciones as a
on s.serie_id = a.serie_id
where s.titulo = "The Crown";

### no need to alias columns that exist in only one table involved in 
### the join operation.
select
titulo,
personaje
from series as s
inner join actuaciones as a
on s.serie_id = a.serie_id
where titulo = "The Crown";

## Join / w limit
select * -- todos los campos
from series as s
inner join episodios as e
on s.serie_id = e.serie_id
limit 10;

## Left Join
select 
s.titulo as "Titulo de la serie",
e.titulo as "Titulo de Episodio"
from series as s
left join episodios as e
on s.serie_id = e.serie_id
order by s.titulo;

## Left Join / w More complicated structure
select
s.titulo as "Título de la Serie",
e.titulo as "Título del Episodio",
rating_imdb as "Rating IMDB"
from series as s
left join episodios as e
on s.serie_id = e.serie_id
where s.titulo = "Stranger Things"
order by e.rating_imdb desc;

