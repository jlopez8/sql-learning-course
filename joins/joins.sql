# Doing some basic joins.

use netflixdb;

## We can see we have actor ids, series id and the character played
SELECT * FROM Actuaciones;

## We cna see we have the series id, title, ...
SELECT * FROM Series;

## Supone que queremos unir una tabla de series con la tabla de actuaciones 
## usando un join... cual es la clave en comun?
## 'serie_id'
SELECT * From Series
join actuaciones
on series.serie_id = actuaciones.serie_id;

## we can select specific ones...
SELECT titulo From Series
join actuaciones
on series.serie_id = actuaciones.serie_id;

## can select / differentiate columns across tables being queried.
SELECT 
series.titulo,
actuaciones.personaje
From Series
join actuaciones
on series.serie_id = actuaciones.serie_id;

### can also alias for a less verbose query.
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

## complicating joins with "where"
### this will limit the joni results so the title is only from "the Crown".
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

select * -- todos los campos
from series as s
inner join episodios as e
on s.serie_id = e.serie_id
limit 10;

-- Ejercisio 2
select 
s.titulo as titulo_serie, -- de la serie
e.titulo as titulo_episodio, -- episodio,
duracion
from series as s
join episodios as e
on s.serie_id = e.serie_id
where s.titulo = 'Stranger Things';


# Left Join
## Means we will get everything from the left most table and only 
## the matching items from the right table. If there is something 
## left table has that right table does not, these should appear
## as null values in those columns to preserve structure.

select 
s.titulo as "Titulo de la serie",
e.titulo as "Titulo de Episodio"
from series as s
left join episodios as e
on s.serie_id = e.serie_id
order by s.titulo;

# Ejercisio 3
select
s.titulo as "Título de la Serie",
e.titulo as "Título del Episodio",
rating_imdb as "Rating IMDB"
from 
series as s
left join
episodios as e
on s.serie_id = e.serie_id
order by s.titulo asc;

# Ejercisio 4
select
s.titulo as "Título de la Serie",
e.titulo as "Título del Episodio",
rating_imdb as "Rating IMDB"
from series as s
left join episodios as e
on s.serie_id = e.serie_id
where s.titulo = "Stranger Things"
order by e.rating_imdb desc;

# RIGHT JOINS
use netflixdb;
SELECT 
	series.titulo as "Titulo de la Series",
    episodios.titulo as "Titulo del Episodio"
FROM episodios
RIGHT JOIN series
ON episodios.serie_id = series.serie_id
ORDER BY series.titulo;

## practica 1
select
    s.titulo as "Título de la Serie",
    e.titulo as "Título del Episodio",
    duracion as "Duración" -- where is this one coming from?
FROM series as s
RIGHT JOIN episodios as e
ON s.serie_id = e.serie_id
WHERE e.duracion > 30
ORDER BY s.titulo;

# UNION Y UNION ALL
use netflixdb;

select * from series
where genero = 'ciencia ficción'
-- now lets try to join with another genero using union all without dupes.
union all 
select * from series
where genero = 'Drama';

-- we can test the union all dupes thing..
select * from series
where genero = 'ciencia ficción'

union all

select * from series 
where genero = 'Drama'

union all

select * from series
where genero = 'Drama'
order by titulo;

# practica 2
select * 
from series
where genero = 'ciencia ficción'
union all
select * 
from series
where genero = 'drama';

## using only union
select 
titulo
from episodios
where duracion > 20 
union 
select
titulo 
from episodios
where rating_imdb > 9;

### you can do the same query with 'where'
select 
titulo
from episodios
where (duracion > 20 or rating_imdb > 9);

## Project of the day.

### question 1
select genero, count(genero) as count_genero
from series
group by genero
order by count_genero desc;

### Question 2
select 
	s.titulo as "titulo de la serie", 
	count(e.episodio_id) as "conta de episodio",
    avg(e.rating_imdb) as "avg_rating"
from series as s
left join episodios as e
on s.serie_id = e.serie_id
group by s.titulo
order by avg(e.rating_imdb) desc
limit 3;

### Pregunta 3

-- where titulo = "Stranger Things"; 
select sum(e.duracion) as "Total Duracion"
from series as s
left join episodios as e
on s.serie_id = e.serie_id
where s.titulo = "Stranger things"




