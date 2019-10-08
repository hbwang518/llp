use medixj
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.id, a.latinName from mpam a where a.latinName is not null 
	order by a.id
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort = ''
		set @i = charindex(' ',@latinName)-1
		if (  @i > 1)
		begin
		    print @i
			set @latinNameShort = SUBSTRING(@latinName, 1, @i)
			print @latinNameShort
		end
		
		if('' <>  @latinNameShort)
		begin
			print @latinNameShort
			update mpam set latinNameShort = @latinNameShort where id = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO

-------------------------------------------------------------------------------------------------------------------------

use medixj
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @latinNameShort1 varchar(255)
Declare @firstLatinNameShort varchar(255)
Declare @secondLatinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.id, a.latinName from mpam a where a.latinName is not null 
	order by a.id
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort1 = ''
		set @latinNameShort = ''
		set @firstLatinNameShort = ''
		set @i = charindex(' ',@latinName)
		if (  @i > 1)
		begin
		    print @i
		    set @firstLatinNameShort = SUBSTRING(@latinName, 1, @i-1)
		    print @firstLatinNameShort
			set @latinNameShort1 = SUBSTRING(@latinName, @i, LEN(@latinName) - @i)
			set @latinNameShort1 = LTRIM(rtrim(@latinNameShort1))
			print @latinNameShort1
		end
		
		
		set @latinNameShort = ''
		set @i = charindex(' ',@latinNameShort1)-1
		if (  @i > 1)
		begin
		    print @i
			set @latinNameShort = SUBSTRING(@latinNameShort1, 1, @i)
			print @latinNameShort
		end
		
		
		
		if('' <>  @latinNameShort)
		begin
		
		    set @latinNameShort = @firstLatinNameShort + ' ' + @latinNameShort
			print @latinNameShort
			update mpam set latinNameShort = @latinNameShort where id = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO

---------

-------------------------------------------------------------------------------------------------------------------------

use medixj
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @latinNameShort1 varchar(255)
Declare @firstLatinNameShort varchar(255)
Declare @secondLatinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.id, a.latinName from plantxj a where a.latinName is not null 
	order by a.id
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort1 = ''
		set @latinNameShort = ''
		set @firstLatinNameShort = ''
		set @i = charindex(' ',@latinName)
		if (  @i > 1)
		begin
		    print @i
		    set @firstLatinNameShort = SUBSTRING(@latinName, 1, @i-1)
		    print @firstLatinNameShort
			set @latinNameShort1 = SUBSTRING(@latinName, @i, LEN(@latinName) - @i)
			set @latinNameShort1 = LTRIM(rtrim(@latinNameShort1))
			print @latinNameShort1
		end
		
		
		set @latinNameShort = ''
		set @i = charindex(' ',@latinNameShort1)-1
		if (  @i > 1)
		begin
		    print @i
			set @latinNameShort = SUBSTRING(@latinNameShort1, 1, @i)
			print @latinNameShort
		end
		
		
		
		if('' <>  @latinNameShort)
		begin
		
		    set @latinNameShort = @firstLatinNameShort + ' ' + @latinNameShort
			print @latinNameShort
			update plantxj set latinNameShort = @latinNameShort where id = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO

-------------------------------------------------------------------------------------------------------------------------

use medixj
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @latinNameShort1 varchar(255)
Declare @firstLatinNameShort varchar(255)
Declare @secondLatinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.id, a.latinName from animalxj a where a.latinName is not null 
	order by a.id
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort1 = ''
		set @latinNameShort = ''
		set @firstLatinNameShort = ''
		set @i = charindex(' ',@latinName)
		if (  @i > 1)
		begin
		    print @i
		    set @firstLatinNameShort = SUBSTRING(@latinName, 1, @i-1)
		    print @firstLatinNameShort
			set @latinNameShort1 = SUBSTRING(@latinName, @i, LEN(@latinName) - @i)
			set @latinNameShort1 = LTRIM(rtrim(@latinNameShort1))
			print @latinNameShort1
		end
		
		
		set @latinNameShort = ''
		set @i = charindex(' ',@latinNameShort1)-1
		if (  @i > 1)
		begin
		    print @i
			set @latinNameShort = SUBSTRING(@latinNameShort1, 1, @i)
			print @latinNameShort
		end
		
		
		
		if('' <>  @latinNameShort)
		begin
		
		    set @latinNameShort = @firstLatinNameShort + ' ' + @latinNameShort
			print @latinNameShort
			update animalxj set latinNameShort = @latinNameShort where id = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO

-------------------------------------------------------------------------------------------------------------------------

use medixj
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @latinNameShort1 varchar(255)
Declare @firstLatinNameShort varchar(255)
Declare @secondLatinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.id, a.latinNameFull from mhz a where a.latinNameFull is not null 
	order by a.id
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort1 = ''
		set @latinNameShort = ''
		set @firstLatinNameShort = ''
		set @i = charindex(' ',@latinName)
		if (  @i > 1)
		begin
		    print @i
		    set @firstLatinNameShort = SUBSTRING(@latinName, 1, @i-1)
		    print @firstLatinNameShort
			set @latinNameShort1 = SUBSTRING(@latinName, @i, LEN(@latinName) - @i)
			set @latinNameShort1 = LTRIM(rtrim(@latinNameShort1))
			print @latinNameShort1
		end
		
		
		set @latinNameShort = ''
		set @i = charindex(' ',@latinNameShort1)-1
		if (  @i > 1)
		begin
		    print @i
			set @latinNameShort = SUBSTRING(@latinNameShort1, 1, @i)
			print @latinNameShort
		end
		
		
		
		if('' <>  @latinNameShort)
		begin
		
		    set @latinNameShort = @firstLatinNameShort + ' ' + @latinNameShort
			print @latinNameShort
			update mhz set latinName = @latinNameShort where id = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO


-------------------------------------------------------------------------------------------------------------------------

use medixj
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @latinNameShort1 varchar(255)
Declare @firstLatinNameShort varchar(255)
Declare @secondLatinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.id, a.latinName from mug a where a.latinName is not null 
	order by a.id
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort1 = ''
		set @latinNameShort = ''
		set @firstLatinNameShort = ''
		set @i = charindex(' ',@latinName)
		if (  @i > 1)
		begin
		    print @i
		    set @firstLatinNameShort = SUBSTRING(@latinName, 1, @i)
		    set @firstLatinNameShort = LTRIM(rtrim(@firstLatinNameShort))
		    print @firstLatinNameShort			
		end
		
		if('' <>  @firstLatinNameShort)
		begin
			update mug set latinGenus = @firstLatinNameShort where id = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO

-------------------------------------------------------------------------------------------------------

use medixj
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @latinNameShort1 varchar(255)
Declare @firstLatinNameShort varchar(255)
Declare @secondLatinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.id, a.latinName from mhz a where a.latinName is not null 
	order by a.id
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort1 = ''
		set @latinNameShort = ''
		set @firstLatinNameShort = ''
		set @i = charindex(' ',@latinName)
		if (  @i > 1)
		begin
		    print @i
		    set @firstLatinNameShort = SUBSTRING(@latinName, 1, @i)
		    set @firstLatinNameShort = LTRIM(rtrim(@firstLatinNameShort))
		    print @firstLatinNameShort			
		end
		
		if('' <>  @firstLatinNameShort)
		begin
			update mhz set latinGenus = @firstLatinNameShort where id = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO

-------------------------------------------------------------------------------------------------------

use medixj
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @latinNameShort1 varchar(255)
Declare @firstLatinNameShort varchar(255)
Declare @secondLatinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.id, a.latinNameFull from plantxj a where a.latinNameFull is not null 
	order by a.id
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort1 = ''
		set @latinNameShort = ''
		set @firstLatinNameShort = ''
		set @i = charindex(' ',@latinName)
		if (  @i > 1)
		begin
		    print @i
		    set @firstLatinNameShort = SUBSTRING(@latinName, 1, @i)
		    set @firstLatinNameShort = LTRIM(rtrim(@firstLatinNameShort))
		    print @firstLatinNameShort			
		end
		
		if('' <>  @firstLatinNameShort)
		begin
			update plantxj set latinGenus = @firstLatinNameShort where id = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO

----------------------------------------------------------------------------------------------------------

use medi
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.id, a.latinGenusFull from plantBJ a where a.latinGenusFull is not null 
	order by a.id
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort = ''
		set @i = charindex(' ',@latinName)-1
		if (  @i > 1)
		begin
		    print @i
			set @latinNameShort = SUBSTRING(@latinName, 1, @i)
			print @latinNameShort
		end
		
		if('' <>  @latinNameShort)
		begin
			print @latinNameShort
			update plantBJ set latinGenusFull = @latinNameShort where id = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO

-------------------------------------------------------------------------------------------------------------------------

use medi
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @latinNameShort1 varchar(255)
Declare @firstLatinNameShort varchar(255)
Declare @secondLatinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.id, a.latinNameFull from plantbj a where a.latinNameFull is not null 
	order by a.id
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort1 = ''
		set @latinNameShort = ''
		set @firstLatinNameShort = ''
		set @i = charindex(' ',@latinName)
		if (  @i > 1)
		begin
		    print @i
		    set @firstLatinNameShort = SUBSTRING(@latinName, 1, @i-1)
		    print @firstLatinNameShort
			set @latinNameShort1 = SUBSTRING(@latinName, @i, LEN(@latinName) - @i)
			set @latinNameShort1 = LTRIM(rtrim(@latinNameShort1))
			print @latinNameShort1
		end
		
		
		set @latinNameShort = ''
		set @i = charindex(' ',@latinNameShort1)-1
		if (  @i > 1)
		begin
		    print @i
			set @latinNameShort = SUBSTRING(@latinNameShort1, 1, @i)
			print @latinNameShort
		end
		
		
		
		if('' <>  @latinNameShort)
		begin
		
		    set @latinNameShort = @firstLatinNameShort + ' ' + @latinNameShort
			print @latinNameShort
			update plantbj set latinName = @latinNameShort where id = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO

-------------------------------------------------------------------------------------------------------------------------

use speciesRichnessXinJiang
Declare @id int
Declare @latinName varchar(255)
Declare @latinNameShort varchar(255)
Declare @latinNameShort1 varchar(255)
Declare @firstLatinNameShort varchar(255)
Declare @secondLatinNameShort varchar(255)
Declare @PlantCount int 
Declare @remainder int
Declare @MiddleCount int
Declare @i int

Declare @minCount int
Declare @maxCount int 


Declare mpam_list cursor  for
	select a.autoid, a.latinNameOriFull from speciesNR a where a.latinNameOriFull is not null and a.latinNameOri is null
	order by a.autoid
open mpam_list

print 'begin'

fetch next from mpam_list into @id, @latinName 
print @latinName
Begin
   while (@@FETCH_STATUS = 0)
   begin
		set @latinNameShort1 = ''
		set @latinNameShort = ''
		set @firstLatinNameShort = ''
		set @i = charindex(' ',@latinName)
		if (  @i > 1)
		begin
		    print @i
		    set @firstLatinNameShort = SUBSTRING(@latinName, 1, @i-1)
		    print @firstLatinNameShort
			set @latinNameShort1 = SUBSTRING(@latinName, @i, LEN(@latinName) - @i)
			set @latinNameShort1 = LTRIM(rtrim(@latinNameShort1))
			print @latinNameShort1
		end
		
		
		set @latinNameShort = ''
		set @i = charindex(' ',@latinNameShort1)-1
		if (@i > 1)
		begin
		    print @i
			set @latinNameShort = SUBSTRING(@latinNameShort1, 1, @i)
			print @latinNameShort
		end
		
		
		
		if('' <>  @latinNameShort)
		begin
		
		    set @latinNameShort = @firstLatinNameShort + ' ' + @latinNameShort
			print @latinNameShort
			update speciesNR set latinNameOri = @latinNameShort where autoid = @id
		end
		fetch next from mpam_list into @id, @latinName 
	end
end

close mpam_list
DEALLOCATE mpam_list

GO

---------