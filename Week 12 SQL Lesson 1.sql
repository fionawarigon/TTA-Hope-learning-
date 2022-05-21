-- create a database 
create database example;
drop database example;
use example;

-- create a table
create table person (
	person_id smallint unsigned, 
    fname varchar(20),
    lname varchar(20),
    eye_colour enum('BR','BL','GR'),
    birth_date date,
    street varchar(30),
    city varchar(20),
    country varchar(20),
    post_code varchar(20),
    constraint pk_person primary key(person_id)
);

-- view table
desc person;
explain person;

-- Creating a second table that references the 1st tables PK
create table favourite_food (
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favourite_food primary key (person_id, food),
    constraint fk_favourite_food_person_id foreign key (person_id)
    references person (person_id)
);

-- altering foreign key
-- Note:  First line removes any foreign key links.
set foreign_key_checks=0;
-- Note: This is the main cog a table.
alter table person
	modify person_id smallint unsigned auto_increment;
-- Note: this reinstates the foreign key connections.
set foreign_key_checks=1;

-- inserting data 
insert into person 
	(person_id, fname, lname, eye_colour, birth_date)
values (null, 'Jon', 'Snow', 'BR', '1989-05-26');

-- Querying the data
select person_id, fname, lname, birth_date
from person
where person_id = 1;

select person_id, fname, lname, birth_date
from person
where lname = 'Snow';

select *
from person;

-- Inserting Data into Second Table
insert into favourite_food 
	(person_id, food)
values (1, 'pizza');

insert into favourite_food 
	(person_id, food)
values (1, 'cookies');

insert into favourite_food 
	(person_id, food)
values (1, 'crisps');

insert into favourite_food 
	(person_id, food)
values (1, 'chips'),
		(1, 'chocolate'),
        (1, 'cakes');

-- order table by food
select *
from favourite_food
where person_id = 1
order by food;



-- update table 
update person
set street = '123 You know Nothing St.',
city = 'The Great Wall',
country = 'Westeros',
post_code = '021138'
where person_id = 1;

select *
from person
where person_id = 1;

-- deleting data from table
insert into person 
	(person_id, fname, lname, eye_colour, birth_date)
values (null, 'Jon', 'Snow', 'BR', '1989-05-26');

select *
from person;

delete from person
where person_id = 2;

select *
from person;

-- When Good statements Go Bad

-- Inserting invalid Nonunique Primary Keys
insert into person
	(person_id, fname, lname, eye_colour, birth_date)
values (1, 'Charles', 'Fulton', 'GR', '1968-01-15');

-- Non-existent Foreign Key
insert into favourite_food
	(person_id, food)
values (200, 'Cheese');

-- Column Value Violations
update person
set eye_colour = 'RD'
where person_id = 1;

-- Invalid Date Conversions
update person
set birth_date = 'DEC-21-1980'
where person_id = 1;

-- Correct Date Conversions
update person
set birth_date = str_to_date('DEC-21-1980', '%b-%d-%Y')
where person_id = 1;



drop database example; 

drop table person;

drop table favorite_food;

