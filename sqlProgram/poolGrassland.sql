----计算种库按照栅格平均(全疆草地) 加经纬度和气候信息
select aa.*, bbb.*
from 
(
	select a.id, count(plant_id) gridPlantCount, count(distinct(cnGenus)) gridGenusCount, count(distinct(cnFamily)) gridFamilyCount  
	from plantCountyAltitudeValidResultDistinct a, m_plant 
	where a.plant_id = m_plant.id  
	group by a.id
) aa,
(
	select bb.id, cc.plot, speciesCount, cnGenusCount, cc.cnFamilyCount
	, bb.latitude, bb.longitude, bb.MAT, bb.MAP, bb.Im1955, bb.PET, bb.AET
        from
	(
		select a.id,b.plot,b.latitude, b.longitude, b.MAT, b.MAP, b.Im1955, b.PET, b.AET from m_grid a join grasslandEnvironment b
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
) bbb

where aa.id= bbb.id order by aa.id

