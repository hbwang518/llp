
----------------从bodysize文件中----------
##动物个体大小,利用Ecology Jetz的数据.
select * from m_animal
select * from BirdFuncDat
select * from MamFuncDat

select a.*, b.bodymass_value from m_animal a
left join BirdFuncDat b on a.latinName = b.scientific
order by a.id

select a.*, c.bodymass_value from m_animal a
left join MamFuncDat c on a.latinName = c.scientific
order by a.id


select d.* from m_animal d where d.latinname not in 
(
select distinct(a.latinname) from m_animal a, BirdFuncDat b
where a.latinName = b.scientific
union
select distinct(a.latinname) from m_animal a, MamFuncDat c
where a.latinName = c.scientific
)
order by d.id

##补充之后,更新m_animal表,写入个体大小数据
select * from animalbs
select * from m_animal0 order by id
select * from m_animal order by id

--select * into m_animal from m_animal0
select * from m_animal
--update m_animal set cnName = a.cnName, latinName = a.latinName, lowAltitude=a.lowAltitude, highAltitude = a.highAltitude,
--weight=a.weight, lowWeight=a.lowWeight, highWeight=a.highWeight from m_animal, animalbs a where m_animal.id=a.id
select * from m_animal where latinfamily like '%gliridae%'
## 睡鼠科--->日本睡鼠科



###栅格物种个体大小
select * from distinctAnimalCounty
----------------------------------------------------------------------
-----------copy and modified from speciesRichnessStepNew20141297.sql --2018-09-16
----------------------------------------------------------------------
-----animal-----
--programme first  ---前面已做
/* 采用更新表
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

--programme second   ---海拔数据已补充完整,不需要此步骤

--update M_Animal set lowAltitude=-10000,highAltitude=-10000 where lowAltitude is null
--select * from M_Animal where lowAltitude=-10000

--programme third    ---海拔数据已补充完整,不需要此步骤
--update M_Animal set lowAltitude=lowAltitude-50,highAltitude=highAltitude+50 where lowAltitude=highAltitude


--programme forth    ---将补充的海拔数据写入AnimalCountyAltitudeResult表,这个表有物种的海拔数据和物种所在栅格的海拔数据
/*采用更新表
select a.animal_id,a.county_code,b.lowAltitude,b.highAltitude,c.Id,c.altitude_min,c.altitude_max into AnimalCountyAltitudeResult
from distinctAnimalCounty a ,M_Animal b,M_Grid c,piaoCountyCode d,M_County e 
where a.animal_id=b.id and c.county=d.Id and d.code =e.code and e.code=a.county_code 
--backup oldtable
--select * into ProcessedOldTable.dbo.AnimalCountyAltitudeResult2010 from AnimalCountyAltitudeResult
--drop table AnimalCountyAltitudeResult

比较原来的表和新生成的表,即validate
#select * from ProcessedOldTable.dbo.AnimalCountyAltitudeResult2010 where animal_id=1 order by id
#select * from AnimalCountyAltitudeResult where animal_id=1 order by id

--validate
select * from M_Animal where id = 11
select * from AnimalCounty where animal_id= 11
select distinct(county_Code) from AnimalCountyAltitudeResult where animal_id = 11
select distinct(county_code) from areaToCounty where area_id = 46

select * from AnimalCountyAltitudeResult where animal_id = 202
select * from m_grid c,piaoCountyCode d where c.county=d.Id and d.code = '653223'

*/

--programme fifth采用

--select * into AnimalCountyAltitudeValidResult from AnimalCountyAltitudeResult 
where (lowAltitude < -8000 or (altitude_min>=lowAltitude and altitude_min<= highAltitude ) 
or (altitude_max>=lowAltitude and altitude_max<= highAltitude ) 
or (altitude_min<=lowAltitude and altitude_max>= highAltitude )
)
#or (altitude_min>=lowAltitude and altitude_max<= highAltitude )  ---物种分布海拔包含了栅格海拔的情况不需要单独考虑,前面的两条已包含

--backup oldtable
--select * into ProcessedOldTable.dbo.AnimalCountyAltitudeValidResult2010 from AnimalCountyAltitudeValidResult
--drop table AnimalCountyAltitudeValidResult    
--select count(*) from ProcessedOldTable.dbo.AnimalCountyAltitudeValidResult2010                                                                            


--programme sixth    ---计算栅格物种数
select top 1000 * from AnimalCountyAltitudeValidResult

select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani1 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani2 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='b') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani3 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m' and b.endangeredFlag = '1') c group by c.Id
select Id,count(distinct(animal_id)) animal,count(distinct(cnFamily)) cnFamily,count(distinct(cnOrder)) cnOrder into ani4 from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='b' and b.endangeredFlag = '1') c group by c.Id

select * from ani1 order by id
select * from ani2 order by id
select * from ani3 order by id
select * from ani4 order by id

select * from m_grid


--select region,Id,count(distinct(cnName)),count(distinct(cnFamily)),count(distinct(cnGenus)) from (select d.lastregion,a.id,a.cnName,b.cnFamily,b.cnGenus from animalCountyAltitudeValidResult a,M_animal b,m_grid d where a.cnName=b.cnName and a.Id=d.id) w group by w.region,w.Id order by w.region


--validate

select count(distinct(animal_id)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 26468
select count(distinct(cnFamily)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 26468
select count(distinct(cnOrder)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 26468

select count(distinct(animal_id)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 33408
select count(distinct(cnFamily)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 33408
select count(distinct(cnOrder)) from (select a.Id,a.animal_id,b.cnFamily,b.cnOrder from AnimalCountyAltitudeValidResult a,M_Animal b where a.animal_id=b.id and b.speciesFlag='m') c where c.id = 33408



CREATE INDEX ani1   ON ani1  (id)
CREATE INDEX ani2   ON ani2  (id)
CREATE INDEX ani3   ON ani3  (id)
CREATE INDEX ani4   ON ani4  (id)

select z.*,ani2.*,ani3.*,ani4.* from ani1 z
left join ani2  on z.id=ani2.id
left join ani3 on z.id=ani3.id
left join ani4 on z.id=ani4.id
order by z.id



--取每个grid的log的weight的平均值
select a.id, avg(log(b.weight)) from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id group by a.id order by a.id  ---several rows missing


--显示每一个grid，按照weight排列的数据
select a.id as gridid, b.id as animalid, b.weight, ROW_NUMBER() over (partition by a.id order by b.weight) as rownum from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id

--取每个grid最中间的weight值：m&b
##rows missing
select aaa.gridid, bbb.animalid, bbb.weight from 
(
	select gridid, floor(max(rownum)/2) as rownum1 from (
	select a.id as gridid, b.id as animalid, b.weight, ROW_NUMBER() over (partition by a.id order by b.weight) as rownum from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id where b.speciesFlag='m'
	) aa group by gridid
) aaa join (
select a.id as gridid, b.id as animalid, b.weight, ROW_NUMBER() over (partition by a.id order by b.weight) as rownum from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id where b.speciesFlag='m'
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum 

##with m_grid 17454 rows
select a.id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='m'

select aaa.gridid,bbb.animal_id, bbb.weight from 
(
	select gridid, ceiling(max(rownum)/2) as rownum1 from (
select c.id as gridid, d.weight, ROW_NUMBER() over (partition by c.id order by d.weight) as rownum 
from m_grid c left join 
(select a.id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='m')
d on c.id=d.id
	) aa group by gridid
) aaa left join (
select c.id as gridid, d.animal_id, d.weight, ROW_NUMBER() over (partition by c.id order by d.weight) as rownum 
from m_grid c left join 
(select a.id, a.animal_id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='m')
d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


select aaa.gridid,bbb.animal_id, bbb.weight from 
(
	select gridid, ceiling(max(rownum)/2) as rownum1 from (
select c.id as gridid, d.weight, ROW_NUMBER() over (partition by c.id order by d.weight) as rownum 
from m_grid c left join 
(select a.id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='b')
d on c.id=d.id
	) aa group by gridid
) aaa left join (
select c.id as gridid, d.animal_id, d.weight, ROW_NUMBER() over (partition by c.id order by d.weight) as rownum 
from m_grid c left join 
(select a.id, a.animal_id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='b')
d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid




##validate
select c.id as gridid, d.animal_id, d.weight, ROW_NUMBER() over (partition by c.id order by d.weight) as rownum 
from m_grid c left join 
(select a.id, a.animal_id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='m')
d on c.id=d.id


select aaa.gridid, bbb.animalid, bbb.weight from 
(
	select gridid, floor(max(rownum)/2) as rownum1 from (
	select a.id as gridid, b.id as animalid, b.weight, ROW_NUMBER() over (partition by a.id order by b.weight) as rownum from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id where b.speciesFlag='b'
	) aa group by gridid
) aaa join (
select a.id as gridid, b.id as animalid, b.weight, ROW_NUMBER() over (partition by a.id order by b.weight) as rownum from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id where b.speciesFlag='b'
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum 


##计算动物物种分布区##
--基于20091226植物的计算方法
--得到AnimalScorp-- that is 每个物种分布Grid的横向和纵向值即xy值
select animal_id, id Grid_id, id%240 GridLeft , id/240 GridTop into AnimalGridExtremum from AnimalCountyAltitudeValidResult

select distinct a.animal_id, min(a.Grid_id) GridTop from AnimalGridExtremum a,
(
select animal_id, min(GridTop) GridTop from AnimalGridExtremum
group by animal_id
) z
where a.animal_id = z.animal_id and a.GridTop = z.GridTop group by a.animal_id

--AnimalGridRange  最左，最右栅格信息

select animal_id, Count(*) from 
(
select a.animal_id, Grid_id from AnimalGridExtremum a,
	(
		select animal_id, min(GridLeft) GridLeft from AnimalGridExtremum 	
		group by animal_id 
	) b
	where a.animal_id = b.animal_id and a.GridLeft = b.GridLeft
) z group by animal_id having count(*) > 1

select * from AnimalGridExtremum
select * from animalgridrange order by animal_id
select * from m_animal a, animalgridrange b where a.id =b.animal_id

--AnimalGridRange表示某个动物最左边，最右边，最顶部，最底部的Grid  采用
select distinct animal_id, null GridLeft, null GridRight, null GridTop, null GridBottom into AnimalGridRange from AnimalCountyAltitudeValidResult

--update AnimalGridRange set GridLeft = z.Grid_id from AnimalGridRange, 
(
	select a.animal_id, Grid_id from AnimalGridExtremum a,
	(
		select animal_id, min(GridLeft) GridLeft from AnimalGridExtremum 	
		group by animal_id 

	) b
	where a.animal_id = b.animal_id and a.GridLeft = b.GridLeft
) z 
where AnimalGridRange.animal_id = z.animal_id


select * from AnimalGridRange where HorizonRange = 0 --=GridRight-GridLeft, VerticalRange=GridBottom-GridTop
select * from AnimalGridRange where VerticalRange > 0

--update LonMedian and LatMedian for AnimalGridRange 
--alter table AnimalGridRange add LonMedian decimal(10, 2);
--alter table AnimalGridRange add LatMedian decimal(10, 2);
--update AnimalGridRange set LonMedian = m_grid.Lon + AnimalGridRange.HorizonRange * 0.1 / 2 from AnimalGridRange, m_grid
where AnimalGridRange.GridLeft = m_grid.ID

--update AnimalGridRange set LatMedian = m_grid.Lat + AnimalGridRange.VerticalRange * 0.1 / 2 from AnimalGridRange, m_grid
where AnimalGridRange.GridBottom = m_grid.ID



select * from AnimalGridRange
select * from m_animal


##计算每一个Grid Range的RA
select a.id, b.id, b.RA, ROW_NUMBER() over (partition by a.id order by b.RA) from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.id

##取每个grid最中间的RA值
select aaa.gridid,bbb.animalid, bbb.RA from 
(
	select gridid, floor(max(rownum)/2) as rownum1 from (
	select a.id gridid, b.id, b.RA, ROW_NUMBER() over (partition by a.id order by b.RA) rownum from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.id
	) aa group by gridid
) aaa join (
select a.id gridid, b.id animalid, b.RA, ROW_NUMBER() over (partition by a.id order by b.RA) rownum from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum 

#17454rows
select aaa.gridid,bbb.animal_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' 
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' 
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


select aaa.gridid,bbb.animal_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' 
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' 
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid



--取每个grid最中间的 HorizonRange值
select aaa.gridid,bbb.animalid, bbb.HorizonRange from 
(
	select gridid, floor(max(rownum)/2) as rownum1 from (
	select a.id gridid, b.animal_id, b.HorizonRange, ROW_NUMBER() over (partition by a.id order by b.HorizonRange) rownum from AnimalCountyAltitudeValidResult a join AnimalGridRange b on a.animal_id=b.animal_id
	) aa group by gridid
) aaa join (
select a.id gridid, b.animal_id animalid, b.HorizonRange, ROW_NUMBER() over (partition by a.id order by b.HorizonRange) rownum from AnimalCountyAltitudeValidResult a join AnimalGridRange b on a.animal_id=b.animal_id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum 

##17454rows
select aaa.gridid,bbb.animal_id, bbb.HorizonRange from 
(
	select gridid, ceiling(max(rownum)/2) as rownum1 from (
		select c.id as gridid, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.HorizonRange from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' 
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.HorizonRange from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' 
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid



select aaa.gridid,bbb.animal_id, bbb.HorizonRange from 
(
	select gridid, ceiling(max(rownum)/2) as rownum1 from (
		select c.id as gridid, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.HorizonRange from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' 
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.HorizonRange from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' 
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid




--取每个grid最中间的verticLRange值
select aaa.gridid,bbb.animalid, bbb.VerticalRange from 
(
	select gridid, floor(max(rownum)/2) as rownum1 from (
	select a.id gridid, b.animal_id, b.VerticalRange, ROW_NUMBER() over (partition by a.id order by b.VerticalRange) rownum from AnimalCountyAltitudeValidResult a join AnimalGridRange b on a.animal_id=b.animal_id
	) aa group by gridid
) aaa join (
select a.id gridid, b.animal_id animalid, b.VerticalRange, ROW_NUMBER() over (partition by a.id order by b.VerticalRange) rownum from AnimalCountyAltitudeValidResult a join AnimalGridRange b on a.animal_id=b.animal_id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum 


#17454rows
select aaa.gridid,bbb.animal_id, bbb.VerticalRange from 
(
	select gridid, ceiling(max(rownum)/2) as rownum1 from (
		select c.id as gridid, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.VerticalRange from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' 
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.VerticalRange from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' 
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid




select aaa.gridid,bbb.animal_id, bbb.VerticalRange from 
(
	select gridid, ceiling(max(rownum)/2) as rownum1 from (
		select c.id as gridid, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.VerticalRange from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' 
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.VerticalRange from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' 
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid



##平均值
select c.id, avg(b.RA)
from m_grid c left join AnimalCountyAltitudeValidResult a on c.id=a.id
left join m_animal b on a.animal_id=b.Id and b.speciesflag= 'm' 
group by c.id order by c.id

##17454rows
select c.id as gridid, avg(d.RA)
	from m_grid c left join 
	(
		select a.id, b.RA from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m'
	)
	d on c.id=d.id
	group by c.id order by c.id


select c.id, avg(b.RA)
from m_grid c left join AnimalCountyAltitudeValidResult a on c.id=a.id
left join m_animal b on a.animal_id=b.Id and b.speciesflag= 'b' 
group by c.id order by c.id

##17454rows
select c.id as gridid, avg(d.RA)
	from m_grid c left join 
	(
		select a.id, b.RA from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b'
	)
	d on c.id=d.id
	group by c.id order by c.id






select * from AnimalCountyAltitudeValidResult
select * from m_animal
select * from m_grid order by id



select * from animalgridrange
select * from m_animal
select * from m_plant
select * from m_grid




#some rare species   validate
select * from AnimalCountyAltitudeValidResult where animal_id = 1018
select * from m_county where code = 653221

select * from AnimalCountyAltitudeValidResult where animal_id = 1014
select * from m_county where code = 653101

select * from AnimalCountyAltitudeValidResult where animal_id = 1075
select * from m_county where code = 652323

select * from AnimalCountyAltitudeValidResult where animal_id = 1020
select * from m_county where code = 653221

select * from AnimalCountyAltitudeValidResult where animal_id = 424
select * from m_county where code = 654124



select * from animalcounty where cnname = '萨氏伏翼'
select * from animalcounty where animal_id = 1014        ##cnname = '褐长耳蝠'
select * from animalcounty where cnname = '大黄鼠'



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








直接从主表中统计物种数(与上述的链表查询结果不同,可能某些物种没有分布区)
select distinct(cnfamily) from m_animal where speciesFlag='m'
select distinct(cnname) from m_plant where culandwildflag ='1' and id <5000

select * from M_Plant where id not in (select plant_id from plantcounty) and m_plant.culandwildflag = 1

select id,lastregion from m_grid order by id
 


select * from distinctanimalcounty


select animal_id, count(county_code) a from distinctAnimalCounty group by animal_id order by a, animal_id





--select * into processedoldtable.dbo._PHD_Grid_GridScope from _PHD_Grid_GridScope
--drop table _PHD_Grid_GridScope
select * from speciesNR
select * from speciesNR0
select * from speciesNRdelete
select * from eremoChina
select * from eremoChina2
select * from gridspecies01 order by id
--drop table plantCountyAltitudeValidResultDistinct02
select * from m_area
select * from plantbodysize
select * from animalcounty where animal_id=424
select * from m_county
select * from areatocounty

select * from m_animal where (del= 1 or del=2 or ra is null)
select * from animalcounty
select * from m_area
select * from areatocounty where area_id=42
select * from animalcounty where animal_id in (select id from m_animal where RA is null)
select * from m_animal where RA is null and speciesflag = 'b'
select * from m_animal where RA is null and speciesflag = 'm'
select * from m_animal where lowaltitude < 0
select * from m_animal where del is null and RA is not null
select * from m_animal where del is null
select * from m_animal where (del<> 1 and del<>2) or del is null
select * from m_animal where del<> 2

select * from m_plant where ra is not null order by id

select * from mediXJ01
select * from AnimalGridRange

select a.animal_id, a.county_code, b.lowAltitude, b.highAltitude, c.Id, c.altitude_min, c.altitude_max
from distinctAnimalCounty a, M_Animal b, M_Grid c, piaoCountyCode d, M_County e 
where a.animal_id=b.id and c.county=d.Id and d.code =e.code and e.code=a.county_code and b.id=424

select * from m_plant order by id
select * from plantheightflora

--update m_plant set heightmaxF = a.heightmax, heightminF = a.heightmin, heightmeanF=a.heightmean from m_plant, plantheightflora a where m_plant.id=a.id

select * from m_plant where del = 0 and (culandwildflag = 1 or 
select * from m_plant where culandwildflag =2  

select * from m_grid order by ID
SELECT distinct(vegettype) from m_grid 0~5
select * from allType
SELECT * FROM VEGET
select count(vegettype) a, vegettype from m_grid group by vegettype order by a

select * from m_plant where endemismFlag is not null or endangeredFlag is not null or xjendangeredFlag is not null
select * from m_plant where endangeredFlag is not null
select * from m_plant where xjendangeredFlag is not null

select * from m_plant order by RA
select * from IUCNCHINARED2013
select * from aspectcode
select * from eremoChina2
select * from m_area
select * from m_grid
select * from plantdumb
select * from plantbodysize

select top 1000 * from AnimalCountyAltitudeValidResult
select distinct animal_id, id from AnimalCountyAltitudeValidResult
select * from m_plant order by id
select * from alltype
select * from m_animal where highweight is not null
select * from areatocounty
select * from animalcounty
select * from AnimalCountyAltitudeResult
select * from AnimalGridExtremum order by gridtop
select * from animalgridrange order by animal_id

select top 100 * from plantCountyAltitudeValidResultDistinct where plant_id in (select id from m_plant where culandwildflag = 1)
select * from m_plant where del =0

select * from plantgridextremum    --4671920
select * from mMGRID
select * from mmgrid_bak
select distinct(endangeredflag) from m_animal
select * from m_animal order by id

select * from plantlonlat
select * from m_plant c, plantlonlat a, plantgridrange b left join a on a.plant_id = c.id 
								join b on c.id=b.plant_id order by c.id


select typecode, count(*) from m_plant group by typecode order by typecode
select * from m_plant order by typecode
select * from alltype where class = 'type' order by typecode

select @@version

##更新endemic和xjendangered两列，将删除的物种的信息写到被重复的物种。
select * from m_plant where del <> 0 order by endemismflag
--update m_plant set endemismflag =null
--update m_plant set xjEndangeredflag =null
--update m_plant set endemismflag =endemismflagOri
--update m_plant set xjEndangeredflag =xjEndangeredflagOri
select * from m_plant where id in (
select minid from m_plant where endemismflag =1 and minid<>id
) and (endemismflag <> 1 or endemismflag is null)
--update m_plant set endemismflag =1 where id in (select minid from m_plant where endemismflag =1 and minid<>id) and  endemismflag is null     --19
--update m_plant set xjEndangeredflag =1 where id in (select minid from m_plant where xjEndangeredflagOri =1 and minid<>id) and xjEndangeredflag is null  --1
select * from m_plant where xjendangeredflag=1  and xjendangeredflagori is null
select * from m_plant where endemismflag = 1 and  endemismflagori is null
select * from listpowos

select * from plantgridrange
select * from m_plant where DEL=0 and RA is not null  
select * from plantlonlat
select * from m_plant where extentNS <> extentNSORI+1
select * from m_plant where RA <> RAORI

select aaa.gridid,bbb.plant_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, a.plant_id, b.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and (b.typecode='1' or b.typecode='2' or b.typecode='3')
		)
		d on c.id=d.id 
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, a.plant_id, b.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and (b.typecode='1' or b.typecode='2' or b.typecode='3')
		
	)
	d on c.id=d.id 
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


#中值
##with m_grid 17454 rows
select a.id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='m'

select aaa.gridid, bbb.animal_id, bbb.weight from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
select c.id as gridid, d.weight, ROW_NUMBER() over (partition by c.id order by d.weight) as rownum 
from m_grid c left join 
(select a.id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0)
d on c.id=d.id
	) aa group by gridid     --get the medium row number
) aaa left join (
select c.id as gridid, d.animal_id, d.weight, ROW_NUMBER() over (partition by c.id order by d.weight) as rownum 
from m_grid c left join 
(select a.id, a.animal_id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0)
d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum   --get the value equals the medium row number
order by aaa.gridid


select aaa.gridid,bbb.animal_id, bbb.weight from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
select c.id as gridid, d.weight, ROW_NUMBER() over (partition by c.id order by d.weight) as rownum 
from m_grid c left join 
(select a.id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0)
d on c.id=d.id
	) aa group by gridid
) aaa left join (
select c.id as gridid, d.animal_id, d.weight, ROW_NUMBER() over (partition by c.id order by d.weight) as rownum 
from m_grid c left join 
(select a.id, a.animal_id, b.weight from AnimalCountyAltitudeValidResult a join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0)
d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


##plant
select aaa.gridid,bbb.plant_id, bbb.heightmeanF from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
select c.id as gridid, d.heightmeanF, ROW_NUMBER() over (partition by c.id order by d.heightmeanF) as rownum 
from m_grid c left join 
(select a.id, b.heightmeanF from plantCountyAltitudeValidResultDistinct a join m_plant b on a.plant_id=b.Id and b.del = 0)
d on c.id=d.id
	) aa group by gridid
) aaa left join (
select c.id as gridid, d.plant_id, d.heightmeanF, ROW_NUMBER() over (partition by c.id order by d.heightmeanF) as rownum 
from m_grid c left join 
(select a.id, a.plant_id, b.heightmeanF from plantCountyAltitudeValidResultDistinct a join m_plant b on a.plant_id=b.Id and b.del = 0)
d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


##tree typecode=3
select aaa.gridid,bbb.plant_id, bbb.heightmeanF from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
select c.id as gridid, d.heightmeanF, ROW_NUMBER() over (partition by c.id order by d.heightmeanF) as rownum 
from m_grid c left join 
(select a.id, b.heightmeanF from plantCountyAltitudeValidResultDistinct a join m_plant b on a.plant_id=b.Id and b.typeCode='3' and b.del = 0)
d on c.id=d.id
	) aa group by gridid
) aaa left join (
select c.id as gridid, d.plant_id, d.heightmeanF, ROW_NUMBER() over (partition by c.id order by d.heightmeanF) as rownum 
from m_grid c left join 
(select a.id, a.plant_id, b.heightmeanF from plantCountyAltitudeValidResultDistinct a join m_plant b on a.plant_id=b.Id and b.typeCode='3' and b.del = 0)
d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid

##shrub typecode=1
select aaa.gridid,bbb.plant_id, bbb.heightmeanF from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
select c.id as gridid, d.heightmeanF, ROW_NUMBER() over (partition by c.id order by d.heightmeanF) as rownum 
from m_grid c left join 
(select a.id, b.heightmeanF from plantCountyAltitudeValidResultDistinct a join m_plant b on a.plant_id=b.Id and b.typeCode='1' and b.del = 0)
d on c.id=d.id
	) aa group by gridid
) aaa left join (
select c.id as gridid, d.plant_id, d.heightmeanF, ROW_NUMBER() over (partition by c.id order by d.heightmeanF) as rownum 
from m_grid c left join 
(select a.id, a.plant_id, b.heightmeanF from plantCountyAltitudeValidResultDistinct a join m_plant b on a.plant_id=b.Id and b.typeCode='1' and b.del = 0)
d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


##herb typecode=2
select aaa.gridid,bbb.plant_id, bbb.heightmeanF from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
select c.id as gridid, d.heightmeanF, ROW_NUMBER() over (partition by c.id order by d.heightmeanF) as rownum 
from m_grid c left join 
(select a.id, b.heightmeanF from plantCountyAltitudeValidResultDistinct a join m_plant b on a.plant_id=b.Id and b.typeCode='2' and b.del = 0)
d on c.id=d.id
	) aa group by gridid
) aaa left join (
select c.id as gridid, d.plant_id, d.heightmeanF, ROW_NUMBER() over (partition by c.id order by d.heightmeanF) as rownum 
from m_grid c left join 
(select a.id, a.plant_id, b.heightmeanF from plantCountyAltitudeValidResultDistinct a join m_plant b on a.plant_id=b.Id and b.typeCode='2' and b.del = 0)
d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid




##平均值
--with m_grid, 17454 rows
select c.id, round(avg(log(b.weight,2)),2)
from m_grid c left join AnimalCountyAltitudeValidResult a on c.id=a.id
left join m_animal b on a.animal_id=b.Id and b.speciesflag= 'm' and b.del = 0
group by c.id order by c.id

select c.id, round(avg(log(b.weight,2)),2)
from m_grid c left join AnimalCountyAltitudeValidResult a on c.id=a.id
left join m_animal b on a.animal_id=b.Id and b.speciesflag= 'b' and b.del = 0
group by c.id order by c.id

select c.id, round(avg(log(b.heightmeanF,2)),2)
from m_grid c left join plantCountyAltitudeValidResultDistinct a on c.id=a.id
left join m_plant b on a.plant_id=b.Id and b.del = 0
group by c.id order by c.id

#tree
select c.id, round(avg(log(b.heightmeanF,2)),2)
from m_grid c left join plantCountyAltitudeValidResultDistinct a on c.id=a.id
left join m_plant b on a.plant_id=b.Id and b.del = 0 and b.typecode='3'
group by c.id order by c.id

#shrub
select c.id, round(avg(log(b.heightmeanF,2)),2)
from m_grid c left join plantCountyAltitudeValidResultDistinct a on c.id=a.id
left join m_plant b on a.plant_id=b.Id and b.del = 0 and b.typecode='1'
group by c.id order by c.id

#herb
select c.id, round(avg(log(b.heightmeanF,2)),2)
from m_grid c left join plantCountyAltitudeValidResultDistinct a on c.id=a.id
left join m_plant b on a.plant_id=b.Id and b.del = 0 and b.typecode='2'
group by c.id order by c.id


#step 6 计算物种分布区
 #基于20091226植物的计算方法
 #得到AnimalScope, 即每个物种分布Grid的横向和纵向值即xy值
 #select animal_id, id Grid_id, id%240 GridLeft, id/240 GridTop into AnimalGridExtremum from AnimalCountyAltitudeValidResult
  select count(*) from AnimalGridExtremum   --3455766

 #生成AnimalGridRange表示某个动物最左边,最右边,最顶部,最底部的Grid
 #select distinct animal_id, null GridLeft, null GridRight, null GridTop, null GridBottom into AnimalGridRange from AnimalCountyAltitudeValidResult
 --write a new table to record the range of species
  select * from AnimalGridRange order by animal_id

 ---因为前面可能存在多行记录，即一个Min(GridLeft)有多个Grid，所以取最小的Grid在这种情况下。

--update AnimalGridRange set GridLeft = z.Grid_id from AnimalGridRange, 
(
	select a.animal_id, min(a.Grid_id) Grid_id from AnimalGridExtremum a,
	(
	select animal_id, min(GridLeft) GridLeft from AnimalGridExtremum	
	group by animal_id 
	) b
	where a.animal_id = b.animal_id and a.GridLeft = b.GridLeft group by a.animal_id
) z 
where AnimalGridRange.animal_id = z.animal_id


--update AnimalGridRange set GridRight = z.Grid_id from AnimalGridRange, 
(
	select distinct a.Animal_id, min(a.Grid_id) Grid_id from AnimalGridExtremum a,
	(
	select Animal_id, max(GridLeft) GridLeft from AnimalGridExtremum	
	group by Animal_id 
	) b
	where a.Animal_id = b.Animal_id and a.GridLeft = b.GridLeft group by a.Animal_id
) z 
where AnimalGridRange.Animal_id = z.Animal_id


--update AnimalGridRange set GridTop = z.Grid_id from AnimalGridRange, 
(
	select distinct a.Animal_id, min(a.Grid_id) Grid_id from AnimalGridExtremum a,
	(
	select Animal_id, min(GridTop) GridTop from AnimalGridExtremum 	
	group by Animal_id
	) b
	where a.Animal_id = b.Animal_id and a.GridTop = b.GridTop group by a.Animal_id
) z 
where AnimalGridRange.Animal_id = z.Animal_id

--update AnimalGridRange set GridBottom = z.Grid_id from AnimalGridRange, 
(
	select distinct a.Animal_id, min(a.Grid_id) Grid_id from AnimalGridExtremum a,
	(
	select Animal_id, max(GridTop) GridTop from AnimalGridExtremum	
	group by Animal_id 
	) b
	where a.Animal_id = b.Animal_id and a.GridTop = b.GridTop group by a.Animal_id
) z 
where AnimalGridRange.Animal_id = z.Animal_id


 ## alter table AnimalGridRange add HorizonRange int;
 ## alter table AnimalGridRange add VerticalRange int;

## update AnimalGridRange set HorizonRange=a.HorizonRange from AnimalGridRange,
(
select Animal_id, (max(GridLeft) - min(GridLeft)+1) as HorizonRange from AnimalGridExtremum 	
	group by Animal_id 
) a
where AnimalGridRange.Animal_id=a.Animal_id

## update AnimalGridRange set VerticalRange=a.VerticalRange from AnimalGridRange,
(
select Animal_id, (max(GridTop) - min(GridTop)+1) as VerticalRange from AnimalGridExtremum 
	group by Animal_id 
) a
where AnimalGridRange.Animal_id=a.Animal_id

 select * from plantgridrange order by plant_id
 select * from AnimalGridRange order by animal_id
 --alter table m_animal add ExtentNS int;
 --alter table m_animal add ExtentWE int;
 #update a set a.extentNS=b.verticalrange, a.extentWE=b.horizonrange from m_animal a, animalgridrange b where a.id =b.animal_id  ##将animalgridrange里的信息写到m_animal
 
 --alter table m_plant add ExtentNS int;
 --alter table m_plant add ExtentWE int;
 #update a set a.extentNS=b.verticalrange, a.extentWE=b.horizonrange from m_plant a, plantgridrange b where a.id =b.plant_id  ##将plantgridrange里的信息写到m_plant


 ## 物种RA
 --alter table m_animal add RA int;
 ##update m_animal set RA = a.RA from m_animal, (
select animal_id, count(id) RA from AnimalCountyAltitudeValidResult group by animal_id) a where m_animal.id=a.animal_id
 
 ##alter table m_plant add RA int;
 ##update m_plant set RA = a.RA from m_plant, (
select plant_id, count(id) RA from plantCountyAltitudeValidResultDistinct group by plant_id) a where m_plant.id=a.plant_id


 ##alter table AnimalGridRange add RA int;
 ##alter table plantGridRange add RA int;
 ##update a set a.RA = b.RA from animalgridrange a, m_animal b where a.animal_id =b.id
 ##update a set a.RA = b.RA from plantgridrange a, m_plant b where a.plant_id =b.id






 ##before the batch program

##step 7 计算栅格的分布区

  #中值
  #RA
  ##17454rows
##mammal
select aaa.gridid,bbb.animal_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid

##mammal endangered
select aaa.gridid,bbb.animal_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.endangeredflag='1' and b.del = 0
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.endangeredflag='1' and b.del = 0
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


#bird
select aaa.gridid,bbb.animal_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


#bird endangered
select aaa.gridid,bbb.animal_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.endangeredflag='1' and b.del = 0
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.RA from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.endangeredflag='1' and b.del = 0
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid



##17454rows    #plant
select aaa.gridid,bbb.plant_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.RA from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id 
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id 
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


#herb
select aaa.gridid,bbb.plant_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.RA from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and b.typecode='2' 
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, a.plant_id, b.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='2' 
		
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


#tree
select aaa.gridid,bbb.plant_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.RA from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and b.typecode='3' 
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='3' 
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


#shrub
select aaa.gridid,bbb.plant_id, bbb.RA from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.RA from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and b.typecode='1' 
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.RA, ROW_NUMBER() over (partition by c.id order by d.RA) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='1' 
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid



#WE
##17454rows
select aaa.gridid,bbb.animal_id, bbb.HorizonRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.HorizonRange from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.HorizonRange from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid



select aaa.gridid,bbb.animal_id, bbb.HorizonRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.HorizonRange from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.HorizonRange from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


##17454rows    #plant
select aaa.gridid,bbb.plant_id, bbb.HorizonRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.HorizonRange from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id 
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.HorizonRange from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id 
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid

##herb
select aaa.gridid,bbb.plant_id, bbb.HorizonRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.HorizonRange from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and b.typecode='2'
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.HorizonRange from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='2'
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


##tree
select aaa.gridid,bbb.plant_id, bbb.HorizonRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.HorizonRange from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and b.typecode='3'
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.HorizonRange from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='3'
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


#shrub
select aaa.gridid,bbb.plant_id, bbb.HorizonRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.HorizonRange from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and b.typecode='1'
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.HorizonRange, ROW_NUMBER() over (partition by c.id order by d.HorizonRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.HorizonRange from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='1'
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


#NS
##17454rows
select aaa.gridid,bbb.animal_id, bbb.VerticalRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.VerticalRange from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.VerticalRange from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


#bird
select aaa.gridid,bbb.animal_id, bbb.VerticalRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.animal_id, agr.VerticalRange from AnimalCountyAltitudeValidResult a 
			join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0
			join AnimalGridRange agr on a.animal_id=agr.animal_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.animal_id, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.animal_id, agr.VerticalRange from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0
		join AnimalGridRange agr on a.animal_id=agr.animal_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


##17454rows    #plant
select aaa.gridid,bbb.plant_id, bbb.VerticalRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.VerticalRange from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id 
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.VerticalRange from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id 
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid

#herb
select aaa.gridid,bbb.plant_id, bbb.VerticalRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.VerticalRange from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and b.typecode='2'
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.VerticalRange from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='2'
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid



#tree
select aaa.gridid,bbb.plant_id, bbb.VerticalRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.VerticalRange from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and b.typecode='3'
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.VerticalRange from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='3'
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid

#shrub
select aaa.gridid,bbb.plant_id, bbb.VerticalRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.VerticalRange from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and b.typecode='1'
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.VerticalRange from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='1'
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
order by aaa.gridid


#平均值
#RA
##17454rows
select c.id as gridid, avg(d.RA)
	from m_grid c left join 
	(
		select a.id, b.RA from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0
	)
	d on c.id=d.id
	group by c.id order by c.id

##17454rows
select c.id as gridid, avg(d.RA)
	from m_grid c left join 
	(
		select a.id, b.RA from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0
	)
	d on c.id=d.id
	group by c.id order by c.id

##17454rows  #plant
select c.id as gridid, avg(d.RA)
	from m_grid c left join 
	(
		select a.id, b.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id
	)
	d on c.id=d.id
	group by c.id order by c.id

#herb
select c.id as gridid, avg(d.RA)
	from m_grid c left join 
	(
		select a.id, b.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b. typecode= '2'
	)
	d on c.id=d.id
	group by c.id order by c.id

#tree
select c.id as gridid, avg(d.RA)
	from m_grid c left join 
	(
		select a.id, b.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b. typecode= '3'
	)
	d on c.id=d.id
	group by c.id order by c.id

#shrub
select c.id as gridid, avg(d.RA)
	from m_grid c left join 
	(
		select a.id, b.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b. typecode= '1'
	)
	d on c.id=d.id
	group by c.id order by c.id


#WE
##17454rows
select c.id as gridid, avg(d.ExtentWE)
	from m_grid c left join 
	(
		select a.id, b.ExtentWE from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0
	)
	d on c.id=d.id
	group by c.id order by c.id

##17454rows
select c.id as gridid, avg(d.ExtentWE)
	from m_grid c left join 
	(
		select a.id, b.ExtentWE from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0
	)
	d on c.id=d.id
	group by c.id order by c.id

##17454rows  #plant
select c.id as gridid, avg(d.extentWE)
	from m_grid c left join 
	(
		select a.id, b.extentwe from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id 
	)
	d on c.id=d.id
	group by c.id order by c.id

#herb
select c.id as gridid, avg(d.extentWE)
	from m_grid c left join 
	(
		select a.id, b.extentwe from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode= '2'
	)
	d on c.id=d.id
	group by c.id order by c.id

#tree
select c.id as gridid, avg(d.extentWE)
	from m_grid c left join 
	(
		select a.id, b.extentwe from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode= '3'
	)
	d on c.id=d.id
	group by c.id order by c.id

#shrub
select c.id as gridid, avg(d.extentWE)
	from m_grid c left join 
	(
		select a.id, b.extentwe from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode= '1'
	)
	d on c.id=d.id
	group by c.id order by c.id


#NS
##17454rows
select c.id as gridid, avg(d.ExtentNS)
	from m_grid c left join 
	(
		select a.id, b.ExtentNS from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='m' and b.del = 0
	)
	d on c.id=d.id
	group by c.id order by c.id

##17454rows
select c.id as gridid, avg(d.ExtentNS)
	from m_grid c left join 
	(
		select a.id, b.ExtentNS from AnimalCountyAltitudeValidResult a 
		join m_animal b on a.animal_id=b.Id and b.speciesFlag='b' and b.del = 0
	)
	d on c.id=d.id
	group by c.id order by c.id


##17454rows  #plant
select c.id as gridid, avg(d.extentNS)
	from m_grid c left join 
	(
		select a.id, b.extentns from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id
	)
	d on c.id=d.id
	group by c.id order by c.id

#herb
select c.id as gridid, avg(d.extentNS)
	from m_grid c left join 
	(
		select a.id, b.extentns from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='2'
	)
	d on c.id=d.id
	group by c.id order by c.id

#tree
select c.id as gridid, avg(d.extentNS)
	from m_grid c left join 
	(
		select a.id, b.extentns from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='3'
	)
	d on c.id=d.id
	group by c.id order by c.id

#shrub
select c.id as gridid, avg(d.extentNS)
	from m_grid c left join 
	(
		select a.id, b.extentns from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='1'
	)
	d on c.id=d.id
	group by c.id order by c.id



 select * from m_plant where del = 0 and culandwildflag=1 order by id
 select * from m_animal where del= 0 order by id
 
 select * from alltype
 select distinct(culandwildflag) from m_plant



select * from m_animal order by del desc

SELECT Id, [cnOrder], [latinorder], [cnFamily], [latinFamily], [cnName], [latinName], [lowAltitude], [highAltitude], [speciesFlag],
		 [habitate], [endangeredFlag], [weight], [lowWeight], [highWeight], [RA], [extentNS], [extentWE]
from m_animal
where del=0 order by id

select * from m_animal where cnname like '%蝠%'




select * from animalbs
