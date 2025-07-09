USE NETFLIXDB;

select episodio_id from episodios;

SELECT DISTINCT genero from series;

Select titulo, duracion from episodios order by duracion;

select titulo, duracion from episodios order by duracion asc;
select titulo, duracion from episodios order by duracion desc;
select nombre, fecha_nacimiento from actores order by fecha_nacimiento desc;

# LIMIT
SELECT * FROM EPISODIOS limit 5;

select titulo, duracion from episodios order by duracion desc limit 5;

# WHERE
SELECT * FROM Series WHERE genero = "Drama"; 
select * from series where genero = "Comedia";

# Comparison
select * from series where año_lanzamiento > 2015;

# LOGICAL OPERATORS
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

SELECT * from series
where (genero NOT IN ("COMEDIA"));

select * 
from series 
where (
    genero not IN ("Drama", "Drama histórico")
);

select distinct genero from series;

# LIke
select * from series
where titulo like "%The%";

select titulo from series 
where (
    titulo like "%The%"
);

SELECT SUM(duracion) FROM episodios;
SELECT SUM(duracion) AS suma_duracion from episodios;

select sum(duracion) 
as suma_duracion 
from episodios
where (
	serie_id = 5
);

select avg(duracion) 
as avg_duracion 
from episodios
where (
	serie_id = 5
);

select avg(duracion)
as avg_duracion
from episodios
where serie_id in (1,1);

# Group By
select  serie_id, avg(duracion) as avg_duracion, sum(duracion) as suma_duracion from episodios
where serie_id in (1,2)
group by serie_id;

select serie_id, count(episodio_id) as count_episodios from episodios group by 1;

select año_lanzamiento, count(serie_id) as cantidad_de_series
from series
group by año_lanzamiento;

# Having
SELECT serie_id, count(episodio_id) as no_episodios  
from episodios
group by serie_id
having count(episodio_id) > 10;

select temporada, sum(duracion) as duracion_total
from episodios
where serie_id = 2
group by temporada
having sum(duracion) > 400;

# Project 1
## Question 1
## Who is the actor (es) that has participated in the most series?

select actor_id, count(serie_id) as count_serie 
from actuaciones
group by actor_id
order by count_serie desc
limit 1;

select nombre
from actores
where actor_id = 18;
# ANS: Gina Carano

## Question 2
## What is the series with the highest average imdb rating?

select serie_id, avg(rating_imdb) as avg_rating
from episodios
group by serie_id
order by avg_rating desc;
limit 1; 
## serie id = 8

select titulo 
from series
where serie_id = 8;
# Answer Arcane

## Question 3
###  What is the longest episode?
select titulo, max(duracion) as max_duracion
from episodios
group by titulo
order by max_duracion desc
limit 1;
# ANS: The Sign of Three
