#########本书总物种数
##详细描述物种detailSpecies=1,提到物种detailSpecies=2,按照listQin20150428,做了mediInfo这个表,按照这个表统计.
#验证这两个表的物种是否统一
select * from mediInfo where id not in (
select id from mediInfo where latinName in (
select latinName from listqin20150428) and cnName in (select cnName from listqin20150428))
and (detailSpecies =1 or detailSpecies=2)

select * from mediInfo where detailSpecies=1 and (cnName in 
(select cnName from listqin20150428 where detailSpecies=1)
or latinName in (select latinName from listqin20150428 where detailSpecies=1))

select * from mediInfo where detailSpecies=2 and (cnName in 
(select cnName from listqin20150428 where detailSpecies=2)
or latinName in (select latinName from listqin20150428 where detailSpecies=2))

select * from mediInfo where id not in (
select id from mediInfo where detailSpecies=1 and 
cnName in (select cnName from listqin20150428 where detailSpecies = 1)
) and detailSpecies=1

select * from mediInfo where id not in (
select id from mediInfo where detailSpecies=1 and 
latinName in (select latinName from listqin20150428 where detailSpecies = 1)
) and detailSpecies=1


##全部物种数及详细物种数
select count(distinct(cnName)) species,
count(distinct(cnFamily)) Family,
count(distinct(cnGenus)) Genus 
from listqin20150428 
where detailSpecies = 1 or detailSpecies = 2

select count(distinct(cnName)) species,
count(distinct(cnFamily)) Family,
count(distinct(cnGenus)) Genus 
from listqin20150428 
where detailSpecies = 1 


##按照濒危级别,统计科属种数
select endanStatus, count(distinct(cnName)) species,
count(distinct(cnGenus)) Genus,
count(distinct(cnFamily)) Family
from mediInfo 
where detailSpecies = 1 
group by endanStatus


##按照生活型
#每个生活型总物种数
select ecoType2, count(distinct(cnName)) species,
count(distinct(cnGenus)) Genus,
count(distinct(cnFamily)) Family
from mediInfo 
where detailSpecies = 1 
group by ecoType2

#按照濒危级别的生活型统计,即乔灌草藤
select endanStatus, ecoType2, count(ecotype2) 
from mediInfo where detailSpecies = 1 
group by endanStatus, ecoType2


##按照是否特有
#总物种数,包括特有和非特有
select '特有', count(distinct(cnName))cnName, 
count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where detailSpecies = 1 and endem = 1;
select '非特有', count(distinct(cnName))cnName, 
count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily  
from mediInfo where detailSpecies = 1 and endem = 0;

#按照濒危级别的特有及非特有物种数
select endanStatus, endem, count(endem) from mediInfo 
where detailSpecies = 1 group by endanStatus, endem

#特有物种数按照濒危级别
select endanStatus, count(distinct(cnName)) species,
count(distinct(cnGenus)) Genus,
count(distinct(cnFamily)) Family
from mediInfo 
where detailSpecies = 1 and endem=1
group by endanStatus 


##生境特征
#每种生境的物种数
select habitat, count(habitat) from mediInfo 
where detailSpecies = 1 group by habitat

#按照濒危级别统计每种生境的物种数
select endanStatus, habitat, count(habitat) from mediInfo 
where detailSpecies = 1 group by endanStatus, habitat


######药用相关的特征
####药味
##不同药味物种科属种数
select '苦', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and flavour like '%苦%';
select '辛', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and flavour like '%辛%';
select '酸', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and flavour like '%酸%';
select '甘', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and flavour like '%甘%';
select '咸', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and flavour like '%咸%';

##不同濒危等级药味的物种数  #number of species = flavor
select endanstatus, count(flavour) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where flavour like '%苦%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(flavour) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where flavour like '%辛%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(flavour) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where flavour like '%酸%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(flavour) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where flavour like '%甘%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(flavour) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where flavour like '%咸%' and detailSpecies = 1 group by endanstatus

####药性
##不同药性物种科属种数
select distinct(property) from mediInfo   ##确定哪几种药性##
select '寒', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and property like '%寒%';
select '凉', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and property like '%凉%';
select '平', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and property like '%平%';
select '温', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and property like '%温%';
select '热', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and property like '%热%';

##不同濒危等级药性的物种数
select endanstatus, count(property) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where property like '%寒%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(property) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where property like '%凉%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(property) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where property like '%平%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(property) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where property like '%温%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(property) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where property like '%热%' and detailSpecies = 1 group by endanstatus


####不同药用部位物种科属种数
##不同药用部位物种科属种数
select distinct(mediPart) from mediInfo   ##确定哪几种药用部位##
select '11', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%11%';
select '12', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%12%';
select '13', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%13%';
select '14', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%14%';
select '15', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%15%';
select '16', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%16%';
select '17', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%17%';
select '19', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%19%';

##不同濒危等级药用部位的物种数
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%11%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%12%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%13%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%14%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%15%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%16%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%17%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%19%' and detailSpecies = 1 group by endanstatus


####不同功效物种科属种数
##不同功效物种科属种数
select distinct(func) from mediInfo   ##确定哪几种药用部位##
select '1', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%1%';
select '2', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%2%';
select '3', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%3%';
select '4', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%4%';
select '5', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%5%';
select '6', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%6%';
select '7', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%7%';
select '8', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%8%';

##不同濒危等级功效的物种数
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%1%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%2%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%3%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%4%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%5%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%6%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%7%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%8%' and detailSpecies = 1 group by endanstatus


#########植物园情况统计
#####植物园数据集中于garden表,是由gardenCas和gardenMedi两表合并而来的,即中科院的植物园和药用植物园.
#####gardenCas是所有栽培物种数,但是gardenMedi仅包含了红皮书详细描述物种.
####每个植物园物种数
select cnGarden, count(*) species from garden 
where latinName in (select latinName from mediInfo where detailSpecies = 1)
or cnName in (select cnName from mediInfo where detailSpecies = 1)
group by cnGarden order by species desc

or,另外一种写法:

select cnGarden, count(*) species from garden a, mediInfo b
where (a.latinName=b.latinName or a.cnName=b.cnName) and detailSpecies = 1
group by a.cnGarden order by species desc


##不同濒危等级植物园物种数
select a.cnGarden, b.endanStatus, count(a.cnName) species 
from garden a, mediInfo b 
where (a.latinName=b.latinName or a.cnName=b.cnName) and detailSpecies = 1
group by a.cnGarden, b.endanStatus
order by cnGarden


##每个物种在植物园的栽培情况




#####致危因子情况统计





#####分布情况统计
##得到总的分布结果表
select * from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName order by a.autoId

##得到详细描述物种结果表
##To get the result of only species of detail 
select * from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName 
and a.cnName in (select distinct(cnName) from distribution where (descr is null or descr = '添加') and cnName in (select cnName from listqin20150428 where detailSpecies=1))
order by a.autoId


######得到省或者县有多少个物种
#province species#
select province, count(distinct(b.cnName)) Species, count(distinct(b.cnGenus)) Genus, count(distinct(b.cnFamily)) Family 
from distribution a, mediInfo b
where (a.descr is null or a.descr like '%添加%') and a.cnName=b.cnName and b.detailSpecies=1
group by a.province order by a.province

##得到省的经纬度  ???
select * from 
(select province, count(distinct(b.cnName)) Species, count(distinct(b.cnGenus)) Genus, count(distinct(b.cnFamily)) Family 
from distribution a, mediInfo b
where (a.descr is null or a.descr like '%添加%') and a.cnName=b.cnName and b.detailSpecies=1
group by a.province
) d, county2007 e
where d.province = e.province


##得到物种在多少个省或者县分布##
select a.cnName, a.latinName, count(distinct(a.province)) provinceCount 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and b.detailSpecies = 1 and (descr is null or descr like '%添加%')
group by a.cnName, a.latinName order by provinceCount

select a.cnName, a.latinName, count(distinct(a.countyCode)) countyCount 
from distribution a , listqin20150428 b 
where a.cnName=b.cnName and b.detailSpecies = 1 and (descr is null or descr like '%添加%')
group by a.cnName, a.latinName order by countyCount



