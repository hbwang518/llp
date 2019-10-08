select * from xjendangered where cnname not in (select cnname from plant)

SELECT *
FROM plant
WHERE (cnName LIKE '%»ÆÜÎ%')
ORDER BY latinName

select * from sheet3$
select * from plant

select * from plant a, sheet3$ b where a.No = b.No

--insert into plant select * from sheet3$

select * from sheet4$ where region not in (select distribution from plantCounty)

select * from areaToCounty  order by id where area not in (select distribution from plantCounty)

select * from animalCounty order by distribution  where distribution = '654128' order by distribution

select * from animalCounty where distribution = 'ÍÐÄ¾¶û·å'

--update animalCounty set distribution='652922' where distribution = 'ÍÐÄ¾¶û·å'

--update animalCounty set distribution = m_area

--update animalCounty set distribution = m_area.id from animalCounty,m_area where animalCounty.distribution = m_area.area

--update animalCounty set distribution = m_county.code from animalCounty,m_county where animalCounty.distribution = m_county.county

--update plantCounty set distribution = '67' where autoId = 19185

select * from  plantCounty where no = 4028 

--update plantCounty set distribution = plantCounty$.distribution from plantCounty,plantCounty$ where plantCounty.autoId = plantCounty$.autoId and plantCounty.no=4028

select * from plantCounty where distribution like '67%' and distribution not in (select distribution from plantCounty where distribution = '67')

--update plantCounty set distribution1 = cast(distribution as int)

select * from m_county order by county

select * from saltPlant

select distinct(distribution) from plantCounty where Ltrim(rtrim(distribution)) not in (select distinct(Ltrim(rtrim(area))) from areaToCounty)

--update saltPlant set cnName = sheet5$.plant1 from saltPlant, sheet5$ where saltPlant.cnName = sheet5$.salt


--update endemism set cnName = sheet5$.plant2 from endemism, sheet5$ where endemism.cnName = sheet5$.endemism

--update xjendangered set cnName = sheet5$.plant3 from xjendangered, sheet5$ where xjendangered.cnName = sheet5$.xjendangered

select cnName from saltPlant where cnName not in (select cnName from plant)
select cnName from endemism where cnName not in (select cnName from plant)
select cnName from xjendangered where cnName not in (select cnName from plant)

--update plant set xjendangeredFlag = 1 where cnName in (select cnName from xjendangered)
--update plant set endemismFlag = 1 where cnName in (select cnName from endemism)
--update plant set halophilousFlag = 1 where cnName in (select cnName from saltPlant)

select * from plant where halophilousFlag = 1
select * from plant where endemismFlag = 1
select * from plant where xjendangeredFlag = 1

select * from M_Area

select * from M_County

--select distinct(area) into M_Area from areaToCounty order by area

--update areatoCounty set area = m_area.id from areaToCounty , m_area where areaToCounty.area = m_area.area

select count(*) from animal where speciesFlag='b'

select * from animal where speciesFlag='b'

--update animal set no = no + 1000 where speciesFlag='m'

select * from animalCounty

--update animalCounty set no = animal.no from animalCounty, animal where animalCounty.cnName = animal.cnName  and animal.speciesFlag='m'
select * from animalCounty where no not in (select no from animal)

select * from sheet4$

select * from plantCounty

select * from plant

select * from plant a,sheet4$ b , m_County c where a.cnName = b.plant and b.region = c.county 
select * from plant a,sheet4$ b , m_area c where a.cnName = b.plant and b.region = c.area 

--insert into plantCounty select a.no,b.plant,c.code from plant a,sheet4$ b , m_County c where a.cnName = b.plant and b.region = c.code
--insert into plantCounty select a.no,b.plant,c.id from plant a,sheet4$ b , m_area c where a.cnName = b.plant and b.region = c.id

select * from sheet4$ where plant not in (select cnName from plant)
--delete region select * from sheet4$ where region not in (select area from m_area) and region not in (select county from m_county)

select * from m_area
select * from m_county where county like '%ºÍÌï%'
select * from sheet4$ where plant not in (select cnName from plant)

--update sheet4$ set region = '653221' where region = 'ºÍÌïÊÐ'

--update tMean set tmean1 = tmean1 / 10 , tmean2 = tmean2 / 10, tmean3 = tmean3 / 10
, tmean4 = tmean4 / 10, tmean5 = tmean5 / 10, tmean6 = tmean6 / 10, tmean7 = tmean7 / 10
, tmean8 = tmean8 / 10, tmean9 = tmean9 / 10, tmean10 = tmean10 / 10, tmean11 = tmean11 / 10
, tmean12 = tmean12 / 10

--update prec set prec1 = prec1 / 10 , prec2 = prec2 / 10, prec3 = prec3 / 10
, prec4 = prec4 / 10, prec5 = prec5 / 10, prec6 = prec6 / 10, prec7 = prec7 / 10
, prec8 = prec8 / 10, prec9 = prec9 / 10, prec10 = prec10 / 10, prec11 = prec11 / 10
, prec12 = prec12 / 10

select a.*,b.*,c.* from piaoResult a,tMean b, prec c where a.id = b.id and a.id = c.id


select a.*,b.*,c.* from piaoResult a left join tMean b on a.id = b.id left join prec c on a.id = c.id

select * from piaoResult a where a.id not in (select id from prec)
select * from piaoResult a where a.id not in (select id from tmean)

select * from prec

select * from tMean where id is null

--delete tMean where id is null

--update piaoResult set ph = sheet1$.ph from sheet1$ ,piaoResult where sheet1$.id = piaoResult.id

select a.*,b.*,c.*,d.* from piaoResult a left join tMean b on a.id = b.id left join prec c on a.id = c.id inner join tempPlotClimate d on  a.id = d.id

select * from tempPlotClimate

select * from multiAltitude

--update multiAltitude set distribution = a.id from multiAltitude, m_area a where multiAltitude.distribution = a.area


--update multiAltitude set distribution = a.code from multiAltitude, m_county a where multiAltitude.distribution = a.county

--update areaToCounty set county = a.code from areaToCounty,m_county a where areaToCounty.county = a.county

select * from areaToCounty





