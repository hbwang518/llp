#######################################

speciesFlag1 <> 'd'

###mediDaodi###
select * from mediDaodiOri 
--select * into mdd from mediDaodiOri 
select mdd.cnName,mdd.latinName, mf.cnName, mp.latinName, mp.latinGenus from mdd, mediXJ.dbo.mfamily mf , medixj.dbo.mpam mp where mdd.cnName=mp.cnName and mp.familyid=mf.id
--update mdd set mdd.latinName = mp.latinName, mdd.latinGenus = mp.latinGenus, mdd.cnFamily= mf.cnName, mdd.latinFamily = mf.latinName from mdd, mediXJ.dbo.mfamily mf, medixj.dbo.mpam mp where mdd.cnName=mp.cnName and mp.familyid=mf.id
--update mdd set speciesFlag='p' from mdd, mediXJ.dbo.mpam mp where mdd.cnName=mp.cnName and (mp.code like '1E%' or mp.code like '1F%' or mp.code like '1G%')
select * from mdd where cnName1 is not null
select MIN(autoid) minid, id from mdd group by id order by minid  ##select the 1st one##
select MIN(autoid) minid, id from mdd where speciesFlag = 'p' group by id order by minid  ##select the 1st one##
select distinct(id) from mdd where speciesFlag = 'p'
select distinct(id) from mdd where speciesFlag = 'o'
select distinct(id) from mdd where speciesFlag = 'p' and speciesFlag1 is null
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from mdd p where p.speciesFlag = 'p' and p.speciesFlag1 <> 'd'
select count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from mdd p where p.speciesFlag = 'p' and autoid in (select MIN(autoid) minid from mdd group by id)

select region,count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from mdd p where p.speciesFlag = 'p' group by region
select region,count(distinct(p.cnFamily)), count(distinct(p.latinGenus)), count(distinct(p.cnName)) from mdd p where p.speciesFlag = 'p' and 
autoid in (select MIN(autoid) minid from mdd group by id) group by region

select * from mdd where latinName is not null and speciesFlag <> 'p'
select * from mdd where speciesFlag = 'p'
select * from mdd where speciesFlag = 'o'

select distinct(region) from mdd
select distinct(mediName) from mdd

select * from mdd where region like '%关药%'
select * from mdd where cnName like '%膜荚黄芪%'
select distinct(province) from 国标县名2007
select COUNT(cnFamily) a,cnFamily from mdd where speciesFlag = 'p' and autoid in (select MIN(autoid) minid from mdd group by id) group by cnFamily order by a
select COUNT(cnFamily) a,cnFamily from mdd where speciesFlag = 'p' group by cnFamily order by a
select COUNT(distinct(id)),region from mdd where speciesFlag = 'p' group by region


