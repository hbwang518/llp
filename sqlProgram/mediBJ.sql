##########mediBJ############

--update plantbj set LatinName = LatinNameFull where LatinNameFull like '%var.%'
--update plantbj set LatinName = LatinNameFull where LatinNameFull like '% cv.%'
--update plantbj set LatinName = LatinNameFull where LatinNameFull like '% f.%'

--update plantBJ set mediId=mpam.id from plantBJ, mpam where (plantBJ.cnName=mpam.cnName or plantBJ.latinName=mpam.latinName)

select * from mpam
select * from mMedi
select * from plantBJ where mediId is not null and proteLevel is not null
select * from plantBJ where mediId is not null and endanStatus != '��ȫ'
select * from plantBJ where mediId is not null and endanStatus = '������ʧ'
select * from plantBJ where mediId is not null and endanStatus = '������ʧ'
select * from plantBJ where mediId is not null and endanStatus = '������ʧ'
select * from plantBJ where cnName like '%����%'
select * from plantBJ where cnName like '%��ǰ%'
select * from plantBJ where cnName like '%�ѹ�Ӣ%'

select * from plantBJ where endanStatus = '��ȫ'
select * from plantBJ where endanStatus != '��ȫ'
select * from plantBJ where endanStatus = '������ʧ'
select * from plantBJ where endanStatus = '������ʧ'
select * from plantBJ where endanStatus = '������ʧ'

#############
