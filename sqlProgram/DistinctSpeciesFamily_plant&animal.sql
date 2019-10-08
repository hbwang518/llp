select * from m_plant
select * from plantCounty
select Count(distinct(plant_id)) from plantcounty where distribution in (select county_code from areatocounty where area_id in (select id from M_area where area like '天山%'))
--
--统计不同地区的科属种

--year
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3

--统计不同地区的科属种

----天山

--全部
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '天山%') 
		union 
		select id from M_area where area like '天山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
id<7000 and culandwildflag<>2 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '天山%') 
		union 
		select id from M_area where area like '天山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.xjEndangeredFlag is not null


----特有植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '天山%') 
		union 
		select id from M_area where area like '天山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.endemismFlag is not null



----短命植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '天山%') 
		union 
		select id from M_area where area like '天山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.ephemeralFlag is not null



----盐生植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '天山%') 
		union 
		select id from M_area where area like '天山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.halophilousFlag is not null



----阿尔泰山

--全部
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '阿尔泰山%') 
		union 
		select id from M_area where area like '阿尔泰山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
id<7000 and culandwildflag<>2 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '阿尔泰山%') 
		union 
		select id from M_area where area like '阿尔泰山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.xjEndangeredFlag is not null


----特有植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '阿尔泰山%') 
		union 
		select id from M_area where area like '阿尔泰山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.endemismFlag is not null



----短命植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '阿尔泰山%') 
		union 
		select id from M_area where area like '阿尔泰山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.ephemeralFlag is not null



----盐生植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '阿尔泰山%') 
		union 
		select id from M_area where area like '阿尔泰山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.halophilousFlag is not null




----昆仑山

--全部
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '昆仑山%') 
		union 
		select id from M_area where area like '昆仑山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
id<7000 and culandwildflag<>2 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '昆仑山%') 
		union 
		select id from M_area where area like '昆仑山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.xjEndangeredFlag is not null


----特有植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '昆仑山%') 
		union 
		select id from M_area where area like '昆仑山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.endemismFlag is not null



----短命植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '昆仑山%') 
		union 
		select id from M_area where area like '昆仑山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.ephemeralFlag is not null



----盐生植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '昆仑山%') 
		union 
		select id from M_area where area like '昆仑山%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.halophilousFlag is not null





----准噶尔盆地

--全部
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '准噶尔盆地%') 
		union 
		select id from M_area where area like '准噶尔盆地%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
id<7000 and culandwildflag<>2 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '准噶尔盆地%') 
		union 
		select id from M_area where area like '准噶尔盆地%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.xjEndangeredFlag is not null


----特有植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '准噶尔盆地%') 
		union 
		select id from M_area where area like '准噶尔盆地%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.endemismFlag is not null



----短命植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '准噶尔盆地%') 
		union 
		select id from M_area where area like '准噶尔盆地%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.ephemeralFlag is not null



----盐生植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '准噶尔盆地%') 
		union 
		select id from M_area where area like '准噶尔盆地%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.halophilousFlag is not null




----塔里木盆地

--全部
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '塔里木盆地%') 
		union 
		select id from M_area where area like '塔里木盆地%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
id<7000 and culandwildflag<>2 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '塔里木盆地%') 
		union 
		select id from M_area where area like '塔里木盆地%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.xjEndangeredFlag is not null


----特有植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '塔里木盆地%') 
		union 
		select id from M_area where area like '塔里木盆地%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.endemismFlag is not null



----短命植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '塔里木盆地%') 
		union 
		select id from M_area where area like '塔里木盆地%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.ephemeralFlag is not null



----盐生植物
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '塔里木盆地%') 
		union 
		select id from M_area where area like '塔里木盆地%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.halophilousFlag is not null


-----------------------------------------------------动物

select * from m_animal



----鸟类

----天山

--全部
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '天山%') 
		union 
		select id from M_area where area like '天山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '天山%') 
		union 
		select id from M_area where area like '天山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 and a.EndangeredFlag=1



----阿尔泰山

--全部
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '阿尔泰山%') 
		union 
		select id from M_area where area like '阿尔泰山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '阿尔泰山%') 
		union 
		select id from M_area where area like '阿尔泰山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 and a.EndangeredFlag=1





----昆仑山

--全部
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '昆仑山%') 
		union 
		select id from M_area where area like '昆仑山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '昆仑山%') 
		union 
		select id from M_area where area like '昆仑山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 and a.EndangeredFlag=1




----准噶尔盆地

--全部
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '准噶尔盆地%') 
		union 
		select id from M_area where area like '准噶尔盆地%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '准噶尔盆地%') 
		union 
		select id from M_area where area like '准噶尔盆地%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 and a.EndangeredFlag=1




----塔里木盆地


--全部
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '塔里木盆地%') 
		union 
		select id from M_area where area like '塔里木盆地%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '塔里木盆地%') 
		union 
		select id from M_area where area like '塔里木盆地%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 and a.EndangeredFlag=1



--------兽类

----天山

--全部
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '天山%') 
		union 
		select id from M_area where area like '天山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '天山%') 
		union 
		select id from M_area where area like '天山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 and a.EndangeredFlag=1



----阿尔泰山

--全部
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '阿尔泰山%') 
		union 
		select id from M_area where area like '阿尔泰山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '阿尔泰山%') 
		union 
		select id from M_area where area like '阿尔泰山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 and a.EndangeredFlag=1





----昆仑山

--全部
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '昆仑山%') 
		union 
		select id from M_area where area like '昆仑山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '昆仑山%') 
		union 
		select id from M_area where area like '昆仑山%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 and a.EndangeredFlag=1




----准噶尔盆地

--全部
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '准噶尔盆地%') 
		union 
		select id from M_area where area like '准噶尔盆地%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '准噶尔盆地%') 
		union 
		select id from M_area where area like '准噶尔盆地%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 and a.EndangeredFlag<>0




----塔里木盆地


--全部
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '塔里木盆地%') 
		union 
		select id from M_area where area like '塔里木盆地%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 

--重点保护
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '塔里木盆地%') 
		union 
		select id from M_area where area like '塔里木盆地%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 and a.EndangeredFlag<>0

