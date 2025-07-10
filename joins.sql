# Doing some basic joins.

use netflixdb;

## We can see we have actor ids, series id and the character played
SELECT * FROM Actuaciones;

## We cna see we have the series id, title, ...
SELECT * FROM Series;

## Supone que queremos unir una tabla de series con la tabla de actuaciones 
## usando un inner join... cual es la clave en comun?
SELECT 

