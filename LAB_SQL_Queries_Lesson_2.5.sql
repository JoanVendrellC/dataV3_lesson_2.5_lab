USE sakila;

'1.Select all the actors with the first name ‘Scarlett’.'

SELECT* 
FROM actor
where first_name = 'SCARLETT';

'2.How many films (movies) are available for rent and how many films have been rented?'

SELECT 'all movies available' as type, count(distinct film_id)as movies
from inventory
union
select 'rented movies' as type, count(distinct inventory_id) as rentals
from rental;


'3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.'

SELECT min(length) as min_duration, max(length) as max_duration
from film;

'4.Whats the average movie duration expressed in format (hours, minutes)?'

SELECT 
	CONCAT(FLOOR(AVG(length)/60),
    'hour(s)', ROUND(AVG(length) % 60,0),
    'minute(s)') AS avg_duration_hour_min
FROM film;

'5.How many distinct (different) actors last names are there?'

SELECT COUNT(DISTINCT) last_name
Where film;

'6.Since how many days has the company been operating (check DATEDIFF() function)?'

SELECT DATEDIFF(max(last_update), min(rental_date)) as operating_days
from rental;

'7.Show rental info with additional columns month and weekday. Get 20 results.'

select *, MONTH(rental_date) AS month, WEEKDAY(rental_date) AS weekday
from rental
limit 20;

'8.Add an additional column day_type with values weekend and workday depending on the rental day of the week.'

select rental_date, MONTH(rental_date) AS month, WEEKDAY(rental_date) AS weekday,
CASE WHEN WEEKDAY(rental_date) IN (5,6) THEN 'weekend'
ELSE 'weekday' END as 'weekday_or_weekend'
from rental
limit 20;



'9.Get release years.'

select title, release_year
FROM film;



'10.Get all films with ARMAGEDDON in the title.'

SELECT title
FROM film
where title LIKE '%DDON';

'11.Get all films which title ends with APOLLO.'

SELECT title
FROM film
where title LIKE '%APOLLO';

'12.Get 10 the longest films.'

SELECT title
FROM film
ORDER BY length(title) and title ASC
limit 10;


'13.How many films include Behind the Scenes content?'

SELECT COUNT(special_features)
from film;