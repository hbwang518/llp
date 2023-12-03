--插入数据进入Grid_GridScope --程序来自于20100102
Declare @Grid_id int
Declare @InnerGrid_id int
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 

Declare Grid_PlantCount cursor  for
	select top 10 a.id, Count(a.Plant_id) plantCount from plantCountyAltitudeValidResultDistinct a
	group by a.id 
        order by a.id
	
open Grid_PlantCount

Declare Grid_EachPlant_Count cursor  for
	select top 1000 a.id, b.GridCount from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
	where a.plant_id=b.Plant_id
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
		set @i = @i + 1
		while   @i < @PlantCount  
		begin   
		      	set   @i   =   @i+1   
			fetch next from Grid_EachPlant_Count
		end
	end
	update Grid_GridScope set GridCountMin = @minCount where Grid_id = @Grid_id
	fetch next from Grid_PlantCount into @Grid_id, @PlantCount
    end
end

close Grid_PlantCount
DEALLOCATE Grid_PlantCount


close Grid_EachPlant_Count
DEALLOCATE Grid_EachPlant_Count


GO
