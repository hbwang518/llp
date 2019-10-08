--select distinct(distribution) from TemplinxinburuArea where distribution not in (select distinct(area) from areaToCounty union select distinct(county) from areaToCounty)
--select * from TemplinxinburuArea where distribution = 'ÍĞ¿ËÑ·Û·ÉÆ'
--update TemplinxinburuArea a set a.distribution=(select tihuan from replaceArea where yuan=a.distribution) where a.distribution not in (select distinct(area) from areaToCounty union select distinct(county) from areaToCounty)
--select top 100 * from plantBase where auto_id > 4300 family is  null and species is not null
--update plantbase set genus = 'Êé´øŞ§Êô'
--select * into plantBase from plantBaseBackup where auto_id <104
--select * from plantBase order by auto_id
--delete plantBase where auto_id=103
select * into plantBaseBackupAll from plantBase
Declare @auto_id int
Declare @family nvarchar(255)
Declare @familyLatin nvarchar(255)
Declare @genus nvarchar(255)
Declare @genusLatin nvarchar(255)
Declare @species nvarchar(255)
Declare @speciesLatin nvarchar(255)

Declare @auto_id1 int
Declare @family1 nvarchar(255)
Declare @familyLatin1 nvarchar(255)
Declare @genus1 nvarchar(255)
Declare @genusLatin1 nvarchar(255)
Declare @species1 nvarchar(255)
Declare @speciesLatin1 nvarchar(255)

Declare @auto_id2 int
Declare @family2 nvarchar(255)
Declare @familyLatin2 nvarchar(255)
Declare @genus2 nvarchar(255)
Declare @genusLatin2 nvarchar(255)
Declare @species2 nvarchar(255)
Declare @speciesLatin2 nvarchar(255)

Declare tempTable cursor  for
	select auto_id,family,familyLatin,genus,genusLatin,species,speciesLatin from plantBase 
open tempTable

fetch next from tempTable into @auto_id,@family,@familyLatin,@genus,@genusLatin,@species,@speciesLatin


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