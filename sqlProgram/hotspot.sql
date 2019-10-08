
---cover02

select u.id, speciesFlag, bspeciesFlag, mspeciesFlag into HotSpot02 from 
(
	select id from (select top 220 id, species from GridSpecies02 order by species desc) aa
	union 
	select id from (select top 220 id, bspecies from GridAnimal02 order by bspecies desc) bb
	union
	select id from (select top 220 id, mspecies from GridAnimal02 order by mspecies desc) cc
) u
 left join 
(
	select top 220 id, 1 speciesFlag from GridSpecies02 order by species desc
) a on u.id=a.id 
left join 
(
	select top 220 id, 1 bspeciesFlag from GridAnimal02 order by bspecies desc
)b on u.id=b.id 
left join 
(
	select top 220 id, 1 mspeciesFlag from GridAnimal02 order by mspecies desc
) c on u.id=c.id 

select * from hotspot02

alter table hotspot02 add pmb int

update hotspot02 set pmb=1 where speciesFlag=1

update hotspot02 set pmb=2 where speciesFlag is null and bspeciesFlag=1

update hotspot02 set pmb=3 where speciesFlag is null and bspeciesFlag is null and mspeciesFlag=1



---cover03

select u.id, speciesFlag, bspeciesFlag, mspeciesFlag into HotSpot03 from 
(
	select id from (select top 90 id, species from GridSpecies03 order by species desc) aa
	union 
	select id from (select top 90 id, bspecies from GridAnimal03 order by bspecies desc) bb
	union
	select id from (select top 90 id, mspecies from GridAnimal03 order by mspecies desc) cc
) u
 left join 
(
	select top 90 id, 1 speciesFlag from GridSpecies03 order by species desc
) a on u.id=a.id 
left join 
(
	select top 90 id, 1 bspeciesFlag from GridAnimal03 order by bspecies desc
)b on u.id=b.id 
left join 
(
	select top 90 id, 1 mspeciesFlag from GridAnimal03 order by mspecies desc
) c on u.id=c.id 

select * from hotspot03

alter table hotspot03 add pmb int

update hotspot03 set pmb=1 where speciesFlag=1

update hotspot03 set pmb=2 where speciesFlag is null and bspeciesFlag=1

update hotspot03 set pmb=3 where speciesFlag is null and bspeciesFlag is null and mspeciesFlag=1


---cover04
select u.id, speciesFlag, bspeciesFlag, mspeciesFlag into HotSpot04 from 
(
	select id from (select top 50 id, species from GridSpecies04 order by species desc) aa
	union 
	select id from (select top 50 id, bspecies from GridAnimal04 order by bspecies desc) bb
	union
	select id from (select top 50 id, mspecies from GridAnimal04 order by mspecies desc) cc
) u
 left join 
(
	select top 50 id, 1 speciesFlag from GridSpecies04 order by species desc
) a on u.id=a.id 
left join 
(
	select top 50 id, 1 bspeciesFlag from GridAnimal04 order by bspecies desc
)b on u.id=b.id 
left join 
(
	select top 50 id, 1 mspeciesFlag from GridAnimal04 order by mspecies desc
) c on u.id=c.id 

select * from hotspot04

alter table hotspot04 add pmb int

update hotspot04 set pmb=1 where speciesFlag=1

update hotspot04 set pmb=2 where speciesFlag is null and bspeciesFlag=1

update hotspot04 set pmb=3 where speciesFlag is null and bspeciesFlag is null and mspeciesFlag=1



---cover05
select u.id, speciesFlag, bspeciesFlag, mspeciesFlag into HotSpot05 from 
(
	select id from (select top 32 id, species from GridSpecies05 order by species desc) aa
	union 
	select id from (select top 32 id, bspecies from GridAnimal05 order by bspecies desc) bb
	union
	select id from (select top 32 id, mspecies from GridAnimal05 order by mspecies desc) cc
) u
 left join 
(
	select top 32 id, 1 speciesFlag from GridSpecies05 order by species desc
) a on u.id=a.id 
left join 
(
	select top 32 id, 1 bspeciesFlag from GridAnimal05 order by bspecies desc
)b on u.id=b.id 
left join 
(
	select top 32 id, 1 mspeciesFlag from GridAnimal05 order by mspecies desc
) c on u.id=c.id 

select * from hotspot05

alter table hotspot05 add pmb int

update hotspot05 set pmb=1 where speciesFlag=1

update hotspot05 set pmb=2 where speciesFlag is null and bspeciesFlag=1

update hotspot05 set pmb=3 where speciesFlag is null and bspeciesFlag is null and mspeciesFlag=1


---cover06
select u.id, speciesFlag, bspeciesFlag, mspeciesFlag into HotSpot06 from 
(
	select id from (select top 22 id, species from GridSpecies06 order by species desc) aa
	union 
	select id from (select top 22 id, bspecies from GridAnimal06 order by bspecies desc) bb
	union
	select id from (select top 22 id, mspecies from GridAnimal06 order by mspecies desc) cc
) u
 left join 
(
	select top 22 id, 1 speciesFlag from GridSpecies06 order by species desc
) a on u.id=a.id 
left join 
(
	select top 22 id, 1 bspeciesFlag from GridAnimal06 order by bspecies desc
)b on u.id=b.id 
left join 
(
	select top 22 id, 1 mspeciesFlag from GridAnimal06 order by mspecies desc
) c on u.id=c.id 

select * from hotspot06

alter table hotspot06 add pmb int

update hotspot06 set pmb=1 where speciesFlag=1

update hotspot06 set pmb=2 where speciesFlag is null and bspeciesFlag=1

update hotspot06 set pmb=3 where speciesFlag is null and bspeciesFlag is null and mspeciesFlag=1


---cover07
select u.id, speciesFlag, bspeciesFlag, mspeciesFlag into HotSpot07 from 
(
	select id from (select top 16 id, species from GridSpecies07 order by species desc) aa
	union 
	select id from (select top 16 id, bspecies from GridAnimal07 order by bspecies desc) bb
	union
	select id from (select top 16 id, mspecies from GridAnimal07 order by mspecies desc) cc
) u
 left join 
(
	select top 16 id, 1 speciesFlag from GridSpecies07 order by species desc
) a on u.id=a.id 
left join 
(
	select top 16 id, 1 bspeciesFlag from GridAnimal07 order by bspecies desc
)b on u.id=b.id 
left join 
(
	select top 16 id, 1 mspeciesFlag from GridAnimal07 order by mspecies desc
) c on u.id=c.id 

select * from hotspot07

alter table hotspot07 add pmb int

update hotspot07 set pmb=1 where speciesFlag=1

update hotspot07 set pmb=2 where speciesFlag is null and bspeciesFlag=1

update hotspot07 set pmb=3 where speciesFlag is null and bspeciesFlag is null and mspeciesFlag=1


---cover08
select u.id, speciesFlag, bspeciesFlag, mspeciesFlag into HotSpot08 from 
(
	select id from (select top 12 id, species from GridSpecies08 order by species desc) aa
	union 
	select id from (select top 12 id, bspecies from GridAnimal08 order by bspecies desc) bb
	union
	select id from (select top 12 id, mspecies from GridAnimal08 order by mspecies desc) cc
) u
 left join 
(
	select top 12 id, 1 speciesFlag from GridSpecies08 order by species desc
) a on u.id=a.id 
left join 
(
	select top 12 id, 1 bspeciesFlag from GridAnimal08 order by bspecies desc
)b on u.id=b.id 
left join 
(
	select top 12 id, 1 mspeciesFlag from GridAnimal08 order by mspecies desc
) c on u.id=c.id 

select * from hotspot08

alter table hotspot08 add pmb int

update hotspot08 set pmb=1 where speciesFlag=1

update hotspot08 set pmb=2 where speciesFlag is null and bspeciesFlag=1

update hotspot08 set pmb=3 where speciesFlag is null and bspeciesFlag is null and mspeciesFlag=1


---cover09
select u.id, speciesFlag, bspeciesFlag, mspeciesFlag into HotSpot09 from 
(
	select id from (select top 10 id, species from GridSpecies09 order by species desc) aa
	union 
	select id from (select top 10 id, bspecies from GridAnimal09 order by bspecies desc) bb
	union
	select id from (select top 10 id, mspecies from GridAnimal09 order by mspecies desc) cc
) u
 left join 
(
	select top 10 id, 1 speciesFlag from GridSpecies09 order by species desc
) a on u.id=a.id 
left join 
(
	select top 10 id, 1 bspeciesFlag from GridAnimal09 order by bspecies desc
)b on u.id=b.id 
left join 
(
	select top 10 id, 1 mspeciesFlag from GridAnimal09 order by mspecies desc
) c on u.id=c.id 

select * from hotspot09

alter table hotspot09 add pmb int

update hotspot09 set pmb=1 where speciesFlag=1

update hotspot09 set pmb=2 where speciesFlag is null and bspeciesFlag=1

update hotspot09 set pmb=3 where speciesFlag is null and bspeciesFlag is null and mspeciesFlag=1


---cover10
select u.id, speciesFlag, bspeciesFlag, mspeciesFlag into HotSpot10 from 
(
	select id from (select top 8 id, species from GridSpecies10 order by species desc) aa
	union 
	select id from (select top 8 id, bspecies from GridAnimal10 order by bspecies desc) bb
	union
	select id from (select top 8 id, mspecies from GridAnimal10 order by mspecies desc) cc
) u
 left join 
(
	select top 8 id, 1 speciesFlag from GridSpecies10 order by species desc
) a on u.id=a.id 
left join 
(
	select top 8 id, 1 bspeciesFlag from GridAnimal10 order by bspecies desc
)b on u.id=b.id 
left join 
(
	select top 8 id, 1 mspeciesFlag from GridAnimal10 order by mspecies desc
) c on u.id=c.id 

select * from hotspot10

alter table hotspot10 add pmb int

update hotspot10 set pmb=1 where speciesFlag=1

update hotspot10 set pmb=2 where speciesFlag is null and bspeciesFlag=1

update hotspot10 set pmb=3 where speciesFlag is null and bspeciesFlag is null and mspeciesFlag=1

-----------------------------------------------------------------------------------------------------------
hotspot保护的物种数量

---hotspot01
select * from hotspot123

select count(distinct(plant_id)) from PlantCountyAltitudeValidResultdistinct where id in (select grid from hotspot123 where pspeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult where animal_id < 1000 and id in (select grid from hotspot123 where bSpeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult where animal_id > 1000 and id in (select grid from hotspot123 where mSpeciesFlag = 1 )


select count(distinct(plant_id)) from PlantCountyAltitudeValidResult where id in (select grid from hotspot123 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult where animal_id < 1000 and id in (select grid from hotspot123)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult where animal_id > 1000 and id in (select grid from hotspot123)



--hotspot02
select * from hotspot02

select top 1 * from PlantCountyAltitudeValidResult

select top 1 * from AnimalCountyAltitudeValidResult

select count(distinct(plant_id)) from PlantCountyAltitudeValidResult02 where id in (select id from hotspot02 where speciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult02 where animal_id < 1000 and id in (select id from hotspot02 where bSpeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult02 where animal_id > 1000 and id in (select id from hotspot02 where mSpeciesFlag = 1 )


select count(distinct(plant_id)) from PlantCountyAltitudeValidResult02 where id in (select id from hotspot02 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult02 where animal_id < 1000 and id in (select id from hotspot02)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult02 where animal_id > 1000 and id in (select id from hotspot02)


---hotspot03

select count(distinct(plant_id)) from PlantCountyAltitudeValidResult03 where id in (select id from hotspot03 where speciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult03 where animal_id < 1000 and id in (select id from hotspot03 where bSpeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult03 where animal_id > 1000 and id in (select id from hotspot03 where mSpeciesFlag = 1 )


select count(distinct(plant_id)) from PlantCountyAltitudeValidResult03 where id in (select id from hotspot03 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult03 where animal_id < 1000 and id in (select id from hotspot03)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult03 where animal_id > 1000 and id in (select id from hotspot03)



---hotspot04
select count(distinct(plant_id)) from PlantCountyAltitudeValidResult04 where id in (select id from hotspot04 where speciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult04 where animal_id < 1000 and id in (select id from hotspot04 where bSpeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult04 where animal_id > 1000 and id in (select id from hotspot04 where mSpeciesFlag = 1 )


select count(distinct(plant_id)) from PlantCountyAltitudeValidResult04 where id in (select id from hotspot04 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult04 where animal_id < 1000 and id in (select id from hotspot04)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult04 where animal_id > 1000 and id in (select id from hotspot04)




---hotspot05
select count(distinct(plant_id)) from PlantCountyAltitudeValidResult05 where id in (select id from hotspot05 where speciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult05 where animal_id < 1000 and id in (select id from hotspot05 where bSpeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult05 where animal_id > 1000 and id in (select id from hotspot05 where mSpeciesFlag = 1 )


select count(distinct(plant_id)) from PlantCountyAltitudeValidResult05 where id in (select id from hotspot05 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult05 where animal_id < 1000 and id in (select id from hotspot05)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult05 where animal_id > 1000 and id in (select id from hotspot05)


---hotspot06
select count(distinct(plant_id)) from PlantCountyAltitudeValidResult06 where id in (select id from hotspot06 where speciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult06 where animal_id < 1000 and id in (select id from hotspot06 where bSpeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult06 where animal_id > 1000 and id in (select id from hotspot06 where mSpeciesFlag = 1 )


select count(distinct(plant_id)) from PlantCountyAltitudeValidResult06 where id in (select id from hotspot06 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult06 where animal_id < 1000 and id in (select id from hotspot06)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult06 where animal_id > 1000 and id in (select id from hotspot06)


---hotspot07
select count(distinct(plant_id)) from PlantCountyAltitudeValidResult07 where id in (select id from hotspot07 where speciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult07 where animal_id < 1000 and id in (select id from hotspot07 where bSpeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult07 where animal_id > 1000 and id in (select id from hotspot07 where mSpeciesFlag = 1 )


select count(distinct(plant_id)) from PlantCountyAltitudeValidResult07 where id in (select id from hotspot07 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult07 where animal_id < 1000 and id in (select id from hotspot07)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult07 where animal_id > 1000 and id in (select id from hotspot07)



---hotspot08
select count(distinct(plant_id)) from PlantCountyAltitudeValidResult08 where id in (select id from hotspot08 where speciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult08 where animal_id < 1000 and id in (select id from hotspot08 where bSpeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult08 where animal_id > 1000 and id in (select id from hotspot08 where mSpeciesFlag = 1 )


select count(distinct(plant_id)) from PlantCountyAltitudeValidResult08 where id in (select id from hotspot08)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult08 where animal_id < 1000 and id in (select id from hotspot08)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult08 where animal_id > 1000 and id in (select id from hotspot08)


---hotspot09
select count(distinct(plant_id)) from PlantCountyAltitudeValidResult09 where id in (select id from hotspot09 where speciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult09 where animal_id < 1000 and id in (select id from hotspot09 where bSpeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult09 where animal_id > 1000 and id in (select id from hotspot09 where mSpeciesFlag = 1 )


select count(distinct(plant_id)) from PlantCountyAltitudeValidResult09 where id in (select id from hotspot09)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult09 where animal_id < 1000 and id in (select id from hotspot09)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult09 where animal_id > 1000 and id in (select id from hotspot09)


---hotspot10
select count(distinct(plant_id)) from PlantCountyAltitudeValidResult10 where id in (select id from hotspot10 where speciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult10 where animal_id < 1000 and id in (select id from hotspot10 where bSpeciesFlag = 1 )

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult10 where animal_id > 1000 and id in (select id from hotspot10 where mSpeciesFlag = 1 )


select count(distinct(plant_id)) from PlantCountyAltitudeValidResult10 where id in (select id from hotspot10)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult10 where animal_id < 1000 and id in (select id from hotspot10)

select count(distinct(animal_id)) from AnimalCountyAltitudeValidResult10 where animal_id > 1000 and id in (select id from hotspot10)


-----------------------------------------------
--计算植物quartile1-4的热点地区
select id into hotSpotQuartile from gridSpeciesQuartile01


--alter table hotSpotQuartile add Q1 int
--alter table hotSpotQuartile add Q2 int
--alter table hotSpotQuartile add Q3 int
--alter table hotSpotQuartile add Q4 int

update hotSpotQuartile set Q1 = 1 
from hotSpotQuartile a, 
(
select top 850 id from gridSpeciesQuartile01 order by species desc
) b
where a.id = b.id 
----------------------------------------
update hotSpotQuartile set Q2 = 1 
from hotSpotQuartile a, 
(
select top 850 id from gridSpeciesQuartile02 order by species desc
) b
where a.id = b.id 
----------------------------------------
update hotSpotQuartile set Q3 = 1 
from hotSpotQuartile a, 
(
select top 850 id from gridSpeciesQuartile03 order by species desc
) b
where a.id = b.id 
---------------------------------------
update hotSpotQuartile set Q4 = 1 
from hotSpotQuartile a, 
(
select top 850 id from gridSpeciesQuartile04 order by species desc
) b
where a.id = b.id 