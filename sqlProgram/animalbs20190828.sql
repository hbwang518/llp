##update m_animal set del = 0 where del is null

##计算物种分布
##copy and modified from speciesRichnessStepNew20141297.sql   ----20190828

#step 1 县域分布
select animal_id,county_code into distinctAnimalCounty from (
select a.animal_id,b.county_code from AnimalCounty a,areaToCounty b where a.distribution =b.area_id
union 
select animal_id,distribution county_code from AnimalCounty where distribution in (select code from M_County)
) as ta

#select * from distinctanimalcounty   --25266 ---> 25293
#select * from distinctanimalcounty where animal_id = 424

#step 2 未考虑海拔分布的栅格
select a.animal_id, a.county_code, b.lowAltitude, b.highAltitude, c.Id, c.altitude_min, c.altitude_max into AnimalCountyAltitudeResult
from distinctAnimalCounty a, M_Animal b, M_Grid c, piaoCountyCode d, M_County e 
where a.animal_id=b.id and c.county=d.Id and d.code =e.code and e.code=a.county_code 

#select count(*) from AnimalCountyAltitudeResult   --5034023 ---> 5043055
#select top 1000 * from AnimalCountyAltitudeResult
#select * from AnimalCountyAltitudeResult where animal_id = 424

#step 3 实际分布的栅格
select * into AnimalCountyAltitudeValidResult from AnimalCountyAltitudeResult 
where ( (altitude_min>=lowAltitude and altitude_min<= highAltitude) 
or (altitude_max>=lowAltitude and altitude_max<= highAltitude) 
or (altitude_min<=lowAltitude and altitude_max>= highAltitude)
)

#select count(*) from AnimalCountyAltitudevalidResult   --3450051 ---> 3455766
#select top 1000 * from AnimalCountyAltitudeValidResult


#step 4  计算grid物种数
##animal
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani1 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.del = 0 and b.speciesFlag='m') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani2 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.del = 0 and b.speciesFlag='b') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani3 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.del = 0 and b.speciesFlag='m' and b.endangeredFlag = '1') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani4 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.del = 0 and b.speciesFlag='b' and b.endangeredFlag = '1') c group by c.Id

select * from ani1 order by id
select * from ani2 order by id
select * from ani3 order by id
select * from ani4 order by id

CREATE INDEX ani1   ON ani1  (id)
CREATE INDEX ani2   ON ani2  (id)
CREATE INDEX ani3   ON ani3  (id)
CREATE INDEX ani4   ON ani4  (id)

select * from m_grid

select z.id,ani1.*,ani2.*,ani3.*,ani4.* from m_grid z
left join ani1  on z.id=ani1.id
left join ani2  on z.id=ani2.id
left join ani3 on z.id=ani3.id
left join ani4 on z.id=ani4.id
order by z.id


##plant
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamilyOri)) cnFamily ,count(distinct(cnGenusOri)) cnGenus into a1  from (select a.Id,b.id plant_id,b.cnFamilyOri,b.cnGenusOri from PlantCountyAltitudeValidResultdistinct a,M_Plant b where a.plant_id=b.id) w group by w.Id 																							 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamilyOri)) cnFamily ,count(distinct(cnGenusOri)) cnGenus into a2  from (select a.Id,b.id plant_id,b.cnFamilyOri,b.cnGenusOri from PlantCountyAltitudeValidResultdistinct a,M_Plant b where a.plant_id=b.id and b.typeCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamilyOri)) cnFamily ,count(distinct(cnGenusOri)) cnGenus into a3  from (select a.Id,b.id plant_id,b.cnFamilyOri,b.cnGenusOri from PlantCountyAltitudeValidResultdistinct a,M_Plant b where a.plant_id=b.id and b.typeCode ='2') w group by w.Id
select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamilyOri)) cnFamily ,count(distinct(cnGenusOri)) cnGenus into a4  from (select a.Id,b.id plant_id,b.cnFamilyOri,b.cnGenusOri from PlantCountyAltitudeValidResultdistinct a,M_Plant b where a.plant_id=b.id and b.typeCode ='3') w group by w.Id 

select z.id as id, a1.*,a2.*,a3.*,a4.* from m_grid z	
left join a1  on z.id=a1.id
left join a2  on z.id=a2.id
left join a3  on z.id=a3.id
left join a4  on z.id=a4.id
order by z.id


#step 5 计算物种体重&RS的中值&平均值
##/*   */中文字为第一次执行，计算重量和RS中值，完成后将其注释，继续执行后面的平均值计算。
declare @animalMCon varchar(500) = ' speciesFlag=''m'' '
declare @animalBCon varchar(500) = ' speciesFlag=''b'' '
declare @animalSql varchar(2000) = '
select aaa.gridid,bbb.animal_id, bbb.--field-- from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
select c.id as gridid, d.--field--, ROW_NUMBER() over (partition by c.id order by d.--field--) as rownum 
from m_grid c left join 
(select a.id, b.--field-- from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and --CONDITION-- and b.del = 0)
d on c.id=d.id
	) aa group by gridid
) aaa left join (
select c.id as gridid, d.animal_id, d.--field--, ROW_NUMBER() over (partition by c.id order by d.--field--) as rownum 
from m_grid c left join 
(select a.id, a.animal_id, b.--field-- from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and --CONDITION-- and b.del = 0)
d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
'
--weight
declare @animalWeight varchar(500) = 'weight'
declare @animalMSql  varchar(2000) = REPLACE(REPLACE(@animalSql, '--CONDITION--', @animalMCon), '--field--', @animalWeight)
declare @animalBSql  varchar(2000) = REPLACE(REPLACE(@animalSql, '--CONDITION--', @animalBCon), '--field--', @animalWeight)

declare @animalRA varchar(500) = 'RA'
declare @animalMSqlRA varchar(2000) = REPLACE(REPLACE(@animalSql, '--CONDITION--', @animalMCon), '--field--', @animalRA)
declare @animalBSqlRA varchar(2000) = REPLACE(REPLACE(@animalSql, '--CONDITION--', @animalBCon), '--field--', @animalRA)

declare @animalExtentWE varchar(500) = 'ExtentWE'
declare @animalMSqlExtentWE varchar(2000) = REPLACE(REPLACE(@animalSql, '--CONDITION--', @animalMCon), '--field--', @animalExtentWE)
declare @animalBSqlExtentWE varchar(2000) = REPLACE(REPLACE(@animalSql, '--CONDITION--', @animalBCon), '--field--', @animalExtentWE)

declare @animalExtentNS varchar(500) = 'ExtentNS'
declare @animalMSqlExtentNS varchar(2000) = REPLACE(REPLACE(@animalSql, '--CONDITION--', @animalMCon), '--field--', @animalExtentNS)
declare @animalBSqlExtentNS varchar(2000) = REPLACE(REPLACE(@animalSql, '--CONDITION--', @animalBCon), '--field--', @animalExtentNS)

/*
exec('select m.gridid, m.weight as Mweight, mm.RA as MRA, mmm.ExtentWE as MextentWE, mmmm.ExtentNS as MextentNS, n.weight as Bweight, nn.RA as BRA, nnn.ExtentWE as BextentWE, nnnn.ExtentNS as BextentNS from (' 
+ @animalMSql + ') m join (' + @animalBSql + ') n on m.gridid=n.gridid join (' 
+ @animalMSqlRA + ') mm on m.gridid=mm.gridid join (' + @animalBSqlRA + ') nn on m.gridid=nn.gridid join (' 
+ @animalMSqlExtentWE + ') mmm on m.gridid=mmm.gridid join (' + @animalBSqlExtentWE + ') nnn on m.gridid=nnn.gridid join (' 
+ @animalMSqlExtentNS + ') mmmm on m.gridid=mmmm.gridid join (' + @animalBSqlExtentNS + ') nnnn on m.gridid=nnnn.gridid order by m.gridid')
*/

declare @animalSqlAvg varchar(2000) = '
select c.id, round(avg(log(b.weight,2)),2) as weight, avg(b.RA) as RA, avg(b.ExtentWE) as extentWE, avg(b.ExtentNS) as extentNS
from m_grid c left join AnimalCountyAltitudeValidResult a on c.id=a.id
left join m_animal b on a.animal_id=b.Id and --CONDITION-- and b.del = 0
group by c.id '
	
declare @animalMAvg varchar(2000) = REPLACE(@animalSqlAvg, '--CONDITION--', @animalMCon)
declare @animalBAvg varchar(2000) = REPLACE(@animalSqlAvg, '--CONDITION--', @animalBCon)
exec('select m.id, m.weight as Mlogweightavg, m.RA as MRAavg, m.ExtentWE as MextentWEavg, m.ExtentNS as MextentNSavg, n.weight as Blogweightavg, n.RA as BRAavg, n.ExtentWE as BextentWEavg, n.ExtentNS as BextentNSavg from ('+@animalMAvg+') m join ('+@animalBAvg+') n on m.id=n.id order by m.id')


--plant
declare @plantSQl varchar(2000) = 'select aaa.gridid, bbb.--field-- from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.--field--, ROW_NUMBER() over (partition by c.id order by d.--field--) as rownum 
		from m_grid c left join 
		(
			select a.id, b.--field-- from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id --condition--
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.--field--, ROW_NUMBER() over (partition by c.id order by d.--field--) as rownum 
	from m_grid c left join 
	(
		select a.id, b.--field-- from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id --condition--		
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
'
declare @plantCon varchar(200) = 'and b.typecode=''3'' ' --and b.typecode=''1''计算不同生活型，更改1灌木，2草本，3乔木
declare @plantSqlHeight varchar(2000) = REPLACE(REPLACE(@plantSQl, '--CONDITION--', @plantCon), '--field--', 'HeightMeanF')
declare @plantSqlExtentNS varchar(2000) = REPLACE(REPLACE(@plantSQl, '--CONDITION--', @plantCon), '--field--', 'ExtentNS')
declare @plantSqlExtentWE varchar(2000) = REPLACE(REPLACE(@plantSQl, '--CONDITION--', @plantCon), '--field--', 'ExtentWE')
declare @plantSqlRA varchar(2000) = REPLACE(REPLACE(@plantSQl, '--CONDITION--', @plantCon), '--field--', 'RA')
declare @plantExecSql varchar(4000) = '
select m1.gridid, m1.heightMeanF, m2.extentNS, m3.extentWE,m4.RA from ('+@plantSqlHeight+') m1 
join ('+@plantSqlExtentNS+') m2 on m1.gridid=m2.gridid 
join ('+@plantSqlExtentWE+') m3 on m1.gridid=m3.gridid 
join ('+@plantSqlRA+') m4 on m1.gridid=m4.gridid order by m1.gridid 
'
--exec(@plantExecSql)


declare @plantExecAvg varchar(4000) = '
select c.id as gridid, cast(avg(d.HeightMeanF) as numeric(10,1)) as heightMeanFavg, avg(d.extentNS) as extentNSavg, avg(d.ExtentWE) as extentWEavg,  avg(d.RA) as RAavg 
	from m_grid c left join 
	(
		select a.id, b.HeightMeanF, b.ExtentNS, b.ExtentWE, b.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id --CONDITION--
	)
	d on c.id=d.id
	group by c.id order by c.id
'

declare @plantExecAvgSql varchar(4000) = REPLACE(@plantExecAvg, '--CONDITION--', @plantCon)
exec(@plantExecAvgSql)

---------------------------------------------------------------------------------------------

select * from m_plant where del = 0 order by id
select * from plantXJworlddistribution
## alter table m_plant add TDWG3 int;
## update m_plant set TDWG3 = b.n_regions from m_plant, plantXJworlddistribution b where m_plant. id = b.id

