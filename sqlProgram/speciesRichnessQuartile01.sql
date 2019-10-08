
--programme first

--update M_Plant set lowAltitude=-10000,highAltitude=-10000 where lowAltitude is null
--select * from M_Plant where lowAltitude=-10000

--programme second
--update M_Plant set lowAltitude=lowAltitude-50,highAltitude=highAltitude+50 where lowAltitude=highAltitude

--programme third -- 不再计算多海拔信息
select * from distinctPlantCounty
select * from distinctPlantCounty02
*/
select plant_id,county_code,lowAltitude,highAltitude into distinctPlantCounty02 from
( 
	--取单海拔
	select M_Plant.id plant_id,w.county_code,M_Plant.lowAltitude,M_Plant.highAltitude from M_Plant left join 
	(
		--取county和area中的county
		select distinct(plant_id) plant_id ,distribution county_code from plantCounty where distribution in (select code from m_county) and plant_id not in (select plant_id from MultiAltitude)
		union
		select distinct( a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution = b.area_id and a.distribution in (select id from m_area) and a.plant_id not in (select plant_id from MultiAltitude)
                --select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution = b.area_id and a.plant_id not in (select plant_id from MultiAltitude)
                --select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution in (select id from m_area) and a.plant_id not in (select plant_id from MultiAltitude)
	) as w on M_Plant.id = w.plant_id  
	--取多海拔
	/*union 
	(
		--取county和area中的county
		select plant_id ,distribution county_Code ,lowAltitude,highAltitude from MultiAltitude where distribution in (select code from m_county)
		union  
                select a.plant_id,b.county_Code county_Code, a.lowAltitude,a.highAltitude from MultiAltitude a,areaToCounty b where a.distribution =b.area_id
	) */
) as z

--validate
--select * from plantCounty where plant_id = 1539
--select * from plantCounty where plant_id = 230
--select a.plant_id, a.cnName, b.area, b.id from plantCounty a, m_area b where a.distribution = b.id and a.plant_id = 1539
--select a.plant_id, a.cnName, b.area, b.id from plantCounty a, m_area b where a.distribution = b.id and a.plant_id = 230
--select plant_id,cnName from plantCounty group by plant_id,cnName having count(distribution) < 2

--select distinct(county_code) from distinctPlantCounty where plant_id = 1539
--select distinct(county_code) from distinctPlantCounty where plant_id = 230
--select distinct(county_code) from areaToCounty where area_id = 73
--select county_code from areaToCounty where area_id = 73
--select area_id,county_code from areaToCounty group by area_id,county_code having count(id) > 1

--select * from distinctPlantCounty where plant_id = 230

--programme forth
select * from m_grid
select * from grid02
--drop table PlantCountyAltitudeResultQuartile01
--m_grid 表的county 和 piaoCountyCode 的id关联， piaoCountyCode 的 code (邮政编码) 和 distinctPlantCounty的 county_code 邮政编码 关联 所以 distinctPlantCounty就和m_grid建立的联系
select b.Id, a.plant_id, a.county_code,a.lowAltitude PlantLowAltitude,a.highAltitude PlantHighAltitude,b.altitude_min GridAltitudeMin,b.altitude_max GridAltitudeMax into PlantCountyAltitudeResultQuartile01
from distinctPlantCounty02 a ,m_grid b, m_plant c, piaoCountyCode d
where a.plant_id=c.id and b.county=d.Id and d.code = a.county_code and c.culAndWildFlag=1 and c.quartile=1

--programme fifth 得到PlantCountyAltitudeValidResult，根据海拔信息过滤出有效数据

--select * into PlantCountyAltitudeValidResult from PlantCountyAltitudeResult where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) or (altitude_min<=lowAltitude and altitude_max>= highAltitude ))

select * into PlantCountyAltitudeValidResultQuartile01 from PlantCountyAltitudeResultQuartile01 
where 
(	PlantLowAltitude < -8000 
	or (GridAltitudeMin >= PlantLowAltitude and GridAltitudeMin <= PlantHighAltitude ) 
	or (GridAltitudeMax >= PlantLowAltitude and GridAltitudeMax <= PlantHighAltitude ) 
	or (GridAltitudeMin <= PlantLowAltitude and GridAltitudeMax >= PlantHighAltitude )
)


--programme sixth	

CREATE INDEX PlantCountyAltitudeValidResultQuartile01_Plant_id ON PlantCountyAltitudeValidResultQuartile01 (plant_id)
CREATE INDEX PlantCountyAltitudeValidResultQuartile01_Id ON PlantCountyAltitudeValidResultQuartile01 (Id)

select Id,count(distinct(plant_id)) Species,count(distinct(cnFamily)) Family,count(distinct(cnGenus)) Genus into a0  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id) w group by w.Id 
select Id,count(distinct(plant_id)) Species12,count(distinct(cnFamily)) Family12,count(distinct(cnGenus)) Genus12 into a1  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and (b.yearCode ='2' or b.yearCode ='1')) w group by w.Id 
select Id,count(distinct(plant_id)) Species3,count(distinct(cnFamily)) Family3,count(distinct(cnGenus)) Genus3 into a2  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and b.yearCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesWoody,count(distinct(cnFamily)) FamilyWoody,count(distinct(cnGenus)) GenusWoody into a3  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and (b.typeCode ='1' or b.typeCode ='3')) w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesHerb,count(distinct(cnFamily)) FamilyHerb,count(distinct(cnGenus)) GenusHerb into a4  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and (b.typeCode ='2' or b.typeCode ='4')) w group by w.Id
select Id,count(distinct(plant_id)) SpeciesFern,count(distinct(cnFamily)) FamilyFern,count(distinct(cnGenus)) GenusFern into a5  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and b.menCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesGym,count(distinct(cnFamily)) FamilyGym,count(distinct(cnGenus)) GenusGym into a6  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and b.menCode ='2') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesAng,count(distinct(cnFamily)) FamilyAng,count(distinct(cnGenus)) GenusAng into a7  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and b.menCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesDan,count(distinct(cnFamily)) FamilyDan,count(distinct(cnGenus)) GenusDan into a8 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and b.endangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesEph,count(distinct(cnFamily)) FamilyEph,count(distinct(cnGenus)) GenusEph into a9 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and b.ephemeralFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesEnd,count(distinct(cnFamily)) FamilyEnd,count(distinct(cnGenus)) GenusEnd into a10 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and b.endemismFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesXJDan,count(distinct(cnFamily)) FamilyXJDan ,count(distinct(cnGenus)) GenusXJDan into a11 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and b.xjEndangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesHal,count(distinct(cnFamily)) FamilyHal,count(distinct(cnGenus)) GenusHal into a12 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultQuartile01 a,M_Plant b where a.plant_id=b.id and b.halophilousFlag ='1') w group by w.Id 
			


CREATE INDEX plant_ida0   ON a0  (species)
CREATE INDEX plant_ida1   ON a1  (species12)
CREATE INDEX plant_ida2   ON a2  (species3)
CREATE INDEX plant_ida3   ON a3  (specieswoody)
CREATE INDEX plant_ida4   ON a4  (speciesherb)
CREATE INDEX plant_ida5   ON a5  (speciesfern)
CREATE INDEX plant_ida6   ON a6  (speciesgym)
CREATE INDEX plant_ida7   ON a7  (speciesang)
CREATE INDEX plant_ida8   ON a8  (speciesdan)
CREATE INDEX plant_ida9   ON a9  (specieseph)
CREATE INDEX plant_ida10  ON a10 (speciesend)
CREATE INDEX plant_ida11  ON a11 (speciesxjdan)
CREATE INDEX plant_ida12  ON a12 (specieshal)


select z.id as id, a0.species,a0.genus,a0.family,a1.species12,a1.genus12,a1.family12,a2.species3,a2.genus3,a2.family3,
a3.specieswoody,a3.genuswoody,a3.familywoody,a4.speciesherb,a4.genusherb,a4.familyherb,a5.speciesfern,a5.genusfern,a5.familyfern,
a6.speciesGym,a6.genusGym,a6.familygym,a7.speciesAng,a7.genusAng,a7.familyAng,a8.speciesDan,a8.genusDan,a8.familyDan,
a9.speciesEph,a9.genusEph,a9.familyEph,a10.speciesEnd,a10.genusEnd,a10.familyEnd,a11.speciesxjDan,a11.genusxjDan,a11.familyxjDan,
a12.speciesHal,a12.genusHal,a12.familyHal
into GridSpeciesQuartile01 from m_grid z	
left join a0  on z.id=a0.id
left join a1  on z.id=a1.id
left join a2  on z.id=a2.id
left join a3  on z.id=a3.id
left join a4  on z.id=a4.id
left join a5  on z.id=a5.id
left join a6  on z.id=a6.id
left join a7  on z.id=a7.id
left join a8  on z.id=a8.id
left join a9  on z.id=a9.id
left join a10 on z.id=a10.id
left join a11 on z.id=a11.id
left join a12 on z.id=a12.id
order by z.id

select * from GridSpeciesQuartile01



统计总物种数
select count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b,m_grid c where a.plant_id=b.id and a.id= c.id) w
统计各区域物种数
select lastRegion,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus, c.lastRegion from PlantCountyAltitudeValidResult02 a,M_Plant b,m_grid c where a.plant_id=b.id and a.id= c.id) w group by w.lastRegion 

统计山区和盆地物种数
--select count(distinct(plant_id)) plant,count(distinct(cnFamily)) Family ,count(distinct(cnGenus)) Genus from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b,m_grid c where a.plant_id=b.id and a.id= c.id and (c.lastregion =1 or c.lastregion =2 or c.lastregion =3 or c.lastregion = 4)) w 
select count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b,m_grid c where a.plant_id=b.id and a.id= c.id and c.lastregion in(1,2,3,4) ) w
select count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b,m_grid c where a.plant_id=b.id and a.id= c.id and c.lastregion in(5,6,7) ) w


-----animal-----
--programme first
/*
select animal_id,county_code into distinctAnimalCounty from (
select a.animal_id,b.county_code from AnimalCounty a,areaToCounty b where a.distribution =b.area_id
union 
select animal_id,distribution county_code from AnimalCounty where distribution in (select code from M_County)
) as ta

--validate
select * from AnimalCounty where animal_id = 202
select * from AnimalCounty where animal_id = 11
select * from AnimalCounty where animal_id in 
(
select animal_id from AnimalCounty group by animal_id,cnName having count(distribution) < 2
)

select animal_id,cnName from AnimalCounty group by animal_id,cnName having count(distribution) < 2
select a.animal_id, a.cnName, b.area, b.id from AnimalCounty a, m_area b where a.distribution = b.id and a.animal_id = 202
select a.animal_id, a.cnName, b.area, b.id from AnimalCounty a, m_area b where a.distribution = b.id and a.animal_id = 11

select distinct(county_code) from areaToCounty where area_id = 46
select distinct(county_Code) from distinctAnimalCounty where animal_id = 202

select distinct(county_Code) from distinctAnimalCounty where animal_id = 11
*/

--programme second

--update M_Animal set lowAltitude=-10000,highAltitude=-10000 where lowAltitude is null
--select * from M_Animal where lowAltitude=-10000

--programme third
--update M_Animal set lowAltitude=lowAltitude-50,highAltitude=highAltitude+50 where lowAltitude=highAltitude


--programme forth
/*
select a.animal_id,a.county_code,b.lowAltitude,b.highAltitude,c.Id,c.altitude_min,c.altitude_max into AnimalCountyAltitudeResult
from distinctAnimalCounty a ,M_Animal b,M_Grid c,piaoCountyCode d,M_County e 
where a.animal_id=b.id and c.county=d.Id and d.code =e.code and e.code=a.county_code 

--validate

validate
select * from M_Animal where id = 11
select * from AnimalCounty where animal_id= 11
select distinct(county_Code) from AnimalCountyAltitudeResult where animal_id = 11
select distinct(county_code) from areaToCounty where area_id = 46

select * from AnimalCountyAltitudeResult where animal_id = 202
select * from m_grid c,piaoCountyCode d where c.county=d.Id and d.code = '653223'

*/
--select * from AnimalCountyAltitudeResult

--programme fifth

--select * into AnimalCountyAltitudeValidResult from AnimalCountyAltitudeResult where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) or (altitude_min<=lowAltitude and altitude_max>= highAltitude ))
                                                                                

--programme sixth
select top 1000 * from AnimalCountyAltitudeValidResult
select * from M_animal

select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani1 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani2 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='b') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani3 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m' and b.endangeredFlag = '1') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani4 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='b' and b.endangeredFlag = '1') c group by c.Id

--select region,Id,count(distinct(cnName)),count(distinct(cnFamily)),count(distinct(cnGenus)) from (select d.lastregion,a.id,a.cnName,b.cnFamily,b.cnGenus from animalCountyAltitudeValidResult a,M_animal b,m_grid d where a.cnName=b.cnName and a.Id=d.id) w group by w.region,w.Id order by w.region

validate

select count(distinct(animal_id)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 26468
select count(distinct(cnFamily)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 26468
select count(distinct(cnOrder)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 26468

select count(distinct(animal_id)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 33408
select count(distinct(cnFamily)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 33408
select count(distinct(cnOrder)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 33408

select  * from ani1 

CREATE INDEX ani1   ON ani1  (id)
CREATE INDEX ani2   ON ani2  (id)
CREATE INDEX ani3   ON ani3  (id)
CREATE INDEX ani4   ON ani4  (id)

select z.*,ani2.*,ani3.*,ani4.* from ani1 z
left join ani2  on z.id=ani2.id
left join ani3 on z.id=ani3.id
left join ani4 on z.id=ani4.id
order by z.id


统计总物种数
select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='m') w  
select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='b') w 
统计各区域物种数
select lastRegion,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder, c.lastRegion from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='m') w group by w.lastRegion 
select lastRegion,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder, c.lastRegion from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='b') w group by w.lastRegion 

统计山区和盆地物种数
select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='m' and c.lastregion in(1,2,3,4)) w  
select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='b' and c.lastregion in(1,2,3,4)) w  

select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='m' and c.lastregion in(5,6,7)) w  
select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='b' and c.lastregion in(5,6,7)) w  


直接从主表中统计物种数(与上述的链表查询结果不同，可能某些物种没有分布区)
select distinct(cnfamily) from m_animal where speciesFlag='m'
select distinct(cnname) from m_plant where culandwildflag ='1' and id <5000


select * from M_Plant where id not in (select plant_id from plantcounty) and m_plant.culandwildflag = 1

select id,lastregion from m_grid order by id
 