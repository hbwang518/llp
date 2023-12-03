
##copy and modified from speciesRichnessStepNew20141297.sql   ----20191009
select * from distinctPlantCounty where plant_id not in (select id from m_plant)
select * from distinctPlantCounty where plant_id=52   --id=4060是52同一种植物，在m_plant中被删除了
select * from m_plant where latinname = 'Polypodium vulgare' order by id

----------------------------------------------------------------------------------------------------------
--first update distinctPlantCounty
----------------------------------------------------------------------------------------------------------

--select * into distinctPlantCountyBeforeMerge from distinctPlantCounty
select * from distinctPlantCountyBeforeMerge where plant_id is null
--drop table distinctPlantCount

select distinct b.minid as plant_id, b.id, county_code from distinctPlantCountyBeforeMerge a join m_plant b
on a.plant_id=b.id and b.id < 7000 where b.minid is null 

--select distinct b.minid as plant_id, county_code, 0 as lowAltitude, 0 as highAltitude into distinctPlantCounty from distinctPlantCountyBeforeMerge a join m_plant b
--on a.plant_id=b.id and b.id < 7000

--update distinctPlantCount set lowAltitude=b.lowAltitude, highAltitude=b.highAltitude from distinctPlantCounty a join m_plant b on a.plant_id=b.id

----------------------------------------------------------------------------------------------------------
--second --update PlantCountyAltitudeResult
----------------------------------------------------------------------------------------------------------

--select * into PlantCountyAltitudeResultBeforeMerge from PlantCountyAltitudeResult
--delete PlantCountyAltitudeResult
--insert into PlantCountyAltitudeResult select a.plant_id,a.county_code,a.lowAltitude,a.highAltitude,c.Id,c.altitude_min,c.altitude_max
--from distinctPlantCounty a ,M_Plant b,m_grid c,piaoCountyCode d
--where a.plant_id=b.id and c.county=d.Id and d.code = a.county_code and b.culAndWildFlag=1 
select count(*) from PlantCountyAltitudeResult

----------------------------------------------------------------------------------------------------------
--third update PlantCountyAltitudeValidResult
----------------------------------------------------------------------------------------------------------

--select * into PlantCountyAltitudeValidResultBeforMerge from PlantCountyAltitudeValidResult
--delete PlantCountyAltitudeValidResult
--insert into PlantCountyAltitudeValidResult select * from PlantCountyAltitudeResult 
where (lowAltitude < -8000 or 
(altitude_min>=lowAltitude and altitude_min<= highAltitude ) or 
(altitude_max>=lowAltitude and altitude_max<= highAltitude ) or 
(altitude_min<=lowAltitude and altitude_max>= highAltitude ))

----------------------------------------------------------------------------------------------------------
--fourth, rename, update plantCountyAltitudeValidResultDistinct
--原来在表PlantCountyAltitudeValidResultBeforMerge中因为多海拔数据同一个gridId,相同的plantid会出现多次，所以需要distinct来产生plantCountyAltitudeValidResultDistinct表
--现在不存在这种情况，PlantCountyAltitudeValidResult不需要再distinct，直接改动PlantCountyAltitudeValidResult名称为PlantCountyAltitudeValidResultDistinct
----------------------------------------------------------------------------------------------------------
select count(*) from PlantCountyAltitudeValidResultBeforMerge  --4704198
select count(*) from plantCountyAltitudeValidResultDistinct      --4671920
select id, plant_id  from PlantCountyAltitudeValidResultBeforMerge group by id, plant_id having count(*) > 1
select id, plant_id  from plantCountyAltitudeValidResultDistinct group by id, plant_id having count(*) > 1
select id, plant_id  from PlantCountyAltitudeValidResult group by id, plant_id having count(*) > 1
select * from PlantCountyAltitudeValidResultBeforMerge where id=7572 and plant_id=385
--EXEC sp_rename 'plantCountyAltitudeValidResultDistinct', 'plantCountyAltitudeValidResultDistinctBeforeMerge' 
--EXEC sp_rename 'plantCountyAltitudeValidResult', 'plantCountyAltitudeValidResultDistinct' 
select count(*) from plantCountyAltitudeValidResultDistinct   ---4583895


--Fifth   一大堆表   Grid_GridScope
--
--#基于20091226植物的计算方法    #step 6 计算物种分布区
--得到PlantScope-- that is 每种植物分布Grid的横向和纵向值
--drop table PlantGridExtremum
select plant_id, id Grid_id, id%240 GridLeft , id/240 GridTop into PlantGridExtremum from plantCountyAltitudeValidResultDistinct

--PlantGridRange
--植物最左，最右栅格信息
select plant_id, Count(*) from 
(
select a.Plant_id, Grid_id from PlantGridExtremum a,
	(
		select plant_id, min(GridLeft) GridLeft from PlantGridExtremum 	
		group by plant_id 

	) b
	where a.plant_id = b.plant_id and a.GridLeft = b.GridLeft
) z group by plant_id having count(*) > 1


--PlantGridRange表示某个植物最左边，最右边，最顶部，最底部的Grid
--drop table PlantGridRange
--select distinct plant_id, null GridLeft, null GridRight, null GridTop, null GridBottom into PlantGridRange from plantCountyAltitudeValidResultDistinct

update PlantGridRange set GridLeft = z.Grid_id from PlantGridRange, 
(
	select a.Plant_id, Grid_id from PlantGridExtremum a,
	(
		select plant_id, min(GridLeft) GridLeft from PlantGridExtremum 	
		group by plant_id 

	) b
	where a.plant_id = b.plant_id and a.GridLeft = b.GridLeft
) z 
where PlantGridRange.plant_id = z.Plant_id

---因为前面可能存在多行记录，即一个Min(GridLeft)有多个Grid，所以取最小的Grid在这种情况下。

update PlantGridRange set GridLeft = z.Grid_id from PlantGridRange, 
(
	select a.Plant_id, min(a.Grid_id) Grid_id from PlantGridExtremum a,
	(
	select plant_id, min(GridLeft) GridLeft from PlantGridExtremum	
	group by plant_id 
	) b
	where a.plant_id = b.plant_id and a.GridLeft = b.GridLeft group by a.Plant_id
) z 
where PlantGridRange.plant_id = z.Plant_id


update PlantGridRange set GridRight = z.Grid_id from PlantGridRange, 
(
	select distinct a.Plant_id, min(a.Grid_id) Grid_id from PlantGridExtremum a,
	(
	select plant_id, max(GridLeft) GridLeft from PlantGridExtremum	
	group by plant_id 
	) b
	where a.plant_id = b.plant_id and a.GridLeft = b.GridLeft group by a.Plant_id
) z 
where PlantGridRange.plant_id = z.Plant_id


update PlantGridRange set GridTop = z.Grid_id from PlantGridRange, 
(
	select distinct a.Plant_id, min(a.Grid_id) Grid_id from PlantGridExtremum a,
	(
	select plant_id, min(GridTop) GridTop from PlantGridExtremum 	
	group by plant_id
	) b
	where a.plant_id = b.plant_id and a.GridTop = b.GridTop group by a.Plant_id
) z 
where PlantGridRange.plant_id = z.Plant_id

update PlantGridRange set GridBottom = z.Grid_id from PlantGridRange, 
(
	select distinct a.Plant_id, min(a.Grid_id) Grid_id from PlantGridExtremum a,
	(
	select plant_id, max(GridTop) GridTop from PlantGridExtremum	
	group by plant_id 
	) b
	where a.plant_id = b.plant_id and a.GridTop = b.GridTop group by a.Plant_id
) z 
where PlantGridRange.plant_id = z.Plant_id

--alter table PlantGridRange add HorizonRange int;
--alter table PlantGridRange add VerticalRange int;

update PlantGridRange set HorizonRange=a.HorizonRange from PlantGridRange,
(
select plant_id, (max(GridLeft) - min(GridLeft)+1) as HorizonRange from PlantGridExtremum 	
	group by plant_id 
) a
where PlantGridRange.Plant_id=a.plant_id

update PlantGridRange set VerticalRange=a.VerticalRange from PlantGridRange,
(
select plant_id, (max(GridTop) - min(GridTop)+1) as VerticalRange from PlantGridExtremum 
	group by plant_id 
) a
where PlantGridRange.Plant_id=a.plant_id


--update LonMedian and LatMedian for PlantGridRange 
--alter table PlantGridRange add LonMedian decimal(10, 2);
--alter table PlantGridRange add LatMedian decimal(10, 2);
update PlantGridRange set LonMedian = m_grid.Lon + PlantGridRange.HorizonRange * 0.1 / 2 from PlantGridRange, m_grid
where plantGridRange.GridLeft = m_grid.ID

update PlantGridRange set LatMedian = m_grid.Lat + PlantGridRange.VerticalRange * 0.1 / 2 from PlantGridRange, m_grid
where plantGridRange.GridBottom = m_grid.ID


--PlantLonLat
--植物分布区最大，最小经纬度信息
--drop table PlantLonLat
select Plant_id into PlantLonLat from PlantGridRange
alter table PlantLonLat add LonWest numeric(10,2);
alter table PlantLonLat add LonEast numeric(10,2);
alter table PlantLonLat add LatNorth numeric(10,2);
alter table PlantLonLat add LatSouth numeric(10,2);
alter table PlantLonLat add GridCount int;


update PlantLonLat set LonWest =c.Lon from PlantLonLat a, PlantGridRange b, M_Grid c where a.Plant_id= b.Plant_id and b.GridLeft = c.ID;
update PlantLonLat set LonEast =c.Lon from PlantLonLat a, PlantGridRange b, M_Grid c where a.Plant_id= b.Plant_id and b.GridRight = c.ID;
update PlantLonLat set LatNorth =c.Lat from PlantLonLat a, PlantGridRange b, M_Grid c where a.Plant_id= b.Plant_id and b.GridTop = c.ID;
update PlantLonLat set LatSouth =c.Lat from PlantLonLat a, PlantGridRange b, M_Grid c where a.Plant_id= b.Plant_id and b.GridBottom = c.ID;

update PlantLonLat set GridCount=z.GridCount 
from PlantLonLat,
(select Plant_id, Count(distinct(Id)) GridCount  from plantCountyAltitudeValidResultDistinct group by Plant_id) z
where PlantLonLat.Plant_id=z.Plant_id

select * from PlantLonLat order by plant_id
select * from PlantGridRange

--Grid_GridScope
--drop table Grid_GridScope
select * from Grid_GridScope
#1.12是小数
select id Grid_id, 1 GridCountMedian, 1 GridCountMin,1 GridCountMax,1.12 LonMedian,1.12 LatMedian into Grid_GridScope from m_grid

select a.id, b.GridCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.Plant_id
order by a.id, b.GridCount

update Grid_GridScope set GridCountMin = 0, GridCountMax=0, lonMedian=0, latMedian=0

--插数据进入Grid_GridScope
select * from Grid_GridScope
update Grid_GridScope set GridCountMedian=z2.gridCount from Grid_GridScope z1, (
select aaa.id,bbb.plant_id, bbb.GridCount from 
(
	select id, ceiling(max(rownum)/2.0) as rownum1 from
	(
		select a.id, b.Plant_id, b.GridCount, ROW_NUMBER() over (partition by a.id order by b.gridCount) as rownum  from plantCountyAltitudeValidResultDistinct a, PlantLonLat b where a.plant_id=b.Plant_id
	) aa group by aa.id
) aaa left join (
    select a.id, b.Plant_id, b.GridCount, ROW_NUMBER() over (partition by a.id order by b.gridCount) as rownum  from plantCountyAltitudeValidResultDistinct a, PlantLonLat b where a.plant_id=b.Plant_id
) bbb on aaa.id = bbb.id and aaa.rownum1=bbb.rownum
) z2 where z1.grid_id=z2.id

--没完成该表



---
Sixth
---
select * from plantgridextremum
select * from plantgridrange order by plant_id




select max(HorizonRange) from PlantGridRange
select max(VerticalRange) from PlantGridRange

select a.id, a.plant_id, b.HorizonRange from plantCountyAltitudeValidResultDistinct a, PlantGridRange b
where a.plant_id=b.plant_id order by a.id,b.HorizonRange

select a.id, Count(*) from plantCountyAltitudeValidResultDistinct a, PlantGridRange b
where a.plant_id=b.plant_id group by a.id

select a.id, a.plant_id, b.VerticalRange from plantCountyAltitudeValidResultDistinct a, PlantGridRange b
where a.plant_id=b.plant_id

select plant_id, Grid_id, GridLeft from PlantGridExtremum group by plant_id, Grid_id,GridLeft  having GridLeft = min(GridLeft)


select * from PlantGridRange where GridTop > GridBottom

select * from PlantGridRange where GridTop < GridBottom

select * from PlantGridRange where GridTop = GridBottom

select * from m_plant where id=446