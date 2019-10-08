use SpeciesRichnessXinJiang

select top 1 * from plantCountyAltitudeValidResultDistinct

Declare @Grid_id int
Declare @InnerGrid_id int
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare Grid_PlantCount cursor  for
	select top 2 a.id, Count(a.Plant_id) plantCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
	where a.plant_id=b.Plant_id --and a.id=2299
	group by a.id 
        order by a.id		
	--select top 2 a.id, Count(distinct(a.Plant_id)) plantCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
	--where a.plant_id=b.Plant_id --and a.id=2299
	--group by a.id 
	--order by a.id

	--select top 2 a.id, Count(a.Plant_id) plantCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
	--where a.plant_id=b.Plant_id --and a.id=2299
	--group by a.id 
        --order by a.id
	
open Grid_PlantCount

--select distinct(Plant_id) from plantCountyAltitudeValidResultDistinct

Declare Grid_EachPlant_Count cursor  for
	select top 1350 a.id, b.GridCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
	where a.plant_id=b.Plant_id --and a.id in (2068,2299)
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

select * from Grid_GridScope where GridCountMedian > 2 order by Grid_id

select * from plantGridRange

update plantGridRange set HorizonRange = GridRight - GridLeft , VerticalRange = GridBottom - GridTop

select * from plantGridRange where VerticalRange < 0

select * from plantGridRange where HorizonRange < 0