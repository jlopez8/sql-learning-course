# Write a subquery that will get the three generos mas populars en netflix series.
## In the superquery query, for each genero, identify the title of the series, the year of launch, and the 
## promedio of the imdb rating.

## Suggestions: use a subquery that will select the generos and count the quantity of series in each genero
## order the results by quantity and limit the results to 3 (that way you do away with anything not in the top 3).

## Now in the super query, filter the series that correspond to the three generos using the keyword IN.

select s.titulo, s.año_lanzamiento, s.genero, avg(e.rating_imdb) as avg_rating
from series as s
left join
episodios as e 
on s.serie_id = e.serie_id
where genero in (
	select genero from (
		select genero, count(serie_id)
		from series
		group by genero
		order by count(serie_id) desc
		limit 3
	) as top_genero
)
group by s.serie_id 
order by avg_rating desc;




