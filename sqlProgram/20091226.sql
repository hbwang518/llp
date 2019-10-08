use SpeciesRichnessXinJiang

select top 3 * from plantCountyAltitudeValidResultDistinct

select count(*) from plantCountyAltitudeValidResultDistinct

select * from M_Plant where highAltitude is null

select * from m_plant where id not in (select plant_id from plantCounty) and culAndWildFlag=1

select * from m_plant where id not in (select distinct(plant_Id) from distinctPlantCounty)

select * from distinctPlantCounty where Plant_id in (
select id from m_plant where id not in (select plant_id from plantCounty) and culAndWildFlag=1)

--得到PlantScorp-- that is 每种植物分布Grid的横向和纵向值
select plant_id, id Grid_id, id%240 GridLeft , id/240 GridTop into PlantGridExtremum from plantCountyAltitudeValidResultDistinct
drop table PlantGridExtremum

select * from PlantGridExtremum where plant_id = 1

select distinct a.Plant_id, min(a.Grid_id) GridTop from PlantGridExtremum a,
(
select plant_id, min(GridTop) GridTop from PlantGridExtremum
group by plant_id
) z
where a.plant_id = z.plant_id and a.GridTop = z.GridTop group by a.Plant_id

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

select * from 

--PlantGridRange表示某个植物最左边，最右边，最顶部，最底部的Grid
select distinct plant_id, null GridLeft, null GridRight, null GridTop, null GridBottom into PlantGridRange from plantCountyAltitudeValidResultDistinct

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
update PlantGridRange set HorizonRange=GridRight-GridLeft, VerticalRange=GridBottom-GridTop

update PlantGridRange set HorizonRange=a.HorizonRange from PlantGridRange,
(
select plant_id, (max(GridLeft) - min(GridLeft)) as HorizonRange from PlantGridExtremum 	
	group by plant_id 
) a
where PlantGridRange.Plant_id=a.plant_id

update PlantGridRange set VerticalRange=a.VerticalRange from PlantGridRange,
(
select plant_id, (max(GridTop) - min(GridTop)) as VerticalRange from PlantGridExtremum 
	group by plant_id 
) a
where PlantGridRange.Plant_id=a.plant_id

select * from PlantGridRange where HorizonRange = 0 --=GridRight-GridLeft, VerticalRange=GridBottom-GridTop
select * from PlantGridRange where VerticalRange > 0

--update LonMedian and LatMedian for PlantGridRange 
update PlantGridRange set LonMedian = m_grid.Lon + PlantGridRange.HorizonRange * 0.1 / 2 from PlantGridRange, m_grid
where plantGridRange.GridLeft = m_grid.ID

update PlantGridRange set LatMedian = m_grid.Lat + PlantGridRange.VerticalRange * 0.1 / 2 from PlantGridRange, m_grid
where plantGridRange.GridBottom = m_grid.ID

select * from m_grid

select max(HorizonRange) from PlantGridRange
select max(VerticalRange) from PlantGridRange
select top 1 * from plantCountyAltitudeValidResultDistinct

select a.id, Count(a.Plant_id) plantCount 
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.Plant_id --and a.id=2299
group by a.id 
order by a.id

select a.id, a.plant_id, b.HorizonRange from plantCountyAltitudeValidResultDistinct a, PlantGridRange b
where a.plant_id=b.plant_id order by  a.id,b.HorizonRange

select a.id, Count(*) from plantCountyAltitudeValidResultDistinct a, PlantGridRange b
where a.plant_id=b.plant_id group by a.id


select a.id, a.plant_id, b.VerticalRange from plantCountyAltitudeValidResultDistinct a, PlantGridRange b
where a.plant_id=b.plant_id

select * from PlantGridRange

select plant_id, Grid_id, GridLeft from PlantGridExtremum group by plant_id, Grid_id,GridLeft  having GridLeft = min(GridLeft)


select * from PlantGridRange

select * from PlantGridRange where GridTop > GridBottom

select * from PlantGridRange where GridTop < GridBottom

select * from PlantGridRange where GridTop = GridBottom

select * from m_plant where id=446



--PlantLonLat
--植物分布区最大，最小经纬度信息

select Plant_id, GridLeft LonWest, GridRight LonEast, GridTop LatNorth, GridBottom LatSouth, 0 GridCount into PlantLonLat from PlantGridRange

update PlantLonLat set LonWest =c.Lon from PlantLonLat a, PlantGridRange b, M_Grid c where a.Plant_id= b.Plant_id and b.GridLeft = c.ID;
update PlantLonLat set LonEast =c.Lon from PlantLonLat a, PlantGridRange b, M_Grid c where a.Plant_id= b.Plant_id and b.GridRight = c.ID;
update PlantLonLat set LatNorth =c.Lat from PlantLonLat a, PlantGridRange b, M_Grid c where a.Plant_id= b.Plant_id and b.GridTop = c.ID;
update PlantLonLat set LatSouth =c.Lat from PlantLonLat a, PlantGridRange b, M_Grid c where a.Plant_id= b.Plant_id and b.GridBottom = c.ID;

select * from PlantLonLat
select * from PlantGridRange
select * from _phd_PlantLonLat

update PlantLonLat set GridCount=z.GridCount 
from PlantLonLat,
(select Plant_id, Count(distinct(Id)) GridCount  from plantCountyAltitudeValidResultDistinct group by Plant_id) z
where PlantLonLat.Plant_id=z.Plant_id


--Grid_GridScope
select * 	 m_grid, 1.12是小数
select id Grid_id, 1 GridCountMedian, 1 GridCountMin,1 GridCountMax,1.12 LonMedian,1.12 LatMedian into Grid_GridScope from m_grid
 plantCountyAltitudeValidResultDistinct

select a.id, b.GridCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.Plant_id
order by a.id, b.GridCount

select * from Grid_GridScope 
select * from _phd_Grid_GridScope
insert into Grid_GridScope (grid_id) select grid_Id from  _phd_Grid_GridScope

update Grid_GridScope set GridCountMin = 0, GridCountMax=0, lonMedian=0, latMedian=0


select a.id, Count(Plant_id) plantCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.Plant_id
group by a.id 


select a.id, b.GridCount PlantGridCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.Plant_id
order by 
order by a.id b.GridCount

select * from PlantLonLat
select * from Grid_GridScope order by Grid_id
select * from Plant

select * from _phd_Grid_GridScope
delete Grid_GridScope
select top 1 * from plantCountyAltitudeValidResultDistinct
select * from m_plant
select count(*) from plantCountyAltitudeValidResultDistinct a, m_plant b where a.plant_id=b.id and b.del > 0
delete plantCountyAltitudeValidResultDistinct where plant_id in (select id from m_plant where del > 0)
select * from PlantLonLat where plant_id in (select id from m_plant where del > 0)
select * from PlantGridExtremum where plant_id in (select id from m_plant where del > 0)
select * from PlantGridRange where plant_id in (select id from m_plant where del > 0)
select * from m_plant where del > 0
delete PlantLonLat  where plant_id in (select id from m_plant where del > 0)
delete PlantGridExtremum  where plant_id in (select id from m_plant where del > 0)
delete PlantGridRange  where plant_id in (select id from m_plant where del > 0)

--插入数据进入Grid_GridScope

Declare @Grid_id int
Declare @InnerGrid_id int
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int
declare @Plant_id int

Declare @minCount int
Declare @maxCount int 


Declare Grid_PlantCount cursor  for
	select top 2 a.id, Count(a.Plant_id) plantCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
	where a.plant_id=b.Plant_id
	group by a.id 
	order by a.id
open Grid_PlantCount


Declare Grid_EachPlant_Count cursor  for
	select a.id, b.GridCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
	where a.plant_id=b.Plant_id --and grid_id in (2068,2299)
	order by a.id, b.GridCount
open tempTable

fetch next from Grid_PlantCount into @Grid_id, @PlantCount

Begin
   while (@@FETCH_STATUS = 0)
	set @remainder = @PlantCount%2
	set @MiddleCount = @PlantCount/2
	
	if @remainder = 0
	begin
		set @i = 0;
		while   @i < @MiddleCount  
		begin   
		      	set   @i   =   @i+1   
			fetch next from Grid_EachPlant_Count
		end 
		fetch next from Grid_EachPlant_Count into @InnerGrid_id, @minCount
		fetch next from Grid_EachPlant_Count into @InnerGrid_id, @maxCount
		set @i = @i + 2
		while   @i < @PlantCount  
		begin   
		      	set   @i   =   @i+1   
			fetch next from Grid_EachPlant_Count
		end
		set @minCount = (@minCount+@maxCount)/2
	end
	else
	begin
		set @i = 0;
		while   @i <= @MiddleCount  
		begin   
		      	set   @i   =   @i+1   
			fetch next from Grid_EachPlant_Count
		end 
		fetch next from Grid_EachPlant_Count into @InnerGrid_id, @minCount		
		set @i = @i + 2
		while   @i < @PlantCount  
		begin   
		      	set   @i   =   @i+1   
			fetch next from Grid_EachPlant_Count
		end
	end
	update Grid_GridScope set GridCountMedian = @minCount where plant_id = @Plant_id
	fetch next from Grid_PlantCount into @Grid_id, @PlantCount
end

close Grid_PlantCount
DEALLOCATE Grid_PlantCount


close Grid_EachPlant_Count
DEALLOCATE Grid_EachPlant_Count

GO

select * from PlantLonLat

select a.id, b.GridCount
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.plant_id 
order by a.id

select a.id, avg(b.GridCount)
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.plant_id 
group by a.id
order by a.id

select * from grid_gridscope order by grid_id

select plant_id from m_plant,
(
	select latinGenus from m_plant group by latinGenus having Count(*) >=20
) genus

where m_plant.latinGenus=genus.latinGenus

select a.id, avg(b.GridCount) meanGridCount, Count(*) plantCount
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b,
(   select id from m_plant,
    (
            select latinGenus from m_plant group by latinGenus having Count(*) >=20
    ) genus
    where m_plant.latinGenus=genus.latinGenus
) z
where a.plant_id=b.plant_id and a.plant_id=z.id
group by a.id
order by a.id

select a.id, b.GridCount
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b,
(   select id from m_plant,
    (
            select latinGenus from m_plant group by latinGenus having Count(*) >=20
    ) genus
    where m_plant.latinGenus=genus.latinGenus
) z
where a.plant_id=b.plant_id and a.plant_id=z.id
order by a.id


select distinct species, 0 id into XiangJiangPlot from shrubAndGrass

insert into XiangJiangPlot (species, id) values ( select distinct species, 0 id from Arbor) 

delete xiangJiangPlot

select id, cnName into XinJiangPlot from m_plant where cnName in (select species from shrubAndGrass union select species from Arbor)

select distinct species from shrubAndGrass union select species from Arbor

select distinct species from Arbor

update XinJiangPlot set cnName = m_plant.cnName from m_plant where m_plant.id=xinJiangPlot.id

select a.id, avg(b.GridCount) meanGridCount, Count(*) plantCount
                                                    from plantCountyAltitudeValidResultDistinct a, PlantLonLat b,XinJiangPlot c                                                    
                                                    where a.plant_id=b.plant_id and a.plant_id=c.id
                                                    group by a.id
                                                    order by a.id

select a.id, b.GridCount
                                                        from plantCountyAltitudeValidResultDistinct a, PlantLonLat b,,XinJiangPlot c                                                         
                                                        where a.plant_id=b.plant_id and a.plant_id=c.id
                                                        order by a.id

select * from Grid_GridScope where GridSorensonVertical is null
select * from Grid_GridScope where GridCountMedian is null
select * from Grid_GridScope where GridCountMax is null

select a.id, Count(a.Plant_id) plantCount 
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.Plant_id --and a.id=2299
group by a.id 
order by a.id
                                            
select a.id, b.GridCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
 where a.plant_id=b.Plant_id
 order by a.id, b.GridCount
 
 select a.id, avg(b.GridCount) meanGridCount, Count(*) plantCount
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.plant_id 
group by a.id
order by a.id