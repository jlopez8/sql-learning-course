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

