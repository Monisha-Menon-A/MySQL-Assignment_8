create database assignment_8;
use assignment_8;

create table country (id int primary key,
country_name varchar(50),
population varchar(50),
area_sqkm varchar(50));
desc country;
insert into country(id, country_name, population, area_sqkm)
values(1, 'India', '90000000', '32 lakhs'),
(2, 'China', '90000000', '97 lakhs'),
(3, 'USA', '80000000', '93 lakhs'),
(4, 'UK', '70000000', '2 lakhs'),
(5, 'Canada', '60000000', '99 lakhs'),
(6, 'Australia', '50000000', '50 lakhs'),
(7, 'Netherlands', '40000000', '32 lakhs'),
(8, 'Sweden', '30000000', '4 lakhs'),
(9, 'Austria', '20000000', '3 lakhs'),
(10, 'Switzerland', '10000000', '2 lakhs');
select*from country;

create table persons (id int primary key,
first_name varchar(50),
last_name varchar(50),
population varchar(50),
rating int,
country_id int,
country_name varchar(50));
desc persons;
insert into persons(id, first_name, last_name, population,rating,country_id,country_name)
values(1, 'Lisha', 'Thomas', '90000000', 1, 1, 'India'),
(2, 'Chaang', 'Yaang', '90000000', 2, 2, 'China'),
(3, 'Thomas', 'Cook', '80000000', 3, 3, 'USA'),
(4, 'Diana', 'Xavier', '90000000', 1, 1, 'India'),
(5, 'Freddy', 'Dainz', '60000000', 5, 5, 'Canada'),
(6, 'Hari', 'Sharma', '90000000', 1, 1, 'India'),
(7, 'william', 'Blake', '40000000', 7, 7, 'Netherlands'),
(8, 'Right', 'Thomas', '30000000',8, 8, 'Sweden'),
(9, 'Cindrella', 'John', '20000000', 9, 9, 'Austria'),
(10, 'Irene', 'Dizooza', '10000000', 10, 10, 'Iceland');
select*from persons;

#Find the number of persons in each country
select country_name, count(*) as person_count from 
(select country_name from persons)as subquery group by country_name;

#Find the number of persons in each country sorted from high to low
select country_name, person_count from(select country_name, count(*) as person_count
from persons group by country_name) as subquery order by person_count desc;

#Find out an average rating for Persons in respective countries if the average is greater than 3.0
select country_name, average_rating from(select country_name, avg(rating) as average_rating
from persons group by country_name) as subquery where average_rating>3; 

#Find the countries with the same rating as the USA
select country_name, avg(rating) from persons group by country_name having avg(rating)=
(select avg(rating) from persons where country_name='USA'); 

#Select all countries whose population is greater than the average population of all nations
select distinct country_name from persons where population>
(select avg(population) from persons);

