use SpeciesRichnessXinJiang
--选择County是空的植物
select * from m_plant where id in (select plant_id from distinctPlantCounty where county_code is null)

select * from plantCountyAltitudeValidResult

select top 10 distinct id, plant_id, (select top 1 lowAltitude, highAltitude from plantCountyAltitudeValidResult innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id  )from plantCountyAltitudeValidResult outTable

select distinct id, plant_id , 

(select top 1 lowaltitude from plantCountyAltitudeValidResult innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id order by innerTable.id, innerTable.Plant_id,innerTable.County_code, innerTable.lowaltitude, innerTable.highAltitude, innerTable.altitude_min, innerTable.altitude_max  ) lowaltitude,
(select top 1 highAltitude from plantCountyAltitudeValidResult innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id order by innerTable.id, innerTable.Plant_id,innerTable.County_code, innerTable.lowaltitude, innerTable.highAltitude, innerTable.altitude_min, innerTable.altitude_max  ) highAltitude,
(select top 1 County_code from plantCountyAltitudeValidResult innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id order by innerTable.id, innerTable.Plant_id,innerTable.County_code, innerTable.lowaltitude, innerTable.highAltitude, innerTable.altitude_min, innerTable.altitude_max  ) County_code,
(select top 1 altitude_min from plantCountyAltitudeValidResult innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id order by innerTable.id, innerTable.Plant_id,innerTable.County_code, innerTable.lowaltitude, innerTable.highAltitude, innerTable.altitude_min, innerTable.altitude_max  ) altitude_min,
(select top 1 altitude_max from plantCountyAltitudeValidResult innerTable where innerTable.id = outTable.id and innerTable.Plant_id=outTable.Plant_id order by innerTable.id, innerTable.Plant_id,innerTable.County_code, innerTable.lowaltitude, innerTable.highAltitude, innerTable.altitude_min, innerTable.altitude_max  ) altitude_max 

into plantCountyAltitudeValidResultDistinct

from plantCountyAltitudeValidResult outTable

select distinct id, plant_id, county_code from plantCountyAltitudeValidResult
 

select top 1 * from plantCountyAltitudeValidResult

Declare @Grid_id int
Declare @InnerGrid_id int
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare Grid_PlantCount cursor  for
	select top 2 a.id, Count(distinct(a.Plant_id)) plantCount from plantCountyAltitudeValidResult a, PlantLonLat b
	where a.plant_id=b.Plant_id and a.id=2299
	group by a.id 

	select top 2 a.id, Count(a.Plant_id) plantCount from plantCountyAltitudeValidResult a, PlantLonLat b
	where a.plant_id=b.Plant_id and a.id=2299
	group by a.id 

	select * from plantCountyAltitudeValidResult

	SELECT DISTINCT(PLANT_ID) FROM
(
	select ID, PLANT_ID, COUNT(*) COUNTA from plantCountyAltitudeValidResult GROUP BY ID, PLANT_ID HAVING COUNT(*) > 1) Z

	order by a.id
open Grid_PlantCount

--select distinct(Plant_id) from plantCountyAltitudeValidResult

Declare Grid_EachPlant_Count cursor  for
	select a.id, a.Plant_id, b.GridCount from plantCountyAltitudeValidResult a, PlantLonLat b
	where a.plant_id=b.Plant_id and a.id in (2299)
	order by a.id, b.GridCount
open Grid_EachPlant_Count

fetch next from Grid_PlantCount into @Grid_id, @PlantCount

Begin
   while (@@FETCH_STATUS = 0)
   Begin
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
	update Grid_GridScope set GridCountMedian = @minCount where Grid_id = @Grid_id
	fetch next from Grid_PlantCount into @Grid_id, @PlantCount
    end
end

close Grid_PlantCount
DEALLOCATE Grid_PlantCount


close Grid_EachPlant_Count
DEALLOCATE Grid_EachPlant_Count


GO
