use speciesRichnessXinJiang

select * from plotPlant
select * from PlantbodySize
select * from shrubAndGrass where number is null
select distinct species from shrubAndGrass
select * from arbor
select distinct(plot) from arbor 
select distinct(species) from arbor
select distinct(plot) from xinjiangPlot.dbo.HCZLWoody
select * from xinjiangPlot.dbo.Environment
select * from grasslandPlot
select * from PlantBodySize where bodySize is null
select distinct id, cnName from plotPlant group by id, cnName
select * from m_grid
select * from grasslandBiomass where plot is not null
select * from grasslandenvironment



select * from plantgridrange
select * from plantlonlat
select * from grid_gridScope
select top 1 * from grid_gridScope
select top 1 * from m_grid



##select distinct b.id,b.cnName into plantIDSpecies from shrubAndGrass a, m_plant b 
where a.species = b.cnName

select b.id,b.cnName from shrubAndGrass a, m_plant b 
where a.species = b.cnName group by b.id,b.cnName

--select a.plotNo, b.id,b.cnName into PlotPlant from shrubAndGrass a, m_plant b 
where a.species = b.cnName
group by PlotNo, b.id, b.cnName
order by PlotNo, b.id, b.cnName

select a.plotNo, b.id,b.cnName, number, coverage, aveHeight 
from shrubAndGrass a, m_plant b 
where a.species = b.cnName and a.speciesFlag = 2 and splotArea =1
order by a.plotNo, b.id, b.cnName

--update plotPlant set plot = b.plot from plotPlant a,  shrubAndGrass b
where a.plot = b.plotNo

select a.plot, b.id, b.cnName, number, coverage, aveHeight from shrubAndGrass a, m_plant b 
where a.species = b.cnName and a.speciesFlag = 2 and splotArea = 1
order by a.plotNo, b.id, b.cnName

select * from shrubAndGrass where number is not null and coverage is not null and aveHeight is not null

select b.id, b.cnName, number, coverage, aveHeight from shrubAndGrass a, m_plant b 
where a.species = b.cnName and a.speciesFlag = 2 and splotArea =1 and number is not null and coverage is not null and aveHeight is not null
order by b.id, b.cnName

##########计算林下草本平均的数量盖度和高度
#insert plantBodySize name (id, cnName) vlaues 
#select id, cnName, avg(number) number, avg(coverage) coverage, avg(height) height, avg(bodySize) bodySize into PlantBodySize
from plotPlant group by id, cnName


select * from PlantBodySize order by id
##update PlantBodySize set number = null, coverage=null, height=null, bodySize=null

##对应林下草本植物个体大小和分布区特征
select a.gridcount, b.* from plantlonlat a, plantBodysize b where b.id = a.plant_id and b.bodysize is not null 
select a.*, b.* from plantgridrange a, plantBodysize b where b.id = a.plant_id and b.bodysize is not null 

select * from arbor
select * from arbor where heighteye is null and heightmeasured is null

--mememe乔木分布区和个体大小(平均胸高断面积,胸径,最大胸径)对应
select a.*, b.* from plantgridrange a,  
(select species, avg(breast*breast/4/3.14) bodysize from arbor group by species) b, m_plant c 
where c.id = a.plant_id and b.species = c.cnname

#平均胸高断面积
select a.*, b.*, d.Gridcount from plantgridrange a,  
(select species, avg(breast*breast/4/3.14) bodysize from arbor group by species) b, m_plant c, plantlonlat d 
where c.id = a.plant_id and b.species = c.cnname and d.plant_id = a.plant_id order by a.plant_id

#乔木平均胸径&最大胸径作为个体大小   <----treeBS
select a.*, b.*, d.Gridcount from plantgridrange a,  
(select species, avg(breast/3.14) bodysizeavg, max(breast/3.14) bodysizemax from arbor 
group by species) b, m_plant c, plantlonlat d 
where c.id = a.plant_id and b.species = c.cnname and d.plant_id = a.plant_id order by a.plant_id


------------------------------------------------------------------------------------------------------------

----算plot和对应栅格的bodySize及RangeSize
select a.*, b.* from grid_gridScope a,  
(select plot, avg(breast*breast/4/3.14) bodysize from arbor group by plot) b,
(
	select a.id, b.plot, a.lon, a.lat, b.longitude, b.latitude from m_grid a join xinjiangPlot.dbo.Environment b 
on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
) c
where a.Grid_id=c.id and c.plot = b.plot

##验证,为上面程序的部分
select a.* from grid_gridScope a,
(
	select a.id, b.plot, a.lon, a.lat, b.longitude, b.latitude from m_grid a join xinjiangPlot.dbo.Environment b 
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
) c
where a.Grid_id=c.id


select a.*, b.* from grid_gridScope a,  
(select plot, avg(breast/3.14) bodysizeavg, max(breast/3.14) bodysizemax from arbor group by plot) b,
(
select a.id, b.plot, a.lon, a.lat, b.longitude, b.latitude from m_grid a join xinjiangPlot.dbo.Environment b 
on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
) c
where a.Grid_id=c.id and c.plot = b.plot


----计算栅格乔木的bodySize及RangeSize
select aaa.*, bbb.* from grid_gridScope aaa,  
( select bb.id, avg(aa.breast*aa.breast/4/3.14) bodysize from arbor aa,
	(
		select a.id as id, b.plot, a.lon, a.lat, b.longitude, b.latitude from m_grid a join xinjiangPlot.dbo.Environment b 
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	) bb where aa.plot=bb.plot group by bb.id
) bbb
where aaa.Grid_id=bbb.id

##验证,为上面程序的部分
select a.id, b.plot, a.lon, a.lat, b.longitude, b.latitude from m_grid a join xinjiangPlot.dbo.Environment b 
on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude

##计算栅格乔木的bodySize,栅格的RangeSize和richness   <---- gridtreeBS
select aaa.*, bbb.*, ccc.* from grid_gridScope aaa,  
( select bb.id, avg(breast/3.14) bodysizeavg, max(breast/3.14) bodysizemax from arbor aa,
	(select a.id as id, b.plot, a.lon, a.lat, b.longitude, b.latitude from m_grid a 
		join xinjiangPlot.dbo.Environment b 
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 < b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 < b.latitude
	) bb where aa.plot=bb.plot group by bb.id
) bbb,
(select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount
	from plantCountyAltitudeValidResultDistinct a,m_plant 
	where a.plant_id = m_plant.id  group by a.id) ccc
where aaa.Grid_id=bbb.id and aaa.Grid_id=ccc.id



####计算草地

##植物按照高度*盖度
select a.*, b.*, d.Gridcount from plantgridrange a,  
(select species, avg(AveHeight*Coverage) bodysize from grasslandPlot group by species) b, m_plant c, plantlonlat d 
where c.id = a.plant_id and b.species = c.cnname and d.plant_id = a.plant_id order by a.plant_id

##植物按照平均和最大高度
select a.*, b.*, d.Gridcount from plantgridrange a,  
(select species, avg(AveHeight) heightavg, max(AveHeight) heightmax from grasslandPlot group by species) b, m_plant c, plantlonlat d 
where c.id = a.plant_id and b.species = c.cnname and d.plant_id = a.plant_id order by a.plant_id

##区域:按照生物量   <----grasslandbiomass
select aa.*, bb.* from 
(
select a.id,a.lon, a.lat, d.*, c.*, e.latitude, e.longitude from m_grid a join grasslandEnvironment b
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
join grid_gridScope c on a.Id = c.grid_id
join grasslandBiomass d on b.plot=d.plot 
join grasslandenvironment e on d.plot=e.plot
) aa ,
(
select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount
	from plantCountyAltitudeValidResultDistinct a,m_plant 
	where a.plant_id = m_plant.id  group by a.id
) bb where aa.id=bb.id
 order by aa.id


##区域:按照平均和最大高度   <----grasslandHeight
select aaa.*, bbb.*, ccc.* from grid_gridScope aaa,  
(
select bb.id, avg(aveHeight) bodysizeavg from grasslandplot aa,
	(select a.id as id, b.plot, a.lon, a.lat, b.longitude, b.latitude from m_grid a 
		join grasslandenvironment b 
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 < b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 < b.latitude
	) bb where aa.plot=bb.plot group by bb.id
) bbb,
(select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount
	from plantCountyAltitudeValidResultDistinct a,m_plant 
	where a.plant_id = m_plant.id  group by a.id) ccc
where aaa.Grid_id=bbb.id and aaa.Grid_id=ccc.id

	
#select * from grasslandbiomass where plotavgbiomass is not null
#select * from grasslandplot
#select * from grasslandbiomass
#select * from grasslandenvironment

--------------------------------------------------------------------------------------

select plot, number, coverage, aveHeight from shrubAndGrass
where speciesFlag = 2 and splotArea =1 and number is not null and coverage is not null and aveHeight is not null
order by plot

select aa.*, bb.* from
(
	select plot, sum(coverage*aveHeight)/sum(number) as plotBodySize from shrubAndGrass
	where speciesFlag = 2 and splotArea =1 and number is not null and coverage is not null and aveHeight is not null
	group by plot
) aa,
(
	select a.id, b.plot, a.lon, a.lat, b.longitude, b.latitude from m_grid a join xinjiangPlot.dbo.Environment b 
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
) bb
where aa.plot=bb.plot


--------------------------------------------------------------------------------------------------
--计算草本栅格bodySize及RangeSize
select aaa.*, bbb.* from grid_gridScope aaa,
(
	select bb.Id, sum(aa.coverage*aa.aveHeight)/sum(aa.number) as plotBodySize from shrubAndGrass aa,
	(
	select a.id, b.plot, a.lon, a.lat, b.longitude, b.latitude from m_grid a join xinjiangPlot.dbo.Environment b 
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	) bb
	where aa.plot=bb.plot and aa.speciesFlag = 2 and aa.splotArea =1 and aa.number is not null and aa.coverage is not null and aa.aveHeight is not null
	group by bb.Id
) bbb
where aaa.Grid_id= bbb.id




----------------
##动物个体大小,利用Ecology Jetz的数据.
select * from m_animal
select * from BirdFuncDat
select * from MamFuncDat

select a.*, b.bodymass_value from m_animal a
left join BirdFuncDat b on a.latinName = b.scientific
order by a.id

select a.*, c.bodymass_value from m_animal a
left join MamFuncDat c on a.latinName = c.scientific
order by a.id


select d.* from m_animal d where d.latinname not in 
(
select distinct(a.latinname) from m_animal a, BirdFuncDat b
where a.latinName = b.scientific
union
select distinct(a.latinname) from m_animal a, MamFuncDat c
where a.latinName = c.scientific
)
order by d.id


####
select * from plantxj   #4092row  #in medi
select * from m_plant   #4092row  #in speciesrichnessXinjiang

select * from plantxj where lowAltitude < 0    #1871row  
select * from m_plant where lowAltitude < 0    #1413row, more data in this


##select * into m_plant from M_Plant1

select * from M_PLANT1 WHERE del = 1

select * from m_plant order by id

select * from m_plant where del=1 order by id












~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-------下面是种库，未动
------计算草地种库
select a.id,b.plot,b.richness from m_grid a join grasslandEnvironment b
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	

select * from grasslandEnvironment
select top 10 * from plantCountyAltitudeValidResultDistinct

select aa.*, bb.* from
(
	select id, count(plant_id) plantCount from plantCountyAltitudeValidResultDistinct group by id
) aa,
(
	select a.id,b.plot,b.richness from m_grid a join grasslandEnvironment b
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	
) bb
where aa.id= bb.id order by aa.id



--计算山地森林种库

select a.id,b.plot,b.richness from m_grid a join grasslandEnvironment b
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	
select * from grasslandEnvironment

select top 10 * from plantCountyAltitudeValidResultDistinct

select aa.*, bb.* from
(
	select id, count(plant_id) plantCount from plantCountyAltitudeValidResultDistinct group by id
) aa,
(
	select a.id,b.plot from m_grid a join XinJiangPlot.dbo.EnvironmentNeedle b
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
) bb
where aa.id= bb.id order by aa.id

select aa.id, aa.plantCount, bb.*, cc.*
from 
(
	select id, count(plant_id) plantCount from plantCountyAltitudeValidResultDistinct group by id
) aa,
(
	select a.id,b.plot, b.latitude, b.longitude from m_grid a join XinJiangPlot.dbo.EnvironmentNeedle b
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
) bb,
(
	select z.plot, count(distinct(z.species)) speciesCount, count(distinct(z.cnGenus)) cnGenusCount,count(distinct(z.cnFamily)) cnFamilyCount from 
	
	(
	
	select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.shrubandgrassneedle b, XinJiangPlot.dbo.environmentneedle c where  a.cnName = b.species and b.plot =c.plot 
	
	union all
	
	select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.arborneedle b,  XinJiangPlot.dbo.environmentneedle c where  a.cnName = b.species and  b.plot =c.plot 
	
	) z group by z.plot
) cc
where aa.id= bb.id and bb.plot = cc.plot order by aa.id

----
select top 1 * from m_plant

select aa.*, cc.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount  from plantCountyAltitudeValidResultDistinct a, m_plant where a.plant_id = m_plant.id  group by a.id
) aa,
(
	select a.id,b.plot from m_grid a join XinJiangPlot.dbo.EnvironmentNeedle b
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
) bb,
(
	select z.plot, count(distinct(z.species)) speciesCount, count(distinct(z.cnGenus)) cnGenusCount,count(distinct(z.cnFamily)) cnFamilyCount from 
	
	(
	
	select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.shrubandgrassneedle b, XinJiangPlot.dbo.environmentneedle c where  a.cnName = b.species and b.plot =c.plot 
	
	union all
	
	select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.arborneedle b,  XinJiangPlot.dbo.environmentneedle c where  a.cnName = b.species and  b.plot =c.plot 
	
	) z group by z.plot
) cc
where aa.id= bb.id and bb.plot = cc.plot order by aa.id

------
----计算种库按照栅格平均(全疆山地)
select top 1 aa.*, bbb.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount  from plantCountyAltitudeValidResultDistinct a, m_plant where a.plant_id = m_plant.id  group by a.id
) aa,
(
	select bb.id, avg(1.0*cc.speciesCount) speciesCount, avg(1.0*cc.cnGenusCount) cnGenusCount, avg(1.0*cc.cnFamilyCount) cnFamilyCount 
	from
	(
		select a.id,b.plot from m_grid a join XinJiangPlot.dbo.Environment b
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	) bb, 
	(
		select z.plot, count(distinct(z.species)) speciesCount, count(distinct(z.cnGenus)) cnGenusCount,count(distinct(z.cnFamily)) cnFamilyCount from 
		
		(
		
		select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.shrubandgrass b, XinJiangPlot.dbo.environment c where  a.cnName = b.species and b.plot =c.plot 
		
		union all
		
		select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.arbor b,  XinJiangPlot.dbo.environment c where  a.cnName = b.species and  b.plot =c.plot 
		
		) z group by z.plot
	) cc
	where bb.plot = cc.plot group by bb.id
) bbb

where aa.id= bbb.id order by aa.id

----------------------------
---全疆山地 加经纬度和气候信息
select aa.*, bbb.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount  from plantCountyAltitudeValidResultDistinct a, m_plant where a.plant_id = m_plant.id  group by a.id
) aa,
(
	select bb.id, avg(1.0*cc.speciesCount) speciesCount, avg(1.0*cc.cnGenusCount) cnGenusCount, avg(1.0*cc.cnFamilyCount) cnFamilyCount 
		, avg(bb.latitude) avglatitude, avg(bb.longitude) avgLongitude, avg(bb.MAT) avgMAT, avg(bb.MAP) avgMAP, avg(bb.Im1955) avgIm1955, avg(bb.Total_pe) avgPET, avg(bb.total_ae) avgAET
	from
	(
		select a.id,b.plot, c.latitude, c.longitude, c.MAT, c.MAP, c.Im1955, c.Total_pe, c.total_ae from m_grid a join XinJiangPlot.dbo.Environment b
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
		join XinJiangPlot.dbo.plotClimate_tang c on
		b.plot = c.plot
	) bb, 
	(
		select z.plot, count(distinct(z.species)) speciesCount, count(distinct(z.cnGenus)) cnGenusCount,count(distinct(z.cnFamily)) cnFamilyCount from 
		
		(
		
		select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.shrubandgrass b, XinJiangPlot.dbo.environment c where  a.cnName = b.species and b.plot =c.plot 
		
		union all
		
		select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.arbor b,  XinJiangPlot.dbo.environment c where  a.cnName = b.species and  b.plot =c.plot 
		
		) z group by z.plot
	) cc
	where bb.plot = cc.plot group by bb.id
) bbb

where aa.id= bbb.id order by aa.id


----计算种库按照栅格平均(全疆针叶林)
select aa.*, bbb.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount  from plantCountyAltitudeValidResultDistinct a, m_plant where a.plant_id = m_plant.id  group by a.id
) aa,
(
	select bb.id, avg(1.0*cc.speciesCount) speciesCount, avg(1.0*cc.cnGenusCount) cnGenusCount, avg(1.0*cc.cnFamilyCount) cnFamilyCount 
	from
	(
		select a.id,b.plot from m_grid a join XinJiangPlot.dbo.Environmentneedle b
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	) bb, 
	(
		select z.plot, count(distinct(z.species)) speciesCount, count(distinct(z.cnGenus)) cnGenusCount,count(distinct(z.cnFamily)) cnFamilyCount from 
		
		(
		
		select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.shrubandgrassNeedle b, XinJiangPlot.dbo.environmentNeedle c where  a.cnName = b.species and b.plot =c.plot 
		
		union all
		
		select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.arborNeedle b,  XinJiangPlot.dbo.environmentNeedle c where  a.cnName = b.species and  b.plot =c.plot 
		
		) z group by z.plot
	) cc
	where bb.plot = cc.plot group by bb.id
) bbb

where aa.id= bbb.id order by aa.id

----计算种库按照栅格平均(全疆草地)
select aa.*, bbb.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount  from plantCountyAltitudeValidResultDistinct a, m_plant where a.plant_id = m_plant.id  group by a.id
) aa,
(
	select bb.id, avg(1.0*cc.speciesCount) speciesCount, avg(1.0*cc.cnGenusCount) cnGenusCount, avg(1.0*cc.cnFamilyCount) cnFamilyCount 
	from
	(
		select a.id,b.plot from m_grid a join grasslandEnvironment b
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	) bb, 
	(
		select b.plot, count(distinct(a.cnName)) speciesCount, count(distinct(a.cnGenus)) cnGenusCount, count(distinct(a.cnFamily)) cnFamilyCount  from m_plant a, grasslandPlot b where  a.cnName = b.species 
		 group by b.plot
	) cc
	where bb.plot = cc.plot group by bb.id
) bbb

where aa.id= bbb.id order by aa.id

select * from grasslandPlot



----计算种库按照栅格平均(全疆草地) 加经纬度和气候信息
select aa.*, bbb.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount  from plantCountyAltitudeValidResultDistinct a, m_plant where a.plant_id = m_plant.id  group by a.id
) aa,
(
	select bb.id, avg(1.0*cc.speciesCount) speciesCount, avg(1.0*cc.cnGenusCount) cnGenusCount, avg(1.0*cc.cnFamilyCount) cnFamilyCount 
	, avg(bb.latitude) avglatitude, avg(bb.longitude) avgLongitude, avg(bb.MAT) avgMAT, avg(bb.MAP) avgMAP, avg(bb.Im1955) avgIm1955, avg(bb.PET) avgPET, avg(bb.AET) avgAET
        from
	(
		select a.id,b.plot,b.latitude, b.longitude, b.MAT, b.MAP, b.Im1955, b.PET, b.AET from m_grid a join grasslandEnvironment b
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	) bb, 
	(
		select b.plot, count(distinct(a.cnName)) speciesCount, count(distinct(a.cnGenus)) cnGenusCount, count(distinct(a.cnFamily)) cnFamilyCount  from m_plant a, grasslandPlot b where  a.cnName = b.species 
		 group by b.plot
	) cc
	where bb.plot = cc.plot group by bb.id
) bbb

where aa.id= bbb.id order by aa.id







~~~~~~~~~~~~~~~~~~~~~~~~seems useless~~~~~~~~~~~~~~
--select * into plantBodySize from plotPlant 
--delete plantBodySize
select * from plantbodysize
select distinct species from arbor
------
select a.plot, b.id, b.cnName, number, coverage, aveHeight from shrubAndGrass a, m_plant b 
where a.species = b.cnName and a.speciesFlag = 2 and splotArea =1 and number is not null 
and coverage is not null and aveHeight is not null
order by a.plotNo, b.id, b.cnName
--------
select * from PlotPlant where id = 308


select * from plantgridrange
select * from grid_gridScope


select top 10 * from GrasslandBiomass

select * from grasslandPlot where species = '天山大黄'

select species, avg(AveHeight*Coverage) from grasslandPlot group by species

select * from grasslandplot where species='白花匹菊' and aveHeight is not null

select * from grasslandplot where species='天山大黄' and aveHeight is not null


select * from xinjiangplot
select * from plotplant

select * from plotclimate_tang
select * from HCZLWoody
select * from environmentIndex

select * from plotclimatenew
select * from plotpool
select * from environment
select * from shrubandgrass
select * from arbor



--update environment set speciesNo = aaa.speciesNo from environment ee join
(
select plotno, plot, count(distinct(species)) as speciesNo from
(
select e.plotno, e.plot, a.species from environment e left join arbor a on e.plot=a.plot
union 
select e.plotno, e.plot, a.species from environment e left join shrubandgrass a on e.plot=a.plot
) aa group by plotno, plot
) aaa on ee.plotno=aaa.plotno

select * from environment where speciesNo < 1






~~~~~~~~~~~~~~~IUCN~~~~~~~~~~~~~~~~~`  
select * from IUCNchinared2013
select distinct(CNstatus) from IUCNchinared2013 

--select * into rangeSize.dbo.plantxj from medi.dbo.plantxj   ##to compare the IUCN list, get plantXJ directly from medi, should be changed.
--select * into rangeSize.dbo.IUCNchinared2013 from speciesRichnessXinJiang.dbo.IUCNchinared2013
select distinct cnstatus from IUCNchinared2013

select * from plantxj
select modify_date from sys.tables where name='plantxj'



--update IUCNchinared2013 set enstatus='VU' where cnstatus like '%VU%'
--update IUCNchinared2013 set enstatus='RE' where cnstatus like '%RE%'
--update IUCNchinared2013 set enstatus='CR' where cnstatus like '%CR%'
--update IUCNchinared2013 set enstatus='DD' where cnstatus like '%DD%'
--update IUCNchinared2013 set enstatus='EW' where cnstatus like '%EW%'
--update IUCNchinared2013 set enstatus='NT' where cnstatus like '%NT%'
--update IUCNchinared2013 set enstatus='LC' where cnstatus like '%LC%'
--update IUCNchinared2013 set enstatus='EX' where cnstatus like '%EX%'
--update IUCNchinared2013 set enstatus='EN' where cnstatus like '%EN%'


select ENSTATUS, COUNT(ENstatus) from IUCNchinared2013 GROUP BY ENSTATUS

select a.cnname, a.latinname, b.enstatus from plantxj a, IUCNchinared2013 b where (a.cnname in (select cnName from IUCNCHINARED2013) OR a.LATINname in (select LATINName from IUCNCHINARED2013)) group by a.cnname, a.latinname, b.enstatus

select * from IUCNchinared2013 where cnname like '%阿尔金山碱茅%'

select * from plantxj where lowaltitude < 0

select * from m_plant where lowAltitude < 0

select a.id, a.cnName, a.latinName, b.cnName, b.latinName, b.enstatus from plantxj a, IUCNchinared2013 b 
where (a.cnName=b.cnName or a.latinName=b.latinName)
and a.id =672
order by a.id



select distinct a.id from plantxj a, IUCNchinared2013 b 
where a.cnName=b.cnName or a.latinName=b.latinName
group by a.id having count(*) > 1

select enstatus, count(*) from 
(
select a.id, a.cnName, a.latinName, b.cnName as bcnname, b.latinName as blatinname, b.enstatus from plantxj a, IUCNchinared2013 b 
where (a.cnName=b.cnName or a.latinName=b.latinName)
) aa
group by enstatus


select a.id, a.cnName, a.latinName, b.cnName as bcnname, b.latinName as blatinname, b.enstatus from plantxj a, IUCNchinared2013 b 
where (a.cnName=b.cnName or a.latinName=b.latinName) 



select * from animalcounty
select * from distinctAnimalCounty   ---25266
select * from distinctplantCounty    ---61068
select count(county_code) from animalcountyaltituderesult   ---5034023
select count(county_code) from plantcountyaltituderesult    ---7307118




select * from 地名词典区县
select * from 地名词典省市



select * from plantTNRS
select distinct(latinNameTNRS) from plantTNRS
select * from m_plant
--update m_plant set cnname =b.cnNameChina, latinname=b.latinNameTNRs from m_plant a, plantTNRS b
--where a.id=b.id

select * from m_plant where cnname like '%贝母%'

select * from plantcounty
select modify_date from sys.tables where name='distinctplantcounty'
select * into distinctplantcounty from distinctplantcounty20141207

#
--update m_plant set minid=b.minid from m_plant a, 
--(select min(id) minid, latinName from m_plant group by latinName) b
--where a.latinname =b.latinname

select id, minid, cnname, latinname, lowaltitude, highaltitude from m_plant where id <> minid
select id, minid, cnname, latinname, lowaltitude, highaltitude from m_plant where minid in 
(select minid from m_plant group by minid having count(*) > 1 ) order by minid


select * from redlistxj
select * from m_plant where id <> minid



select distinct (typecode) from m_plant 
select * from allType order by type

select * from m_plant order by quartile
select * from m_plant order by id
select * from m_plant where protectionvalue is not null
select * from m_plant where endangeredflag is not null
select * from m_plant where xjendangeredflag is not null


select * from plantxj order by id
