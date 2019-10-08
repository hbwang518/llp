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

select * from plantBJ where endanStatus = '安全'
select * from plantBJ where endanStatus != '安全'
select * from plantBJ where endanStatus = '极易消失'
select * from plantBJ where endanStatus = '容易消失'
select * from plantBJ where endanStatus = '可能消失'

#############
