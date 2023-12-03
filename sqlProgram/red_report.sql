
select * from red2013  --2013年评估物种数，此处与环保部2013发布不同，采用环保部数据
select * from red2020  where status2020 is not null --2020年评估物种数
select * from red2020 where status2020 is not null and status2013 is not null 
and (kingdom =3 or kingdom =4)   --两年均评估的总物种数及维管束植物物种数

select * from red2020 where latinname like '%Nicotiana%'  --选择具体物种

--分别按照kingdom统计评估物种数，特有物种数
select kingdom, count(distinct(latinFamily)) Family,count(distinct(latinGenus)) Genus,count(distinct(latinName)) Species from red2020 where status2013 is not null and status2020 is not null group by kingdom
select kingdom, count(distinct(latinFamily)) Family,count(distinct(latinGenus)) Genus,count(distinct(latinName)) Species from red2020 where status2013 is not null and status2020 is not null and endemism = 1 group by kingdom

----按照濒危级别分类，2020，合并灭绝种
select status2020new, count(distinct(latinFamily)) Family,count(distinct(latinGenus)) Genus,count(distinct(latinName)) Species
FROM (
SELECT CASE WHEN status2020 = 'RE' THEN 'EX' WHEN status2020 = 'EW'  THEN 'EX' ELSE status2020 END AS status2020new,
* FROM red2020
) aa
where status2013 is not null and status2020 is not null
group by status2020new

----按照濒危级别分类，2020，合并灭绝种，种子植物
select status2020new, count(distinct(latinFamily)) Family,count(distinct(latinGenus)) Genus,count(distinct(latinName)) Species
FROM (
SELECT CASE WHEN status2020 = 'RE' THEN 'EX' WHEN status2020 = 'EW'  THEN 'EX' ELSE status2020 END AS status2020new,
* FROM red2020
) aa
where status2013 is not null and status2020 is not null and (kingdom =3 or kingdom =4)
group by status2020new

----按照濒危级别分类，2013，合并灭绝种
select status2013new, count(distinct(latinFamily)) Family,count(distinct(latinGenus)) Genus,count(distinct(latinName)) Species
FROM (
SELECT CASE WHEN status2013 = 'RE' THEN 'EX' WHEN status2013 = 'EW'  THEN 'EX' ELSE status2013 END AS status2013new,
* FROM red2020
) aa
where status2013 is not null and status2020 is not null
group by status2013new

----按照濒危级别分类，2013，合并灭绝种，种子植物
select status2013new, count(distinct(latinFamily)) Family,count(distinct(latinGenus)) Genus,count(distinct(latinName)) Species
FROM (
SELECT CASE WHEN status2013 = 'RE' THEN 'EX' WHEN status2013 = 'EW'  THEN 'EX' ELSE status2013 END AS status2013new,
* FROM red2020
) aa
where status2013 is not null and status2020 is not null and (kingdom =3 or kingdom =4)
group by status2013new

----按照濒危级别分类，2020，不合并灭绝种
select status2020, count(distinct(latinFamily)) Family,count(distinct(latinGenus)) Genus,count(distinct(latinName)) Species
from red2020 
where status2013 is not null and status2020 is not null
group by status2020

----按照濒危级别分类，2013，不合并灭绝种
select status2013, count(distinct(latinFamily)) Family,count(distinct(latinGenus)) Genus,count(distinct(latinName)) Species
from red2020 
where status2013 is not null and status2020 is not null
group by status2013


--matrix 验证，计算在VS程序
select * from red2020 where status2020 = 'LC' and status2013 = 'LC'
select * from red2020 where status2020 = status2013 and status2013 is not null and status2020 is not null  --级别不变物种数
select * from red2020 where status2020 = 'LC' and status2013 = 'NT'
select * from red2020 where status2020num > status2013num and status2013 is not null and status2020 is not null
select * from red2020 where status2020num < status2013num and status2013 is not null and status2020 is not null


select id, cnfamily, cnname, status2020, status2013 from red2020 where status2020num > status2013num and status2013 is not null and status2020 is not null order by id
select id, cnfamily, cnname, status2020, status2013 from red2020 where status2020num < status2013num and status2013 is not null and status2020 is not null order by id

--altitude
--all 
--受威胁物种，不分组，平均海拔
select count(distinct(latinFamily)) Family, count(distinct(latinGenus)) Genus, count(distinct(latinName)) Species from red2020 where latinName in (
	select latinName from red2013 where meanAltitude is not null
) and (status2020='CR' or status2020='EN' or status2020='VU')  

---受威胁物种，分组，平均海拔
select status2020, count(distinct(latinFamily)) Family, count(distinct(latinGenus)) Genus, count(distinct(latinName)) Species from red2020 where latinName in (
	select latinName from red2013 where meanAltitude is not null
) and (status2020='CR' or status2020='EN' or status2020='VU')  
group by status2020

--0-1000
select status2020, count(distinct(latinFamily)), count(distinct(latinGenus)), count(distinct(latinName)) from red2020 where latinName in (
	select latinName from red2013 
	where meanAltitude <= 1000
) and (status2020='CR' or status2020='EN' or status2020='VU')  
group by status2020

--1000-2000
select status2020, count(distinct(latinFamily)), count(distinct(latinGenus)), count(distinct(latinName)) from red2020 where latinName in (
	select latinName from red2013 
	where meanAltitude > 1000 and meanAltitude <= 2000
) and (status2020='CR' or status2020='EN' or status2020='VU') 
group by status2020

--2000-3000
select status2020, count(distinct(latinFamily)), count(distinct(latinGenus)), count(distinct(latinName)) from red2020 where latinName in (
	select latinName from red2013 where meanAltitude > 2000 and meanAltitude <= 3000
) and (status2020='CR' or status2020='EN' or status2020='VU') 
group by status2020

--3000以上
select status2020, count(distinct(latinFamily)), count(distinct(latinGenus)), count(distinct(latinName)) from red2020 where latinName in (
	select latinName from red2013 where meanAltitude > 3000 
) and (status2020='CR' or status2020='EN' or status2020='VU') 
group by status2020

--全部海拔
select * from red2013 where lowaltitude is not null and highaltitude is not null
select * from red2013 where lowaltitude is not null and highaltitude is null
select * from red2013 where lowaltitude is null and highaltitude is not null order by highaltitude

select status2020, count(distinct(latinFamily)), count(distinct(latinGenus)), count(distinct(latinName)) from red2020 where latinName in (
	select latinName from red2013 
	where lowaltitude is not null and highaltitude is not null
) and (status2020='CR' or status2020='EN' or status2020='VU')  
group by status2020

--0-1000，受威胁物种，出现海拔
select status2020, count(distinct(latinFamily)), count(distinct(latinGenus)), count(distinct(latinName)) from red2020 where latinName in (
	select latinName from red2013 
	where lowAltitude <= 1000 and lowAltitude is not null and highAltitude is not null
) and (status2020='CR' or status2020='EN' or status2020='VU')  
group by status2020

--1000-2000，受威胁物种，出现海拔
select status2020, count(distinct(latinFamily)), count(distinct(latinGenus)), count(distinct(latinName)) from red2020 where latinName in (
	select latinName from red2013 
	where ((lowAltitude > 1000 and lowAltitude <= 2000) 
		or (highAltitude > 1000 and highAltitude <= 2000)
		or (lowAltitude < 1000 and highAltitude > 2000))
		and lowAltitude is not null and highAltitude is not null
) and (status2020='CR' or status2020='EN' or status2020='VU') 
group by status2020

--2000-3000，受威胁物种，出现海拔
select status2020, count(distinct(latinFamily)), count(distinct(latinGenus)), count(distinct(latinName)) from red2020 where latinName in (
	select latinName from red2013 
	where ((lowAltitude > 2000 and lowAltitude <= 3000)
		or (highAltitude > 2000 and highAltitude <= 3000)
		or (lowAltitude < 2000 and highAltitude > 3000))
		and lowAltitude is not null and highAltitude is not null
) and (status2020='CR' or status2020='EN' or status2020='VU') 
group by status2020

--3000以上，受威胁物种，出现海拔
select status2020, count(distinct(latinFamily)), count(distinct(latinGenus)), count(distinct(latinName)) from red2020 where latinName in (
	select latinName from red2013 
	where highAltitude > 3000 and lowAltitude is not null and highAltitude is not null
) and (status2020='CR' or status2020='EN' or status2020='VU') 
group by status2020






--RLI 红色名录指数计算

--全部物种
--未去掉2013为灭绝的物种
  --2020
select status2020, count(*) from red2020
where status2020 is not null and status2013 is not null
and status2020 !='DD' and status2013 != 'DD'
group by status2020

  --2013
select status2013, count(*) from red2020
where status2020 is not null and status2013 is not null
and status2020! ='DD' and status2013 != 'DD'
group by status2013

--去掉2013为灭绝的物种
select distinct(status2013) from red2020
  --2020
select status2020, count(*) from red2020
where status2020 is not null and status2013 is not null
and status2020 !='DD' and status2013 != 'DD' 
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
group by status2020

  --2013
select status2013, count(*) from red2020
where status2020 is not null and status2013 is not null
and status2020! ='DD' and status2013 != 'DD'
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
group by status2013

select * from red2013 where status2013 = 'RE' or status2013 = 'EX' or status2013 = 'EW'
order by id

select * from red2020 where status2013 = 'RE' or status2013 = 'EX' or status2013 = 'EW'
order by id2013

select * from red2020 where status2020 = 'RE' or status2020 = 'EX' or status2020 = 'EW'
order by id

--全部物种
select * from red2020 order by id
select * from chinaassessmentevaluation
--delete chinaassessmentevaluation where autoid is null
--去掉2013为灭绝，以及非真实变化的物种
select distinct(status2013) from red2020
  --2020
select status2020, count(*) from red2020
where status2020 is not null and status2013 is not null
and status2020 !='DD' and status2013 != 'DD' 
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
and  id not in (select speciesId from chinaassessmentevaluation where genuineChange=0)
group by status2020

  --2013
select status2013, count(*) from red2020
where status2020 is not null and status2013 is not null
and status2020! ='DD' and status2013 != 'DD'
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
and  id not in (select speciesId from chinaassessmentevaluation where genuineChange=0)
group by status2013



--维管束植物
--未去掉2013为灭绝的物种
  --2020不含苔藓植物
select status2020, count(*) from red2020
where status2020 is not null and status2013 is not null and kingdom != '1'
and status2020! ='DD' and status2013 != 'DD'
group by status2020

  --2013不含苔藓植物
select status2013, count(*) from red2020
where status2020 is not null and status2013 is not null and kingdom != '1'
and status2020 !='DD' and status2013 != 'DD'
group by status2013


--去掉2013为灭绝的物种
  --2020不含苔藓植物
select status2020, count(*) from red2020
where status2020 is not null and status2013 is not null and kingdom != '1'
and status2020! ='DD' and status2013 != 'DD'
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
group by status2020

  --2013不含苔藓植物
select status2013, count(*) from red2020
where status2020 is not null and status2013 is not null and kingdom != '1'
and status2020 !='DD' and status2013 != 'DD'
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
group by status2013



？
--去掉2013为灭绝，以及非真实变化的物种
  --2020不含苔藓植物，为维管束植物
select status2020, count(*) from red2020
where status2020 is not null and status2013 is not null and kingdom != '1'
and status2020! ='DD' and status2013 != 'DD'
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
and  id not in (select speciesId from chinaassessmentevaluation where genuineChange=0)
group by status2020

  --2013不含苔藓植物，为维管束植物
select status2013, count(*) from red2020
where status2020 is not null and status2013 is not null and kingdom != '1'
and status2020 !='DD' and status2013 != 'DD'
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
and  id not in (select speciesId from chinaassessmentevaluation where genuineChange=0)
group by status2013


--种子植物
--未去掉2013为灭绝的物种
  --2020种子植物
select status2020, count(*) from red2020
where status2020 is not null and status2013 is not null and (kingdom = 3 or kingdom = 4)
and status2020 !='DD' and status2013 != 'DD'
group by status2020

  --2013种子植物
select status2013, count(*) from red2020
where status2020 is not null and status2013 is not null and (kingdom = 3 or kingdom = 4)
and status2020 !='DD' and status2013 != 'DD'
group by status2013


--种子植物
--去掉2013为灭绝的物种
  --2020种子植物
select status2020, count(*) from red2020
where status2020 is not null and status2013 is not null and (kingdom = 3 or kingdom = 4)
and status2020 !='DD' and status2013 != 'DD'
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
group by status2020


  --2013种子植物
select status2013, count(*) from red2020
where status2020 is not null and status2013 is not null and (kingdom = 3 or kingdom = 4)
and status2020 !='DD' and status2013 != 'DD'
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
group by status2013


？
--去掉2013为灭绝，以及非真实变化的物种
  --2020种子植物
select status2020, count(*) from red2020
where status2020 is not null and status2013 is not null and (kingdom = 3 or kingdom = 4)
and status2020 !='DD' and status2013 != 'DD'
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
and  id not in (select speciesId from chinaassessmentevaluation where genuineChange=0)
group by status2020

  --2013种子植物
select status2013, count(*) from red2020
where status2020 is not null and status2013 is not null and (kingdom = 3 or kingdom = 4)
and status2020 !='DD' and status2013 != 'DD'
and status2013 != 'RE' and status2013 != 'EX' and status2013 != 'EW'
and  id not in (select speciesId from chinaassessmentevaluation where genuineChange=0)
group by status2013





--category  评级依据ABCDE
Select * from red2020Category
select distinct speciesID2013 from red2013Category
select * from red2020 where category2020 is not null and category2013 !='' 
select * from red2013 where category2013 is not null and category2013 !='' 
select * from red2020 where category2020 is not null and category2020 !='' and (status2020='CR' or status2020='EN' or status2020='VU') and (kingdom = 2 or kingdom = 3 or kingdom = 4)
select * from red2020 where category2013 is not null and category2013 !='' and (status2020='CR' or status2020='EN' or status2020='VU') and (kingdom = 2 or kingdom = 3 or kingdom = 4)

--全部物种
--category2013,为充分利用数据，用2013表，因为不需要与2020数据match
select category1, count(distinct(latinName)), count(distinct(latinGenus)),count(distinct(cnFamily)),count(distinct(speciesID2013))
from
(
	select a.speciesID2013, left(a.category, 1) category1, b.latinGenus, b.cnFamily,b.latinName from red2013Category a
	join red2013 b on a.speciesID2013=b.ID and 
	(status2013='CR' or status2013='EN' or status2013='VU') 
) aa group by category1


--category2020
select category1, count(distinct(latinName)), count(distinct(latinGenus)),count(distinct(cnFamily)),count(distinct(speciesID2020))
from
(
	select a.speciesID2020, left(a.category, 1) category1, b.latinGenus, b.cnFamily,b.latinName from red2020Category a
	join red2020 b on a.speciesID2020=b.ID and 
	(status2020='CR' or status2020='EN' or status2020='VU') 
) aa group by category1

--维管束植物
--category2013,为充分利用数据，用2013表，因为不需要与2020数据match
select category1, count(distinct(latinName)), count(distinct(latinGenus)),count(distinct(cnFamily)),count(distinct(speciesID2013))
from
(
	select a.speciesID2013, left(a.category, 1) category1, b.latinGenus, b.cnFamily,b.latinName from red2013Category a
	join red2013 b on a.speciesID2013=b.ID and 
	(status2013='CR' or status2013='EN' or status2013='VU') and (b.kingdom = 2 or b.kingdom = 3 or b.kingdom = 4)
) aa group by category1


--category2020
select category1, count(distinct(latinName)), count(distinct(latinGenus)),count(distinct(cnFamily)),count(distinct(speciesID2020))
from
(
	select a.speciesID2020, left(a.category, 1) category1, b.latinGenus, b.cnFamily,b.latinName from red2020Category a
	join red2020 b on a.speciesID2020=b.ID and 
	(status2020='CR' or status2020='EN' or status2020='VU') and (b.kingdom = 2 or b.kingdom = 3 or b.kingdom = 4)
) aa group by category1


--种子植物
--category2013,为充分利用数据，用2013表，因为不需要与2020数据match
select category1, count(distinct(latinName)), count(distinct(latinGenus)),count(distinct(cnFamily)),count(distinct(speciesID2013))
from
(
	select a.speciesID2013, left(a.category, 1) category1, b.latinGenus, b.cnFamily,b.latinName from red2013Category a
	join red2013 b on a.speciesID2013=b.ID and 
	(status2013='CR' or status2013='EN' or status2013='VU') and (b.kingdom = 3 or b.kingdom = 4)
) aa group by category1


--category2020
select category1, count(distinct(latinName)), count(distinct(latinGenus)),count(distinct(cnFamily)),count(distinct(speciesID2020))
from
(
	select a.speciesID2020, left(a.category, 1) category1, b.latinGenus, b.cnFamily,b.latinName from red2020Category a
	join red2020 b on a.speciesID2020=b.ID and 
	(status2020='CR' or status2020='EN' or status2020='VU') and (b.kingdom = 3 or b.kingdom = 4)
) aa group by category1



---threat,2013年数据参考朱丽
select * from red2013threat  --8227行
select SpeciesName, threat_code from red2013threat group by SpeciesName, threat_code  ---去除重复的，剩余6934行
select threat_code1,count(*) from
(
select SpeciesName,RLstatus, floor(threat_code) as threat_code1 from red2013threat group by SpeciesName, RLstatus,  threat_code
) a group by threat_code1 order by threat_code1

--原SDG报告中8入侵非常少，而7较多，与本分析不一致，但是数据就是这样的
select * from red2013threat where threat_code >= 7 and threat_code < 8   --167种
select * from red2013threat where threat_code >= 8 and threat_code < 9   --764种

---2020年数据由程序计算出一个表后，通过xls的筛选得到数据。



----province
--总受威胁物种数，见最前面的计算
--total总物种数，升级分级别 
select province.province, 
RE.speciesCount as RECount,
EW.speciesCount as EWCount,
EX.speciesCount as EXCount,
CR.speciesCount as CRCount, 
EN.speciesCount as ENCount,
VU.speciesCount as VUCount,
LC.speciesCount as LCCount,
NT.speciesCount as NTCount,
DD.speciesCount as DDCount

from
(
select distinct province from red2013province
) province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='RE'
group by a.province, b.status2020
) RE on province.province=RE.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='EW'
group by a.province, b.status2020
) EW on province.province=EW.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='EX'
group by a.province, b.status2020
) EX on province.province=EX.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='CR'
group by a.province, b.status2020
) CR on province.province=CR.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='EN'
group by a.province, b.status2020
) EN on province.province=EN.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='VU'
group by a.province, b.status2020
) VU on province.province=VU.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='NT'
group by a.province, b.status2020
) NT on province.province=NT.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='LC'
group by a.province, b.status2020
) LC on province.province=LC.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='DD'
group by a.province, b.status2020
) DD on province.province=DD.province
order by province.province



---仅种子植物
select province.province, 
RE.speciesCount as RECount,
EW.speciesCount as EWCount,
EX.speciesCount as EXCount,
CR.speciesCount as CRCount, 
EN.speciesCount as ENCount,
VU.speciesCount as VUCount,
LC.speciesCount as LCCount,
NT.speciesCount as NTCount,
DD.speciesCount as DDCount

from
(
select distinct province from red2013province
) province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='RE' and (b.kingdom= 3 or b.kingdom=4)
group by a.province, b.status2020
) RE on province.province=RE.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='EW' and (b.kingdom= 3 or b.kingdom=4)
group by a.province, b.status2020
) EW on province.province=EW.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='EX' and (b.kingdom= 3 or b.kingdom=4)
group by a.province, b.status2020
) EX on province.province=EX.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='CR' and (b.kingdom= 3 or b.kingdom=4)
group by a.province, b.status2020
) CR on province.province=CR.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='EN' and (b.kingdom= 3 or b.kingdom=4)
group by a.province, b.status2020
) EN on province.province=EN.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='VU' and (b.kingdom= 3 or b.kingdom=4)
group by a.province, b.status2020
) VU on province.province=VU.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='NT' and (b.kingdom= 3 or b.kingdom=4)
group by a.province, b.status2020
) NT on province.province=NT.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='LC' and (b.kingdom= 3 or b.kingdom=4)
group by a.province, b.status2020
) LC on province.province=LC.province
left join
(
select a.province,b.status2020, count(*) speciesCount
from red2013province a join red2020 b on a.speciesID=b.ID2013
where b.status2020='DD' and (b.kingdom= 3 or b.kingdom=4)
group by a.province, b.status2020
) DD on province.province=DD.province
order by province.province

select * from red2013province

select distinct a.* from red2020 A 
JOIN red2013province B ON A.latinName=B.latinName AND B.province='青海'
and a.status2020 in ('EN','VU','CR','NT') order by id

select distinct status2013 from red2013





--IUCN评估与我国评估的结果
select * from ChinaIUCN_assessments  ----国际库3758种
select * from ChinaIUCN_assessments where latinname in ((select latinname from red2020) union (select latinname from red2013))  --我国已评估的物种两年2689行
select * from ChinaIUCN_assessments where latinname in (select latinname from red2020)   --2519行
select * from ChinaIUCN_assessments where latinname in (select latinname from red2013)   --2348行

--与2013的结果比对
select * from ChinaIUCN_assessments a left join red2013 b on a.latinName = b.latinName
--与2020的结果比对，采用此即可，因为该表同时有2013和2020的评估结果
select * from ChinaIUCN_assessments a left join red2020 b on a.latinName = b.latinName order by a.id
---2020，维管束植物，不采用left join，过滤掉对不上的空值，仅统计物种数
select * from ChinaIUCN_assessments a, red2020 b where a.latinName = b.latinName and (b.kingdom = 2 or b.kingdom = 3 or b.kingdom = 4) and b.id is not null order by a.id
---2020，蕨类，裸子，被子
select * from ChinaIUCN_assessments a, red2020 b where a.latinName = b.latinName and b.kingdom = 2 and b.id is not null order by a.id
select * from ChinaIUCN_assessments a, red2020 b where a.latinName = b.latinName and b.kingdom = 3 and b.id is not null order by a.id
select * from ChinaIUCN_assessments a, red2020 b where a.latinName = b.latinName and b.kingdom = 4 and b.id is not null order by a.id
---2020，藻类
select * from ChinaIUCN_assessments a, red2020 b where a.latinName = b.latinName and b.kingdom = 1 and b.id is not null order by a.id


--threats
select * from ChinaIUCN_threats
select distinct(threatcode) from ChinaIUCN_threats order by threatcode
select distinct(latinname) from ChinaIUCN_threats

----国际库中受威胁物种有致危因子信息的 1126种
select distinct(latinname) from ChinaIUCN_threats where latinname in (select latinname from ChinaIUCN_assessments)

----统计IUCN的threat数量
select threatcode1, count(*) from
(
select latinname, left(threatcode, 1) as threatcode1 from ChinaIUCN_threats 
where threatcode is not null  group by latinname, threatcode
) a group by threatcode1 order by threatcode1




--IUCN物种与我国共同物种我国评估的threat，按2020
select * from red2020threat

select * from red2020 where latinname in (select latinname from ChinaIUCN_assessments)  ---在red2020表中有2519种
select * from red2020threat where latinname in (select latinname from ChinaIUCN_assessments)  ---在red2020threat表中有1655种
--仅计算IUCN评估过的物种在我国2020评估种的threat情况
select threats, count(*) from
(
	select distinct latinname, case when charindex('.', threats) > 0 then left(threats,charindex('.', threats)-1) else threats end as threats
	from red2020threat where threats is not null 
) aa where latinname in 
(select latinname from ChinaIUCN_assessments) group by threats order by threats


--验证threat为5的
select * from red2020threat where latinname in (select latinname from ChinaIUCN_assessments) and threats >= 5 and threats < 6 order by speciesid
---不去重复为279行
---去除5.2, 5.3重复计算的，189行
select * from 
(
	select distinct latinname, case when charindex('.', threats) > 0 then left(threats,charindex('.', threats)-1) else threats end as threats
	from red2020threat where threats is not null 
) aa
where latinname in (select latinname from ChinaIUCN_assessments) and threats >= 5 and threats < 6 order by aa.latinname



select * from red2020 order by id

select * from reddistribution20200307

SELECT    ID, ID2013, kingdom, cnFamily, latinFamily, latinGenus, latinName, cnName, status2020, extinct2020, category2020, crenvu2020, endemism, status2013, extinct2013, 
                category2013, crenvu2013 FROM      red2020


select * from red2013 order by id
select * from red2013province order by autoid

select distinct(大类标识) from red2013ori

select * from red2020 where status2020 = 'EX'

select * from red2013 where status2004 is not null


select * from red2013ori

select * from red2020ori

select * from red2020threat

select * from red2013threat a, red2013 b where a.latinname =b.latinname and a.threat_code is not null

select * from red2020threat a, red2020 b where (a.latinname =b.latinname or a.cnname =b.cnname) and a.threats is not null order by b.id 

##采用此作为threat表的基础
select * from red2020threat a, red2020 b where a.latinname =b.latinname  and a.threats is not null order by b.id 


select * from red2020 where status2020 != status2013 
		order by id


select * from red2020 where status2020 != status2013 
	and status2013 = 'DD'
		order by id



select * from red2020 where status2020 != status2013 
	and status2013 != 'DD' and status2020 != 'DD' 
		order by id

SELECT * FROM RED2020 ORDER BY ID



select * from chinarandom150
delete chinarandom150 where id is null

select kingdom, cnfamily, count(*) from chinarandom150 group by kingdom, cnFamily order by kingdom



select * from chinagov2020 where cnname not in (select cnname from red2020)

select * from chinagov2020 where govid not in(
select govid from chinagov2020 where cnname in (select cnname from red2020)
)


select * from red2013 order by id
select * from red2020full
select * from red2020 where cnname is null
select * from chinagov2020 where cnname is null order by govid

select * from red2020 where latinname = 'Solenostoma rupicolum'   ---
select * from red2020 where latinname = 'Tectaria subvariolosa'   ---
select * from red2020 where latinname = 'Deparia minamitanii'   ---
select * from red2020 where latinname = 'Arachniodes dimorphophyllum'   ---


select * from red2020 a join chinagov2020 b 
on a.cnName=b.cnName and a.status2020 !=b.status2020gov order by a.cnname

select * from chinagov2020 where govid in (4186,34858)  ---重复1种
select * from red2020 where cnname = '淡水耳叶苔'

select * from chinagov2020 where govid in (4387,9692)    ---重复1种
select * from red2020 where cnname = '毛叶铁线蕨'

select * from chinagov2020 where govid in (35142,35143)    ---重复1种
select * from red2020 where cnname like '%地钱%'


select * from chinagov2020 where govid in (28922)
select * from red2020 where cnname = '陕西羽叶报春'     ---级别不同


select * from chinagov2020 where id2020 is null
select * from chinagov2020 where cnname is null
select * from red2020 where cnname is null

select cnName,status2020gov,count(*) from chinagov2020 group by cnName, status2020gov having count(*) > 1
select cnName,status2020,count(*) from red2020 group by cnName, status2020 having count(*) > 1


select cnName,status2020gov,count(*) from chinagov2020 group by cnName, status2020gov having count(*) = 1

select * from  chinagov2020 aa where  aa.govid in (
   select govid from chinagov2020 a join
	(
	select cnName,status2020gov from chinagov2020 group by cnName, status2020gov having count(*) = 1
	) b  on a.cnName=b.cnName and a.status2020gov=b.status2020gov
)
and aa.govid not in (
  select govid from chinagov2020 where id2020 in (
	select id from red2020 a join
	(
	select cnName,status2020 from red2020 group by cnName, status2020 having count(*) = 1
	) b  on a.cnName=b.cnName and a.status2020=b.status2020
   )
)

select id2020,COUNT(*) from chinagov2020 
where id2020 in (
	select id from red2020 a join
	(
	select cnName,status2020 from red2020 group by cnName, status2020 having count(*) = 1
	) b  on a.cnName=b.cnName and a.status2020=b.status2020
   )
group by id2020 having count(*) > 1

select * from chinagov2020 where id2020=22309
select * from red2020 where id=22309

select * from red2020 where cnname = '蜈蚣草'
select * from chinagov2020 where cnname = '蜈蚣草'    --id号与蕨类的重复，已修改

select * from red2020 where cnname = '滇南桫椤'
select * from red2020 where cnname like '%云贵牙蕨%'

select a.cnName,a.status2020,b.status2020gov from red2020 a join chinagov2020 b 
on a.cnName=b.cnName and a.status2020 !=b.status2020gov order by a.cnname

select * from chinagov2020 where govid not in (
  select a.govid from chinagov2020 a,red2020 b where a.cnName=b.cnName or a.latinName=b.latinName
)

--update chinagov2020 set id2020=b.id from chinagov2020 a, red2020 b where a.cnName=b.cnName and a.status2020gov=b.status2020
--update chinagov2020 set id2020=b.id from chinagov2020 a, red2020 b 
where a.latinName=b.latinName and a.status2020gov=b.status2020 and a.id2020 is null

select * from chinagov2020 where id2020 is null
select * from red2020 where cnname = '毛叶铁线蕨'
select * from red2020 where cnname = '陕西羽叶报春'
select * from red2020 where cnname = '淡水耳叶苔'

select distinct a.* from red2020 a join chinagov2020 b 
on a.cnName=b.cnName and a.status2020 =b.status2020gov
where a.cnName is not null and b.cnName is not null

select kingdom, count(distinct(latinFamily)) Family,count(distinct(latinGenus)) Genus,count(distinct(latinName)) Species 
from red2020 where status2013 is not null and status2020 is not null and endemism = 1 group by kingdom

select a.*,b.*
from chinagov2020 a join red2020 b on a.id2020=b.id and a.endemism!=b.endemism

select * from red2020 where endemism = 1
