
select * from plantlonlat a, m_plant b where a.plant_id =b.id order by a.gridcount

select * from environment
select distinct(foresttype) from environment
select * from grasslandenvironment


select distinct(plot) from shrubandgrass order by plot
select * from shrubandgrass order by plot
select * from environment where plot like '%TC%' order by plot
select * from environment order by plot

select * from mediInfo order by descr, ID

select * from m_mediRed where cnName like '%ÏÉÃ©%'
select * from m_mediRed where latinName like '%Curculigo%'
select * from mediInfo where À­¶¡Ãû like '%Curculigo%'

select * from m_mediRed where latinName like '%Corydalis%'
select * from mediInfo where À­¶¡Ãû like '%Corydalis%'

select * from m_mediRed where latinName like '%Illicium%'
select * from mediInfo where À­¶¡Ãû like '%Illicium%'


select * from m_area
select * from areatocounty
select * from plantcounty where cnName ='雪岭云杉' order by cnName
select a.area_id, b. from areatocounty a join m_area b where a.area_id = b.id

select distinct plant_id, cnName, distribution from 
(
select a.plant_id, a.cnName, b.county_code as distribution from plantcounty a join  areatocounty b on a.distribution=b.area_id
union
select a.plant_id, a.cnName, a.distribution from plantcounty a where len(distribution) > 5
) aa where plant_id=329

--42772 + 18067 = 

select * from M_plant where cnName like '%甘草%'

select * from countyreplacepiaotoli
select * from m_county order by code
沙湾  shawan  654223
玛纳斯  manasi  652324
奇台   qitai  652325
塔城   tacheng  654201
乌苏  wusu   654202


select distinct plant_id, cnName, distribution from 
(
select a.plant_id, a.cnName, b.county_code as distribution from plantcounty a join  areatocounty b on a.distribution=b.area_id
union
select a.plant_id, a.cnName, a.distribution from plantcounty a where len(distribution) > 5
) aa where distribution=654325


select * from m_grid

select * from speciesNR where (NR = '布尔根河狸' or NR = '科克托海') and (class = 'plant' or class = 'bird' or class= 'mammal')
order by NR, class


select distinct(NR) from speciesNR

select * from m_plant where cnname like '%柏%'
select * from m_plant where latinname like '%betula%'
select * from m_plant where latinname like '%populus%'



select * from plantXJ where (mediID is not null or ugid is not null or hzid is not null) order by id
select * from M_plant where id < 7000 order by id

select count(*) from PlantCountyAltitudeValidResult


select distinct (NR) from speciesNR 

select * from speciesNR WHERE NR like '%天池%' and class = 'plant'

select nr, count(distinct(cnName)) from speciesNR where class = 'plant'  group by nr



##动物数据计算
select * from M_County
select * from animalcounty
select animal_id, distribution county_code from AnimalCounty where distribution in (select code from M_County)   ##直接是县的分布
select a.animal_id,b.county_code from AnimalCounty a,areaToCounty b where a.distribution =b.area_id              ##定义的area的分布转为县的分布


##