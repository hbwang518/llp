SELECT * FROM disaster
SELECT * FROM basicXj.dbo.geomor
SELECT * FROM hydro
SELECT * FROM river
SELECT * FROM snow
--SELECT substring(convert(char(20),soil_id),1,2),soil_id FROM soil where soil_id < 100
SELECT * FROM soilIndex where code < 10
SELECT * FROM travel
--update soil set soil2 = convert(int ,substring(convert(char(20),soil_id),1,2)) where soil_id > 99
--update soil set soil2 = null
select * from basicXj.dbo.soil
select * from soil where soil_id < 100

--update soil set soil2 =03 where soil_id < 100

select b.* from soil a ,soilIndex b where a.soil2=b.code and b.code = 3

--update soil set china = b.china ,us = b.us from soil a, soilIndex b where a.soil2=b.code and b.code = 3

SELECT substring(convert(char(20),Hydro_id),1,1),hydro_id FROM hydro where hydro_id > 99
--update hydro set hydro_id1 = convert(int ,substring(convert(char(20),hydro_id),1,1)) 

SELECT substring(convert(char(20),geomor_id),1,2),geomor_id FROM geomor where geomor_id > 99
--update geomor set geomor_id2 = convert(int ,substring(convert(char(20),geomor_id),1,2)) 

SELECT substring(convert(char(20),disaster_id),1,2),disaster_id FROM disaster where disaster_id > 99
--update disaster set disaster_id2 = convert(int ,substring(convert(char(20),disaster_id),1,2)) where disaster_id > 99

SELECT substring(convert(char(20),disaster_id),1,1),disaster_id FROM disaster where disaster_id < 100
--update disaster set disaster_id2 = convert(int ,substring(convert(char(20),disaster_id),1,1)) where disaster_id < 100

SELECT substring(convert(char(20),snow_id),1,1),snow_id FROM snow 
--update snow set snow_id1 = convert(int ,substring(convert(char(20),snow_id),1,1)) 


select * from sheet2
--update sheet2 set region = region-1

--update sheet2 set region = 6 where region = 0

select * from piaoResult 

select * from sheet2 where region = 0

select * from sheet2 a,piaoResult b where a.id = b.id 

--update piaoResult set newRegion = b.region from piaoResult a, sheet2 b where a.id = b.id 

--update piaoResult set chinaSoil = c.china, usSoil = c.us from piaoResult a, sheet2 b, basicXj.dbo.soil c where a.id = b.id and b.soil = c.soil_id

--update piaoResult set geomor = c.geomor_id2 from piaoResult a, sheet2 b, basicXj.dbo.geomor c where a.id = b.id and b.geomor = c.geomor_id

--update piaoResult set aspect = b.poxiang, slope=b.slope from piaoResult a, sheet2 b where a.id = b.id

select id,type,count(type) from travel group by id, type order by id

select id, china ,sum(area) from soil group by id,china order by id
select id, geomor_id2 ,sum(area) from geomor group by id,geomor_id2 order by id

select distinct(disaster_id2) from disaster
select id, disaster_id2 ,sum(area) from disaster group by id,disaster_id2 order by id
select id, hydro_id1 ,sum(area) from hydro group by id,hydro_id1 order by id
select id, snow_id1 ,sum(area) from snow group by id,snow_id1 order by id

select * from basicXj.dbo.soil order by china
--update soil set china = 0 where china is null
--update soil set us = 0 where us is null

--update soil set chinaCode =a.code  from soil,soilCode a where soil.china= a.soil
--update soil set usCode =a.code from soil,soilCode a where soil.us= a.soil  

--update piaoresult set chinasoilcode = 0, chinasoil=0 where chinasoil is null
--update piaoresult set ussoilcode = 0, ussoil=0 where ussoil is null
--update piaoResult set chinaSoilCode =a.code  from piaoresult,basicXj.dbo.soilcode a where piaoresult.chinasoil= a.soil
--update piaoResult set usSoilCode =a.code  from piaoresult,basicXj.dbo.soilcode a where piaoresult.ussoil= a.soil  

select * from piaoresult

select a.lon, a.lat, b.lon, b.lat from piaoresult a, sheet2 b where a.id =b.id 


select * from endemism where cnname not in (select cnname from plant)

SELECT * FROM plant WHERE (cnName LIKE '%·ïÃ«¾Õ%') ORDER BY latinName

SELECT cnName  FROM plant WHERE (cnName LIKE '__·ïÃ«¾Õ%') ORDER BY latinName

select REPLACE ( 'abcd' , 'bc' , 'ee' ) 

--update plant set cnName = Replace(cnName,'·ï','·ç') where (cnName LIKE '%·ïÃ«¾Õ')

SELECT cnName,Replace(cnName,'·ï','·ç')  FROM plant WHERE (cnName LIKE '%·ïÃ«¾Õ') ORDER BY latinName

select count(cnname) from plant where protectionvalue is not null

select * from xjendangered

select * from xjendangered where cnname not in (select cnname from plant)


select cnname from endemism where cnname not in (select cnname from plant)

select * from plant where cnname like '%¸Ê²Ý%'

select * from plant where cnname not in (select cnname from plantcounty) and culAndWildFlag =1 order by no



--update m_grid set geomor =a.geomor from m_grid, sheet2$ a where m_grid.id = a.id

--update m_grid set ph =a.ph from m_grid, sheet3$ a where m_grid.id = a.id