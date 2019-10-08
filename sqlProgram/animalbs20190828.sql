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


#step 4  计算grid物种数 （考虑删除del=1和2的物种）
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


#step 5 计算物种体重中值/平均值

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
		select a.id, agr.plant_id, agr.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='2' 
		join plantGridRange agr on a.plant_id=agr.plant_id
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




#

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

--
select m.id, m.weight as Mweight, m.RA as MRA, m.ExtentWE as MExtentWE, m.ExtentNS as MExtentSN, 
n.weight as Bweight, n.RA as BRA, n.ExtentWE as BExtentWE, n.ExtentNS as BExtentSN  from (
select c.id, round(avg(log(b.weight,2)),2) as weight, avg(b.RA) as RA, avg(b.ExtentWE) as ExtentWE, avg(b.ExtentNS) as ExtentNS
from m_grid c left join AnimalCountyAltitudeValidResult a on c.id=a.id
left join m_animal b on a.animal_id=b.Id and  speciesFlag='m'  and b.del = 0
group by c.id) 
m join (
select c.id, round(avg(log(b.weight,2)),2) as weight, avg(b.RA) as RA, avg(b.ExtentWE) as ExtentWE, avg(b.ExtentNS) as ExtentNS
from m_grid c left join AnimalCountyAltitudeValidResult a on c.id=a.id
left join m_animal b on a.animal_id=b.Id and  speciesFlag='b'  and b.del = 0
group by c.id) n on m.id=n.id

------------------------------------------------------------------------------------------------------------------
------- 中值
------------------------------------------------------------------------------------------------------------------
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
--exec('select m.gridid, m.weight as Mweight, n.weight as Bweight from (' + @animalMSql + ') m join (' + @animalBSql + ') n on m.gridid=n.gridid')

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
exec('select m.gridid, m.weight as Mweight, n.weight as Bweight, mm.RA as MRA, nn.RA as BRA, mmm.ExtentWE as MExtentWE, nnn.ExtentWE as BExtentWE, mmmm.ExtentNS as MExtentNS, nnnn.ExtentNS as BExtentNS from (' 
+ @animalMSql + ') m join (' + @animalBSql + ') n on m.gridid=n.gridid join (' 
+ @animalMSqlRA + ') mm on m.gridid=mm.gridid join (' + @animalBSqlRA + ') nn on m.gridid=nn.gridid join (' 
+ @animalMSqlExtentWE + ') mmm on m.gridid=mmm.gridid join (' + @animalBSqlExtentWE + ') nnn on m.gridid=nnn.gridid join (' 
+ @animalMSqlExtentNS + ') mmmm on m.gridid=mmmm.gridid join (' + @animalBSqlExtentNS + ') nnnn on m.gridid=nnnn.gridid order by m.gridid')
*/

declare @animalSqlAvg varchar(2000) = '
select c.id, round(avg(log(b.weight,2)),2) as weight, avg(b.RA) as RA, avg(b.ExtentWE) as ExtentWE, avg(b.ExtentNS) as ExtentNS
from m_grid c left join AnimalCountyAltitudeValidResult a on c.id=a.id
left join m_animal b on a.animal_id=b.Id and --CONDITION-- and b.del = 0
group by c.id '
	
declare @animalMAvg varchar(2000) = REPLACE(@animalSqlAvg, '--CONDITION--', @animalMCon)
declare @animalBAvg varchar(2000) = REPLACE(@animalSqlAvg, '--CONDITION--', @animalBCon)
exec('select m.id, m.weight as Mweight, m.RA as MRA, m.ExtentWE as MExtentWE, m.ExtentNS as ExtentNS, n.weight as Bweight, n.RA as BRA, n.ExtentWE as BExtentWE, n.ExtentNS as ExtentNS  from ('+@animalMAvg+') m join ('+@animalBAvg+') n on m.id=n.id')


--
select m1.gridid, m1.Height, m2.VerticalRange from (select aaa.gridid, bbb.Height from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.Height, ROW_NUMBER() over (partition by c.id order by d.Height) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.Height from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and typecode='1'
			join plantGridRange agr on a.plant_id=agr.plant_id
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.plant_id, d.Height, ROW_NUMBER() over (partition by c.id order by d.Height) as rownum 
	from m_grid c left join 
	(
		select a.id, agr.plant_id, agr.Height from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.typecode='1'
		join plantGridRange agr on a.plant_id=agr.plant_id
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
) m1 
join (select aaa.gridid, bbb.VerticalRange from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.VerticalRange, ROW_NUMBER() over (partition by c.id order by d.VerticalRange) as rownum 
		from m_grid c left join 
		(
			select a.id, agr.plant_id, agr.VerticalRange from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and typecode='1'
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
) m2 on m1.gridid=m2.gridid 


--herb
declare @plantSQl varchar(2000) = 'select aaa.gridid, bbb.--field-- from 
(
	select gridid, ceiling(max(rownum)/2.0) as rownum1 from (
		select c.id as gridid, d.--field--, ROW_NUMBER() over (partition by c.id order by d.--field--) as rownum 
		from m_grid c left join 
		(
			select a.id, b.--field-- from plantCountyAltitudeValidResultDistinct a 
			join m_plant b on a.plant_id=b.Id and --condition--
		)
		d on c.id=d.id
	) aa group by gridid
) aaa left join (
	select c.id as gridid, d.--field--, ROW_NUMBER() over (partition by c.id order by d.--field--) as rownum 
	from m_grid c left join 
	(
		select a.id, b.--field-- from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.--condition--		
	)
	d on c.id=d.id
) bbb on aaa.gridid = bbb.gridid and aaa.rownum1=bbb.rownum
'
declare @plantCon varchar(200) = 'typecode=''1'''
declare @plantSqlHeight varchar(2000) = REPLACE(REPLACE(@plantSQl, '--CONDITION--', @plantCon), '--field--', 'HeightMeanF')
declare @plantSqlExtentNS varchar(2000) = REPLACE(REPLACE(@plantSQl, '--CONDITION--', @plantCon), '--field--', 'ExtentNS')
declare @plantSqlExtentWE varchar(2000) = REPLACE(REPLACE(@plantSQl, '--CONDITION--', @plantCon), '--field--', 'ExtentWE')
declare @plantSqlRA varchar(2000) = REPLACE(REPLACE(@plantSQl, '--CONDITION--', @plantCon), '--field--', 'RA')
declare @plantExecSql varchar(4000) = '
select m1.gridid, m1.HeightMeanF, m2.ExtentNS, m3.ExtentWE,m4.RA from ('+@plantSqlHeight+') m1 
join ('+@plantSqlExtentNS+') m2 on m1.gridid=m2.gridid 
join ('+@plantSqlExtentWE+') m3 on m1.gridid=m3.gridid 
join ('+@plantSqlRA+') m4 on m1.gridid=m4.gridid order by m1.gridid 
'
--exec(@plantExecSql)

declare @plantExecAvg varchar(4000) = '
select c.id as gridid, avg(d.HeightMeanF) as HeightMeanF, avg(d.extentNS) as extentNS, avg(d.ExtentWE) as ExtentWE,  avg(d.RA) as RA 
	from m_grid c left join 
	(
		select a.id, b.HeightMeanF, b.ExtentNS, b.ExtentWE, b.RA from plantCountyAltitudeValidResultDistinct a 
		join m_plant b on a.plant_id=b.Id and b.--CONDITION--
	)
	d on c.id=d.id
	group by c.id order by c.id
'

declare @plantExecAvgSql varchar(4000) = REPLACE(@plantExecAvg, '--CONDITION--', @plantCon)
exec(@plantExecAvgSql)



select * from m_plant where del = 0 order by id
select * from plantXJworlddistribution
## alter table m_plant add TDWG3 int;
## update m_plant set TDWG3 = b.n_regions from m_plant, plantXJworlddistribution b where m_plant. id = b.id

