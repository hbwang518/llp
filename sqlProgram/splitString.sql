eclare @auto_id2 int
Declare @latiinName nvarchar(255)
Declare @@countyNameAll nvarchar(8000)
Declare @@countyName nvarchar(255)

Declare tempTable cursor  for
	select id,latinName,county from distribution 
open tempTable

fetch next from tempTable into @latiinName,@countyNameAll

Begin
   while (@@FETCH_STATUS = 0)
	Begin
	    
	   if @genus is null 
		begin
			fetch next from tempTable into @auto_id1,@family1,@familyLatin1,@genus1,@genusLatin1,@species1,@speciesLatin1
			
			--update plantBase set family=@family,familyLatin=@familyLatin where auto_id=@auto_id1
	
		   	while (@@FETCH_STATUS = 0)
				Begin
					fetch next from tempTable into @auto_id2,@family2,@familyLatin2,@genus2,@genusLatin2,@species2,@speciesLatin2
					if @genus2 is not null
						begin
							set @auto_id1      = @auto_id2
							set @family1       = @family2
							set @familyLatin1  = @familyLatin2
							set @genus1        = @genus2
							set @genusLatin1   = @genusLatin2
							set @species1      = @species2
							set @speciesLatin1 = @speciesLatin2
							continue
						end
					if @family2 is not null 
						begin
							set @auto_id      = @auto_id2
							set @family       = @family2
							set @familyLatin  = @familyLatin2
							set @genus        = @genus2
							set @genusLatin   = @genusLatin2
							set @species      = @species2
							set @speciesLatin = @speciesLatin2
							break
						end
					else 
						begin
							update plantBase set family=@family,familyLatin=@familyLatin,genus=@genus1,genusLatin=@genusLatin1 where auto_id=@auto_id2
						
						end 	
					
				end
		end

	  
	end
end

close tempTable

DEALLOCATE tempTable

GO