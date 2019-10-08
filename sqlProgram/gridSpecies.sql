select * from xinjiangPlot.dbo.environment
select * from piaoCountyCode
select * from M_Plant where highAltitude is null

--update m_plant set highAltitude=10000 where highAltitude is null
select * from distinctPlantCounty
select * from PlantCountyAltitudeValidResult

select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a0  from (select a.Id,b.id 
plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult a,M_Plant b where a.plant_id=b.id) w group by w.Id 

select * from gridspecies order by grid

select distinct(plant_id) from PlantCountyAltitudeValidResult a, 
(select top 850 grid from gridspecies order by pspecies desc) as b
where a.id = b.grid

select top 850 grid, pspecies from gridspecies order by pspecies desc

select distinct(id) from m_plant where culandWildFlag=2 or culandWildFlag=1

select distinct(id) from m_plant where culandWildFlag=2 or culandWildFlag=1

select * from m_plant where id not in (select plant_id from PlantCountyAltitudeResult) and culandWildFlag<>2 and culandWildFlag<>3

select distinct(plant_id) from distinctPlantCounty
select distinct(plant_id) from PlantCountyAltitudeResult
select distinct(plant_id) from PlantCountyAltitudeValidResult 

select a.plant_id,a.county_code,a.lowAltitude,a.highAltitude,c.Id,c.altitude_min,c.altitude_max 
from distinctPlantCounty a ,M_Plant b,m_grid c,piaoCountyCode d,M_county e 
where a.plant_id=b.id and c.county=d.Id and d.code =e.code and e.code=a.county_code and b.culAndWildFlag=1 

select distinct(a.plant_id)
from distinctPlantCounty a ,M_Plant b
where a.plant_id=b.id  and b.culAndWildFlag=1 

select distinct(id)
from M_Plant b
where b.culAndWildFlag=1 

select distinct(county_code) from distinctPlantCounty where plant_id not in
(
select distinct(a.plant_id)
from distinctPlantCounty a ,M_Plant b, M_county e 
where a.plant_id=b.id and e.code=a.county_code and b.culAndWildFlag=1 
)

select * from distinctPlantCounty where plant_id not in
(
select distinct(a.plant_id)
from distinctPlantCounty a ,M_Plant b, M_county e 
where a.plant_id=b.id and e.code=a.county_code and b.culAndWildFlag=1 
)

select * from distinctPlantCounty where plant_id not in
(
select distinct(a.plant_id)
from distinctPlantCounty a, M_county e 
where e.code=a.county_code and b.culAndWildFlag=1 
)

select * from distinctPlantCounty where county_code not in (select code from M_county)

select distinct(plant_id) from distinctPlantCounty where plant_id not in (select id from m_plant where culAndWildFlag=1)
from distinctPlantCounty a ,M_Plant b, M_county e 
where a.plant_id=b.id and e.code=a.county_code and b.culAndWildFlag=1 

select * into distinctPlantCounty_Cul1 from distinctPlantCounty where plant_id in (select id from m_plant where culAndWildFlag=1)



select distinct(a.plant_id)
from distinctPlantCounty_Cul1 a ,M_Plant b, M_county e 
where a.plant_id=b.id and e.code=a.county_code


select a.*
from distinctPlantCounty_Cul1 a ,M_Plant b
where a.plant_id=b.id 

select distinct(a.plant_id) from distinctPlantCounty_Cul1 a inner join M_Plant b on a.plant_id=b.id
left join M_county e on e.code=a.county_code

select * from distinctPlantCounty where county_code is null


select plant_id,county_code,lowAltitude,highAltitude into  distinctPlantCounty from
( 
	--取单海拔
	select M_Plant.id plant_id,w.county_code,M_Plant.lowAltitude,M_Plant.highAltitude from M_Plant left join 
	(
		--取county和area中的county
		select distinct(plant_id) plant_id ,distribution county_code from plantCounty where distribution in (select code from m_county) and plant_id 
not in (select plant_id from MultiAltitude) 
		union
		select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution in (select id from 
m_area) and a.plant_id not in (select plant_id from MultiAltitude) 
	) as w on M_Plant.id = w.plant_id where w.county_code is null
	--取多海拔
	union 
	(
		--取county和area中的county
		select plant_id ,distribution county_Code ,lowAltitude,highAltitude from MultiAltitude where distribution in (select code from m_county)
		union  
                select a.plant_id,b.county_Code county_Code, a.lowAltitude,a.highAltitude from MultiAltitude a,areaToCounty b where a.distribution =b.area_id
	) 
) as z

select * from plantCounty where distribution is null
select * from 
(
select distinct(plant_id) plant_id ,distribution county_code from plantCounty where distribution in (select code from m_county) and plant_id 
not in (select plant_id from MultiAltitude) 
		union
		select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution in (select id from 
m_area) and a.plant_id not in (select plant_id from MultiAltitude) 
	) as w on M_Plant.id = w.plant_id 


--取单海拔
	select M_Plant.id plant_id,w.county_code,M_Plant.lowAltitude,M_Plant.highAltitude from M_Plant left join 
	(
		--取county和area中的county
		select distinct(plant_id) plant_id ,distribution county_code from plantCounty where distribution in (select code from m_county) and plant_id 
not in (select plant_id from MultiAltitude) 
		union
		select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution in (select id from 
m_area) and a.plant_id not in (select plant_id from MultiAltitude) 
	) as w on M_Plant.id = w.plant_id where w.county_code is null

select * from 
(
select distinct(plant_id) plant_id ,distribution county_code from plantCounty where distribution in (select code from m_county) and plant_id 
not in (select plant_id from MultiAltitude) 
		union
		select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution in (select id from 
m_area) and a.plant_id not in (select plant_id from MultiAltitude) 
) as w where w.county_code is null

select * from m_plant where id not in (select plant_id from plantCounty) and culAndWildFlag=1 


--得到前850个有最多种植物数grid
select top 850 grid, pspecies from gridspecies order by pspecies desc
select distinct(plant_id) from PlantCountyAltitudeValidResult where id in (select top 850 grid from gridspecies order by pspecies desc)

select distinct(cngenus) from PlantCountyAltitudeValidResult a, m_plant b where a.id in (select top 850 grid from gridspecies order by pspecies desc) and a.plant_id =b.id
select distinct(cnfamily) from PlantCountyAltitudeValidResult a, m_plant b where a.id in (select top 850 grid from gridspecies order by pspecies desc) and a.plant_id =b.id

--得到前850个有最多种鸟类的grid
select distinct(animal_id) from animalCountyAltitudeValidResult where id in (select top 850 grid from gridspecies order by bspecies desc) and animal_id<1000

select distinct(cnfamily) from animalCountyAltitudeValidResult a, m_animal b where a.id in (select top 850 grid from gridspecies order by bspecies desc) and a.animal_id =b.id and a.animal_id<1000
select distinct(cnorder) from animalCountyAltitudeValidResult a, m_animal b where a.id in (select top 850 grid from gridspecies order by bspecies desc) and a.animal_id =b.id and a.animal_id<1000

--得到前850个有最多种哺乳类的grid
select distinct(animal_id) from animalCountyAltitudeValidResult where id in (select top 850 grid from gridspecies order by mspecies desc) and animal_id>1000

select distinct(cnfamily) from animalCountyAltitudeValidResult a, m_animal b where a.id in (select top 850 grid from gridspecies order by mspecies desc) and a.animal_id =b.id and a.animal_id>1000
select distinct(cnorder) from animalCountyAltitudeValidResult a, m_animal b where a.id in (select top 850 grid from gridspecies order by mspecies desc) and a.animal_id =b.id and a.animal_id>1000

select distinct(animal_id) from animalCountyAltitudeValidResult a, m_animal b where a.id in (select top 850 grid from gridspecies order by mDanspecies desc) and a.animal_id>1000 and b.endangeredflag=1 and a.animal_id =b.id

select * from m_animal where endangeredflag=1 and id>1000

select distinct(plant_id) from PlantCountyAltitudeValidResult 
select grid into HotSpotPBMspecies 
from (
select grid from (select top 850 grid, pspecies species from gridspecies order by pspecies desc) a
union
select grid from (select top 850 grid, bspecies species from gridspecies order by bspecies desc) b
union
select grid from (select top 850 grid, mspecies species from gridspecies order by mspecies desc) c
) w

--update HotSpotPBMspecies set pspeciesFlag = 1 where grid in (select top 850 grid from gridspecies order by pspecies desc)
--update HotSpotPBMspecies set bspeciesFlag = 1 where grid in (select top 850 grid from gridspecies order by bspecies desc)
--update HotSpotPBMspecies set mspeciesFlag = 1 where grid in (select top 850 grid from gridspecies order by mspecies desc)

---select  * into HotSpot123 from HotSpotPBMspecies

--update HotSpot123 set pspeciesflag=2 where pspeciesflag=0 and bspeciesflag=1
--update HotSpot123 set pspeciesflag=3 where pspeciesflag=0 and mspeciesflag=1



select * from HotSpotPBMspecies order by grid

select * from HotSpotPBMspecies where pspeciesFlag = 1 and bspeciesFlag = 1 and mspeciesFlag = 1

select * from HotSpotPBMspecies where pspeciesFlag = 1 and bspeciesFlag = 1 and mspeciesFlag = 0


select * from HotSpotPBMspecies where pspeciesFlag = 1 and bspeciesFlag = 0 and mspeciesFlag = 0


select * from HotSpotPBMspecies where pspeciesFlag = 0 and bspeciesFlag = 1 and mspeciesFlag = 0


select * from HotSpotPBMspecies where pspeciesFlag = 0 and bspeciesFlag = 1 and mspeciesFlag = 1


select * from HotSpotPBMspecies where pspeciesFlag = 1 and bspeciesFlag = 0 and mspeciesFlag = 1


select * from HotSpotPBMspecies where pspeciesFlag = 0 and bspeciesFlag = 0 and mspeciesFlag = 1

