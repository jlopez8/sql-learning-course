### Working with SubQueries

use netflixdb;


# One way of getting the office episodes from the episodes table is to use the 
# table id, but if you don't remember it, you will have to find it from 
# another table (the series table). Which you can do in separate queries:

# this one gives 13...
select serie_id
from series
where titulo = 'The Office';

# and then you can use 13 here...
select * 
from episodios
where serie_id = 13;

# but this isn't an efficient way to do this. We can use a sub-query in place of the
# '13' you end up finding in the other query.
# By making this part more open, we allow this to be parameterized by one variable instead
# of two.
select * 
from episodios
where serie_id = (
	select serie_id
	from series
	where titulo = 'Sherlock'
);

# now try it for another type...
select titulo
from series
where serie_id in (
	select serie_id
	from episodios
	group by serie_id
	having avg(rating_imdb) > 8.0
);

# Now try using IF 
Select 
	titulo, 
    rating_imdb, 
    IF (rating_imdb >= 8, "Alto", "Bajo") as "Categoria de Rating"
FROM episodios;

# Now try with year!
select
	nombre,
	year(fecha_nacimiento) as año_nacimiento,
    if(year(fecha_nacimiento)  > 2000, "young", "old") as "categories de actores"
from actores;

select
	titulo,
	año_lanzamiento,
    case
		when año_lanzamiento >= 2020 then "nuevo"
        when año_lanzamiento between 2010 and 2019 then "clasica"
        else "antigua"
        end
        as "categoria"
from series;

## Now try it in practice as well...
select
	titulo,
    case 
		when año_lanzamiento < 2010 then "Antigua"
        when año_lanzamiento >= 2010 then "Reciente"
        end
        as "Antigüedad"
from series;

## Another one
select
	titulo,
    case
		when genero = "Drama" then "Dramático"
        when genero = "Comedia" then "Divertido"
        else "Otro"
        end as "Categoría de Género"
from series;


# The CAST statement
use netflixdb;
describe episodios;
# You can see the ones that are availalbe with their type.
# So lets 

select fecha_estreno 
from episodios
limit 100;

select * from episodios
where cast(fecha_estreno as date) > "2010-01-01";

# MYSQL does not like casting the same way others might
# In this case we will ue 'as char' as 'as text' although latter may work well in other
# interpreters
select titulo, cast(año_lanzamiento as char)
from series;

# Working with FECHA Y HORA (DATE AND TIME)

## get all fechas but then also get the fecha with only the year, with only month
## Uses YEAR statement, MONTH
select fecha_estreno, YEAR(fecha_estreno), MONTH(fecha_estreno)
from episodios;

# Now try using date add to add 30 days to each value in the fecha estreno column
## Date add is specifically made to mathematically accurately add time to dates
## So they are also reflected accurately as dates on a calendar. Some months are
## different for example, and years change calendars so dateadd is important.
select fecha_estreno,
date_add(fecha_estreno, interval 30 day) as "fecha_estreno + 30 day",
date_add(fecha_estreno, interval 1 MONTH) as "fecha_estreno + 1 mo"
from episodios;

# Same with datediff (for date subtract)
## uses "CURDATE()" which is a function for the current date.
select *,
datediff(CURDATE(), fecha_estreno) as diasdeestreno
from episodios;

# Strings and TEXTS
## UPPER, LOWER: go to mayuscula or miniscula for letters in text
select UPPER(titulo) from series;
select LOWER(nombre) from Actores;

## CONCAT: concatenate all elements in parentheses
select CONCAT(titulo, " (", año_lanzamiento, ")") as titulo_año 
from series;

## SUBSTRING take some characters of a string 
select SUBSTRING(titulo, 1, 5) as extracted_titulo from episodios;

## Length: counts length of string (character count).
select titulo, length(titulo) as length_titulo from series;

## 
