select * from plantXJ where lowAltitude = -10050 and (culandwildflag=1 or culandwildflag=3) order by id

select * from m_plant where lowAltitude = -10050 and culandwildflag=1

select * from plantXJ where mediId is not null and culAndWildFlag=1



select * from plantxj where typecode=2
select * from plantxj where culandwildflag=3
--can not be processed because not with id --select * from plantxj where culandwildflag=3 and cnName not in (select cnName from mpam)
select distinct(culandwildflag) from plantxj
select * from allType
select * from mpam
select * from mfamily
select count(distinct(p.cnFamily)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 2 or typeCode=4) and p.culAndWildFlag=1 and p.id < 7000
select count(distinct(m.latinName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 2 or typeCode=4) and p.culAndWildFlag=1 and p.id < 7000
select count(distinct(m.familyid)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 2 or typeCode=4) and p.culAndWildFlag=1 and p.id < 7000


---with only same cnName but not latinName---
select mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName
select count(distinct(cnFamily)) from plantXJ where cnName in (select cnName from mpam)
select count(distinct(cnGenus)) from plantXJ where cnName in (select cnName from mpam)
select cnName, cnGenus, cnFamily from plantXJ where cnName in (select cnName from mpam)
select count(distinct(p.cnFamily)) from plantXJ p, mpam m where p.cnName = m.cnName and p.id < 7000
select count(distinct(m.latinName)) from plantXJ p, mpam m where p.cnName = m.cnName and p.id < 7000


---to select and edit some specific species in the main table--- 
select * from plantxj where latinName like '%Heteropapus%'
select * from plantxj where cnName like '%狗哇花%'
select * from animalXJ
select * from mpam where latinName like '%Allium%'
select * from mpam where cnName like '%冬虫夏草%'
select * from GBRL where cnName like '%等叶花葶乌头%'

----with only same cnName,but not latin Name---
##woody and herbal, in total##
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p, mpam m where p.cnName = m.cnName and p.id < 7000
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 2 or typeCode=4)  and p.id < 7000
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 1 or typeCode=3)  and p.id < 7000
##woody and herbal, cult and wild##
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 2 or typeCode=4) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.id < 7000
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 1 or typeCode=3) and p.culAndWildFlag=2 and p.id < 7000
##woody and herbal, endemic##
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 2 or typeCode=4) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.endemismFlag =1 and p.id < 7000
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 1 or typeCode=3) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.endemismFlag =1 and p.id < 7000

select * from plantXJ p where cnName in (select cnName from mpam) and (typecode = 2 or typeCode=4) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.endemismFlag =1 and p.id < 7000
select * from plantXJ p where cnName in (select cnName from mpam) and (typecode = 1 or typeCode=3) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.endemismFlag =1 and p.id < 7000

select * from plantXJ p where latinName in (select latinName from mpam)
select * from plantXJ p where cnName in (select cnName from mpam) 

----with not only cnName but also latinName----
----plant----same cnName but different latinName---
select p.cnName,p.latinName, m.latinName, m.cnName from plantXJ p, mpam m where p.cnName = m.cnName
and p.id not in(select p.id from plantXJ p, mpam m where p.latinName = m.latinName)
----plant----same latinName but different cnName---
select p.cnName,m.cnName, p.latinName, m.latinName from plantXJ p, mpam m where p.latinName = m.latinName
and p.id not in(select p.id from plantXJ p, mpam m where p.cnName = m.cnName)

----UG plant----same cnName but different latinName---
select p.cnName,p.latinName, m.latinName, m.cnName from plantXJ p, mug m where p.cnName = m.cnName
and p.id not in(select p.id from plantXJ p, mug m where p.latinName = m.latinName)
----UG plant----same latinName but different cnName---
select p.cnName,m.cnName, p.latinName, m.latinName from plantXJ p, mug m where p.latinName = m.latinName
and p.id not in(select p.id from plantXJ p, mug m where p.cnName = m.cnName)

----HZ plant----same cnName but different latinName---
select p.cnName,p.latinName, m.latinName, m.cnName from plantXJ p, mhz m where p.cnName = m.cnName
and p.id not in(select p.id from plantXJ p, mhz m where p.latinName = m.latinName)
----HZ plant----same latinName but different cnName---
select p.cnName,m.cnName, p.latinName, m.latinName from plantXJ p, mhz m where p.latinName = m.latinName
and p.id not in(select p.id from plantXJ p, mhz m where p.cnName = m.cnName)

-----animal-----
----animal----same cnName but different latinName---
select p.cnName,p.latinName, m.latinName, m.cnName  from animalXJ p, mpam m where p.cnName = m.cnName
and p.id not in(select p.id from animalXJ p, mpam m where p.latinName = m.latinName)
----animal----same latinName but different cnName---
select p.cnName, m.cnName, p.latinName, m.latinName from animalXJ p, mpam m where p.latinName = m.latinName
and p.id not in(select p.id from animalXJ p, mpam m where p.cnName = m.cnName)

----UG animal----same cnName but different latinName---
select p.cnName,p.latinName, m.latinName, m.cnName  from animalXJ p, mug m where p.cnName = m.cnName
and p.id not in(select p.id from animalXJ p, mug m where p.latinName = m.latinName)
----UG animal----same latinName but different cnName---
select p.cnName, m.cnName, p.latinName, m.latinName from animalXJ p, mug m where p.latinName = m.latinName
and p.id not in(select p.id from animalXJ p, mug m where p.cnName = m.cnName)

----HZ animal----same cnName but different latinName---
select p.cnName,p.latinName, m.latinName, m.cnName  from animalXJ p, mhz m where p.cnName = m.cnName
and p.id not in(select p.id from animalXJ p, mhz m where p.latinName = m.latinName)
----HZ animal----same latinName but different cnName---
select p.cnName, m.cnName, p.latinName, m.latinName from animalXJ p, mhz m where p.latinName = m.latinName
and p.id not in(select p.id from animalXJ p, mhz m where p.cnName = m.cnName)


----to update main plant and animal tables to set new columns to mark the characters----
--update plantXJ set mediid=mpam.id from plantXJ , mpam where (plantxj.cnName=mpam.cnName or plantxj.latinName=mpam.latinName)
--update animalXJ set mediid=mpam.id from animalXJ , mpam where (animalXJ.cnName=mpam.cnName or animalXJ.latinName=mpam.latinName)
--update plantXJ set hzid=mhz.id from plantXJ , mhz where (plantxj.cnName=mhz.cnName or plantxj.latinName=mhz.latinName)
--update animalXJ set hzid=mhz.id from animalXJ , mhz where (animalXJ.cnName=mhz.cnName or animalXJ.latinName=mhz.latinName)
--update plantXJ set ugid=mug.id from plantXJ , mug where (plantxj.cnName=mug.cnName or plantxj.latinName=mug.latinName)
--update animalXJ set ugid=mug.id from animalXJ , mug where (animalXJ.cnName=mug.cnName or animalXJ.latinName=mug.latinName)

----
select plantXJ.* from plantXJ, mpam where (plantxj.cnName=mpam.cnName or plantxj.latinName=mpam.latinName)

select animalXJ.* from animalXJ, mpam where (animalXJ.cnName=mpam.cnName or animalXJ.latinName=mpam.latinName)

select plantXJ.* from plantXJ, mhz where (plantxj.cnName=mhz.cnName or plantxj.latinName=mhz.latinName)

select animalXJ.* from animalXJ, mhz where (animalXJ.cnName=mhz.cnName or animalXJ.latinName=mhz.latinName)

select plantXJ.* from plantXJ, mug where (plantxj.cnName=mug.cnName or plantxj.latinName=mug.latinName)

select  animalXJ.* from animalXJ, mug where (animalXJ.cnName=mug.cnName or animalXJ.latinName=mug.latinName)

select * from plantxj where mediId is not null
select * from plantxj where UGId is not null
select * from plantxj where HZId is not null


------
select * from mediUGOri order by id
select * from mediUGOri where cnName in (select cnName from mpam) order by id
select * from mediUGOri where cnName not in (select cnName from mpam) order by id
select * from mediUGOri where id not in (select id from mediUGOri where cnName in (select cnName from mpam)) order by id

select distinct(cnName) from mediUGOri where cnName in (select cnName from plantXJ) order by cnName
select * from plantXJ where cnName in (select cnName from mediUGOri) order by cnName

select * from mediUGOri where cnName in (select cnName from animalXJ) order by id
select * from animalXJ where cnName in (select cnName from mediUGOri) order by id

select * from mMedi


select top 100 * from PlantCountyAltitudeValidResult
select count (plant_id) from PlantCountyAltitudeValidResult


---select code, cnName, latinName into mclass from MediChinaOri where len(code) < 3
---select m.code, m.cnName, m.latinName,c.id classid into mfamily from MediChinaOri m, mclass c where SUBSTRING(m.code, 1, 2) = c.code and len(m.code) < 6 and len(m.code) > 3 
  
select code, cnName, latinName, SUBSTRING(code, 1, 2)  from MediChinaOri m where len(m.code) < 6 and len(m.code) > 3 

--select m.code, m.cnName, m.latinName, c.id familyid into mpam from MediChinaOri m, mfamily c where SUBSTRING(m.code, 1, 5) = c.code and len(m.code) =8
--select m.code, m.cnName, m.latinName,c.id familyid into mpam from MediChinaOri m, mclass c where SUBSTRING(m.code, 1, 2) = c.code and len(m.code) < 9 and len(m.code) > 5
     
--select m.code, m.mediName, c.id pamid into mMedi from MediChinaOri m, mpam c where SUBSTRING(m.code, 1, 8) = c.code and len(m.code) =10
--select m.code, m.cnName, m.latinName, c.id familyid into mpam from MediChinaOri m, mfamily c where SUBSTRING(m.code, 1, 5) = c.code and len(m.code) =8

###confirm all the code in the new table###  
--select * from MediChinaOri m where len(m.code) =8 and m.code not in (select code from mpam)
--select * from MediChinaOri m where len(m.code) =5 and m.code not in (select code from mfamily)
--select * from MediChinaOri where code not in (select code from mpam) and len(code) =8

select m.code, m.cnName, m.latinName, 5 from MediChinaOri m where len(m.code) =5 and SUBSTRING(m.code, 1, 2) = '1E'
--insert into mfamily (code, cnName, latinName, classid ) select m.code, m.cnName, m.latinName, 5 from MediChinaOri m where len(m.code)=5 and SUBSTRING(m.code, 1, 2) = '1E'
--insert into mfamily (code, cnName, latinName, classid )values ('3B901', '化石科', null, 7)
--insert into mfamily (code, cnName, latinName, classid )values ('3C901', '其他矿物科', null, 8)

## plantXJ = [speciesRichnessXinJiang].[dbo].[M_Plant]) ##
--select * into plantXJ from [speciesRichnessXinJiang].[dbo].[M_Plant]
--select * into animalXJ from [speciesRichnessXinJiang].[dbo].[M_Animal] 
 
select * from mpam where cnName in (select cnName from plantXJ)
select * from mpam where cnName in (select cnName from animalXJ)
  
--ALTER TABLE mpam add latinNameShort VARCHAR(100) NULL
--ALTER TABLE mpam add latinNameExtra VARCHAR(100) NULL

--update mpam set latinNameshort = ltrim(rtrim(latinNameshort))
--update mpam set latinName = ltrim(rtrim(latinName))
--update mpam set latinName = null where '' = ltrim(rtrim(latinName))
--update mpam set latinhNamesort = null where '' = ltrim(rtrim(latinNameshort))
--update mpam set cnName=LTRIM(RTRIM(cnName))
--update gbrl set cnName=LTRIM(RTRIM(cnName))

##to make
select m.* from mpam m, gbrl g where m.code = g.code and m.cnName=g.cnName 
select m.* from mpam m, gbrl g where m.code = g.code 
select m.* from mpam m, gbrl g where m.cnName = g.cnName 
select m.code, m.cnName, g.code, g.cnName from mpam m, gbrl g where m.code = g.code and m.cnName<>g.cnName 

--update mpam set latinNameShort=null
--update mpam set latinNameShort=g.latinNameShort from mpam, gbrl g where mpam.cnName=g.cnName

select * from mpam where latinNameShort is null and code like '1%' order by id
select * from mpam where charindex(latinNameshort,latinName) < 1
select * from mpam where (code like '1E%' or code like '1F%' or code like '1G%')and latinNameShort is null 
绵毛酸模叶蓼

select plantXJ.* from plantXJ, gbrl where charindex(gbrl.latinNameShort, plantXJ.latinName) > 0 
select * from plantXJ p, mpam m where p.cnName=m.cnName and (p.culAndWildFlag = 1 or p.culAndWildFlag =3) order by p.id
select * from plantXJ p, mpam m where p.cnName=m.cnName and p.culAndWildFlag = 2 order by p.id
select * from plantXJ p where p.cnName not in (select p.cnName from plantXJ p, mpam m where p.cnName=m.cnName) order by p.id
select * from animalXJ p, mpam m where p.cnName=m.cnName order by p.id
select * from animalXJ p where p.cnName not in (select p.cnName from animalXJ p, mpam m where p.cnName=m.cnName) order by p.id 

select * from plantXJ
select * from plantXJ where culAndWildFlag =3 and cnName in (select cnName from mMedi)
select * from mMedi
---------------------------------------
select * from mediUGOri
  select * from mpam where latinName is not null and '' <> ltrim(rtrim(latinName)) and charindex(' ',latinName) > 0
  
  select charindex(' ','abc de') 
  
  update mpam set latinNameshort = latinName
  
  update mpam set latinNameshort = SUBSTRING(latinNameshort, 1, charindex(' ',latinNameshort) -1) + '__' +  SUBSTRING(latinNameshort, charindex(' ',latinNameshort), len(latinNameshort) - charindex(' ',latinNameshort) -1)
  
select latinNameshort, SUBSTRING(latinNameshort, 1, charindex(' ',latinNameshort) -1) + '__' +  SUBSTRING(latinNameshort, charindex(' ',latinNameshort), len(latinNameshort) - charindex(' ',latinNameshort) -1)

from mpam where latinNameshort is not null and  charindex(' ',latinNameshort) > 0
  
select latinNameshort, SUBSTRING(latinNameshort, 1, charindex(' ',latinNameshort) -1) + '__' + SUBSTRING(latinNameshort, charindex(' ',latinNameshort)+1, LEN(latinNameshort) - charindex(' ',latinNameshort))

from mpam where latinNameshort is not null and  charindex(' ',latinNameshort) > 0

select latinNameshort, substring(latinNameshort, charindex(' ',latinNameshort)+1,LEN(latinNameshort) - charindex(' ',latinNameshort)) aa
from mpam where latinNameshort is not null and  charindex(' ',latinNameshort) > 0
order by aa

update mpam set latinNameshort= substring(latinNameshort, charindex(' ',latinNameshort)+1,LEN(latinNameshort) - charindex(' ',latinNameshort))
where latinNameshort is not null and  charindex(' ',latinNameshort) > 0

select * from mpam where charindex(' ',latinNameshort) > 0

select * from mpam where latinName like '%var.%' and cnName in (select cnName from plantxj)

--update mpam set latinNameShort = latinName
update mpam set latinNameshort= SUBSTRING(latinNameshort, 1, charindex(' ',latinNameshort) -1) + '__' + substring(latinNameshort, charindex(' ',latinNameshort)+1,LEN(latinNameshort) - charindex(' ',latinNameshort))
where latinNameshort is not null and  charindex(' ',latinNameshort) > 0

select * from mpam where latinName like '% var.%' or latinNameShort like '% F.%' or latinNameShort like '% subsp.%'

--update mpam set latinGenus = latinNameShort

select * from plantXJ where latinName is null and latinName is not null

update plantXJ set latinName = latinName where latinName is null and latinName is not null

select * from animalxj

select * from animalxj where latinName is null and latinName is not null

update animalxj set latinNameShort = latinName where latinNameShort is null and latinName is not null

select * from mpam where latinNameFull like '%var.%' 
select g.latinName, m.latinName, m.latinNameFull from gbrl g, mpam m where g.cnName = m.cnName and m.latinNameFull like '%var.%' 

--update mpam set latinNameGBRL = gbrl.latinName from GBRL, mpam where gbrl.cnName= mpam.cnName 

select * from mpam where latinName = latinNameGBRL

select * from mpam where latinName <> latinNameGBRL and latinNameGBRL is not null

select * from mpam where latinNameGBRL is null order by code


--update mpam set latinName = LatinNameGBRL
--WHERE     (LatinNameGBRL IS NOT NULL) AND (latinName <> LatinNameGBRL) AND (LatinNameGBRL LIKE '%subsp.%')

select * from mediUGOri
select * from mhz
select COUNT(cnName) cnCount, mediName from mhz group by mediName order by cnCount desc

select * from mhz where mediName='枸杞' or mediName='薤白' or mediName='越橘'

--update mhz set latinName = latinNameFull where latinName is null and latinNameFull is not null

select * from mpam where latinGenus = 'aporusa'

select * from animalxj

select id , mediName into mMediUG  from mediugori order by id

select cnName, latinName into mug from mediUGOri 

select  autoid, id, mediName from mMediUG
select * from mMediUG a,
(
select id, MIN(autoid) minAutoid from mMediUg group by id
) b where a.Id=b.Id and a.autoid <> b.minAutoid

delete mMediUG where autoid in (select a.autoid from mMediUG a,
(
select id, MIN(autoid) minAutoid from mMediUg group by id
) b where a.Id=b.Id and a.autoid <> b.minAutoid)

select * from mMediUG order by id

select * from mMediug

select cnName from mug group by cnName having COUNT(cnName) > 1

select * from mug where cnName in (select cnName from mug group by cnName having COUNT(cnName) > 1)

--delete mug where id in (select a.id from mug a,
(
select cnName, MIN(id) minid from mug group by cnName
) b where a.cnName=b.cnName and a.id <> b.minid)


select cnName, MIN(id) minid from mug group by cnName

select top 10 * from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult

--update mug set latinGenus = latinName where latinGenus is null and latinName is not null

select * from mpam

--update mug set speciesFlag='p' from mug, mpam where (mug.cnName=mpam.cnName or mug.latinName=mpam.latinName) and (mpam.code like '1G%' or mpam.code like '1F%' or mpam.code like '1E%')

select mpam.* from mug, mpam where (mug.cnName=mpam.cnName or mug.latinName=mpam.latinName) and (mpam.code like '1G%' or mpam.code like '1F%' or mpam.code like '1E%')

--update mhz set latinGenus = latinName where latinGenus is null and latinName is not null

--update mhz set speciesFlag='p' from mhz, mpam where (mhz.cnName=mpam.cnName or mhz.latinName=mpam.latinName) and (mpam.code like '1G%' or mpam.code like '1F%' or mpam.code like '1E%')
select mpam.* from mhz, mpam where (mhz.cnName=mpam.cnName or mhz.latinName=mpam.latinName) and (mpam.code like '1G%' or mpam.code like '1F%' or mpam.code like '1E%')

select mhz.* from mhz, mpam where (mhz.cnName=mpam.cnName or mhz.latinName=mpam.latinName) and (mpam.code like '2L%')

select * from mpam

select * from mug

select mpam.* from mug, mpam where (mug.cnName=mpam.cnName or mug.latinName=mpam.latinName) and (mpam.code like '1E%' or mpam.code like '1f%' or mpam.code like '1g%')

--update mpam set ugid=mug.id from mug, mpam where (mug.cnName=mpam.cnName or mug.latinName=mpam.latinName)

select mpam.* from mhz, mpam where (mhz.cnName=mpam.cnName or mhz.latinName=mpam.latinName) and (mpam.code like '1E%' or mpam.code like '1f%' or mpam.code like '1g%')

--update mpam set hzid=mhz.id from mhz, mpam where (mhz.cnName=mpam.cnName or mhz.latinName=mpam.latinName)

select * from plantxj



########count species for table
####GB, HG, and HZ####
#GB#
select * from mpam
select count(distinct(mpam.FamilyId)), count(distinct(mpam.latinName)),COUNT(distinct(mpam.latingenus)) from mpam where (mpam.code like '1E%' or mpam.code like '1f%' or mpam.code like '1g%')
select count(distinct(mpam.FamilyId)), count(distinct(mpam.latinName)),COUNT(distinct(mpam.latingenus)) from mpam where mpam.code like '1E%'
select count(distinct(mpam.FamilyId)), count(distinct(mpam.latinName)),COUNT(distinct(mpam.latingenus)) from mpam where mpam.code like '1f%'
select count(distinct(mpam.FamilyId)), count(distinct(mpam.latinName)),COUNT(distinct(mpam.latingenus)) from mpam where mpam.code like '1g%'

#HG#
select * from mug
select count(distinct(m.latinFamily)),COUNT(distinct(m.latingenus)), count(distinct(m.latinName)) from mug m where m.speciesFlag='p'
select count(distinct(m.latinFamily)), count(distinct(m.latinName)) from mug m where m.speciesFlag='m'
select count(distinct(m.latinFamily)), count(distinct(m.latinName)) from mug m where m.speciesFlag='b'
select count(distinct(m.latinName)) from mug m where m.speciesFlag='o'

--update mug a set a.latinfamily = b.latinfamily from mpam b where a.latinGenus = b.latinGenus and a.latinFamily is null
select * from mpam where latinName like '%Rhus%'
select * from mpam where latinName like '%Commiph%'
select * from mpam where latinName like '%Centaurea%'
select * from mpam where latinName like '%Dryopteris%'
select * from mpam where latinName like '%Usnea%'
select * from mpam where latinName like '%Ocimum%'
select * from mpam where latinName like '%Cynips%'
select * from mpam where latinName like '%Aquilaria%'
select * from mpam where latinName like '%Dryopteris%'
select * from mpam where latinName like '%Zostera%'
select * from mug where speciesFlag = 'b'
select * from mug where speciesFlag = 'm'


#HZ#
select * from mhz
select count(distinct(m.latinFamily)),COUNT(distinct(m.latingenus)), count(distinct(m.latinName)) from mhz m where m.speciesFlag='p'
select count(distinct(m.latinFamily)), count(distinct(m.latinName)) from mhz m where m.speciesFlag='m'
select count(distinct(m.latinFamily)), count(distinct(m.latinName)) from mhz m where m.speciesFlag='b'
select count(distinct(m.latinName)) from mug m where m.speciesFlag='o'

--update mhz a set a.latinfamily = b.latinfamily from mpam b where a.latinGenus = b.latinGenus and a.latinFamily is null
select * from mpam where latinName like '%Parmelia%'
select * from mpam where latinName like '%Zygophyllum%'
select * from mpam where latinName like '%Orobanche%'
select * from mpam where latinName like '%Gypsophila%'
select * from mpam where latinName like '%Aspongonpus%'
select * from mpam where latinName like '%Filipendula%'
select * from mpam where latinName like '%Stychnos%'
select * from mhz where speciesFlag = 'b'
select * from mhz where speciesFlag = 'm'


####distributed in Xinjiang####
#GB#
----update mhz, and also mug set species flag = p when it is higher plant, flag = m where it is mammal, flag=b when it is bird, and set flag = o when it is other sources. with m,b and o manually.
select a.id, a.cnName, a.latinName, a.speciesFlag, b.cnName, b.latinName from mug a, mpam b where (b.cnName=a.cnName or b.latinName=a.latinName) order by a.cnName
select a.id, a.cnName, a.latinName, a.speciesFlag, b.cnName, b.latinName from mhz a, mpam b where (b.cnName=a.cnName or b.latinName=a.latinName) order by a.cnName
select * from plantXJ
select * from plantXJ p where (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.mediId is not null order by p.id
select * from plantXJ p where p.culAndWildFlag=2 and p.mediId is not null order by p.id

##GB, wild and cultivated##
select * from mpam
select p.* from plantXJ p, mpam m where (m.cnName = p.cnName or m.latinName = p.latinName) order by p.id
select * from plantXJ where mediId is not null
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.typecode=2 or p.typeCode=4)
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.typecode=1 or p.typeCode=3)
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.culAndWildFlag=1 or p.culAndWildFlag=3)
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and (p.typecode = 2 or p.typeCode=4)
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and (p.typecode=1 or p.typeCode=3)

select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.culAndWildFlag=2)
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.culAndWildFlag=2) and (p.typecode = 2 or p.typeCode=4)
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.culAndWildFlag=2) and (p.typecode=1 or p.typeCode=3)

##GB, wild, woody and herbal, endemism##
select * from plantXJ where typeCode is null
select distinct(typecode) from plantXJ
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and  (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.endemismFlag =1 
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.typecode = 2 or p.typeCode=4) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.endemismFlag =1 
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (typecode = 1 or typeCode=3) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.endemismFlag =1 

##GB, wild, woody and herbal, xjendangered##
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.xjendangeredFlag =1
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.typecode = 2 or p.typeCode=4) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.xjendangeredFlag =1
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.mediId is not null and (p.typecode = 1 or p.typeCode=3) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.xjendangeredFlag =1

select * from plantXJ p where p.mediId is not null and (typecode = 2 or typeCode=4) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.xjendangeredFlag =1
select * from plantXJ p where p.mediId is not null and (typecode = 1 or typeCode=3) and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.xjendangeredFlag =1
select * from plantXJ p where cnName in (select cnName from mpam) and p.xjendangeredFlag =1
select * from plantXJ p where cnName in (select cnName from mpam) and p.endemismFlag =1
###animal###
select * from animalXJ where endangeredFlag =1
select * from animalXJ p where cnName in (select cnName from mpam) and id<1000 
select * from animalXJ p where cnName in (select cnName from mpam) order by id
select * from animalXJ p where p.cnName not in (select cnName from mpam) and id<1000
select count(distinct(p.cnOrder)), count(distinct(p.cnFamily)), count(distinct(p.cnName)) from animalXJ p, mpam m where p.cnName = m.cnName and p.id < 1000
select count(distinct(p.cnOrder)), count(distinct(p.cnFamily)), count(distinct(p.cnName)) from animalXJ p, mpam m where p.cnName = m.cnName and p.id > 1000
##endangered##
select count(distinct(p.cnOrder)), count(distinct(p.cnFamily)), count(distinct(p.cnName)) from animalXJ p, mpam m where p.cnName = m.cnName and p.endangeredFlag =1 and p.id < 1000
select count(distinct(p.cnOrder)), count(distinct(p.cnFamily)), count(distinct(p.cnName)) from animalXJ p, mpam m where p.cnName = m.cnName and p.endangeredFlag =1 and p.id > 1000
select * from animalXJ p where cnName in (select cnName from mpam) and p.endangeredFlag =1 and p.id < 1000
select * from animalXJ p where cnName in (select cnName from mpam) and p.endangeredFlag =1 and p.id > 1000
----
select count(distinct(p.cnFamily)), count(distinct(m.latinName)) from plantXJ p, mpam m where p.cnName = m.cnName and (p.culAndWildFlag=1 or p.culAndWildFlag=3)
select count(distinct(p.cnFamily)) , count(distinct(m.latinName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 2 or typeCode=4) and (p.culAndWildFlag=1 or p.culAndWildFlag=3)
select count(distinct(p.cnFamily)), count(distinct(m.latinName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 1 or typeCode=3) and (p.culAndWildFlag=1 or p.culAndWildFlag=3)
----
select count(distinct(p.cnFamily)), count(distinct(m.latinName)) from plantXJ p, mpam m where p.cnName = m.cnName and p.id < 7000 and (p.culAndWildFlag=1 or p.culAndWildFlag=3)
select count(distinct(p.cnFamily)) , count(distinct(m.latinName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 2 or typeCode=4) and (p.culAndWildFlag=1 or p.culAndWildFlag=3)
select count(distinct(p.cnFamily)), count(distinct(m.latinName)) from plantXJ p, mpam m where p.cnName = m.cnName and (typecode = 1 or typeCode=3) and (p.culAndWildFlag=1 or p.culAndWildFlag=3)


#UG and HZ,all#
select * from mpam where ugId is not null
select count(distinct(m.familyId)), count(distinct(m.latinGenus)), count(distinct(m.cnName)) from mpam m where m.ugId is not null and (m.code like '1E%' or m.code like '1f%' or m.code like '1g%')
select count(distinct(m.familyId)), count(distinct(m.latinGenus)), count(distinct(m.cnName)) from mpam m where m.hzId is not null and (m.code like '1E%' or m.code like '1f%' or m.code like '1g%')

select count(distinct(m.latinfamily)), count(distinct(m.latinGenus)), count(distinct(m.cnName)) from mug m where m.speciesFlag ='p'
select count(distinct(m.latinfamily)), count(distinct(m.latinGenus)), count(distinct(m.cnName)) from mhz m where m.speciesFlag ='p'


#UG and HZ,in Xinjiang#
select * from plantXJ where ugId is not null
select * from plantXJ where hzId is not null
#UG#
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.ugId is not null 
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.ugId is not null and (typecode = 2 or typeCode=4)
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.ugId is not null and (typecode = 1 or typeCode=3)
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.ugId is not null and (p.culAndWildFlag=1 or p.culAndWildFlag=3) 
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.ugId is not null and p.culAndWildFlag=2
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.ugId is not null and p.culAndWildFlag=2 and (typecode = 2 or typeCode=4) 
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.ugId is not null and p.culAndWildFlag=2 and (typecode = 1 or typeCode=3)
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.ugId is not null and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and (typecode = 2 or typeCode=4) 
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.ugId is not null and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and (typecode = 1 or typeCode=3) 
#HZ#
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.hzId is not null
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.hzId is not null and (typecode = 2 or typeCode=4)
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.hzId is not null and (typecode = 1 or typeCode=3)
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.hzId is not null and (p.culAndWildFlag=1 or p.culAndWildFlag=3) 
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.hzId is not null and p.culAndWildFlag=2
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.hzId is not null and p.culAndWildFlag=2 and (typecode = 2 or typeCode=4) 
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.hzId is not null and p.culAndWildFlag=2 and (typecode = 1 or typeCode=3)
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.hzId is not null and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and (typecode = 2 or typeCode=4) 
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.hzId is not null and (p.culAndWildFlag=1 or p.culAndWildFlag=3) and (typecode = 1 or typeCode=3) 


select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p where p.ugId is not null and p.hzId is not null
select p.* from plantXJ p where p.ugId is not null and p.hzId is not null


####medicinal plant in Xinjiang (GB), functional part####
##count and in grid~~~
select SUBSTRING(mm.code, LEN(mm.code)-1, 2), mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '11'
select SUBSTRING(mm.code, LEN(mm.code)-1, 2), mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '12'
select SUBSTRING(mm.code, LEN(mm.code)-1, 2), mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '13'
select SUBSTRING(mm.code, LEN(mm.code)-1, 2), mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '14'
select SUBSTRING(mm.code, LEN(mm.code)-1, 2), mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '15'
select SUBSTRING(mm.code, LEN(mm.code)-1, 2), mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '16'
select SUBSTRING(mm.code, LEN(mm.code)-1, 2), mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '17'
select SUBSTRING(mm.code, LEN(mm.code)-1, 2), mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '19'
select SUBSTRING(mm.code, LEN(mm.code)-1, 2), mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '29'

select * from plantXJ
select * from mpam
select * from mMedi

-----
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p, 
(
select  mp.cnName, mp.latinName from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '11'
) b where (p.cnName=b.cnName or p.latinName=b.latinName)

select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p, 
(
select  mp.cnName, mp.latinName from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '12'
) b where (p.cnName=b.cnName or p.latinName=b.latinName)

select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p, 
(
select  mp.cnName, mp.latinName from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '13'
) b where (p.cnName=b.cnName or p.latinName=b.latinName)

select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p, 
(
select  mp.cnName, mp.latinName from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '14'
) b where (p.cnName=b.cnName or p.latinName=b.latinName)

select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p, 
(
select  mp.cnName, mp.latinName from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '15'
) b where (p.cnName=b.cnName or p.latinName=b.latinName)

select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p, 
(
select  mp.cnName, mp.latinName from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '16'
) b where (p.cnName=b.cnName or p.latinName=b.latinName)

select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p, 
(
select  mp.cnName, mp.latinName from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '17'
) b where (p.cnName=b.cnName or p.latinName=b.latinName)

select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p, 
(
select  mp.cnName, mp.latinName from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '19'
) b where (p.cnName=b.cnName or p.latinName=b.latinName)

select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from plantXJ p, 
(
select  mp.cnName, mp.latinName from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '29'
) b where (p.cnName=b.cnName or p.latinName=b.latinName)

##fungi etc.##
--select SUBSTRING(mm.code, LEN(mm.code)-1, 2), mm.*, mp.* from mMedi mm, mpam mp, plantxj p where mm.pamid= mp.id and p.cnName=mp.cnName and SUBSTRING(mm.code, LEN(mm.code)-1, 2) = '18'

select * from plantXJ where mediId is not null and ugId is not null and hzId is not null
select * from plantXJ where (mediId is not null or ugId is not null or hzId is not null)
select * from plantXJ where mediId is null and (ugId is not null or hzId is not null)
select * from plantXJ where mediId is null and ugId is not null
select * from plantXJ where mediId is null and hzId is not null
select * from plantXJ where mediId is null and ugId is not null and hzId is null
select * from plantXJ where mediId is null and hzId is not null and ugId is null
select * from plantXJ where mediId is null and ugId is not null and hzId is not null


select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where (p.culAndWildFlag=1 or p.culAndWildFlag=3) and p.id <7000
select count(distinct(p.cnFamily)), count(distinct(p.cnGenus)), count(distinct(p.cnName)) from plantXJ p where p.culAndWildFlag=2 and p.id <7000

select * from mMediUG
select DISTINCT(ID) from mMediUG
select * from mug where (speciesFlag = 'm' or speciesFlag = 'b')
select * from mhz where (speciesFlag = 'm' or speciesFlag = 'b')

select * from mfamily
--update mfamily set latinName=LOWER(latinName)
--update mfamily set latinName=UPPER(LEFT(latinName,1))+SUBSTRING(latinName,2,LEN(latinName)) where latinName is not null
select * from mpam
--update mug set latinFamily=mfamily.latinName from mug, mpam, mfamily where (mug.latinGenus=mpam.latinGenus) and mpam.familyid=mfamily.id
--update mhz set latinFamily=mfamily.latinName from mhz, mpam, mfamily where (mhz.latinGenus=mpam.latinGenus ) and mpam.familyid=mfamily.id

select * from mug where latinFamily is null and speciesFlag='p';
select * from mhz where latinFamily is null and speciesFlag='p';

--update mug set latinFamily=plantxj.latinFamily from mug, plantxj where (mug.latinGenus=plantxj.latinGenus) and mug.latinFamily is null 
--update mhz set latinFamily=plantxj.latinFamily from mhz, plantxj where (mhz.latinGenus=plantxj.latinGenus ) and mhz.latinFamily is null


--can not be processed, see the difference with below. --select * from mug where latinGenus not in (select latinGenus from mpam) 
select * from mug where id not in (select mug.id from mug, mpam where mug.latinGenus=mpam.latinGenus) and speciesFlag='p'

select * from mhz where id not in (select mhz.id from mhz, mpam where mhz.latinGenus=mpam.latinGenus) and speciesFlag='p'

select * from mMedi
select * from plantXJ where endemismFlag is not null
select * from a0 order by id
select * from a3 order by id
select * from a4 order by id
SELECT * from mediXJ01 order by id
select * from mediXJ01Old order by id
select * from p0 order by id

########into grid######
##order: gb wild whole, gb herb, gb wooody, endemism, xjendangered, ug wild whole, ug herb, ug woody, hz wild whole, hz herb, hz woody##
select Id,count(distinct(plant_id)) gbSpecies,count(distinct(cnFamily)) gbFamily,count(distinct(cnGenus)) gbGenus into a0 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) gbhSpecies,count(distinct(cnFamily)) gbhFamily,count(distinct(cnGenus)) gbhGenus into a1 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.mediId is not null and (b.typeCode=2 or b.typeCode=4) and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) gbwSpecies,count(distinct(cnFamily)) gbwFamily,count(distinct(cnGenus)) gbwGenus into a2 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.mediId is not null and (b.typeCode=1 or b.typeCode=3) and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 

select Id,count(distinct(plant_id)) endemSpecies,count(distinct(cnFamily)) endemFamily,count(distinct(cnGenus)) endemGenus into a3 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and (b.mediId is not null or b.ugId is not null or b.hzId is not null) and b.endemismFlag=1 and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) xjendanSpecies,count(distinct(cnFamily)) xjendanFamily,count(distinct(cnGenus)) xjendanGenus into a4 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and (b.mediId is not null or b.ugId is not null or b.hzId is not null) and b.xjEndangeredFlag=1 and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 

select Id,count(distinct(plant_id)) ugSpecies,count(distinct(cnFamily)) ugFamily,count(distinct(cnGenus)) ugGenus into a5 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.ugId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) ughSpecies,count(distinct(cnFamily)) ughFamily,count(distinct(cnGenus)) ughGenus into a6 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.ugId is not null and (b.typeCode=2 or b.typeCode=4) and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) ugwSpecies,count(distinct(cnFamily)) ugwFamily,count(distinct(cnGenus)) ugwGenus into a7 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.ugId is not null and (b.typeCode=1 or b.typeCode=3) and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 

select Id,count(distinct(plant_id)) hzSpecies,count(distinct(cnFamily)) hzFamily,count(distinct(cnGenus)) hzGenus into a8 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.hzId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) hzhSpecies,count(distinct(cnFamily)) hzhFamily,count(distinct(cnGenus)) hzhGenus into a9 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.hzId is not null and (b.typeCode=2 or b.typeCode=4) and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) hzwSpecies,count(distinct(cnFamily)) hzwFamily,count(distinct(cnGenus)) hzwGenus into a10 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.hzId is not null and (b.typeCode=1 or b.typeCode=3) and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 

select Id,count(distinct(plant_id)) nonMediSpecies,count(distinct(cnFamily)) nonMediFamily,count(distinct(cnGenus)) nonMediGenus into a11 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and (b.mediId is null and b.ugId is null and b.hzId is null) and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) nonMedihSpecies,count(distinct(cnFamily)) nonMedihFamily,count(distinct(cnGenus)) nonMedihGenus into a12 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and (b.mediId is null and b.ugId is null and b.hzId is null) and (b.typeCode=2 or b.typeCode=4) and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) nonMediwSpecies,count(distinct(cnFamily)) nonMediwFamily,count(distinct(cnGenus)) nonMediwGenus into a13 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and (b.mediId is null and b.ugId is null and b.hzId is null) and (b.typeCode=1 or b.typeCode=3) and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 


select Id,count(distinct(plant_id)) Species11,count(distinct(cnFamily)) Family11,count(distinct(cnGenus)) Genus11 into b1 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b, mpam c, mMedi d where a.plant_id=b.id and b.mediId=c.id and d.pamid=c.id and SUBSTRING(d.code, LEN(d.code)-1, 2) = '11' and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) Species12,count(distinct(cnFamily)) Family12,count(distinct(cnGenus)) Genus12 into b2 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b, mpam c, mMedi d where a.plant_id=b.id and b.mediId=c.id and d.pamid=c.id and SUBSTRING(d.code, LEN(d.code)-1, 2) = '12' and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) Species13,count(distinct(cnFamily)) Family13,count(distinct(cnGenus)) Genus13 into b3 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b, mpam c, mMedi d where a.plant_id=b.id and b.mediId=c.id and d.pamid=c.id and SUBSTRING(d.code, LEN(d.code)-1, 2) = '13' and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) Species14,count(distinct(cnFamily)) Family14,count(distinct(cnGenus)) Genus14 into b4 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b, mpam c, mMedi d where a.plant_id=b.id and b.mediId=c.id and d.pamid=c.id and SUBSTRING(d.code, LEN(d.code)-1, 2) = '14' and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) Species15,count(distinct(cnFamily)) Family15,count(distinct(cnGenus)) Genus15 into b5 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b, mpam c, mMedi d where a.plant_id=b.id and b.mediId=c.id and d.pamid=c.id and SUBSTRING(d.code, LEN(d.code)-1, 2) = '15' and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) Species16,count(distinct(cnFamily)) Family16,count(distinct(cnGenus)) Genus16 into b6 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b, mpam c, mMedi d where a.plant_id=b.id and b.mediId=c.id and d.pamid=c.id and SUBSTRING(d.code, LEN(d.code)-1, 2) = '16' and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) Species17,count(distinct(cnFamily)) Family17,count(distinct(cnGenus)) Genus17 into b7 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b, mpam c, mMedi d where a.plant_id=b.id and b.mediId=c.id and d.pamid=c.id and SUBSTRING(d.code, LEN(d.code)-1, 2) = '17' and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) Species19,count(distinct(cnFamily)) Family19,count(distinct(cnGenus)) Genus19 into b8 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b, mpam c, mMedi d where a.plant_id=b.id and b.mediId=c.id and d.pamid=c.id and SUBSTRING(d.code, LEN(d.code)-1, 2) = '19' and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) Species29,count(distinct(cnFamily)) Family29,count(distinct(cnGenus)) Genus29 into b9 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b, mpam c, mMedi d where a.plant_id=b.id and b.mediId=c.id and d.pamid=c.id and SUBSTRING(d.code, LEN(d.code)-1, 2) = '29' and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 


select z.id as id, 
a0.gbSpecies,a0.gbGenus,a0.gbFamily,
a1.gbhSpecies,a1.gbhGenus,a1.gbhFamily,
a2.gbwSpecies,a2.gbwGenus,a2.gbwFamily,
a3.endemSpecies,a3.endemGenus,a3.endemFamily,
a4.xjendanspecies,a4.xjendangenus,a4.xjendanfamily,
a5.ugSpecies,a5.ugGenus,a5.ugFamily,
a6.ughSpecies,a6.ughGenus,a6.ughFamily,
a7.ugwSpecies,a7.ugwGenus,a7.ugwFamily,
a8.hzSpecies,a8.hzGenus,a8.hzFamily,
a9.hzhSpecies,a9.hzhGenus,a9.hzhFamily,
a10.hzwSpecies,a10.hzwGenus,a10.hzwFamily,
a11.nonMediSpecies,a11.nonMediGenus,a11.nonMediFamily,
a12.nonMedihSpecies,a12.nonMedihGenus,a12.nonMedihFamily,
a13.nonMediwSpecies,a13.nonMediwGenus,a13.nonMediwFamily,
b1.species11,b1.genus11,b1.family11,
b2.species12,b2.genus12,b2.family12,
b3.species13,b3.genus13,b3.family13,
b4.species14,b4.genus14,b4.family14,
b5.species15,b5.genus15,b5.family15,
b6.species16,b6.genus16,b6.family16,
b7.species17,b7.genus17,b7.family17,
b8.species19,b8.genus19,b8.family19,
b9.species29,b9.genus29,b9.family29

into mediXJ01 

from speciesRichnessXinJiang.dbo.m_Grid z	
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
left join a10  on z.id=a10.id
left join a11  on z.id=a11.id
left join a12  on z.id=a12.id
left join a13  on z.id=a13.id
left join b1  on z.id=b1.id
left join b2  on z.id=b2.id
left join b3  on z.id=b3.id
left join b4  on z.id=b4.id
left join b5  on z.id=b5.id
left join b6  on z.id=b6.id
left join b7  on z.id=b7.id
left join b8  on z.id=b8.id
left join b9  on z.id=b9.id
order by z.id

####nature XJ 01####
select * from NFCFXJ 
use medi
--update NFCFXJ set flavourLong = '，' + flavourOri + '，'
--update NFCFXJ set flavourLong = REPLACE ( flavourLong , '，微苦，' , '，苦，' );
--update NFCFXJ set flavourLong = REPLACE ( flavourLong , '，微辛，' , '，辛，' );
--update NFCFXJ set flavourLong = REPLACE ( flavourLong , '，微甘，' , '，甘，' );
--update NFCFXJ set flavourLong = REPLACE ( flavourLong , '，微涩，' , '，涩，' );
--update NFCFXJ set flavourLong = REPLACE ( flavourLong , '，微酸，' , '，酸，' );
--update NFCFXJ set flavourLong = REPLACE ( flavourLong , '，微咸，' , '，咸，' );
select * from NFCFXJ where CHARINDEX ( '，苦，', flavourLong) > 0

select CHARINDEX ( '，苦，', '，苦，')
select * from NFCFXJ where flavourLong like '%微%'

select distinct(natureLong) from nfcfxj 
select * from NFCFXJ where natureOri like '%辛%' or natureOri like '%苦%'
--update NFCFXJ set natureOri = REPLACE ( natureOri , '，有小毒' , '，小毒' )
--update NFCFXJ set natureOri = REPLACE ( natureOri , '，有大毒' , '，大毒' )
--update NFCFXJ set poison = '毒' where natureOri like '%，毒%'
--update NFCFXJ set poison = '小毒' where natureOri like '%，小毒%'
--update NFCFXJ set poison = '大毒' where natureOri like '%，大毒%'
select natureOri, poison from NFCFXJ where natureOri like '%毒%'
select natureOri, poison from NFCFXJ where natureOri like '%，小毒%'
select natureOri, poison from NFCFXJ where natureOri like '%，大毒%'
select * from NFCFXJ where natureOri like '%无毒%'

--update NFCFXJ set natureLong = '，' + natureOri + '，'
select distinct(natureLong) from nfcfxj 
--update NFCFXJ set natureLong = REPLACE ( natureLong , '，毒' , '' )
--update NFCFXJ set natureLong = REPLACE ( natureLong , '，小毒' , '' )
--update NFCFXJ set natureLong = REPLACE ( natureLong , '，大毒' , '' )
--update NFCFXJ set natureLong = REPLACE ( natureLong , '，微寒，' , '，寒，' );
--update NFCFXJ set natureLong = REPLACE ( natureLong , '，大寒，' , '，寒，' );
--update NFCFXJ set natureLong = REPLACE ( natureLong , '，微凉' , '，凉，' );
--update NFCFXJ set natureLong = REPLACE ( natureLong , '，微温，' , '，温，' );
--update NFCFXJ set natureLong = REPLACE ( natureLong , '，温热，' , '，温，' );
select * from NFCFXJ where natureLong like '%热%'
select * from NFCFXJ where natureLong like '%温%'

select * from funcxj
select * from NFCFXJ
select * from mediXJbook 
select distinct(channel) from NFCFXJ

select * from NFCFXJ where channelOri = '' or channelOri is null
--update NFCFXJ set channelOri=null where channelOri = '' or channelOri is null
--update NFCFXJ set channel = '，' + channelOri + '，'
select flavour, nature, channel from NFCFXJ 

select flavour, nature from NFCFXJ where flavour like '%，苦，%' and nature like '%，凉，%'




##########mediBJ############

--update plantbj set LatinName = LatinNameFull where LatinNameFull like '%var.%'
--update plantbj set LatinName = LatinNameFull where LatinNameFull like '% cv.%'
--update plantbj set LatinName = LatinNameFull where LatinNameFull like '% f.%'

--update plantBJ set mediId=mpam.id from plantBJ, mpam where (plantBJ.cnName=mpam.cnName or plantBJ.latinName=mpam.latinName)

select * from mpam
select * from mMedi
select * from plantBJ where mediId is not null and proteLevel is not null
select * from plantBJ where mediId is not null and endanStatus != '安全'
select * from plantBJ where mediId is not null and endanStatus = '极易消失'
select * from plantBJ where mediId is not null and endanStatus = '容易消失'
select * from plantBJ where mediId is not null and endanStatus = '可能消失'
select * from plantBJ where cnName like '%荆条%'
select * from plantBJ where cnName like '%车前%'
select * from plantBJ where cnName like '%蒲公英%'



select top 1000 * from distinctPlantCounty
select * from M_county 
select * from M_plant where cnName like '新疆芍药'
select * from M_county a, distinctPlantCounty b where a.CODE =b.county_code and b.plant_id=800


--to check the species of leaf usage in Tarim basin, id=25106, 25511, 16748, 17458 or 25784 etc.
select top 1000 * from Gridspecies01
select top 1000 * from PlantCountyAltitudeValidResult
select * from M_Plant
select a.plant_id, b.cnName from PlantCountyAltitudeValidResult a, M_Plant b, [medi].[dbo].[mMedi] c, [medi].[dbo].[mpam] d where a.Id=17458 and a.plant_id = b.id and b.cnName = d.cnName and c.pamid=d.id and c.code like '%15'
select a.plant_id, b.cnName, b.latinName from PlantCountyAltitudeValidResult a, M_Plant b, [medi].[dbo].[mMedi] c, [medi].[dbo].[mpam] d where a.Id=25784 and a.plant_id = b.id and b.cnName = d.cnName and c.pamid=d.id and c.code like '%15'

select * from mMedi
select * from mpam
select * from mclass 

select * from M_plant where lowAltitude = -10050 and culAndWildFlag <> 2
select * from mMedi
select * from mpam

select * from a0 order by id
 --select * into M_Plant0 from m_plant
 
 select * from m_plant

--update m_plant set latinName = namechange.latinName from m_plant, namechange where m_plant.id=nameChange.id
--update m_plant set latinGenus = namechange.latinGenus from m_plant, namechange where m_plant.id=nameChange.id
--update m_plant set latinNamefull = namechange.latinNamefull from m_plant, namechange where m_plant.id=nameChange.id
select * from m_plant where latinName is null

select * from mediXJbook

select m.latinNamefull, n.latinNamefull from m_plant m,  namechange n where m.id=n.id and m.latinNamefull <> n.latinNameFull

###To get distinct functions###
SELECT distinct(A) from
(
select mediFunc1 A from mediXJbook where mediFunc1 is not null union 
select mediFunc2 A from mediXJbook where mediFunc2 is not null union 
select mediFunc3 A from mediXJbook where mediFunc3 is not null union 
select mediFunc4 A from mediXJbook where mediFunc4 is not null union 
select mediFunc5 A from mediXJbook where mediFunc5 is not null union 
select mediFunc6 A from mediXJbook where mediFunc6 is not null 
) fun

select * from mediXJbook where id not in (
select p.id from mediXJbook p , m_plant m where p.cnName=m.cnName or p.latinName=m.latinName  
)

select m.latinName, m.cnName, p.latinName from m_plant m , medi.dbo.plantxj p where m.id=p.id  and m.latinName<>p.latinName
select m.latinName, m.cnName, p.latinName, p.cnName from m_plant m , medi.dbo.plantxj p where m.id=p.id  and m.cnName<>p.cnName
select m.latinName, m.cnName, p.latinName from m_plant m , medi.dbo.plantxj p where m.cnName=p.cnName and m.latinName<>p.latinName



--update plantXJ set latinName = ltrim(rtrim(latinName)) where latinName is not null
--update m_plant set latinName = ltrim(rtrim(latinName)) where latinName is not null
--update plantXJ set cnName = ltrim(rtrim(cnName)) where cnName is not null
--update m_plant set cnName = ltrim(rtrim(cnName)) where cnName is not null
--update plantXJ set latinName = speciesRichnessXinJiang.dbo.m_plant.latinName 
from plantXJ, speciesRichnessXinJiang.dbo.m_plant 
where speciesRichnessXinJiang.dbo.m_plant.cnName = plantXJ.cnName and 
speciesRichnessXinJiang.dbo.m_plant.latinName <> plantXJ.latinName

--update plantXJ set latinName = speciesRichnessXinJiang.dbo.m_plant.latinName 
from plantXJ, speciesRichnessXinJiang.dbo.m_plant 
where speciesRichnessXinJiang.dbo.m_plant.cnName = plantXJ.cnName and 
speciesRichnessXinJiang.dbo.m_plant.latinName <> plantXJ.latinName


select * from mediXJ01
select * from mhz
select * from plantXJ
select * from animalXJ
select * from allType
select * from plotclimate_Tang
select * from environment
select * from XinjiangPlot


SELECT     id, cnFamily, latinFamily, cnName, latinName, latinNameFull, mediName0, distribution0, mediPart0, herbarium, mediFunc1, mediFunc2, mediFunc3, mediFunc4, mediFunc5, mediFunc6
FROM         Property
WHERE     (id > 1800)

select * from property where note ='d'

select ltrim(rtrim(mediFunc1)) from property where mediFunc1 is not null
--update property set mediFunc1 = ltrim(rtrim(mediFunc1)) where mediFunc1 is not null
--update property set mediFunc2 = ltrim(rtrim(mediFunc2)) where mediFunc1 is not null
--update property set mediFunc3 = ltrim(rtrim(mediFunc3)) where mediFunc1 is not null
--update property set mediFunc4 = ltrim(rtrim(mediFunc4)) where mediFunc1 is not null
--update property set mediFunc5 = ltrim(rtrim(mediFunc5)) where mediFunc1 is not null
--update property set mediFunc6 = ltrim(rtrim(mediFunc6)) where mediFunc1 is not null
--update property set mediFunc7 = ltrim(rtrim(mediFunc7)) where mediFunc1 is not null


--select * into mediXJbook from speciesRichnessXinJiang.dbo.mediXJbook

select * from plantxj p, mediXJbook r where p.cnName=r.cnName or p.latinName=r.latinName 
select * from mpam p, mediXJbook r where p.cnName=r.cnName or p.latinName=r.latinName 

select top 100 * from GridSpecies order by grid

select * from mediXJbook a where a.cnName not in (select cnName from plantxj) and a.latinName not in (select latinName from plantxj) order by id 

select * from mediXJbook where cnName like '%麻黄%'
select * from plantxj where cnFamily like '%菊科%'

select a.* from plantXJ a where (a.cnName not in (select cnName from mediXJbook) and a.latinName not in (select latinName from mediXJbook)) and a.mediId is not null and a.culandwildflag = 1 order by a.id

select a.* from mediXJbook a where (a.cnName not in (select cnName from plantxj) and a.latinName not in (select latinName from plantxj)) order by id


select distinct(a.id), a.cnName, a.latinName, a.latinGenus, a.latinFamily from mug a,plantXJ b where a.speciesflag = 'p' and 
a.id not in (select b.id from mug b, plantXJ c where (b.cnName = c.cnName or b.latinName = c.latinName))

select * from plantXJ where ugId is not null and culandwildflag =3

select * from altAdd
select * from altAdd where lowAltitude = highAltitude


--select * into speciesNR from xinjiangPlot.dbo.speciesNR  #to move this table to the wanted database
select * from speciesNR where cnName like '%门'
select * from speciesNR where cnName like '%纲'
select * from speciesNR where cnName like '%目'
select * from speciesNR where cnName like '%科'
--delete speciesNR where cnName like '%科'
select max(autoid) from speciesNR
select * from speciesNR where latinNameOri like '%现存%'
--update speciesNR set latinNameOri = replace(latinNameOri, '现存', '')
select * from speciesNR where latinNameOri like '%历史%'
--update speciesNR set latinNameOri = replace(latinNameOri, '历史', '')
--update speciesNR set latinNameOriFull = ltrim(rtrim(latinNameOriFull))
--update speciesNR set cnname = ltrim(rtrim(cnname))
select * from speciesNR where class='plant' and latinName is null
select * from m_plant m, medi.dbo.plantxj x where m.cnname=x.cnName and m.latinName<>x.latinName  #to confirm m_plant and plantxj in database medi
select * from speciesNR where class='plant' and latinName is null and cnName like ''
select * from m_plant m, speciesNR s where m.cnName = s.cnName
--update speciesNR set latinName = m.latinName from m_plant m, speciesNR s where m.cnName = s.cnName and s.cnName is null
select latinName from speciesNR where latinName is not null
select * from m_animal m, speciesNR s where m.cnName = s.cnName and s.latinName is not null 
--update speciesNR set latinName = m.latinName from m_animal m, speciesNR s where m.cnName = s.cnName and s.latinName is null   
select min(autoid) autoid ,cnName, latinNameOri from  speciesNR where class='insect' group by cnName, latinNameOri order by autoid
select min(autoid) autoid ,cnName, latinNameOri from  speciesNR where class='moss' group by cnName, latinNameOri order by cnName,autoid
select min(autoid) autoid ,cnName, latinNameOri from  speciesNR where class='lichen' group by cnName, latinNameOri order by cnName,autoid
select min(autoid) autoid ,cnName, latinNameOri from  speciesNR where class='fungi' group by cnName, latinNameOri order by cnName,autoid

###
select autoid ,cnName, latinNameOriFull,latinName,cnFamily,latinFamily,cnGenus,note from speciesNR
where autoid in (
    select min(autoid) from speciesNR where class='plant' and latinName is null group by cnName, latinNameOriFull 
)
and autoid not in (select autoid from speciesNR where (cnName like '%科' or cnName like '%属') and class='plant')
order by cnName

###
select autoid ,cnName, latinNameOriFull,latinName,cnFamily,latinFamily,cnOrder,latinOrder, note from speciesNR
where autoid in (
    select min(autoid) from speciesNR where (class='mammal' or class= 'bird') and NR<>'艾比湖' and latinName is null group by cnName, latinNameOriFull 
)
and autoid not in (select autoid from speciesNR where (cnName like '%科' or cnName like '%目' or cnName like '%属') and (class='mammal' or class= 'bird'))
order by cnName


select min(autoid) autoid ,cnName, latinNameOriFull,latinName,cnFamily,latinFamily,cnGenus,note from  speciesNR where class='plant' and latinName is null group by cnName, latinNameOri,latinName,cnFamily,latinFamily,cnGenus,note order by cnName

select * from speciesNR where (cnName like '%科' or cnName like '%属') and class='plant'
select * from speciesNR where (cnName like '%科' or cnName like '%目' or cnName like '%属') and (class='mammal' or class= 'bird')

select min(autoid) autoid ,cnName, latinNameOri,latinName,class,cnOrder,latinOrder,cnFamily,latinFamily,note from  speciesNR where latinName is null and (class='mammal' or class='bird') and NR<>'艾比湖' group by cnName, latinNameOri,latinName,class,cnOrder,latinOrder,cnFamily,latinFamily,note order by class,cnName
select autoid ,cnName, latinNameOri,latinName,class,cnOrder,latinOrder,cnFamily,latinFamily,note from speciesNR where (class='mammal' or class='bird') and NR='艾比湖' order by autoId
select min(autoid) autoid ,cnName, latinNameOri,latinName,class,cnOrder,latinOrder,cnFamily,latinFamily,note from  speciesNR where (class='fish' or class='reptile' or class='amphibian' or class='proBird' or class='proMammal') and latinName is null group by cnName, latinNameOri,latinName,class,cnOrder,latinOrder,cnFamily,latinFamily,note order by cnName

select count(*) from speciesNR where latinName is null

select min(autoid) autoid ,cnName, latinNameOri from  speciesNR where class='plant' and latinName is null group by cnName, latinNameOri order by autoid
select min(autoid) autoid ,cnName, latinNameOri from  speciesNR where class='mammal' and latinName is null group by cnName, latinNameOri order by autoid


select * from mediXJbook
select * from mediXJ01
select * from plantXJ where culandwildflag=1 and mediId is not null
select p.*, pro.* from medi.dbo.plantXJ p, mediXJbook pro where (p.cnName=pro.cnName or p.latinName=pro.latinName)
and p.culandwildflag=1 and p.mediId is not null

select min(autoid) autoid, cnName, latinName from speciesNR where latinName is not null and class = 'plant' group by cnName, latinName


select * from popxjunionresult

select id, max(pop), avg(pop) from popxjunionresult group by id order by id
select top 1 * from nfcfxj
select top 1 a.id, b.flavour, b.nature, b.channel from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a, nfcfxj b where a.plant_id =  b.id

select * from nfcfxj
--drop table b3
select a.id, count(b.flavour) 
from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a, nfcfxj b 
where a.plant_id =  b.id and a.id='22987' and b.flavour like '%甘%' 
group by a.id
