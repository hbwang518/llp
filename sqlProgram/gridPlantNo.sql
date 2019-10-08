
--programme first
--为了每个样方都有一个海拔信息，已执行过
--update M_Plant set lowAltitude=-10000,highAltitude=-10000 where lowAltitude is null
--select * from M_Plant where lowAltitude=-10000

--programme second
--为了有一个海拔差，已执行过
--update M_Plant set lowAltitude=lowAltitude-50,highAltitude=highAltitude+50 where lowAltitude=highAltitude

--programme third， 得到plant和County的对照表
select * from distinctPlantCounty
*/
select plant_id,county_code,lowAltitude,highAltitude into  distinctPlantCounty from
( 
	--取单海拔
	select M_Plant.id plant_id,w.county_code,M_Plant.lowAltitude,M_Plant.highAltitude from M_Plant left join 
	(
		--取county和area中的county
		select distinct(plant_id) plant_id ,distribution county_code from plantCounty where distribution in (select code from m_county) and plant_id not in (select plant_id from MultiAltitude)
		union
		select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution in (select id from m_area) and a.plant_id not in (select plant_id from MultiAltitude)
	) as w on M_Plant.id = w.plant_id  
	--取多海拔
	union 
	(
		--取county和area中的county
		select plant_id ,distribution county_Code ,lowAltitude,highAltitude from MultiAltitude where distribution in (select code from m_county)
		union  
                select a.plant_id,b.county_Code county_Code, a.lowAltitude,a.highAltitude from MultiAltitude a,areaToCounty b where a.distribution =b.area_id
	) 
) as z

--programme forth
--得到plant，county，海拔和m_Grid的对照表， piaoCountyCode为County和m_grid的对照表
/*
select a.plant_id,a.county_code,a.lowAltitude,a.highAltitude,c.Id,c.altitude_min,c.altitude_max into PlantCountyAltitudeResult
from distinctPlantCounty a ,M_Plant b,m_grid c,piaoCountyCode d,M_county e 
where a.plant_id=b.id and c.county=d.Id and d.code =e.code and e.code=a.county_code and b.culAndWildFlag=1 
*/
--select * from PlantCountyAltitudeResult

--programme fifth
--取得有效的plant，county，海拔和m_Grid的对照表
--select * into PlantCountyAltitudeValidResult from PlantCountyAltitudeResult where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) or (altitude_min<=lowAltitude and altitude_max>= highAltitude ))

--select * from PlantCountyAltitudeResult where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) or (altitude_min<=lowAltitude and altitude_max>= highAltitude ))



--programme sixth	

CREATE INDEX PlantCountyAltitudeValidResult ON PlantCountyAltitudeValidResult  (plant_id)
CREATE INDEX plant   ON M_Plant  (id)

select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a0  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a1  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.yearCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a2  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.yearCode ='2') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a3  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.yearCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a4  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and (b.typeCode ='1' or b.typeCode ='3')) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a5  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and (b.typeCode ='2' or b.typeCode ='4')) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a6  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.typeCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a7  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a8  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='2') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a9  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a10 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.endangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a11 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.ephemeralFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a12 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.endemismFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a13 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.xjEndangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a14 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.halophilousFlag ='1') w group by w.Id 
																												 
CREATE INDEX plant_ida0   ON a0  (plant_id)
CREATE INDEX plant_ida1   ON a1  (plant_id)
CREATE INDEX plant_ida2   ON a2  (plant_id)
CREATE INDEX plant_ida3   ON a3  (plant_id)
CREATE INDEX plant_ida4   ON a4  (plant_id)
CREATE INDEX plant_ida5   ON a5  (plant_id)
CREATE INDEX plant_ida6   ON a5  (plant_id)
CREATE INDEX plant_ida7   ON a7  (plant_id)
CREATE INDEX plant_ida8   ON a8  (plant_id)
CREATE INDEX plant_ida9   ON a7  (plant_id)
CREATE INDEX plant_ida10  ON a10 (plant_id)
CREATE INDEX plant_ida11  ON a11 (plant_id)
CREATE INDEX plant_ida12  ON a12 (plant_id)
CREATE INDEX plant_ida13  ON a13 (plant_id)
CREATE INDEX plant_ida14  ON a14 (plant_id)
	
 select z.id as id, a0.*,a1.*,a2.*,a3.*,a4.*,a5.*,a6.*,a7.*,a8.*,a9.*,a10.*,a11.*,a12.*,a13.*,a14.* from m_grid z	
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
left join a13 on z.id=a13.id
left join a14 on z.id=a14.id
order by z.id

select z.id as id, a1.*,a2.*,a3.* from m_grid z	

left join a1  on z.id=a1.id
left join a2  on z.id=a2.id
left join a3  on z.id=a3.id

order by z.id

select z.id as id, a0.* from m_grid z	
left join a0  on z.id=a0.id
order by z.id

select * from plantCounty where plant_id not in (select id from m_plant)
select * from plantCounty where plant_id =3094
select * from M_plant where id not in (select plant_id from plantCounty) and culAndWildFlag <> 2

select * from m_plant where typeCode > 4 or typeCode <1
select * from m_plant where menCode > 3 or menCode <1

select a.*,b.* from plantCounty a, M_plant b where a.plant_id = b.id and a.cnName <> b.cnName
--update plantCounty set cnName = a.cnName from plantCounty, M_plant a where plantCounty.plant_id = a.id and plantCounty.cnName <> a.cnName
--nurbay
--third
--select * into nurbayDistinctPlantCounty from distinctPlantCounty
--update nurbayDistinctPlantCounty set lowAltitude = a.lowAltitude ,highAltitude = a.highAltitude from nurbayDistinctPlantCounty b,nurbayAltitude a where b.lowAltitude < -8000 and b.highAltitude < -8000 and a.plant_id = b.plant_id
--SELECT DISTINCT(a.PLANT_ID) FROM nurbayDistinctPlantCounty a,m_plant b WHERE a.plant_id = b.id and a.lowAltitude < -8000 and a.highAltitude < -8000 and b.culAndWildFlag=1
--fourth
select a.plant_id,a.county_code,a.lowAltitude,a.highAltitude,c.Id,c.altitude_min,c.altitude_max into nurbayPlantCountyAltitudeResult
from nurbayDistinctPlantCounty a ,M_Plant b,m_grid c,piaoCountyCode d,M_county e 
where a.plant_id=b.id and c.county=d.Id and d.code =e.code and e.code=a.county_code and b.culAndWildFlag=1 
--fifth
--select * into nurbayPlantCountyAltitudeValidResult from nurbayPlantCountyAltitudeResult where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) or (altitude_min<=lowAltitude and altitude_max>= highAltitude ))
--sixth

CREATE INDEX nurbayPlantCountyAltitudeValidResult ON nurbayPlantCountyAltitudeValidResult  (plant_id)


select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa0  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa1  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.yearCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa2  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.yearCode ='2') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa3  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.yearCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa4  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and (b.typeCode ='1' or b.typeCode ='3')) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa5  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and (b.typeCode ='2' or b.typeCode ='4')) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa6  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.typeCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa7  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa8  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='2') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa9  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa10 from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.endangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa11 from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.ephemeralFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa12 from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.endemismFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa13 from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.xjEndangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa14 from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.halophilousFlag ='1') w group by w.Id 

CREATE INDEX plant_idaa0   ON aa0  (plant_id)
CREATE INDEX plant_idaa1   ON aa1  (plant_id)
CREATE INDEX plant_idaa2   ON aa2  (plant_id)
CREATE INDEX plant_idaa3   ON aa3  (plant_id)
CREATE INDEX plant_idaa4   ON aa4  (plant_id)
CREATE INDEX plant_idaa5   ON aa5  (plant_id)
CREATE INDEX plant_idaa6   ON aa6  (plant_id)
CREATE INDEX plant_idaa7   ON aa7  (plant_id)
CREATE INDEX plant_idaa8   ON aa8  (plant_id)
CREATE INDEX plant_idaa9   ON aa9  (plant_id)
CREATE INDEX plant_idaa10  ON aa10 (plant_id)
CREATE INDEX plant_idaa11  ON aa11 (plant_id)
CREATE INDEX plant_idaa12  ON aa12 (plant_id)
CREATE INDEX plant_idaa13  ON aa13 (plant_id)
CREATE INDEX plant_idaa14  ON aa14 (plant_id)

select z.id as id, aa0.*,aa1.*,aa2.*,aa3.*,aa4.*,aa5.*,aa6.*,aa7.*,aa8.*,aa9.*,aa10.*,aa11.*,aa12.*,aa13.*,aa14.* from m_grid z	
left join aa0  on z.id=aa0.id
left join aa1  on z.id=aa1.id
left join aa2  on z.id=aa2.id
left join aa3  on z.id=aa3.id
left join aa4  on z.id=aa4.id
left join aa5  on z.id=aa5.id
left join aa6  on z.id=aa6.id
left join aa7  on z.id=aa7.id
left join aa8  on z.id=aa8.id
left join aa9  on z.id=aa9.id
left join aa10 on z.id=aa10.id
left join aa11 on z.id=aa11.id
left join aa12 on z.id=aa12.id
left join aa13 on z.id=aa13.id
left join aa14 on z.id=aa14.id
order by z.id


select z.id as id, aa4.*,aa5.* from m_grid z	

left join aa4  on z.id=aa4.id
left join aa5  on z.id=aa5.id
order by z.id

--animal
--programme first
/*
select animal_id,county_code into distinctAnimalCounty from (
select distinct(a.animal_id),b.county_code from AnimalCounty a,areaToCounty b where a.distribution =b.area_id
union select distinct(animal_id),distribution county_code from AnimalCounty where distribution in (select code from M_County)
) as ta
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
*/
--select * from AnimalCountyAltitudeResult

--programme fifth

--select * into AnimalCountyAltitudeValidResult from AnimalCountyAltitudeResult where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) or (altitude_min<=lowAltitude and altitude_max>= highAltitude ) or (altitude_min>=lowAltitude and altitude_max<= highAltitude ))


--programme sixth
--select Id,count(distinct(cnName)),count(distinct(cnFamily)),count(distinct(cnOrder)) from (select a.Id,a.cnName,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,Animal b where a.cnName=b.cnName and b.speciesFlag='m') c group by c.Id
--select Id,count(distinct(cnName)),count(distinct(cnFamily)),count(distinct(cnOrder)) from (select a.Id,a.cnName,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,Animal b where a.cnName=b.cnName and b.speciesFlag='b') c group by c.Id
--select Id,count(distinct(cnName)),count(distinct(cnFamily)),count(distinct(cnOrder)) from (select a.Id,a.cnName,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,Animal b where a.cnName=b.cnName and b.speciesFlag='m' and b.endangeredFlag = '1') c group by c.Id
--select Id,count(distinct(cnName)),count(distinct(cnFamily)),count(distinct(cnOrder)) from (select a.Id,a.cnName,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,Animal b where a.cnName=b.cnName and b.speciesFlag='b' and b.endangeredFlag = '1') c group by c.Id
--select region,Id,count(distinct(cnName)),count(distinct(cnFamily)),count(distinct(cnGenus)) from (select d.region,a.gridNo,a.cnName,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b,piaoResult d where a.cnName=b.cnName and a.Id=d.id) w group by w.region,w.Id order by w.region


select z.id as id, a1.*,a2.*,a3.*,a4.* from m_grid z	
	left join 
		(
    		select Id,count(distinct(animal_id)) animal_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnorder)) cnorder from (select a.Id,b.id animal_id,b.cnFamily,b.cnOrder from animalCountyAltitudeValidResult a,M_animal b where a.animal_id=b.id and b.speciesflag= 'b') w group by w.Id 
		) as a1 on z.id=a1.id 
	left join 
		(
    		select Id,count(distinct(animal_id)) animal_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnorder)) cnorder from (select a.Id,b.id animal_id,b.cnFamily,b.cnOrder from animalCountyAltitudeValidResult a,M_animal b where a.animal_id=b.id and b.endangeredFlag ='1'and b.speciesflag= 'b') w group by w.Id 
		) as a2 on z.id=a2.id 
	left join 
		(
    		select Id,count(distinct(animal_id)) animal_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnorder)) cnorder from (select a.Id,b.id animal_id,b.cnFamily,b.cnOrder from animalCountyAltitudeValidResult a,M_animal b where a.animal_id=b.id and b.speciesflag= 'm') w group by w.Id 
		) as a3 on z.id=a3.id 
	left join 
		(
    		select Id,count(distinct(animal_id)) animal_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnorder)) cnorder from (select a.Id,b.id animal_id,b.cnFamily,b.cnOrder from animalCountyAltitudeValidResult a,M_animal b where a.animal_id=b.id and b.endangeredFlag ='1' and b.speciesflag= 'm') w group by w.Id 
		) as a4 on z.id=a4.id 





基础资料：统计栽培野生水生的科属种等资料
select plant_id from ephemeralplant group by plant_id having count(plant_id)>1


select count(distinct(cnname)),count(distinct(cngenus)),count(distinct(cnfamily)) from M_Plant where culandwildFlag=1 and id<7000
select count(distinct(cnname)),count(distinct(cngenus)),count(distinct(cnfamily)) from M_Plant where culandwildFlag=2
select count(distinct(cnname)),count(distinct(cngenus)),count(distinct(cnfamily)) from M_Plant where culandwildFlag=3
select count(distinct(cnname)),count(distinct(cngenus)),count(distinct(cnfamily)) from M_Plant where endangeredflag =1
select count(distinct(cnname)),count(distinct(cngenus)),count(distinct(cnfamily)) from M_Plant where xjendangeredflag =1
select count(distinct(id)),count(distinct(cngenus)),count(distinct(cnfamily)) from M_Plant where ephemeralflag is not null
select count(distinct(cnname)),count(distinct(cngenus)),count(distinct(cnfamily)) from M_Plant where endemismflag =1
select count(distinct(cnname)),count(distinct(cngenus)),count(distinct(cnfamily)) from M_Plant where halophilousFlag =1



select count(distinct(cnname)),count(distinct(cnorder)),count(distinct(cnfamily)) from M_animal where speciesFlag='b'
select count(distinct(cnname)),count(distinct(cnorder)),count(distinct(cnfamily)) from m_animal where speciesflag ='m'
select * from m_animal

select region,count(distinct(cnName)),count(distinct(cnFamily)),count(distinct(cnGenus)) from (select d.region,a.Id,a.cnName,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult1 a,M_Plant b,piaoResult d where a.cnName=b.cnName and a.Id=d.id) w group by w.region,w.Id order by w.region

select region,count(distinct(b.cnName)),count(distinct(b.cnFamily)),count(distinct(b.cnGenus)) from PlantCountyAltitudeValidResult1 a,M_Plant b,piaoResult d where a.cnName=b.cnName and a.Id=d.id group by D.region order by D.region

select region,count(distinct(b.cnName)),count(distinct(b.cnFamily)),count(distinct(b.cnorder)) from animalCountyAltitudeValidResult a,animal b,piaoResult d where a.cnName=b.cnName and a.Id=d.id and b.speciesflag= 'b' group by D.region order by D.region


对应样方的栅格号
select a.plot, b.id from xinjiangPlot.dbo.environment a,piaoResult b where a.longitude>b.lon and a.longitude<b.lon+0.1 and a.latitude>b.lat and a.latitude<b.lat+0.1
select a.*, b.* into tempplotclimate from xinjiangPlot.dbo.environment a,piaoResult b where a.longitude>=b.lon and a.longitude<b.lon+0.1 and a.latitude<=b.lat and a.latitude>b.lat-0.1 order by plot
select a.* from xinjiangPlot.dbo.environment a where plotno not in (select a.plotno from xinjiangPlot.dbo.environment a,piaoResult b where a.longitude>=b.lon and a.longitude<b.lon+0.1 and a.latitude<=b.lat and a.latitude>b.lat-0.1 ) 
select plot from xinjiangPlot.dbo.environment where plot not in (select plot from tempPlotClimate)
select * from xinjiangPlot.dbo.environment
select * from piaoresult where id =3019

--update piaoresult set mat=(te1+te2+te3+te4+te5+te6+te7+te8+te9+te10+te11+te12)/12,map=(ra1+ra2+ra3+ra4+ra5+ra6+ra7+ra8+ra9+ra10+ra11+ra12)/12,gst=(te5+te6+te7+te8+te9)/5,gsp=(ra5+ra6+ra7+ra8+ra9)/5

--update M_Prec set map=(prec1+prec2+prec3+prec4+prec5+prec6+prec7+prec8+prec9+prec10+prec11+prec12)*10,gsp=(prec5+prec6+prec7+prec8+prec9)*10
--update M_tmean set mat=(tmean1+tmean2+tmean3+tmean4+tmean5+tmean6+tmean7+tmean8+tmean9+tmean10+tmean11+tmean12)/12,gst=(tmean5+tmean6+tmean7+tmean8+tmean9)/5

--update M_Prec set prec1=prec1*10, prec2=prec2*10, prec3=prec3*10, prec4=prec4*10, prec5=prec5*10, prec6=prec6*10, prec7=prec7*10, prec8=prec8*10, prec9=prec9*10, prec10=prec10*10, prec11=prec11*10, prec12=prec12*10

select a.* from M_Prec a ,M_Grid b where a.id =b.id order by a.id
select a.* from M_tmean a ,M_Grid b where a.id =b.id order by a.id
select * from environment where longitude is null
select * from PlantCountyAltitudeValidResult where cnname ='雪岭云杉'


select * from plantCounty order by distribution
select * from  areaToCounty order by county_code 
update areaToCounty set county_code = 652301 where county_Code = '五家渠'

select * from  m_County where county like '%五家渠%' order by county_code 

select * from m_plant where cnname like '%毛冠黄%'


select a.county, a.region, a.altitude_mean,a.altitude_max, a.altitude_min, a.newregion, a.geomor, a.slope, a.chinasoilcode, a.ussoilcode, a.ph, a.aspectcode, b.*, c.*,d.* from M_Grid a, M_Climate b, M_Prec c, M_tmean d where a.id=b.id and b.id= c.id and c.id=d.id order by a.id

