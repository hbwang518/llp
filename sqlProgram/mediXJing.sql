select * from mfamily
select * from mclass
select * from mpam where code like '2L%' order by code
select * from mpam where cnName like '%雪莲%' order by id
select * from mpam where familyid=752 order by id
select * from mpam where code > '1G27945' order by code
select * from mpam where latinName like '%Magnolia%'
select * from mMedi where code like '%1G169388%'

select * from mpam where latinName is null and cnName is not null
--update mpam set latinName = latinName where latinName is null and latinName is not null 
select * from mediZhiRL
select * from mMedi where (mediName is null or mediName = '100')
select * from mpam where latinName is null order by code
select * from mpam where cnName is null order by code
select * from GBRL order by code
select * from mediUGOri
select * from gbrl where code='1G261122'
select * from gbrl where latinName like '%Polygonum lapathifolium%'
select * from MediChinaOri where LEN(code)=10
select * from medichinaOri where LEN(code) < 3 
select m.code from MediChinaOri m where len(m.code) =2
select m.code, m.mediName from MediChinaOri m where len(m.code) = 10
select m.code from MediChinaOri m where len(m.code) =5

select * from mpam where latinName is null
select mm.*, mp.* from mMedi mm, mpam mp where mm.pamid= mp.id
select * from mug
select * from mpam where cnName like '%车前%'
select * from mhz where cnName like '%车前%'
select * from mpam where latinName like '%Rubus%'
select * from mhz where latinName like '%Rubus%'
select * from mpam where latinName like '%Berberis%'
select * from mhz where latinName like '%Berberis%'
select * from mpam where cnName like '%虎耳草%'
select * from mhz where cnName like '%虎耳草%'
select * from mpam where cnName like '%虎耳草%'
select * from mhz where cnName like '%虎耳草%'
select * from mpam where cnName like '%黄花乌头%'
select * from mhz where cnName like '%黄花乌头%'
select * from mpam where latinName like '%Nicotiana%'
select * from mhz where latinName like '%Nicotiana%'
select * from mpam where latinName like '%Campanula%'
select * from mhz where latinName like '%Campanula%'
select * from mpam where latinName like '%Capsicum%'
select * from mhz where latinName like '%Capsicum%'
select * from mpam where latinName like '%Aloe%'
select * from mhz where latinName like '%Aloe%'
select * from mpam where cnName like '%石榴%'
select * from mhz where cnName like '%石榴%'
select * from mpam where latinName like '%Medicago%'
select * from mhz where latinName like '%Medicago%'
select * from mpam where cnName like '%委陵菜%'
select * from mhz where cnName like '%委陵菜%'
select * from mpam where latinName like '%Thamnolia%'
select * from mhz where latinName like '%Thamnolia%'
select * from mpam where cnName like '%野芝麻%'
select * from mhz where cnName like '%野芝麻%'
select * from mpam where latinName like '%Malva%'
select * from mug where latinName like '%Malva%'

~~~~~~~~~~~~~~~~~~~~~
select * from endangered where cnName not in 
(select plantxj.cnName from plantxj, endangered where (plantxj.cnName= endangered.cnName or plantxj.latinName= endangered.latinName))

select endangered.* from plantxj, endangered where (plantxj.cnName= endangered.cnName or plantxj.latinName= endangered.latinName) and mediId is not null

select * from plantxj where latinName like '%Syrenia%'
select * from plantxj where latinName like '%Salix%'    Salix fedtschenkoi
select * from plantxj where latinName like '%Juglans%'
select * from plantxj where latinName like '%Haloxylon%'
select * from plantxj where latinName like '%Fritillaria%'
select * from plantxj where latinName like '%Ferula%'
select * from plantxj order by id
~~~~~~~~~~~~~~~~~~~~
select * from mediUGOri
select * from GBRL where 学名 like 'Saussurea%'
select * from GBRL where family like '菊科'

select * from mpam where code like '1G2796%' 
select * from mpam where latinName like 'Saussurea%'
select * from mug where cnName='意大利牛舌草' or cnName='自然金'


select * from mpam where latinName like '%Lycium%'
select * from mpam where latinName like '%Bupleurum%'
select * from mug where latinName like '%Bupleurum%'
select * from mhz where latinName like '%Bupleurum%'

select * from mpam where latinName like '%Scutellaria%'
select * from mug where latinName like '%Scutellaria%'
select * from mhz where latinName like '%Scutellaria%'


select * from plantxj where cnFamily = '菊科'
select * from plantxj where cnFamily = '茄科'
select * from plantxj where cnFamily = '蔷薇科'
select * from plantxj where cnFamily = '唇形科'
select * from plantxj where cnFamily = '兰科'
select * from plantxj where cnFamily = '莎草科'
select * from plantxj where cnFamily = '鳞毛蕨科'
select * from plantxj where cnFamily = '姜科'
select * from plantxj where cnFamily = '紫草科'
select * from plantxj where cnFamily = '伞形科'


#To check cnName that possibly be splited because of numbers in the cnName: 
二色苔草,三苞灯芯草,九顶草,三毛草属,三肋果属,二色藁本,二花胡卢巴,二裂委陵菜,八宝属,圆叶八宝,四棱荠,十字花科,二色堇,
三出翠雀花,四裂女娄菜,黑三棱科,荆三棱
select * from speciesNR where cnname like '%色苔草%'
select * from speciesNR where cnname like '%灯芯草%'
select * from speciesNR where cnname like '%顶草%'
select * from speciesNR where cnname like '%毛草%'
select * from speciesNR where cnname like '%肋果%'
select * from speciesNR where cnname like '%色藁本%'
select * from speciesNR where cnname like '%花胡卢巴%'
select * from speciesNR where cnname like '%裂委陵菜%'
select * from speciesNR where cnname like '%宝%'
select * from speciesNR where cnname like '%棱荠%'
select * from speciesNR where cnname like '%字花科%'
select * from speciesNR where cnname like '%色堇%'
select * from speciesNR where cnname like '%出翠雀花%'
select * from speciesNR where cnname like '%裂女娄菜%'
select * from speciesNR where cnname like '%棱科%'
select * from speciesNR where cnname like '%棱%'

select * from propertyXJ where mediFunc2 like '%祛湿止痛﹑强心安神%'
select * from mpam where cnName like '%柏%'
select * from plantXJ
select * from m_plant where cnName like '%狗哇花%'
select * from mMedi
select * from mpam where cnName like '%麻黄%'
select p.cnName, p.latinName, m.latinName from plantXJ p, mpam m where m.cnName = p.cnName and m.latinName <> p.latinName
select * from mpam where cnName like '%狗娃花%'

select plantxj.cnName
from plantXJ, speciesRichnessXinJiang.dbo.m_plant 
where speciesRichnessXinJiang.dbo.m_plant.latinName = plantXJ.latinName 
and  speciesRichnessXinJiang.dbo.m_plant.cnName = '尖果寒原荠'

--update m_plant set cnName= medi.dbo.plantXJ.cnName
from m_plant, medi.dbo.plantxj 
where medi.dbo.plantXJ.latinName = m_plant.latinName 
and  medi.dbo.m_plant.cnName = '麻头花蓟'

select * from m_plant where cnName like '%马蔺%'
select * from plantxj where cnName like '%菲氏柳%'



select * from speciesNR where class is null  #confirm that all species has classification
--update speciesNR set class='bird' where autoid=15457

select * from speciesNR where cnName like '%(%' order by autoid
select * from speciesNR where latinName like '%(%' order by autoid

select distinct(class) from speciesNR
--update speciesNR set class='amphibian' where class='amphibious'  #modify the wrong class

select * from speciesNR where class = 'insect'
select * from speciesNR where class = 'zooplankton'
select * from speciesNR where class = 'phytoplankton'
select * from speciesNR where class = 'fish'
select * from speciesNR where class = 'reptile'
select * from speciesNR where class = 'amphibian'
select * from speciesNR where class = 'proBird'
select * from speciesNR where class = 'proMammal'

select distinct(cnName) from speciesNR where class = 'insect'
select distinct(cnName) from speciesNR where class = 'zooplankton'
select distinct(cnName) from speciesNR where class = 'phytoplankton'
select distinct(cnName) from speciesNR where class = 'fish'
select distinct(cnName) from speciesNR where class = 'reptile'
select distinct(cnName) from speciesNR where class = 'amphibian'

#to change class of a series of species
select * from speciesNR where NR='艾比湖'
select * from speciesNR where autoId>6915 and autoId<7244
--update speciesNR set class='bird' where autoId>6915 and autoId<7244


select * from speciesNR where cnName like '%时%'

select * from speciesNR where cnName like '%蓝点%'
select * from m_animal
select * from speciesNR where class='mammal' and latinName is null
select * from speciesNR where class='bird' and latinName is null
select * from speciesNR where class='plant' and latinName is null
select * from m_animal
select * from speciesNR where class='bird' and cnName like '%亚种%'
select * from speciesNR where class='mammal' and cnName like '%亚种%'
select * from speciesNR where autoId = '10901'

select * from speciesNR where latinName2 is not null
select * from speciesNR where NR='科克苏湿地' and class='plant'
select * from speciesNR where NR='甘家湖梭梭' and class='plant'
1        
2             
3 
5      
--update speciesNR set level = '1' where NR in ('阿尔金山','喀纳斯','巴音布鲁克','托木尔峰','西天山','甘家湖梭梭','塔里木胡杨','艾比湖')
--update speciesNR set level = '2' where NR in ('天池','布尔根河狸','卡拉麦里','塔什库尔干','巴尔鲁克山','两河源头','中昆仑','科克苏湿地','帕米尔高原湿地','科克托海','夏尔希里','小叶白蜡','四爪陆龟')
--update speciesNR set level = '3' where NR in ('塔里木河上游')
--update speciesNR set level = '5' where NR in ('三道海子','克里雅河','喀什昆仑圆柏','车尔臣河湿地','昌吉老龙河','乌恰沙冬青')


select nr from speciesNR where level is null
select * from speciesNR
select * from m_plant
select * from m_animal
--update speciesNR set cnFamily = m.cnFamily, latinFamily=m.latinFamily, cnGenus=m.cnGenus, latinGenus=m.latinGenus
from speciesNR, m_plant m where speciesNR.cnName=m.cnName

--update speciesNR set cnFamily = m.cnFamily, latinFamily=m.latinFamily, cnOrder=m.cnOrder, latinOrder=m.latinOrder
from speciesNR, m_animal m where speciesNR.cnName=m.cnName

select * --from speciesNR s --set cnFamily = m.cnFamily, latinFamily=m.latinFamily, cnGenus=m.cnGenus, latinGenus=m.latinGenus
from speciesNR s, m_plant m where s.cnName=m.cnName 

select * from speciesNR where latinName is null and class='plant' order by cnName  ###not distinct
select * from speciesNR where (latinName is null and (class='mammal' or class='bird') ) or (class='bird' and nr='艾比湖') order by NR   ###not distinct
select * from speciesNR where latinName is null and (class='fish' or class='reptile' or class='amphibian' or class='proBird' or class='proMammal')   ###not distinct

select * from speciesNR where class = 'plant' and latinName is null

select * from speciesNR where latinNameOri is not null
select * from speciesNR where latinNameOri is null
select * from speciesNR a, M_plant b where a.latinNameOri=b.latinName and a.latinName is null
select * from speciesNR a, M_animal b where a.latinNameOri=b.latinName and a.latinName is null

--update speciesNR set speciesNR.latinNameOri = var1. latinNameOri from speciesNR, var1 where speciesNR.autoId = var1.autoId
SELECT * from var1 a, speciesNR b where a.latinNameOri = b.latinNameOri order by a.latinNameOri

update speciesNR set cnName=m.cnName, latinName=m.latinName, cnFamily = m.cnFamily, latinFamily=m.latinFamily, cnGenus=m.cnGenus, latinGenus=m.latinGenus
from speciesNR a, M_plant m where a.latinNameOri=m.latinName and a.latinName is null

update speciesNR set cnName=m.cnName, latinName=m.latinName, cnFamily = m.cnFamily, latinFamily=m.latinFamily, cnOrder=m.cnOrder, latinOrder=m.latinOrder
from speciesNR a, M_animal m where a.latinNameOri=m.latinName and a.latinName is null




select Id,count(distinct(plant_id)) gbSpecies,count(distinct(cnFamily)) gbFamily,count(distinct(cnGenus)) gbGenus into a0 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select Id,count(distinct(plant_id)) gbSpecies,count(distinct(cnFamily)) gbFamily,count(distinct(cnGenus)) gbGenus into p1 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from speciesRichnessXinJiang.dbo.PlantCountyAltitudeValidResult a,plantxj b where a.plant_id=b.id and b.mediId is not null and (b.culAndWildFlag=1 or b.culAndWildFlag=3)) w group by w.Id 
select * from p1 order by id
select * from p0 order by id
select * from a0 order by id


select * from altAdd
select * from altAdd where lowAltitude = highAltitude


##################################
select * from plantXJ where mediId is not null and culAndWildFlag=1

select * from plantxj where typecode=2
select * from plantxj where culandwildflag=3
--can not be processed because not with id --select * from plantxj where culandwildflag=3 and cnName not in (select cnName from mpam)
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
select * from mug
select * from mediUGOri
select * from mMediUG
select * from mMediUG order by id

select * from mMediug 
select * from speciesNR where class= 'plant' order by NR

select * from gapAW
select * from gapH
select * from namechange
select * from shrubandgrass
select * from namechange

select * from plantXJ
select * from gbrl
select * from checklist
select * from medichinaori
select * from mdd
select * from medizhirl
select * from mclass
select * from mfamily
select * from mpam
select * from MediChinaOri
select * from plot where plotno = 'xjn49'
select plotno,count(distinct(cnname)) from plot group by plotno order by plotno
select * from soil2022



select * from mpam
select * from sp2000qinghai where medi=1
--update sp2000qinghai set medi=1 from sp2000qinghai a join mpam b on a.cnName=b.cnName or a.latinName=b.latinName
--update sp2000qinghai set medi=0 where medi is null or medi <> 1
select * from sp2000qinghai order by autoid

-- 查找var.   的字符串
select latinNameFull,
charIndex(' ', latinNameFull, 1),
CHARINDEX(' ', latinNameFull, charIndex(' ', latinNameFull, 1) +1),
SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' ', latinNameFull, 1) +1))
from sp2000qinghai where charIndex(' var.' ,latinNamefull, 1) > 1

select latinNameFull,
charIndex(' var. ', latinNameFull, 1),
CHARINDEX(' ', latinNameFull, charIndex(' var. ', latinNameFull, 1) +6),
SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' var.', latinNameFull, 1) +6))
from sp2000qinghai where charIndex(' var. ' ,latinNamefull, 1) > 1

--update sp2000qinghai set latinName=SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' ', latinNameFull, 1) +1))
from sp2000qinghai

-- 更新var.   的字符串
--update sp2000qinghai set latinName=SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' var.', latinNameFull, 1) +6))
from sp2000qinghai where charIndex(' var. ' ,latinNamefull, 1) > 1

select latinNameFull,
charIndex(' subsp. ', latinNameFull, 1),
CHARINDEX(' ', latinNameFull, charIndex(' subsp. ', latinNameFull, 1) +8),
SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' subsp.', latinNameFull, 1) +8))
from sp2000qinghai where charIndex(' subsp. ' ,latinNamefull, 1) > 1

--update sp2000qinghai set latinName=SUBSTRING(latinNameFull,1, CHARINDEX(' ', latinNameFull, charIndex(' subsp.', latinNameFull, 1) +8))
from sp2000qinghai where charIndex(' subsp. ' ,latinNamefull, 1) > 1

select latinNamefull from sp2000qinghai where latinNamefull like '% subsp.%'

select latinNamefull,latinName from sp2000qinghai





select latinNameFull, latinName from sp2000qinghai








