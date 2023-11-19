
---20180122
select * from plantXJ
select * from allType
select * from eremoChina where typeWH is null
select * from eremoChina where woody is null and herbal is null
--update eremoChina set typewh='w' where woody='y' 
--update eremoChina set typewh='h' where herbal='y' 

select * from eremoChina where latinName in (select latinName from medi.dbo.plantxj)

--update eremoChina set inLi = '1' where latinName in (select latinName from medi.dbo.plantxj)


select * from eremoChina where inLi is not null and inXJ is null

select top 100 * from plantCountyAltitudeValidResultDistinct 

select * from medi.dbo.plantxj
select * from eremoChina

select a.id, a.plant_id, a.altitude_min, a.altitude_max, b.cnname, b.latinname from plantCountyAltitudeValidResultDistinct a, medi.dbo.plantxj b, eremoChina c
where b.latinName = c. latinname and b.id= a.plant_id
order by a.id, a.plant_id




#######The second time#####
eremoChina2

select * from eremoChina2 where latinName in (select latinName from medi.dbo.plantxj)

--update eremoChina2 set inLi = '1' where latinName in (select latinName from medi.dbo.plantxj)

select * from eremoChina2 where inLi is not null and inXJ is null

select a.id, a.plant_id, a.altitude_min, a.altitude_max, b.cnname, b.latinname from plantCountyAltitudeValidResultDistinct a, medi.dbo.plantxj b, eremoChina2 c
where b.latinName = c. latinname and b.id= a.plant_id
order by a.id, a.plant_id

select a.id, count(a.plant_id) from plantCountyAltitudeValidResultDistinct a, medi.dbo.plantxj b, eremoChina2 c
where b.latinName = c. latinname and b.id= a.plant_id
group by a.id
order by a.id



---20231029
---新疆，青海，西藏 sp2000数据
select autoid, cnName, latinName, distribution FROM CHINAORI
select autoid, cnName, latinName,value province
into chinaProvince
from chinaOri
cross apply string_split(distribution, '、') newDis

--update CHINAORI set distribution=REPLACE('、云南',distribution,',') where autoid=30789
--update CHINAORI set distribution='四川、云南' where autoid=30789

select * from string_split('四川,云南',',')
select * from string_split('四川、云南','、')

--alter database phylo collate chinese_prc_ci_as

select * from chinaProvince where province = '西藏' order by autoid
select * from chinaProvince where province = '青海' order by autoid
select * from chinaProvince where province = '新疆' order by autoid


---20231101
---新疆数据，动物和植物，按照7个分区
select * from m_plant where id<7000
select * from m_plant where id<7000 and del = 0

select * from m_animal where del > 0   --5条
select * from m_animal where del = 0   --574条


select * from m_grid
select distinct(lastregion) from m_grid
select top 10 * from plantCountyAltitudeValidResultDistinct
select top 10 * from AnimalCountyAltitudeValidResult  --为何没有distinct

---plant
select plant_id, cnname, latinname
, case when CHARINDEX('1',region) >  0 then 1 else 0 end as region1
, case when CHARINDEX('2',region) >  0 then 1 else 0 end as region2
, case when CHARINDEX('3',region) >  0 then 1 else 0 end as region3
, case when CHARINDEX('4',region) >  0 then 1 else 0 end as region4
, case when CHARINDEX('5',region) >  0 then 1 else 0 end as region5
, case when CHARINDEX('6',region) >  0 then 1 else 0 end as region6
, case when CHARINDEX('7',region) >  0 then 1 else 0 end as region7
from
(
select plant_id, cnname, latinname, string_agg(lastRegion, ',') as region from
(
select distinct plant_id, cnname, latinname,lastRegion from plantCountyAltitudeValidResultDistinct a 
join m_grid b on a.Id=b.id 
join m_plant c on a.plant_id=c.id where c.id<7000 and c.del = 0
) aa group by plant_id, cnname, latinname
) bb order by plant_id

---植物验证
select distinct plant_id, cnname, latinname,lastRegion from plantCountyAltitudeValidResultDistinct a 
join m_grid b on a.Id=b.id --where plant_id=2
join m_plant c on a.plant_id=c.id order by plant_id

---animal
select animal_id, cnname, latinname
, case when CHARINDEX('1',region) >  0 then 1 else 0 end as region1
, case when CHARINDEX('2',region) >  0 then 1 else 0 end as region2
, case when CHARINDEX('3',region) >  0 then 1 else 0 end as region3
, case when CHARINDEX('4',region) >  0 then 1 else 0 end as region4
, case when CHARINDEX('5',region) >  0 then 1 else 0 end as region5
, case when CHARINDEX('6',region) >  0 then 1 else 0 end as region6
, case when CHARINDEX('7',region) >  0 then 1 else 0 end as region7
from
(
select animal_id, cnname, latinname, string_agg(lastRegion, ',') as region from
(
select distinct animal_id, cnname, latinname,lastRegion from animalCountyAltitudeValidResult a 
join m_grid b on a.Id=b.id 
join m_animal c on a.animal_id=c.id where c.del = 0
) aa group by animal_id, cnname, latinname
) bb order by animal_id


---新疆物种校对
select * from m_plant where id not in (select id from m_plant where id=minid or id<>minid)   --7000以上的
select * from m_plant where id=minid and id < 7000
select * from m_plant where id<>minid and id < 7000
select * from m_plant where id < 7000 order by id

select * from m_plant20191008 where id < 7000 order by id




---按照样地
---新疆森林样地
select * from shrubandgrass
select * from arbor
select * from gridpool order by id

---HCZLwoody,其灌草在shrubandgrass表
select * from hczlwoody order by plot,speciesno

---安老师草地样地
select * from grasslandplot order by plot,splotno
select * from grasslandenvironment order by plot
select * from grasslandbiomass

---草牧业样地
select * from gplotInve2021 order by plot
select * from genvironment2021 order by plot

--
select top 1 * from plantCountyAltitudeValidResultDistinct

select distinct b.minId2, a.id from plantCountyAltitudeValidResultDistinct a
join m_plant b on a.plant_id=b.id
where b.minId2 is not null
order by a.id,b.minId2


---plant
select minId2, cnname2, latinname2
, case when CHARINDEX('1',region) >  0 then 1 else 0 end as region1
, case when CHARINDEX('2',region) >  0 then 1 else 0 end as region2
, case when CHARINDEX('3',region) >  0 then 1 else 0 end as region3
, case when CHARINDEX('4',region) >  0 then 1 else 0 end as region4
, case when CHARINDEX('5',region) >  0 then 1 else 0 end as region5
, case when CHARINDEX('6',region) >  0 then 1 else 0 end as region6
, case when CHARINDEX('7',region) >  0 then 1 else 0 end as region7
from
(
select minId2, cnname2, latinname2, string_agg(lastRegion, ',') as region from
(
select distinct c.minId2, cnname2, latinname2,lastRegion from plantCountyAltitudeValidResultDistinct a 
join m_grid b on a.Id=b.id 
join m_plant c on a.plant_id=c.id where c.id<7000 and c.del = 0
) aa group by minId2, cnname2, latinname2
) bb where minId2 is not null
order by minId2

select distinct c.minId2 from plantCountyAltitudeValidResultDistinct a 
join m_grid b on a.Id=b.id 
join m_plant c on a.plant_id=c.id where c.id<7000 and c.del = 0

select distinct c.minId2 from plantCountyAltitudeValidResultDistinct a 
join m_plant c on a.plant_id=c.id where c.id<7000 and c.del = 0


select id, minid2,highAltitude,lowAltitude from m_plant
where minid2 in (
  select minid2 from m_plant where minid2 is not null group by minid2 having count(*) > 1
)
order by minid2






