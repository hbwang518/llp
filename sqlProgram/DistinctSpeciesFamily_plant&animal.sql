select * from m_plant
select * from plantCounty
select Count(distinct(plant_id)) from plantcounty where distribution in (select county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%'))
--
--ͳ�Ʋ�ͬ�����Ŀ�����

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

--ͳ�Ʋ�ͬ�����Ŀ�����

----��ɽ

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%') 
		union 
		select id from M_area where area like '��ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
id<7000 and culandwildflag<>2 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%') 
		union 
		select id from M_area where area like '��ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.xjEndangeredFlag is not null


----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%') 
		union 
		select id from M_area where area like '��ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.endemismFlag is not null



----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%') 
		union 
		select id from M_area where area like '��ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.ephemeralFlag is not null



----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%') 
		union 
		select id from M_area where area like '��ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.halophilousFlag is not null



----����̩ɽ

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����̩ɽ%') 
		union 
		select id from M_area where area like '����̩ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
id<7000 and culandwildflag<>2 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����̩ɽ%') 
		union 
		select id from M_area where area like '����̩ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.xjEndangeredFlag is not null


----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����̩ɽ%') 
		union 
		select id from M_area where area like '����̩ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.endemismFlag is not null



----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����̩ɽ%') 
		union 
		select id from M_area where area like '����̩ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.ephemeralFlag is not null



----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����̩ɽ%') 
		union 
		select id from M_area where area like '����̩ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.halophilousFlag is not null




----����ɽ

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ɽ%') 
		union 
		select id from M_area where area like '����ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
id<7000 and culandwildflag<>2 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ɽ%') 
		union 
		select id from M_area where area like '����ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.xjEndangeredFlag is not null


----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ɽ%') 
		union 
		select id from M_area where area like '����ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.endemismFlag is not null



----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ɽ%') 
		union 
		select id from M_area where area like '����ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.ephemeralFlag is not null



----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ɽ%') 
		union 
		select id from M_area where area like '����ɽ%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.halophilousFlag is not null





----׼�������

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '׼�������%') 
		union 
		select id from M_area where area like '׼�������%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
id<7000 and culandwildflag<>2 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '׼�������%') 
		union 
		select id from M_area where area like '׼�������%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.xjEndangeredFlag is not null


----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '׼�������%') 
		union 
		select id from M_area where area like '׼�������%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.endemismFlag is not null



----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '׼�������%') 
		union 
		select id from M_area where area like '׼�������%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.ephemeralFlag is not null



----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '׼�������%') 
		union 
		select id from M_area where area like '׼�������%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.halophilousFlag is not null




----����ľ���

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ľ���%') 
		union 
		select id from M_area where area like '����ľ���%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
id<7000 and culandwildflag<>2 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ľ���%') 
		union 
		select id from M_area where area like '����ľ���%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.xjEndangeredFlag is not null


----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ľ���%') 
		union 
		select id from M_area where area like '����ľ���%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.endemismFlag is not null



----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ľ���%') 
		union 
		select id from M_area where area like '����ľ���%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.ephemeralFlag is not null



----����ֲ��
select count(distinct(a.cnname)), count(distinct(a.cngenus)), count(distinct(a.cnfamily)) 
from m_plant a,
(
	select plant_id from plantcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ľ���%') 
		union 
		select id from M_area where area like '����ľ���%'
	) 
)  b -- AreaPlant
where 
a.id=b.plant_id and
a.id<7000 and a.culandwildflag<>2 and a.halophilousFlag is not null


-----------------------------------------------------����

select * from m_animal



----����

----��ɽ

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%') 
		union 
		select id from M_area where area like '��ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%') 
		union 
		select id from M_area where area like '��ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 and a.EndangeredFlag=1



----����̩ɽ

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����̩ɽ%') 
		union 
		select id from M_area where area like '����̩ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����̩ɽ%') 
		union 
		select id from M_area where area like '����̩ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 and a.EndangeredFlag=1





----����ɽ

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ɽ%') 
		union 
		select id from M_area where area like '����ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ɽ%') 
		union 
		select id from M_area where area like '����ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 and a.EndangeredFlag=1




----׼�������

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '׼�������%') 
		union 
		select id from M_area where area like '׼�������%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '׼�������%') 
		union 
		select id from M_area where area like '׼�������%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 and a.EndangeredFlag=1




----����ľ���


--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ľ���%') 
		union 
		select id from M_area where area like '����ľ���%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ľ���%') 
		union 
		select id from M_area where area like '����ľ���%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id<1000 and a.EndangeredFlag=1



--------����

----��ɽ

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%') 
		union 
		select id from M_area where area like '��ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%') 
		union 
		select id from M_area where area like '��ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 and a.EndangeredFlag=1



----����̩ɽ

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����̩ɽ%') 
		union 
		select id from M_area where area like '����̩ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����̩ɽ%') 
		union 
		select id from M_area where area like '����̩ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 and a.EndangeredFlag=1





----����ɽ

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ɽ%') 
		union 
		select id from M_area where area like '����ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ɽ%') 
		union 
		select id from M_area where area like '����ɽ%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 and a.EndangeredFlag=1




----׼�������

--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '׼�������%') 
		union 
		select id from M_area where area like '׼�������%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '׼�������%') 
		union 
		select id from M_area where area like '׼�������%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 and a.EndangeredFlag<>0




----����ľ���


--ȫ��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ľ���%') 
		union 
		select id from M_area where area like '����ľ���%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 

--�ص㱣��
select count(distinct(a.cnname)), count(distinct(a.cnfamily)), count(distinct(a.cnOrder)) 
from m_animal a,
(
	select animal_id from animalcounty where distribution in 
	
	(
		select distinct county_code from areatocounty where area_id in (select id from M_area where area like '����ľ���%') 
		union 
		select id from M_area where area like '����ľ���%'
	) 
)  b -- Areaanimal
where 
a.id=b.animal_id and
id>1000 and a.EndangeredFlag<>0

