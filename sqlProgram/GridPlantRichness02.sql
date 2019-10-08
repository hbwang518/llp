
select * from distinctPlantCounty02
*/
select plant_id,county_code,lowAltitude,highAltitude into distinctPlantCounty02 from
( 
	--取单海拔
	select M_Plant.id plant_id,w.county_code,M_Plant.lowAltitude,M_Plant.highAltitude from M_Plant join 
	(
		--取county和area中的county
		select distinct(plant_id) plant_id ,distribution county_code from plantCounty where distribution in (select code from m_county) and plant_id not in (select plant_id from MultiAltitude)
		union
		select distinct( a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution = b.area_id and a.distribution in (select id from m_area) and a.plant_id not in (select plant_id from MultiAltitude)
                --select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution = b.area_id and a.plant_id not in (select plant_id from MultiAltitude)
                --select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution in (select id from m_area) and a.plant_id not in (select plant_id from MultiAltitude)
	) as w on M_Plant.id = w.plant_id  	
	union 
	(
		--取county和area中的county
		select plant_id ,distribution county_Code ,lowAltitude,highAltitude from MultiAltitude where distribution in (select code from m_county)
		union  
        select a.plant_id,b.county_Code county_Code, a.lowAltitude,a.highAltitude from MultiAltitude a,areaToCounty b where a.distribution =b.area_id
	) 
) as z

select * from PlantGridRange02 where plant_id=3249
select * from PlantGridRange where plant_id=3249

select plant_id, gridLeft%120-gridRight%120 from PlantGridRange02 where plant_id=2712
select plant_id, gridLeft%120-gridRight%240 from PlantGridRange where plant_id=2712

select a.plant_id, a.lonMedian, b.lonMedian from PlantGridRange02 a, PlantGridRange b
where a.plant_id=b.plant_id 

select * from distinctPlantCounty02 where county_code is null
select * from distinctPlantCounty
select * from m_grid
select * from grid02
select a.plant_id, a.id, a.id%120 leftid, b.lon from plantCountyAltitudeValidResultDistinct02 a, grid02 b where a.id=b.id and plant_id=2712 order by leftid
select a.plant_id, a.id, a.id a.id%240 leftid, b.lon  from plantCountyAltitudeValidResultDistinct a, m_grid b where a.id=b.id and plant_id=2712 order by leftid



drop table GridSpecies02
drop table a0
drop table a1
drop table a2
drop table a3
drop table a4
drop table a5
drop table a6
drop table a7
drop table a8
drop table a9
drop table a10
drop table a11
drop table a12

--programme forth
select * from grid02
--m_grid 表的county 和 piaoCountyCode 的id关联， piaoCountyCode 的 code (邮政编码) 和 distinctPlantCounty的 code 邮政编码 关联 所以 distinctPlantCounty就和m_grid建立的联系
select b.Id, a.plant_id, a.county_code,a.lowAltitude PlantLowAltitude,a.highAltitude PlantHighAltitude,b.altitude_min GridAltitudeMin,b.altitude_max GridAltitudeMax 
into PlantCountyAltitudeResult02
from distinctPlantCounty02 a ,Grid02 b, m_plant c
where a.plant_id=c.id and b.county=a.county_code and c.culAndWildFlag=1 

select * from piaoCountyCode where code <> county_id
--programme fifth 得到PlantCountyAltitudeValidResult，根据海拔信息过滤出有效数据
select * from PlantCountyAltitudeResult where county_code is null

select * into PlantCountyAltitudeValidResult02 from PlantCountyAltitudeResult02 
where 
(	PlantLowAltitude < -8000 
	or (GridAltitudeMin >= PlantLowAltitude and GridAltitudeMin <= PlantHighAltitude ) 
	or (GridAltitudeMax >= PlantLowAltitude and GridAltitudeMax <= PlantHighAltitude ) 
	or (GridAltitudeMin <= PlantLowAltitude and GridAltitudeMax >= PlantHighAltitude )
)

--programme sixth	

CREATE INDEX PlantCountyAltitudeValidResult02_Plant_id ON PlantCountyAltitudeValidResult02 (plant_id)
CREATE INDEX PlantCountyAltitudeValidResult02_Id ON PlantCountyAltitudeValidResult02 (Id)
CREATE INDEX plant_index  ON M_Plant  (id)

drop table PlantCountyAltitudeValidResult02
select count(*) from PlantCountyAltitudeValidResult
select count(*) from PlantCountyAltitudeValidResult02
select top 1 * from PlantCountyAltitudeValidResult02
select * from grid02
update PlantCountyAltitudeValidResult02 set 
select a.plant_id, a.county_code, a.lowAltitude, a.highAltitude, b.mergeId as id, a.altitude_min, a.altitude_max
--into PlantCountyAltitudeValidResult02
from PlantCountyAltitudeValidResult a, mMGrid b where a.id=b.id

--drop table a0
--drop table a1
--drop table a2
--drop table a3
--drop table a4
--drop table a5
--drop table a6
--drop table a7
--drop table a8
--drop table a9
--drop table a10
--drop table a11
--drop table a12

select Id,count(distinct(plant_id)) Species,count(distinct(cnFamily)) Family,count(distinct(cnGenus)) Genus into a0  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id) w group by w.Id 
select Id,count(distinct(plant_id)) Species12,count(distinct(cnFamily)) Family12,count(distinct(cnGenus)) Genus12 into a1  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and (b.yearCode ='2' or b.yearCode ='1')) w group by w.Id 
select Id,count(distinct(plant_id)) Species3,count(distinct(cnFamily)) Family3,count(distinct(cnGenus)) Genus3 into a2  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.yearCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesWoody,count(distinct(cnFamily)) FamilyWoody,count(distinct(cnGenus)) GenusWoody into a3  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and (b.typeCode ='1' or b.typeCode ='3')) w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesHerb,count(distinct(cnFamily)) FamilyHerb,count(distinct(cnGenus)) GenusHerb into a4  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and (b.typeCode ='2' or b.typeCode ='4')) w group by w.Id
select Id,count(distinct(plant_id)) SpeciesFern,count(distinct(cnFamily)) FamilyFern,count(distinct(cnGenus)) GenusFern into a5  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.menCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesGym,count(distinct(cnFamily)) FamilyGym,count(distinct(cnGenus)) GenusGym into a6  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.menCode ='2') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesAng,count(distinct(cnFamily)) FamilyAng,count(distinct(cnGenus)) GenusAng into a7  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.menCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesDan,count(distinct(cnFamily)) FamilyDan,count(distinct(cnGenus)) GenusDan into a8 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.endangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesEph,count(distinct(cnFamily)) FamilyEph,count(distinct(cnGenus)) GenusEph into a9 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.ephemeralFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesEnd,count(distinct(cnFamily)) FamilyEnd,count(distinct(cnGenus)) GenusEnd into a10 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.endemismFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesXJDan,count(distinct(cnFamily)) FamilyXJDan ,count(distinct(cnGenus)) GenusXJDan into a11 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.xjEndangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesHal,count(distinct(cnFamily)) FamilyHal,count(distinct(cnGenus)) GenusHal into a12 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.halophilousFlag ='1') w group by w.Id 
			

--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a13  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.yearCode ='1') w group by w.Id 
--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a14  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.yearCode ='2') w group by w.Id 																							 
--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a15  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.typeCode ='1') w group by w.Id 
--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a16  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.typeCode ='2') w group by w.Id
--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a17  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.typeCode ='3') w group by w.Id 
--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a18  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.typeCode ='4') w group by w.Id


CREATE INDEX plant_ida0   ON a0  (species)
CREATE INDEX plant_ida1   ON a1  (species12)
CREATE INDEX plant_ida2   ON a2  (species3)
CREATE INDEX plant_ida3   ON a3  (specieswoody)
CREATE INDEX plant_ida4   ON a4  (speciesherb)
CREATE INDEX plant_ida5   ON a5  (speciesfern)
CREATE INDEX plant_ida6   ON a6  (speciesgym)
CREATE INDEX plant_ida7   ON a7  (speciesang)
CREATE INDEX plant_ida8   ON a8  (speciesdan)
CREATE INDEX plant_ida9   ON a9  (specieseph)
CREATE INDEX plant_ida10  ON a10 (speciesend)
CREATE INDEX plant_ida11  ON a11 (speciesxjdan)
CREATE INDEX plant_ida12  ON a12 (specieshal)

--CREATE INDEX plant_ida13   ON a13  (plant_id)
--CREATE INDEX plant_ida14   ON a14  (plant_id)
--CREATE INDEX plant_ida15   ON a15  (plant_id)
--CREATE INDEX plant_ida16  ON a16 (plant_id)
--CREATE INDEX plant_ida17  ON a17 (plant_id)
--CREATE INDEX plant_ida18  ON a18 (plant_id)	
 
 --drop table GridSpecies02

select z.id as id, a0.species,a0.genus,a0.family,a1.species12,a1.genus12,a1.family12,a2.species3,a2.genus3,a2.family3,
a3.specieswoody,a3.genuswoody,a3.familywoody,a4.speciesherb,a4.genusherb,a4.familyherb,a5.speciesfern,a5.genusfern,a5.familyfern,
a6.speciesGym,a6.genusGym,a6.familygym,a7.speciesAng,a7.genusAng,a7.familyAng,a8.speciesDan,a8.genusDan,a8.familyDan,
a9.speciesEph,a9.genusEph,a9.familyEph,a10.speciesEnd,a10.genusEnd,a10.familyEnd,a11.speciesxjDan,a11.genusxjDan,a11.familyxjDan,
a12.speciesHal,a12.genusHal,a12.familyHal
into GridSpecies02 from Grid02 z	
left join a0  on z.id=a0.id
left join a1  on z.id=a1.id
left join a2  on z.id=a2.id
left join a3  on z.id=a3.id
left join a4  on z.id=a4.id
left join a5  on z.id=a5.id
left join a6  on z.id=a6.id
left join a7  on z.id=a7.id
left join a8  on z.id=a8.id
left join a9  on z.id=a9.id
left join a10 on z.id=a10.id
left join a11 on z.id=a11.id
left join a12 on z.id=a12.id
order by z.id


应该将这些气候等信息全部列入grid的主表里
select * from GridSpecies02
--UPDATE Gridspecies02 set MAT=b.MAT, MAP=b.MAP, GST=b.GST, GSP=b.GSP from gridspecies02 a, climate02 b where a.id =b.grid
drop table plantCountyAltitudeValidResultDistinct02
select distinct id, plant_id , 

(select top 1 lowaltitude from plantCountyAltitudeValidResult02 innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id order by innerTable.id, innerTable.Plant_id,innerTable.County_code, innerTable.lowaltitude, innerTable.highAltitude, innerTable.altitude_min, innerTable.altitude_max  ) lowaltitude,
(select top 1 highAltitude from plantCountyAltitudeValidResult02 innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id order by innerTable.id, innerTable.Plant_id,innerTable.County_code, innerTable.lowaltitude, innerTable.highAltitude, innerTable.altitude_min, innerTable.altitude_max  ) highAltitude,
(select top 1 County_code from plantCountyAltitudeValidResult02 innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id order by innerTable.id, innerTable.Plant_id,innerTable.County_code, innerTable.lowaltitude, innerTable.highAltitude, innerTable.altitude_min, innerTable.altitude_max  ) County_code,
(select top 1 altitude_min from plantCountyAltitudeValidResult02 innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id order by innerTable.id, innerTable.Plant_id,innerTable.County_code, innerTable.lowaltitude, innerTable.highAltitude, innerTable.altitude_min, innerTable.altitude_max  ) altitude_min,
(select top 1 altitude_max from plantCountyAltitudeValidResult02 innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id order by innerTable.id, innerTable.Plant_id,innerTable.County_code, innerTable.lowaltitude, innerTable.highAltitude, innerTable.altitude_min, innerTable.altitude_max  ) altitude_max 

into plantCountyAltitudeValidResultDistinct02

from plantCountyAltitudeValidResult02 outTable


select * from plantCountyAltitudeValidResult02 -- 1324493
select count(*) from plantCountyAltitudeValidResultDistinct02  -- 1319561 -- 4671920
select top 1 * from plantCountyAltitudeValidResultDistinct02

--sp_rename 'plantCountyAltitudeValidResult02.plantLowAltitude',lowaltitude,'column'
--sp_rename 'plantCountyAltitudeValidResult02.plantHighAltitude',highAltitude,'column'
--sp_rename 'plantCountyAltitudeValidResult02.GridAltitudeMin',altitude_min,'column'
--sp_rename 'plantCountyAltitudeValidResult02.GridAltitudeMax',altitude_max,'column'

select distinct id, plant_id, county_code from plantCountyAltitudeValidResultDistinct02
select plant_id, id Grid_id, id%240 GridLeft , id/120 GridTop from plantCountyAltitudeValidResultDistinct02
--GridLeft 为x即格子距离左边的格子数，GridTop指距离上边的格子数
--drop table plantGridExtremum02
--drop table PlantGridRange02

select plant_id, id Grid_id, id%120 GridLeft , 84-id/120 GridTop into PlantGridExtremum02 from plantCountyAltitudeValidResultDistinct02
select plant_id, id Grid_id, (id%480)/2 GridLeft , id/480 GridTop into PlantGridExtremum02 from plantCountyAltitudeValidResultDistinct02

select distinct plant_id, 0 GridLeft, 0 GridRight, 0 GridTop, 0 GridBottom into PlantGridRange02 from plantCountyAltitudeValidResultDistinct02
select * from PlantGridExtremum02
select * from PlantGridRange02
---因为前面可能存在多行记录，即一个Min(GridLeft)有多个Grid，所以取最小的Grid在这种情况下。

update PlantGridRange02 set GridLeft = z.Grid_id from PlantGridRange02, 
(
	select a.Plant_id, min(a.Grid_id) Grid_id from PlantGridExtremum02 a,
	(
	select plant_id, min(GridLeft) GridLeft from PlantGridExtremum02	
	group by plant_id 
	) b
	where a.plant_id = b.plant_id and a.GridLeft = b.GridLeft group by a.Plant_id
) z 
where PlantGridRange02.plant_id = z.Plant_id

select * from PlantGridRange02

update PlantGridRange02 set GridRight = z.Grid_id from PlantGridRange02, 
(
	select distinct a.Plant_id, min(a.Grid_id) Grid_id from PlantGridExtremum02 a,
	(
	select plant_id, max(GridLeft) GridLeft from PlantGridExtremum02	
	group by plant_id 
	) b
	where a.plant_id = b.plant_id and a.GridLeft = b.GridLeft group by a.Plant_id
) z 
where PlantGridRange02.plant_id = z.Plant_id


update PlantGridRange02 set GridTop = z.Grid_id from PlantGridRange02, 
(
	select distinct a.Plant_id, min(a.Grid_id) Grid_id from PlantGridExtremum02 a,
	(
	select plant_id, min(GridTop) GridTop from PlantGridExtremum02 	
	group by plant_id
	) b
	where a.plant_id = b.plant_id and a.GridTop = b.GridTop group by a.Plant_id
) z 
where PlantGridRange02.plant_id = z.Plant_id

update PlantGridRange02 set GridBottom = z.Grid_id from PlantGridRange02, 
(
	select distinct a.Plant_id, min(a.Grid_id) Grid_id from PlantGridExtremum02 a,
	(
	select plant_id, max(GridTop) GridTop from PlantGridExtremum02	
	group by plant_id 
	) b
	where a.plant_id = b.plant_id and a.GridTop = b.GridTop group by a.Plant_id
) z 
where PlantGridRange02.plant_id = z.Plant_id

--alter table PlantGridRange02 add HorizonRange int;
--alter table PlantGridRange02 add VerticalRange int;
select * from PlantGridRange02

update PlantGridRange02 set HorizonRange=a.HorizonRange from PlantGridRange02,
(
select plant_id, (max(GridLeft) - min(GridLeft)) as HorizonRange from PlantGridExtremum02 	
	group by plant_id 
) a
where PlantGridRange02.Plant_id=a.plant_id

update PlantGridRange02 set VerticalRange=a.VerticalRange from PlantGridRange02,
(
select plant_id, (max(GridTop) - min(GridTop)) as VerticalRange from PlantGridExtremum02 
	group by plant_id 
) a
where PlantGridRange02.Plant_id=a.plant_id

select * from PlantGridRange02 where HorizonRange = 0 --=GridRight-GridLeft, VerticalRange=GridBottom-GridTop
select * from PlantGridRange02 where VerticalRange > 0

select a.plant_id, a.lonMedian, a.latMedian, b.lonMedian, b.latMedian from PlantGridRange02 a, plantGridRange b
where a.plant_id=b.plant_id

--alter table PlantGridRange02 add LonMedian decimal(10, 2);
--alter table PlantGridRange02 add LatMedian decimal(10, 2);
update PlantGridRange02 set LonMedian = grid02.Lon + PlantGridRange02.HorizonRange * 0.2 / 2 from PlantGridRange02, grid02
where PlantGridRange02.GridLeft = grid02.ID

update PlantGridRange02 set LatMedian = grid02.Lat + PlantGridRange02.VerticalRange * 0.2 / 2 from PlantGridRange02, grid02
where PlantGridRange02.GridBottom = grid02.ID

select * from PlantGridRange02

select * from m_grid
select * from grid02
select * from PlantLonLat02
drop table PlantLonLat02
select Plant_id, GridLeft LonWest, GridRight LonEast, GridTop LatNorth, GridBottom LatSouth, 0 GridCount into PlantLonLat02 from PlantGridRange02

select a.plant_id, a.LonMedian, a.LatMedian, b.LonMedian, b.LatMedian from PlantGridRange a, PlantGridRange02 b
where a.plant_id=b.plant_id

update PlantLonLat02 set GridCount=z.GridCount 
from PlantLonLat02,
(select Plant_id, Count(distinct(Id)) GridCount  from plantCountyAltitudeValidResultDistinct02 group by Plant_id) z
where PlantLonLat02.Plant_id=z.Plant_id

select * from PlantLonLat02 order by plant_id
select * from PlantLonLat order by plant_id

#乔木平均胸径&最大胸径作为个体大小   <----treeBS
select a.*, b.*, d.Gridcount from plantgridrange02 a,  
(select species, avg(breast/3.14) bodysizeavg, max(breast/3.14) bodysizemax from arbor 
group by species) b, m_plant c, plantlonlat02 d 
where c.id = a.plant_id and b.species = c.cnname and d.plant_id = a.plant_id order by a.plant_id

select * from PlantLonLat02

select * from grid02 order by id

select * from m_grid where id=40561

--alter table grid02 add Lon decimal(10, 2);
--alter table grid02 add Lat decimal(10, 2);
update grid02 set Lon = ((id -1)%120) * 0.2  + 73.1;
--update grid02 set lat = ((id -1)/120) * 0.2  + 35.9;
update grid02 set lat = ((id -1)/120) * 0.2  + 33.1;
select * from grid02 where id=7002
select id, (id-1)/120 from grid02 order by id

select a.id, a.mean, a.mean2, a.mean-a.mean2 as diff  from (
	select id, altitude_mean as mean, (altitude_min+altitude_max) / 2 as mean2 from grid02
) a order by diff

update PlantLonLat02 set LonWest =c.Lon from PlantLonLat02 a, PlantGridRange02 b, grid02 c where a.Plant_id= b.Plant_id and b.GridLeft = c.ID;
update PlantLonLat02 set LonEast =c.Lon from PlantLonLat02 a, PlantGridRange02 b, grid02 c where a.Plant_id= b.Plant_id and b.GridRight = c.ID;
update PlantLonLat02 set LatNorth =c.Lat from PlantLonLat02 a, PlantGridRange02 b, grid02 c where a.Plant_id= b.Plant_id and b.GridTop = c.ID;
update PlantLonLat02 set LatSouth =c.Lat from PlantLonLat02 a, PlantGridRange02 b, grid02 c where a.Plant_id= b.Plant_id and b.GridBottom = c.ID
select * from PlantLonLat02

--drop table Grid_GridScope02

select id Grid_id, 1 GridCountMedian, 1 GridCountMin,1 GridCountMax,1.12 LonMedian,1.12 LatMedian into Grid_GridScope02 from grid02

select * from Grid_GridScope02
select * from PlantGridRange02
PlantGridRange02
alter table Grid_GridScope02 add GridHorizonRangeMedian numeric(10, 2)
alter table Grid_GridScope02 add GridVerticalRangeMedian numeric(10, 2)


##计算栅格乔木的bodySize,栅格的RangeSize和richness   <---- gridtreeBS
select aaa.*, bbb.*, ccc.* from grid_gridScope02 aaa,  
( select bb.id, avg(breast/3.14) bodysizeavg, max(breast/3.14) bodysizemax from arbor aa,
	(select a.id as id, b.plot, a.lon, a.lat, b.longitude, b.latitude from grid02 a 
		join xinjiangPlot.dbo.Environment b 
		on a.lon + 0.1 >= b.longitude and a.lon-0.1 < b.longitude
		and a.lat + 0.1 >= b.latitude and a.lat-0.1 < b.latitude
	) bb where aa.plot=bb.plot group by bb.id
) bbb,
(select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount
	from plantCountyAltitudeValidResultDistinct02 a,m_plant 
	where a.plant_id = m_plant.id  group by a.id) ccc
where aaa.Grid_id=bbb.id and aaa.Grid_id=ccc.id


select id, count(distinct(plant_id)) from plantCountyAltitudeValidResultDistinct02 group by id order by id
select * from gridspecies02 order by id


####计算草地
##植物按照平均和最大高度
select a.*, b.*, d.Gridcount from plantgridrange02 a,  
(select species, avg(AveHeight) heightavg, max(AveHeight) heightmax from grasslandPlot group by species) b, m_plant c, plantlonlat02 d 
where c.id = a.plant_id and b.species = c.cnname and d.plant_id = a.plant_id order by a.plant_id

##区域:按照平均和最大高度   <----grasslandHeight
select aaa.*, bbb.*, ccc.* from grid_gridScope02 aaa,  
(
select bb.id, avg(aveHeight) bodysizeavg from grasslandplot aa,
	(select a.id as id, b.plot, a.lon, a.lat, b.longitude, b.latitude from grid02 a 
		join grasslandenvironment b 
		on a.lon + 0.1 >= b.longitude and a.lon-0.1 < b.longitude
		and a.lat + 0.1 >= b.latitude and a.lat-0.1 < b.latitude
	) bb where aa.plot=bb.plot group by bb.id
) bbb,
(select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount
	from plantCountyAltitudeValidResultDistinct02 a,m_plant 
	where a.plant_id = m_plant.id  group by a.id) ccc
where aaa.Grid_id=bbb.id and aaa.Grid_id=ccc.id




select * from PlantGridRange02

select * from grid_gridScope
select * from grid_gridScope02

select * from m_grid where id=36542
select * from grid02 where id=991


select * from m_grid where id=7306
select * from grid02 where id=8333


select * from m_grid where id=17272
select * from grid02 where id=5996

select top 100 * from plantCountyAltitudeValidResultDistinct02 order by id

select * from grid03

select * from gridspecies03

select * from m_grid order by id
select ID mergeID, ID into mMGrid from m_grid
select * from mMGrid order by ID
--update mMGrid set mergeID =  (ID - 240 ) where ID > 240 and (ID /240) % 2 = 1
select distinct(mergeID) from mMGrid

--update mMGrid set mergeID = mergeID - 1 where ID % 2  = 0

select * from grasslandenvironment
 
select * from grid02 order by id
select * from gridspecies02 order by id
select avg(species) from gridspecies02

select * from m_grid order by id
select * from m_county
select * from m_area
select * from piaocountycode

select * from mMGrid where id in (2539,2540,2779,2780)

select * from mMGrid where id in (12803,12804,12563,12564)

select mergeId, count(id) from mMGrid group by mergeID  having count(*) = 4
order by count(id)
select * from m_grid
alter table mMGrid add Lon decimal(10, 2);
alter table mMGrid add Lat decimal(10, 2);
//取平均的经度
update mMGrid set lon = (select avg(lon) from m_grid where id = mMgrid.id)

select a.mergeId, from  mMGrid

--select * into grid02 from  grid02Ori
--delete grid02
select * from grid02
--insert into grid02 (id) select distinct(mergeId) from mMGrid
--更新经度
update grid02 set lon = aa.lon from grid02, 
(
select a.mergeId, avg(b.lon) lon from  mMGrid a join m_grid b on a.id=b.id
where a.mergeId in (select mergeId from mMGrid group by mergeId having count(*) = 2)
group by a.mergeId
) aa where grid02.id=aa.mergeId
--更新纬度
update grid02 set lat = aa.lat from grid02, 
(
select a.mergeId, avg(b.lat) lat from  mMGrid a join m_grid b on a.id=b.id
where a.mergeId in (select mergeId from mMGrid group by mergeId having count(*) = 1)
group by a.mergeId
) aa where grid02.id=aa.mergeId

//选取栅格1对3的情况
select * from m_grid where id in (
select mergeId from mMGrid group by mergeId having count(*) = 3
)
//选取栅格1对3的情况
select * from mMGrid where mergeId in (
select mergeId from mMGrid group by mergeId having count(*) = 3
)

//选取栅格1对3的情况
select b.mergeId, a.id, a.lon from m_grid a join (
select mergeId, min(id) id from mMGrid where  mergeId in (
select mergeId from mMGrid group by mergeId having count(*) = 3
) group by mergeId
) b on a.id=b.id

//对于栅格1对3的情况,取两个相同的经度的经度和一个不同的经度的经度的平均值作为经度
update grid02 set lon = aaa.meanLon from grid02,
(
	select aa.mergeId, aa.lon, (aa.lon + bb.lon) /2 as meanLon from (
		select b.mergeId, a.lon from m_grid a join mMGrid b on  a.id=b.id
		where b.mergeId in(select mergeId from mMGrid group by mergeId having count(*) = 3)
		group by b.mergeId, a.lon having count(*) = 2
	) aa, 
	(
		select b.mergeId, a.lon from m_grid a join mMGrid b on  a.id=b.id
		where b.mergeId in(select mergeId from mMGrid group by mergeId having count(*) = 3)
		group by b.mergeId, a.lon having count(*) = 1
	) bb where aa.mergeId = bb.mergeId
) aaa where grid02.id=aaa.mergeId

//对于栅格1对3的情况,取两个相同的纬度的纬度和一个不同的纬度的纬度的平均值作为纬度
update grid02 set lat = aaa.meanLat from grid02,
(
	select aa.mergeId, aa.lat, (aa.lat + bb.lat) /2 as meanLat from (
		select b.mergeId, a.lat from m_grid a join mMGrid b on  a.id=b.id
		where b.mergeId in(select mergeId from mMGrid group by mergeId having count(*) = 3)
		group by b.mergeId, a.lat having count(*) = 2
	) aa, 
	(
		select b.mergeId, a.lat from m_grid a join mMGrid b on  a.id=b.id
		where b.mergeId in(select mergeId from mMGrid group by mergeId having count(*) = 3)
		group by b.mergeId, a.lat having count(*) = 1
	) bb where aa.mergeId = bb.mergeId
) aaa where grid02.id=aaa.mergeId

--select * from grid02 where lon is null or lat is null
select * from m_grid
//取4个Grid的最小海拔作为MergeId的最小海拔
update grid02 set altitude_min = aa.altitude_min from grid02,
(
	select a.mergeId, min(b.altitude_min) altitude_min from mMgrid a, m_grid b where a.id=b.id group by a.mergeId
) aa where grid02.id=aa.mergeId

//取4个Grid的最大海拔作为MergeId的最大海拔
update grid02 set altitude_max = aa.altitude_max from grid02,
(
	select a.mergeId, max(b.altitude_max) altitude_max from mMgrid a, m_grid b where a.id=b.id group by a.mergeId
) aa where grid02.id=aa.mergeId

//取4个Grid的平均海拔作为MergeId的平均海拔
update grid02 set altitude_mean = aa.altitude_mean from grid02,
(
	select a.mergeId, avg(b.altitude_mean) altitude_mean from mMgrid a, m_grid b where a.id=b.id group by a.mergeId
) aa where grid02.id=aa.mergeId

select * from 
select * from grid02
//对于一对一的情况更新县的code为MergeId的县code
update grid02 set county = aa.code from grid02,
(select a.id, b.code from m_grid a, piaoCountyCode b where a.county=b.id) aa on grid02.
where grid02.id=aa.id and grid02.id in (select mergeId from mMGrid group by mergeId having count(*) = 1)

select aa.* from grid02,
(select a.id, b.code from m_grid a, piaoCountyCode b where a.county=b.id) aa 
where grid02.id=aa.id and grid02.id in (select mergeId from mMGrid group by mergeId having count(*) = 1)

select a.id, b.code from m_grid a, piaoCountyCode b
where a.county=b.id order by b.code

select a.id, b.code from m_grid a, piaoCountyCode b, mMGrid c
where a.county=b.id and a.id=c.mergeId

and a.id in (select mergeId from mMGrid group by mergeId having count(*) = 1)

select * from mMGrid where mergeId not in (select id from m_grid)
--select * into mMgrid_bak from mMgrid
--select * into grid02_bak from grid02
--delete mMGrid where mergeid not in (select id from m_grid)
--delete grid02 where id not in (select id from m_grid)
select a.mergeId, count(distinct(b.county)) 
from mMGrid a, m_grid b 
where a.id=b.id
group by a.mergeId having  count(distinct(b.county))  = 2

//对于相同县的code的情况,直接更新MergeId的县code
update grid02 set county = aa.code from grid02, 
(
    select a.id, b.code from m_grid a, piaoCountyCode b where a.county=b.id
    and a.id in (
		select a.mergeId
			from mMGrid a, m_grid b 
			where a.id=b.id
			group by a.mergeId having  count(distinct(b.county))  = 1
    )
) aa where grid02.id=aa.id and grid02.county is null

select id, county from m_grid where id in (
	select a.mergeId
	from mMGrid a, m_grid b 
	where a.id=b.id
	group by a.mergeId having  count(distinct(b.county))  = 2
)
//对于县的code有三个的情况,更新MergeId的县code为两个县的code
update grid02 set county = aaa.county from grid02, 
(
	select mergeId, county from 
	(
		select a.mergeId, a.id, b.county from mMGrid a, m_grid b where a.id=b.id and mergeId in (
			select a.mergeId
			from mMGrid a, m_grid b 
			where a.id=b.id
			group by a.mergeId having  count(distinct(b.county))  = 3
		) --order by a.mergeId, a.id
	) aa group by mergeId, county having count(*) = 2
) aaa where grid02.id=aaa.mergeId and grid02.county is null

select a.mergeId, a.id, b.county from mMGrid a, m_grid b where a.id=b.id and mergeId in (
	select a.mergeId
	from mMGrid a, m_grid b 
	where a.id=b.id
	group by a.mergeId having  count(distinct(b.county))  = 2
) and mergeId in (select id from grid02 where county is null)

//对于对于Grid为1对3的情况,更新MergeId的县code为两个县的code
update grid02 set county = aaaa.county from grid02, 
(
	select mergeId, county from 
	(
		select a.mergeId, b.id, b.county from mMGrid a, m_grid b where a.id=b.id and a.mergeId in (select id from grid02 where county is null)
		and a.mergeId in (
			select mergeId from (
				select a.mergeId, b.id, b.county from mMGrid a, m_grid b where a.id=b.id and a.mergeId in (select id from grid02 where county is null)
			) aa group by mergeId having count(id) = 3
		)
	) aaa group by mergeId, county having count(county) = 2
) aaaa where grid02.id=aaaa.mergeId and grid02.county is null
//选取mergeId,gridID,县Code和县名
select a.mergeId, b.id, b.county, c.code, d.county 
from mMGrid a, m_grid b, piaoCountyCode c, m_county d 
where a.id=b.id and b.county=c.id and c.code=d.code and a.mergeId in (select id from grid02 where county is null)
and a.mergeId in (
	select mergeId from (
		select a.mergeId, b.id, b.county from mMGrid a, m_grid b where a.id=b.id and a.mergeId in (select id from grid02 where county is null)
	) aa group by mergeId
) order by mergeId

select * from mMGrid where mergeid=6383
select * from mMGrid where id=6623
select * from mMGrid where id=6624


select * from piaoCountyCode
select * from m_county
select * from grid02 where county is null 
--update grid02 set county = bb.code from grid02 aa, piaoCountyCode bb where aa.county = bb.id

select * from plantCountyAltitudeValidResultDistinct02 where  id=2539


select a.id, b.LonMedian 
from plantCountyAltitudeValidResultDistinct02 a, PlantGridRange02 b
where a.plant_id=b.plant_id and a.id=2539
order by  a.id,b.LonMedian

select * from PlantGridRange02

select a.id, Count(*) plantCount 
from plantCountyAltitudeValidResultDistinct02 a, PlantGridRange02 b
where a.plant_id=b.plant_id 
group by a.id
order by a.id
select * from Grid_GridScope02
select a.grid_id, a.lonMedian,b.lonMedian from Grid_GridScope a,  Grid_GridScope02 b where a.grid_id=b.grid_id
order by a.lonMedian

select a.grid_id, a.latMedian,b.latMedian from Grid_GridScope a,  Grid_GridScope02 b where a.grid_id=b.grid_id
order by a.latMedian

select a.grid_id, a.GridCountMedian,b.GridCountMedian from Grid_GridScope a,  Grid_GridScope02 b where a.grid_id=b.grid_id
order by a.GridCountMedian




