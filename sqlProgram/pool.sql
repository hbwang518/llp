
对于草地,grasslandenvironment是最终的环境和气候信息表.
select * from grasslandenvironment
-----------------------

----计算种库按照plot(全疆草地) 加经纬度和气候信息
select aa.*, bbb.* , ccc.*
from 
(
	select a.id, count(plant_id) speciesGrid, count(distinct(cnGenus)) genusGrid, count(distinct(cnFamily)) familyGrid  
	from plantCountyAltitudeValidResultDistinct a, m_plant b
	where a.plant_id = b.id
	group by a.id
	
	
) aa,
(
	select bb.id, bb.lastregion, bb.MATgrid, bb.MAPgrid, bb.geomor, bb.chinasoilcode, bb.ussoilcode, bb.ph, cc.plot, speciesCount, cnGenusCount, cc.cnFamilyCount
	, bb.latitude, bb.longitude, bb.altitude, bb.MAT, bb.MAP, bb.Im1955, bb.PET, bb.AET, bb.MTCM, bb.MTWM, bb.WI, bb.CI
        from
	(
		select a.id, a.lastregion, a.mat MATgrid, a.map MAPgrid, a.geomor, a.chinasoilcode, a.ussoilcode, a.ph+3 as ph, b.plot,b.latitude, b.longitude,b.altitude, b.MAT, b.MAP, b.Im1955, b.PET, b.AET, b.MTCM, b.MTWM, b.WI, b.CI 
		from m_grid a join grasslandEnvironment b
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	) bb, 
	(
		select b.plot, count(distinct(a.cnName)) speciesCount, count(distinct(a.cnGenus)) cnGenusCount, count(distinct(a.cnFamily)) cnFamilyCount  
		from m_plant a, grasslandPlot b 
		where  a.cnName = b.species 
		 group by b.plot
	) cc
	where bb.plot = cc.plot
) bbb,

(
    select c.id, c.Lat latGrid,c.Lon lonGrid,c.altitude_mean altGrid,c.altitude_max altMaxGrid,c.altitude_min altMinGrid,(c.altitude_max - c.altitude_min) as altRange
	from m_grid c
) ccc

where aa.id= bbb.id and aa.id = ccc.id order by aa.id

----计算种库按照栅格平均(全疆草地) 加经纬度和气候信息
select aa.*, bbb.*, ccc.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount  from plantCountyAltitudeValidResultDistinct a, m_plant where a.plant_id = m_plant.id  group by a.id
) aa,
(
	select bb.id, avg(bb.lastregion) lastregion, avg(bb.MATgrid) MATgrid, avg(bb.MAPgrid) MAPgrid, avg(bb.geomor) geomor, avg(bb.chinasoilcode) chinasoilcode, avg(bb.ussoilcode) ussoilcode, avg(bb.ph) ph, avg(1.0*cc.speciesCount) speciesCount, avg(1.0*cc.cnGenusCount) cnGenusCount, avg(1.0*cc.cnFamilyCount) cnFamilyCount 
	, avg(bb.latitude) avglatitude, avg(bb.longitude) avgLongitude, avg(bb.altitude) avgAltitude, avg(bb.MAT) avgMAT, avg(bb.MAP) avgMAP, avg(bb.Im1955) avgIm1955, avg(bb.PET) avgPET, avg(bb.AET) avgAET, avg(bb.MTCM) avgMTCM, avg(bb.MTWM) avgMTWM, avg(bb.WI) avgWI, avg(bb.CI) avgCI
        from
	(
		select a.id,a.lastregion, a.mat MATgrid, a.map MAPgrid, a.geomor, a.chinasoilcode, a.ussoilcode, a.ph+3 as ph, b.plot,b.latitude, b.longitude, b.altitude, b.MAT, b.MAP, b.Im1955, b.PET, b.AET, b.MTCM, b.MTWM, b.WI, b.CI 
		from m_grid a join grasslandEnvironment b
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
	) bb, 
	(
		select b.plot, count(distinct(a.cnName)) speciesCount, count(distinct(a.cnGenus)) cnGenusCount, count(distinct(a.cnFamily)) cnFamilyCount  from m_plant a, grasslandPlot b where  a.cnName = b.species 
		 group by b.plot
	) cc
	where bb.plot = cc.plot group by bb.id
) bbb,

(
    select c.id, c.Lat latGrid,c.Lon lonGrid,c.altitude_mean altGrid,c.altitude_max altMaxGrid,c.altitude_min altMinGrid,(c.altitude_max - c.altitude_min) as altRange
	from m_grid c
) ccc

where aa.id= bbb.id and aa.id = ccc.id order by aa.id




----------------------------
---全疆山地 plot尺度 加经纬度和气候信息 (气候指标为后导入，原来的找不到)
select aa.*, bbb.*, ccc.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount
	from plantCountyAltitudeValidResultDistinct a, m_plant 
	where a.plant_id = m_plant.id  group by a.id
) aa,
(
	select bb.id, bb.lastregion, bb.MATgrid, bb.MAPgrid, bb.geomor, bb.chinasoilcode, bb.ussoilcode, bb.ph+3 as ph,
		 bb.latitude, bb.longitude, bb.altitude, bb.altitudeGPS, bb.MAT, bb.MAP, bb.Im1955, bb.PET, bb.AET, bb.MTCM, bb.MTWM, bb.WI, bb.CI,
	cc.plot, cc.speciesCount, cnGenusCount, cnFamilyCount

	from
	(
		select a.id, a.lastregion, a.MAT MATgrid, a.MAP*10 as MAPgrid, a.geomor, a.chinasoilcode, a.ussoilcode, a.ph+3 as ph, b.plot,b.latitude, b.longitude, b.altitude, b.altitudeGPS, c.MAT, c.MAP, c.Im1955, c.PET, c.AET, c.MTCM, c.MTWM, c.WI, c.CI 
		from m_grid a join XinJiangPlot.dbo.Environment b
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
	where bb.plot = cc.plot
) bbb,

(
    select c.id, c.Lat latGrid,c.Lon lonGrid,c.altitude_mean altGrid,c.altitude_max altMaxGrid,c.altitude_min altMinGrid,(c.altitude_max - c.altitude_min) as altRange
	from m_grid c
) ccc

where aa.id= bbb.id and aa.id=ccc.id order by aa.id




---全疆山地栅格平均 加经纬度和气候信息 (气候指标为后导入，原来的找不到)

select aa.*, bbb.*,ccc.* from

        (
select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount
	from plantCountyAltitudeValidResultDistinct a, m_plant 
	where a.plant_id = m_plant.id  group by a.id
) aa,
(

select bb.id, avg(bb.lastregion) lastregion, avg(bb.MATgrid) MATgrid, avg(bb.MAPgrid*10) MAPgrid, avg(bb.geomor) geomor, avg(bb.chinasoilcode) chinasoilcode, avg(bb.ussoilcode) ussoilcode, avg(bb.ph) ph, avg(1.0*cc.speciesCount) speciesCount, avg(1.0*cc.cnGenusCount) cnGenusCount, avg(1.0*cc.cnFamilyCount) cnFamilyCount 
	, avg(bb.latitude) avglatitude, avg(bb.longitude) avgLongitude, avg(bb.altitude) avgAltitude, avg(bb.altitudeGPS) avgAltitudeGPS, avg(bb.MAT) avgMAT, avg(bb.MAP) avgMAP, avg(bb.Im1955) avgIm1955, avg(bb.PET) avgPET, avg(bb.AET) avgAET, avg(bb.MTCM) avgMTCM, avg(bb.MTWM) avgMTWM, avg(bb.WI) avgWI, avg(bb.CI) avgCI
        from

	(
		select a.id, a.lastregion, a.MAT MATgrid, a.MAP MAPgrid, a.geomor, a.chinasoilcode, a.ussoilcode, a.ph+3 as ph, b.plot,b.latitude, b.longitude,b.altitude, b.altitudeGPS, c.MAT, c.MAP, c.Im1955, c.PET, c.AET, c.MTCM, c.MTWM, c.WI, c.CI 
		from m_grid a join XinJiangPlot.dbo.Environment b
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
) bbb,
(
    select c.id, c.Lat latGrid,c.Lon lonGrid,c.altitude_mean altGrid,c.altitude_max altMaxGrid,c.altitude_min altMinGrid,(c.altitude_max - c.altitude_min) as altRange
	from m_grid c
) ccc
where aa.id= bbb.id and aa.id=ccc.id



--------------

---计算种库,全疆森林,样地尺度,不含环境信息.
select aa.*, cc.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount
	from plantCountyAltitudeValidResultDistinct a, m_plant 
	where a.plant_id = m_plant.id  group by a.id
) aa,
(
	select a.id,b.plot from m_grid a join XinJiangPlot.dbo.Environment b
	on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
	and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
) bb,
(
	select z.plot, count(distinct(z.species)) speciesCount, count(distinct(z.cnGenus)) cnGenusCount,count(distinct(z.cnFamily)) cnFamilyCount
	from 
	
	(
	
	select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  
	from m_plant a, XinJiangPlot.dbo.shrubandgrass b, XinJiangPlot.dbo.environment c 
	where  a.cnName = b.species and b.plot =c.plot 
	
	union all
	
	select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  
	from m_plant a, XinJiangPlot.dbo.arbor b,  XinJiangPlot.dbo.environment c 
	where  a.cnName = b.species and  b.plot =c.plot 
	
	) z group by z.plot
) cc
where aa.id= bb.id and bb.plot = cc.plot order by aa.id


----计算种库按照栅格平均(全疆山地),不含环境信息
select aa.*, bbb.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount 
	from plantCountyAltitudeValidResultDistinct a, m_plant 
	where a.plant_id = m_plant.id  group by a.id
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
		
		select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  
		from m_plant a, XinJiangPlot.dbo.shrubandgrass b, XinJiangPlot.dbo.environment c 
		where  a.cnName = b.species and b.plot =c.plot 
		
		union all
		
		select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  
		from m_plant a, XinJiangPlot.dbo.arbor b,  XinJiangPlot.dbo.environment c 
		where  a.cnName = b.species and  b.plot =c.plot 
		
		) z group by z.plot
	) cc
	where bb.plot = cc.plot group by bb.id
) bbb

where aa.id= bbb.id order by aa.id


------------

----计算种库按照栅格平均(全疆针叶林)，不含环境信息
select aa.*, bbb.*,ccc.*
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

where aa.id= bbb.id
order by aa.id


------





~~~~~~~~~~~~~
搜Total_pe
SELECT syscolumns.name,systypes.name,syscolumns.isnullable,
syscolumns.length
FROM syscolumns, systypes
WHERE syscolumns.xusertype = systypes.xusertype
AND syscolumns.id = object_id('你的表名')


select* from M_climate
select * from M_grid
select * from PlotPlant
select * from tempplotclimate order by ID
select * from XinjiangPlot
select * from environment order by plot
select plotNo, plot from environment order by plot
select * from plotClimate_tang
select * from environmentBackup
select * from environmentIndex
select* from plotDistribution
select * from temp
select top 1 * from plantCountyAltitudeValidResultDistinct
select * from XinjiangPlot
select * from veget
select * from regiongrid
select * from plotplant
select * from plantdumb
select * from plantbodysize
select * from M_TMean
select * from grasslandplot
select * from grasslandPlantCorrect

select * from allType
select * from testdistribution
select * from plantdumb
select * from M_TMean
select * from allType



((--TC18 没有丰富度信息
select * from arbor where plot like '%TC18%'
select * from shrubandgrass where plot = 'TC18'

select z.plot, count(distinct(z.species)) speciesCount, count(distinct(z.cnGenus)) cnGenusCount,count(distinct(z.cnFamily)) cnFamilyCount from 
		
		(
		
		select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.shrubandgrass b, XinJiangPlot.dbo.environment c where  a.cnName = b.species and b.plot =c.plot 
		
		union all
		
		select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from m_plant a, XinJiangPlot.dbo.arbor b,  XinJiangPlot.dbo.environment c where  a.cnName = b.species and  b.plot =c.plot 
		
		) z group by z.plot
		
		
select a.id, a.lastregion, a.MAT MATgrid, a.MAP MAPgrid, a.geomor, a.chinasoilcode, a.ussoilcode, a.ph+3 as ph, b.plot,b.latitude, b.longitude,b.altitude, c.MAT, c.MAP, c.Im1955, c.PET, c.AET, c.MTCM, c.MTWM, c.WI, c.CI 
from m_grid a join XinJiangPlot.dbo.Environment b
on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
join XinJiangPlot.dbo.plotClimate_tang c on
b.plot = c.plot
))



select lastaa.*, lastbb.* from 
(
select aa.gridPlantCount, aa.gridGenusCount, aa.gridFamilyCount, bbb.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount
	from plantCountyAltitudeValidResultDistinct a, m_plant 
	where a.plant_id = m_plant.id  group by a.id
) aa,
(
	select bb.id, bb.plot, bb.lastregion, bb.MATgrid, bb.MAPgrid, bb.geomor, bb.chinasoilcode, bb.ussoilcode, bb.ph,
		 bb.latitude, bb.longitude, bb.altitude, bb.MAT, bb.MAP, bb.Im1955, bb.PET, bb.AET, bb.MTCM, bb.MTWM, bb.WI, bb.CI
		 avg(bb.lastregion) lastregion, avg(bb.MATgrid) MATgrid, avg(bb.MAPgrid) MAPgrid, avg(bb.geomor) geomor, avg(bb.chinasoilcode) chinasoilcode, avg(bb.ussoilcode) ussoilcode, avg(bb.ph) ph, avg(1.0*cc.speciesCount) speciesCount, avg(1.0*cc.cnGenusCount) cnGenusCount, avg(1.0*cc.cnFamilyCount) cnFamilyCount 
	, avg(bb.latitude) avglatitude, avg(bb.longitude) avgLongitude, avg(bb.altitude) avgAltitude, avg(bb.MAT) avgMAT, avg(bb.MAP) avgMAP, avg(bb.Im1955) avgIm1955, avg(bb.PET) avgPET, avg(bb.AET) avgAET, avg(bb.MTCM) avgMTCM, avg(bb.MTWM) avgMTWM, avg(bb.WI) avgWI, avg(bb.CI) avgCI
	from
	(
		a.id, b.plot,b.latitude, b.longitude,b.altitude, c.MAT, c.MAP, c.Im1955, c.PET, c.AET, c.MTCM, c.MTWM, c.WI, c.CI 
		from m_grid a join XinJiangPlot.dbo.Environment b
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
		join XinJiangPlot.dbo.plotClimate_tang c on
		b.plot = c.plot
		
		
		
	) bb
) bbb

where aa.id= bbb.id
) lastaa,

(
select id, avg(1.0 * speciesCount) speciesCount, avg(1.0 * cnGenusCount) cnGenusCount, avg(1.0 * cnFamilyCount) cnFamilyCount
from
(
	select bb.id id, 
	cc.plot, speciesCount, cnGenusCount, cnFamilyCount

	from
	(
		select a.id, a.lastregion, a.MAT MATgrid, a.MAP MAPgrid, a.geomor, a.chinasoilcode, a.ussoilcode, a.ph+3 as ph, b.plot,b.latitude, b.longitude,b.altitude, c.MAT, c.MAP, c.Im1955, c.PET, c.AET, c.MTCM, c.MTWM, c.WI, c.CI 
		from m_grid a join XinJiangPlot.dbo.Environment b
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
	where bb.plot = cc.plot
) bbb group by id
) lastbb
where lastaa.id=lastbb.id and lastcc.id= lastaa.id

select distinct(a.id)
		from m_grid a join XinJiangPlot.dbo.Environment b
		on a.lon + 0.05 >= b.longitude and a.lon-0.05 <  b.longitude
		and a.lat + 0.05 >= b.latitude and a.lat-0.05 <  b.latitude
		join XinJiangPlot.dbo.plotClimate_tang c on
		b.plot = c.plot




##plotPool new climate data updated
select * from plotClimateNew
select * from plotPool
select a.plot,a.altitude,b.altitude from plotClimateNew a, plotPool b where a.plot = b.plot and a.altitude <> b.altitude 
select a.plot,a.MAT,b.MAT from plotClimateNew a, plotPool b where a.plot = b.plot and a.MAT <> b.MAT 
select a.plot,a.MAP,b.MAP from plotClimateNew a, plotPool b where a.plot = b.plot and a.MAP <> b.MAP 

--update plotPool set altitude = plotClimateNew.altitude from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set MAT = plotClimateNew.MAT from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set MAP = plotClimateNew.MAP from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set Im = plotClimateNew.Im1955 from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set PET = plotClimateNew.PET from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set AET = plotClimateNew.AET from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set MTCM = plotClimateNew.MTCM from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set MTWM = plotClimateNew.MTWM from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set WI = plotClimateNew.WI from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set CI = plotClimateNew.CI from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set GST = plotClimateNew.GST from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set GSP = plotClimateNew.GSP from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set ABT = plotClimateNew.ABT from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set Im1948 = plotClimateNew.Im1948 from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set APE = plotClimateNew.APE from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot
--update plotPool set APE_Ratio = plotClimateNew.APE_Ratio from plotPool, plotClimateNew where plotPool.plot=plotClimateNew.plot

##gridPool new climate data updated
select * from gridpool

--wrong##update gridPool set gridPool.GST=avg(plotpool.GST) from gridpool, plotpool where plotpool.tyoe=F group by plotpool.id

--update gridPool set gridPool.latitude=b.avgvalue from gridpool,(select id, avg(latitude) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.latitude=b.avgvalue from gridpool,(select id, avg(latitude) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.longitude=b.avgvalue from gridpool,(select id, avg(longitude) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.longitude=b.avgvalue from gridpool,(select id, avg(longitude) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.altitude=b.avgvalue from gridpool,(select id, avg(altitude) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.altitude=b.avgvalue from gridpool,(select id, avg(altitude) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.MAT=b.avgvalue from gridpool,(select id, avg(MAT) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.MAT=b.avgvalue from gridpool,(select id, avg(MAT) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.MAP=b.avgvalue from gridpool,(select id, avg(MAP) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.MAP=b.avgvalue from gridpool,(select id, avg(MAP) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.Im=b.avgvalue from gridpool,(select id, avg(Im) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.Im=b.avgvalue from gridpool,(select id, avg(Im) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.PET=b.avgvalue from gridpool,(select id, avg(PET) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.PET=b.avgvalue from gridpool,(select id, avg(PET) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.AET=b.avgvalue from gridpool,(select id, avg(AET) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.AET=b.avgvalue from gridpool,(select id, avg(AET) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.MTCM=b.avgvalue from gridpool,(select id, avg(MTCM) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.MTCM=b.avgvalue from gridpool,(select id, avg(MTCM) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.MTWM=b.avgvalue from gridpool,(select id, avg(MTWM) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.MTWM=b.avgvalue from gridpool,(select id, avg(MTWM) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.WI=b.avgvalue from gridpool,(select id, avg(WI) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.WI=b.avgvalue from gridpool,(select id, avg(WI) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.CI=b.avgvalue from gridpool,(select id, avg(CI) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.CI=b.avgvalue from gridpool,(select id, avg(CI) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.GST=b.avgvalue from gridpool,(select id, avg(GST) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.GST=b.avgvalue from gridpool,(select id, avg(GST) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.GSP=b.avgvalue from gridpool,(select id, avg(GSP) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.GSP=b.avgvalue from gridpool,(select id, avg(GSP) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.ABT=b.avgvalue from gridpool,(select id, avg(ABT) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.ABT=b.avgvalue from gridpool,(select id, avg(ABT) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.Im1948=b.avgvalue from gridpool,(select id, avg(Im1948) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.Im1948=b.avgvalue from gridpool,(select id, avg(Im1948) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.APE=b.avgvalue from gridpool,(select id, avg(APE) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.APE=b.avgvalue from gridpool,(select id, avg(APE) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.APE_Ratio=b.avgvalue from gridpool,(select id, avg(APE_Ratio) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.APE_Ratio=b.avgvalue from gridpool,(select id, avg(APE_Ratio) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'

--update gridPool set gridPool.familyGrid=b.avgvalue from gridpool,(select id, avg(familyGrid) avgvalue from plotpool where plotpool.type='F' group by id) b where gridpool.id = b.id and gridPool.type='F'
--update gridPool set gridPool.familyGrid=b.avgvalue from gridpool,(select id, avg(familyGrid) avgvalue from plotpool where plotpool.type='G' group by id) b where gridpool.id = b.id and gridPool.type='G'
