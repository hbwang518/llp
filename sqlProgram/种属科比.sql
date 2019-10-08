
栅格内woody科属种数
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultDistinct a,M_Plant b where a.plant_id=b.id and (b.typeCode ='1' or b.typeCode ='3')) w group by w.Id order by id

select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResultDistinct a,M_Plant b where a.plant_id=b.id and (b.typeCode ='2' or b.typeCode ='4')) w group by w.Id order by id

新疆分布的植物种科属数
select * from m_plant
select count(distinct(cnName)) from m_plant where culandwildflag=1
select count(distinct(cnfamily)) from m_plant where culandwildflag=1
select count(distinct(cngenus)) from m_plant where culandwildflag=1

新疆分布的木本植物种科属数
select count(distinct(cnName)) from m_plant where culandwildflag=1 and (typecode=1 or typecode =3)
select count(distinct(cnfamily)) from m_plant where culandwildflag=1 and (typecode=1 or typecode =3)
select count(distinct(cngenus)) from m_plant where culandwildflag=1 and (typecode=1 or typecode =3)