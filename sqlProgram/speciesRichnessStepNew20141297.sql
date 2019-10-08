--增加海拔数据。
select * from altAdd
select * from M_Plant where lowAltitude<-9000,highAltitude=-10000


select a.*  from m_plant m,altAdd a
where m.id=a.id and (a.lowAltitude is not null or a.highAltitude is not null)
and a.lowAltitude is not null and a.highAltitude is null
--
对于低海拔是null高海拔不是null的数据将低海拔改为-5000,这样可以利用高海拔的数据
对于高海拔是null低海拔不是null的数据将高海拔改为5000,这样可以利用低海拔的数据
--update altAdd set lowAltitude=-5000 where lowAltitude is null and highAltitude is not null
--update altAdd set highAltitude=5000 where lowAltitude is not null and highAltitude is null

select m.* from m_plant m,altAdd a
where m.id=a.id and (a.lowAltitude is not null and a.highAltitude is not null) and m.lowAltitude < -8000

update m_plant set lowAltitude=a.lowAltitude, highAltitude=a.highAltitude from m_plant m,altAdd a
where m.id=a.id and a.lowAltitude is not null and a.highAltitude is not null and m.lowAltitude < -8000


select count(*) from m_plant
 


--programme first

--update M_Plant set lowAltitude=-10000,highAltitude=-10000 where lowAltitude is null
--select * from M_Plant where lowAltitude=-10000

--programme second
--update M_Plant set lowAltitude=lowAltitude-50,highAltitude=highAltitude+50 where lowAltitude=highAltitude

--programme third
select * from distinctPlantCounty
select * from MultiAltitude
*/
select plant_id,county_code,lowAltitude,highAltitude into distinctPlantCounty from
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
	union 
	(
		--取county和area中的county
		select plant_id ,distribution county_Code ,lowAltitude,highAltitude from MultiAltitude where distribution in (select code from m_county)
		union  
        select a.plant_id,b.county_Code county_Code, a.lowAltitude,a.highAltitude from MultiAltitude a,areaToCounty b where a.distribution =b.area_id
	) 
) as z

--validate
select * from plantCounty where plant_id = 1539
select * from plantCounty where plant_id = 230
select a.plant_id, a.cnName, b.area, b.id from plantCounty a, m_area b where a.distribution = b.id and a.plant_id = 1539
select a.plant_id, a.cnName, b.area, b.id from plantCounty a, m_area b where a.distribution = b.id and a.plant_id = 230
select plant_id,cnName from plantCounty group by plant_id,cnName having count(distribution) < 2

select distinct(county_code) from distinctPlantCounty where plant_id = 1539
select distinct(county_code) from distinctPlantCounty where plant_id = 230
select distinct(county_code) from areaToCounty where area_id = 73
select county_code from areaToCounty where area_id = 73
select area_id,county_code from areaToCounty group by area_id,county_code having count(id) > 1

select * from distinctPlantCounty where plant_id = 230

--programme forth
/*
--m_grid 表的county 和 piaoCountyCode 的id关联， piaoCountyCode 的 code (邮政编码) 和 distinctPlantCounty的 code 邮政编码 关联 所以 distinctPlantCounty就和m_grid建立的联系
select a.plant_id,a.county_code,a.lowAltitude,a.highAltitude,c.Id,c.altitude_min,c.altitude_max into PlantCountyAltitudeResult
from distinctPlantCounty a ,M_Plant b,m_grid c,piaoCountyCode d
where a.plant_id=b.id and c.county=d.Id and d.code = a.county_code and b.culAndWildFlag=1 

validate

select distinct(county_Code) from PlantCountyAltitudeResult where plant_id = 230
select distinct(id) from PlantCountyAltitudeResult where plant_id = 230
select * from m_grid c,piaoCountyCode d where c.county=d.Id and d.code = '654325'
select distinct(county_Code) from m_grid where plant_id = 230

select * from M_Plant where culAndWildFlag=1 and id = 230


*/
--select * from PlantCountyAltitudeResult

--programme fifth

--select * into PlantCountyAltitudeValidResult from PlantCountyAltitudeResult where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) or (altitude_min<=lowAltitude and altitude_max>= highAltitude ))

--select * from PlantCountyAltitudeResult where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) or (altitude_min<=lowAltitude and altitude_max>= highAltitude ))

--validate 

select count(*) from PlantCountyAltitudeValidResult where plant_id = 230

select * from PlantCountyAltitudeValidResult


--programme sixth	

CREATE INDEX PlantCountyAltitudeValidResult_index ON PlantCountyAltitudeValidResult  (plant_id)
CREATE INDEX plant_index  ON M_Plant  (id)

select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a0  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a1  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and (b.yearCode ='2' or b.yearCode ='1')) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a2  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.yearCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a3  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and (b.typeCode ='1' or b.typeCode ='3')) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a4  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and (b.typeCode ='2' or b.typeCode ='4')) w group by w.Id
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a5  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a6  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='2') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a7  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a8 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.endangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a9 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.ephemeralFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a10 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.endemismFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a11 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.xjEndangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a12 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.halophilousFlag ='1') w group by w.Id 
			
	

select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a13  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.yearCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a14  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.yearCode ='2') w group by w.Id 																							 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a15  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.typeCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a16  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.typeCode ='2') w group by w.Id
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a17  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.typeCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a18  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.typeCode ='4') w group by w.Id


CREATE INDEX plant_ida0   ON a0  (plant_id)
CREATE INDEX plant_ida1   ON a1  (plant_id)
CREATE INDEX plant_ida2   ON a2  (plant_id)
CREATE INDEX plant_ida3   ON a3  (plant_id)
CREATE INDEX plant_ida4   ON a4  (plant_id)
CREATE INDEX plant_ida5   ON a5  (plant_id)
CREATE INDEX plant_ida6   ON a6  (plant_id)
CREATE INDEX plant_ida7   ON a7  (plant_id)
CREATE INDEX plant_ida8   ON a8  (plant_id)
CREATE INDEX plant_ida9   ON a9  (plant_id)
CREATE INDEX plant_ida10  ON a10 (plant_id)
CREATE INDEX plant_ida11  ON a11 (plant_id)
CREATE INDEX plant_ida12  ON a12 (plant_id)

CREATE INDEX plant_ida13   ON a13  (plant_id)
CREATE INDEX plant_ida14   ON a14  (plant_id)
CREATE INDEX plant_ida15   ON a15  (plant_id)
CREATE INDEX plant_ida16  ON a16 (plant_id)
CREATE INDEX plant_ida17  ON a17 (plant_id)
CREATE INDEX plant_ida18  ON a18 (plant_id)	
 

select z.id as id, a0.*,a1.*,a2.*,a3.*,a4.*,a5.*,a6.*,a7.*,a8.*,a9.*,a10.*,a11.*,a12.* from m_grid z	
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

select z.id as id, a13.*,a14.*,a15.*,a16.*,a17.*,a18.* from m_grid z	
left join a13  on z.id=a13.id
left join a14  on z.id=a14.id
left join a15  on z.id=a15.id
left join a16  on z.id=a16.id
left join a17  on z.id=a17.id
left join a18  on z.id=a18.id
order by z.id

select * from a0 order by id

统计总物种数
select count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b,m_grid c where a.plant_id=b.id and a.id= c.id) w
统计各区域物种数
select lastRegion,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus, c.lastRegion from PlantCountyAltitudeValidResult a,M_Plant b,m_grid c where a.plant_id=b.id and a.id= c.id) w group by w.lastRegion 

统计山区和盆地物种数
--select count(distinct(plant_id)) plant,count(distinct(cnFamily)) Family ,count(distinct(cnGenus)) Genus from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b,m_grid c where a.plant_id=b.id and a.id= c.id and (c.lastregion =1 or c.lastregion =2 or c.lastregion =3 or c.lastregion = 4)) w 
select count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b,m_grid c where a.plant_id=b.id and a.id= c.id and c.lastregion in(1,2,3,4) ) w
select count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b,m_grid c where a.plant_id=b.id and a.id= c.id and c.lastregion in(5,6,7) ) w




----nurbay-------
--third
--select * into nurbayDistinctPlantCounty from distinctPlantCounty
--update nurbayDistinctPlantCounty set lowAltitude = a.lowAltitude ,highAltitude = a.highAltitude from nurbayDistinctPlantCounty b,nurbayAltitude a where b.lowAltitude < -8000 and b.highAltitude < -8000 and a.plant_id = b.plant_id
--SELECT DISTINCT(a.PLANT_ID) FROM nurbayDistinctPlantCounty a,m_plant b WHERE a.plant_id = b.id and a.lowAltitude < -8000 and a.highAltitude < -8000 and b.culAndWildFlag=1
--fourth
select a.plant_id,a.county_code,a.lowAltitude,a.highAltitude,c.Id,c.altitude_min,c.altitude_max into nurbayPlantCountyAltitudeResult
from nurbayDistinctPlantCounty a ,M_Plant b,m_grid c,piaoCountyCode d,M_county e 
where a.plant_id=b.id and c.county=d.Id and d.code =e.code and e.code=a.county_code and b.culAndWildFlag=1 
bayPlantCountyAltitudeValidResult from nurbayPlantCountyAltitudeResult where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) or (altitude_min<=lowAltitude and altitude_max>= highAltitude ))
--sixth                                                                                   

CREATE INDEX nurbayPlantCountyAltitudeValidResult_index ON nurbayPlantCountyAltitudeValidResult  (plant_id)


select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa0  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa1  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.yearCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa2  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and (b.yearCode ='2' or b.yearCode ='3')) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa3  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and (b.typeCode ='1' or b.typeCode ='3')) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa4  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and (b.typeCode ='2' or b.typeCode ='4')) w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa5  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa6  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='2') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa7  from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.menCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa8 from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.endangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa9 from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.ephemeralFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa10 from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.endemismFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa11 from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.xjEndangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into aa12 from  (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from nurbayPlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id and b.halophilousFlag ='1') w group by w.Id 

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

select z.id as id, aa0.*,aa1.*,aa2.*,aa3.*,aa4.*,aa5.*,aa6.*,aa7.*,aa8.*,aa9.*,aa10.*,aa11.*,aa12.* from m_grid z	
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
order by z.id

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
 