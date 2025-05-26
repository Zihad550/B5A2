-- Active: 1747282426554@@127.0.0.1@5432@test_db
create table rangers (
    ranger_id serial primary key,
    name varchar(255) not null,
    region varchar(255) not null
);

create table species (
    species_id serial primary key,
    common_name varchar(255) not null,
    scientific_name varchar(255) not null,
    discovery_date date not null,
    conservation_status varchar(255) not null
);

create table sightings (
    sighting_id serial primary key,
    ranger_id integer not null references rangers(ranger_id),
    species_id integer not null references species(species_id),
    sighting_time timestamp not null,
    location varchar(255) not null,
    notes varchar(255)
);

insert into rangers (name, region) values 
    ('Alice Green', 'Northern Hills'),
    ('Bob White', 'River Delta'),
    ('Carol King', 'Mountain Range');

insert into species (common_name, scientific_name, discovery_date, conservation_status) values
    ('Snow Leopard', 'Panthera uncia', date '1775-01-01', 'Endangered'),
    ('Bengal Tiger', 'Panthera tigris tigris', date '1758-01-01', 'Endangered'),
    ('Red Panda', 'Ailurus fulgens', date '1825-01-01', 'Vulnerable'),
    ('Asiatic Elephant', 'Elephas maximus indicus', date '1758-01-01', 'Endangered');

insert into sightings (ranger_id, species_id, sighting_time, location, notes) values
    (1, 1, timestamp '2024-05-10 07:45:00', 'Peak Ridge', 'Camera trap image captured'),
    (2, 2, timestamp '2024-05-12 16:20:00', 'Bankwood Area', 'Juvenile seen'),
    (3, 3, timestamp '2024-05-15 09:10:00', 'Bamboo Grove East', 'Feeding observed'),
    (2, 1, timestamp '2024-05-18 18:30:00', 'Snowfall Pass', '(NULL)');
select * from rangers;
select * from species;
select * from sightings;


-- Problem 1
insert into rangers (name, region)
    values
        ('Derek Fox', 'Coastal Plains');

-- Problem 2
select count(distinct species_id) from sightings;

-- Problem 3
select * from sightings 
    where location like '%Pass%';

-- Problem 4
select  r.name, count(*) as total_sightings from sightings as s
    join rangers as r on r.ranger_id = s.ranger_id
    group by  r.name;

-- Problem 5
select common_name from species
    where species_id 
        not in (select species_id from sightings);

-- Problem 6
select common_name, sighting_time, name from sightings as si
    join species as sp on sp.species_id = si.species_id
    join rangers as r on r.ranger_id = si.ranger_id
    order by sighting_time desc
    limit 2;
  
-- Problem 7
update species
    set conservation_status = 'Historic'
    where discovery_date < date '1800-01-01';

-- Problem 8
select sighting_id, case
    when extract(hour from sighting_time) < 12 then 'Morning'
    when extract(hour from sighting_time)  < 17 then 'Afternoon'
    when extract(hour from sighting_time) >= 17 then 'Evening'
        else 'Night'
    end as time_of_day 
    from sightings;
 
-- Problem 9
delete from rangers as r
    where r.ranger_id not in (select ranger_id from sightings); 
