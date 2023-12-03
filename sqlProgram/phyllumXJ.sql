
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
---更新m_plant表，将冬梅的名称更改写到表里，并且正式采用的名称为cnname2等加了2的。
select * from m_plant
select distinct(speciesflag) from m_plant
select * from alltype
select * from sheet2
select b.cnName2 from m_plant a join Sheet2 b on a.id=b.id

alter table m_plant add  latinGenus2   nvarchar(255) NULL
alter table m_plant add  cnGenus2   nvarchar(255) NULL
alter table m_plant add  species2   nvarchar(255) NULL
alter table m_plant add  cnOrder2   nvarchar(255) NULL
alter table m_plant add  latinOrder2   nvarchar(255) NULL
alter table m_plant add  latinClass2   nvarchar(255) NULL
alter table m_plant add  cnClass2   nvarchar(255) NULL
alter table m_plant add  latinFamily2   nvarchar(255) NULL
alter table m_plant add  cnFamily2   nvarchar(255) NULL

update m_plant set cnName2=b.cnName2,
latinName2=b.latinName2,
latinGenus2=b.latinGenus2,
cnGenus2=b.cnGenus2,
species2=b.species2,
cnOrder2=b.cnOrder2,
latinOrder2=b.latinOrder2,
latinClass2=b.latinClass2,
cnClass2=b.cnClass2
from m_plant a join Sheet2 b on a.id=b.id

update m_plant set latinFamily2=b.latinFamily2,
cnFamily2=b.cnFamily2
from m_plant a join phylo.dbo.xjlicheckedbyjin b on a.id=b.id

update m_plant set cnName2 = null where cnName2='NA'
update m_plant set latinName2 = null where latinName2='NA'
update m_plant set latinGenus2 = null where latinGenus2='NA'
update m_plant set cnGenus2 = null where cnGenus2='NA'
update m_plant set species2 = null where species2='NA'
update m_plant set cnOrder2 = null where cnOrder2='NA'
update m_plant set latinOrder2 = null where latinOrder2='NA'
update m_plant set cnClass2 = null where cnClass2='NA'


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


--QH
---首先处理青海的数据拉丁名后面有作者的问题
select * from QH
select latingenusFull, CHARINDEX(' ', latingenusFull), SUBSTRING(latingenusFull,1, CHARINDEX(' ', latingenusFull)) from QH
select latinnamefull, SUBSTRING(latinnamefull,1, CHARINDEX(CHAR(32), latinnamefull)) from QH

select * from QH where latinNameFull like '%' +char(9)+'%'
select * from QH where latinNameFull like '%' +char(10)+'%'
select * from QH where latinNameFull like '%' +char(13)+'%'
select * from QH where latinNameFull like '%' +char(32)+'%'
select * from QH where latinNameFull like '%' +char(160)+'%'
select * from QH where latinNameFull like '%' +'\u00A0'+'%'
select replace(latinNameFull,char(160),'') from QH where speciesid=291
select replace(latinNameFull,char(9),'') from QH where speciesid=291

ALTER DATABASE phylo   
SET COMPATIBILITY_LEVEL = 150

select speciesid,latinName, latinnamefull from QH where speciesid in (
291,311,1813,1863,1999,2072,2266,2267,2328,2490,377,434,438,443,464,489,521,599,606,620,734,753,2524,2561,2601,2604,2666,2673,2723,2841,2850,1206,1446,1574,1769
)
--Mentha canadensis L.
select speciesid,latinName, latinNameFull, replace(latinNameFull, '  ', ' ') from QH where speciesid in (
291,311,1813,1863,1999,2072,2266,2267,2328,2490,377,434,438,443,464,489,521,599,606,620,734,753,2524,2561,2601,2604,2666,2673,2723,2841,2850,1206,1446,1574,1769
)

select latinNameFull, SUBSTRING(latinNameFull,1, CHARINDEX(CHAR(32), latinNameFull, charIndex(CHAR(32), latinNameFull, 1) +1)) from QH

update QH set latingenus = SUBSTRING(latingenusFull,1, CHARINDEX(' ', latingenusFull))

select latinNameFull,
charIndex(' var. ', latinNameFull, 1),
CHARINDEX(' ', latinNameFull, charIndex(' var. ', latinNameFull, 1) +6),
SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' var.', latinNameFull, 1) +6))
from QH where charIndex(' var. ' ,latinNamefull, 1) > 1

--update QH set latinName=SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' ', latinNameFull, 1) +1))
from QH

-- 更新var. 的字符串
--update QH set latinName=SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' var.', latinNameFull, 1) +6))
from QH where charIndex(' var. ' ,latinNamefull, 1) > 1

select latinNameFull,
charIndex(' subsp. ', latinNameFull, 1),
CHARINDEX(' ', latinNameFull, charIndex(' subsp. ', latinNameFull, 1) +8),
SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' subsp.', latinNameFull, 1) +8))
from QH where charIndex(' subsp. ' ,latinNamefull, 1) > 1

--update QH set latinName=SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' subsp.', latinNameFull, 1) +8))
from QH where charIndex(' subsp. ' ,latinNamefull, 1) > 1

select latinNamefull,latinName from QH where latinNamefull like '% subsp.%'

--还有f.也需要处理

--查看处理后的数据，用眼睛看，发现有部分未处理好的，约44个
SELECT  speciesid, cnfamily, latinfamily, cngenus, latingenus, cnname, latinname, latinnamefull
FROM     QH
ORDER BY speciesid

--手动修改：670,1063,1164,2567,2600,2642,2820,1704



---将m_plant表写入phylo数据库，与其他两个地区一起计算
--select * into minid2_plant from speciesRichnessXinJiang.dbo.m_plant
delete m_plant where id !=minid2
delete m_plant  where minid2 is null
select distinct minid2  from minid2_plant
select distinct minid  from minid2_plant
select * from minid2_plant

--弄错了，把列加在了原新疆数据中
alter table minid2_plant add  IsQH  bit
alter table minid2_plant add  IsXJ   bit
alter table minid2_plant add  IsXZ  bit

update minid2_plant set IsQH=1 where cnName in (select cnName from QH)
update minid2_plant set IsXJ=1 where cnName in (select cnName from XJ)
update minid2_plant set IsXZ=1 where cnName in (select cnName from XZ)


--将数据放在一个新的大表XQT
delete XQT
--先把物种最多的XZ放进去
select * into XQT from XZ
--update XQT set isXZ=1

insert into XQT(cnfamily,latinfamily,cngenus,latingenus,cnname,latinname,IsXZ)
select cnfamily,latinfamily,cngenus,latingenus,cnname,latinname,1 from XZ

insert into XQT(cnfamily,latinfamily,cngenus,latingenus,cnname,latinname,IsQH)
select cnfamily,latinfamily,cngenus,latingenus,cnname,latinname,1 from QH

insert into XQT(cnfamily,latinfamily,cngenus,latingenus,cnname,latinname,IsXJ)
select cnfamily,latinfamily,cngenus,latingenus,cnname,latinname,1 from XJ

insert into XQT(cnfamily,latinfamily,cngenus,latingenus,cnname,latinname,IsOld)
select cnfamily2,latinfamily2,cngenus2,latingenus2,cnname2,latinname2,1 from minid2_plant where latinname2 is not null

update XQT set IsXZ =1 where latinname in (select latinname from XZ)
update XQT set IsQH =1 where latinname in (select latinname from QH)
update XQT set IsXJ =1 where latinname in (select latinname from XJ)
update XQT set IsOld =1 where latinname in (select latinname2 from minid2_plant)


--删掉重复的
delete XQT where id not in(
	select min(id) from  XQT group by latinname
)

select * from QH where latinname  not in (select latinname from XQT)
select distinct(latinname) from QH

select * from XQT order by id

update XQT set id=id-22418


--验证物种数，QH still差两种
select * from minid2_plant
select * from QH where latinName is null or latinName = ''
select * from XZ
select * from XJ


select * from XQT where IsXZ =1
select * from XQT where IsQH =1
select * from XQT where IsXJ =1
select * from XQT where Isold =1

select * from XQT where IsXJ =1 and isold is null   --1019
select * from XQT where Isold =1 and isxj is null   --450

select * from XQT where (isQH=1 or isxj=1 or isold=1) 
--and latinname in (select latinname2 from speciesRichnessXinJiang.dbo.m_plant where culandwildflag=1 or culandwildflag=3)
order by id

select * from alltype
select * from speciesRichnessXinJiang.dbo.m_plant where culAndWildFlag=2

--新疆青海西藏物种，未去除m_plant的栽培种
select * from XQT where id not in (
	select id from XQT where isOld=1 and isXZ is null and isQH is null and isXJ is null
	and  latinname in (select latinname2 from  speciesRichnessXinJiang.dbo.m_plant where culAndWildFlag=2)  
) order by id


--青海新疆物种，去除了m_plant的栽培种
select * from XQT where id not in (
	select id from XQT where isOld=1 and isXZ is null and isQH is null and isXJ is null
	and  latinname in (select latinname2 from  speciesRichnessXinJiang.dbo.m_plant where culAndWildFlag=2) 
    ) and (isqh=1 or isxj=1 or isold=1)
order by id

SELECT compatibility_level  
FROM sys.databases WHERE name = 'phylo'; 

ALTER DATABASE phylo  
SET COMPATIBILITY_LEVEL = 160;  
GO

--
select * from XJ
--裕民县、托里县、精河县、博乐市、温泉县、霍城县、察布查尔县、伊宁市、巩留县、新源县、尼勒克县、特克斯县、昭苏县、
select speciesid, STRING_SPLIT(county, '、') from XJ
SELECT Value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');

SELECT distinct speciesid, value
into xjCounty
FROM XJ
    CROSS APPLY STRING_SPLIT(county, '、');

select * from xjcounty order by speciesid

select * from m_county

select distinct()