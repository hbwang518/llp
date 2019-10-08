select distinct(gridid) from DEMunionCounty 
select top 10 * from DEMunionCounty
select top 10 * from AnimalCounty
select top 10 * from AnimalCountyAltitudeResult
select top 10 * from distinctPlantCounty
select top 10 * from distinctAnimalCounty
select top 10 * from M_Animal
select * from DEMunionCounty order by gridid
select max(alt), min(alt) from DEMunionCounty

###animal
select a.animal_id, a.county_code, b.lowAltitude, b.highAltitude, c.gridId, c.alt into AnimalCountyAltitudeResult001
from distinctAnimalCounty a, M_Animal b, DEMunionCounty c
where a.animal_id=b.id and c.countycode = a.county_code 

select * into AnimalCountyAltitudeValidResult001 from AnimalCountyAltitudeResult001 where (lowAltitude < -8000 or (alt>=lowAltitude and alt<= highAltitude ))

select * from M_Animal
select top 1 * from AnimalCountyAltitudeValidResult001

select gridId, count(distinct(cnName)) cnName, count(distinct(cnFamily)) cnFamily, count(distinct(cnOrder)) cnOrder into a001m from (select a.gridId,b.cnName,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult001 a, M_Animal b where a.animal_id=b.Id and b.speciesFlag='m') c group by c.gridId

select gridId,count(distinct(cnName)) cnName, count(distinct(cnFamily)) cnFamily, count(distinct(cnOrder)) cnOrder into a001b from (select a.gridId,b.cnName,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult001 a,M_Animal b where a.animal_id=b.Id and b.speciesFlag='b') c group by c.gridId



select top 10000 * from a001m
select top 10000 * from a001b
select max(cnname), min(cnname) from a001m
select max(cnname), min(cnname) from a001b



###plant
select b.plant_id, b.county_code, b.lowAltitude, b.highAltitude, a.gridid, a.alt into PlantCountyAltitudeResult001
from DEMunionCounty a, distinctPlantCounty b 
where a.countycode=b.county_code

select * into PlantCountyAltitudeValidResult001 from PlantCountyAltitudeResult001 where (lowAltitude < -8000 or (alt>=lowAltitude and alt<= highAltitude ))

select top 1000 * from PlantCountyAltitudeValidResult001
--select count(plant_id) from PlantCountyAltitudeValidResult001


select Id, count(distinct(plant_id)) plant_id, count(distinct(cnFamily)) cnFamily, count(distinct(cnGenus)) cnGenus 
into a001p
from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult001 a,M_Plant b where a.plant_id=b.id) w --where w.id=2065770
group by w.Id 

CREATE INDEX PlantCountyAltitudeValidResult001_id_index  ON PlantCountyAltitudeValidResult001  (id)
select top 1 * from PlantCountyAltitudeValidResult001 where id=2065770
select top 1 * from M_Plant
drop table a001p
select top 1 * from PlantCountyAltitudeValidResult001
select top 1 * from a001p

select Id gridId, count(distinct(plant_id)) plantSpecies 
into a001p0
from PlantCountyAltitudeValidResult001
group by Id 

select top 1 * from a001p0
select avg(plantSpecies), max(plantSpecies), min(plantSpecies) from a001p0

select avg(cnname), max(cnname), min(cnname) from a001m
select avg(cnname), max(cnname), min(cnname) from a001b


select p.gridId, p.plantSpecies, m.cnName mammalSpecies, b.cnName birdSpecies into a001pmb 
from a001p0 p, a001m m, a001b b where p.gridId=m.gridId and m.gridId=b.gridId order by P.gridId

select top 1000 * from demunioncounty order by gridid

select count(*) from plantCountyAltitudeValidResultDistinct