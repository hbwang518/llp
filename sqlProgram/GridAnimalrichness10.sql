use speciesRichnessXinJiang
-----animal-----
--programme first
/*
select animal_id,county_code into distinctAnimalCounty from (
	select a.animal_id,b.county_code from AnimalCounty a,areaToCounty b where a.distribution =b.area_id
	union 
	select animal_id,distribution county_code from AnimalCounty where distribution in (select code from M_County)
) as ta
*/



--programme second

--update M_Animal set lowAltitude=-10000,highAltitude=-10000 where lowAltitude is null
--select * from M_Animal where lowAltitude=-10000

--programme third
--update M_Animal set lowAltitude=lowAltitude-50,highAltitude=highAltitude+50 where lowAltitude=highAltitude


--programme forth

select a.animal_id,a.county_code,b.lowAltitude,b.highAltitude,c.Id,c.altitude_min,c.altitude_max into AnimalCountyAltitudeResult10
from distinctAnimalCounty a ,M_Animal b,Grid10 c
where a.animal_id=b.id and c.county = a.county_code 



--programme fifth

select * into AnimalCountyAltitudeValidResult10 from AnimalCountyAltitudeResult10 
where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) 
or (altitude_min<=lowAltitude and altitude_max>= highAltitude ))
                                                                                

--programme sixth



select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani1 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult10 a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani2 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult10 a,M_Animal b where a.animal_id=b.id and b.speciesFlag='b') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani3 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult10 a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m' and b.endangeredFlag = '1') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani4 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult10 a,M_Animal b where a.animal_id=b.id and b.speciesFlag='b' and b.endangeredFlag = '1') c group by c.Id

--select region,Id,count(distinct(cnName)),count(distinct(cnFamily)),count(distinct(cnGenus)) from (select d.lastregion,a.id,a.cnName,b.cnFamily,b.cnGenus from animalCountyAltitudeValidResult a,M_animal b,m_grid d where a.cnName=b.cnName and a.Id=d.id) w group by w.region,w.Id order by w.region

CREATE INDEX ani1   ON ani1  (id)
CREATE INDEX ani2   ON ani2  (id)
CREATE INDEX ani3   ON ani3  (id)
CREATE INDEX ani4   ON ani4  (id)

select z.Id Id, Z.animal Mspecies, z.cnFamily Mfamily, z.cnOrder Morder,ani2.animal Bspecies,ani2.cnFamily Bfamily, ani2.cnOrder Border,
ani3.animal MDanspecies, ani3.cnFamily MDanfamily, ani3.cnOrder MDanorder,ani4.animal BDanspecies,ani4.cnFamily BDanfamily,ani4.cnOrder BDanorder into GridAnimalspecies10 from ani1 z
left join ani2  on z.id=ani2.id
left join ani3 on z.id=ani3.id
left join ani4 on z.id=ani4.id
order by z.id


统计总物种数
--select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='m') w  
--select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='b') w 
统计各区域物种数
--select lastRegion,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder, c.lastRegion from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='m') w group by w.lastRegion 
--select lastRegion,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder, c.lastRegion from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='b') w group by w.lastRegion 

统计山区和盆地物种数
--select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='m' and c.lastregion in(1,2,3,4)) w  
--select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='b' and c.lastregion in(1,2,3,4)) w  

--select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='m' and c.lastregion in(5,6,7)) w  
--select count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b,m_grid c where a.animal_id=b.id and a.id= c.id and b.speciesFlag='b' and c.lastregion in(5,6,7)) w  


直接从主表中统计物种数(与上述的链表查询结果不同，可能某些物种没有分布区)
--select distinct(cnfamily) from m_animal where speciesFlag='m'
--select distinct(cnname) from m_plant where culandwildflag ='1' and id <5000


--select * from M_Plant where id not in (select plant_id from plantcounty) and m_plant.culandwildflag = 1


 