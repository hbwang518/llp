

#乔木平均胸径&最大胸径作为个体大小   <----treeBS
select a.*, b.*, d.Gridcount from plantgridrange a,  
(select species, avg(breast/3.14) bodysizeavg, max(breast/3.14) bodysizemax from arbor 
group by species) b, m_plant c, plantlonlat d 
where c.id = a.plant_id and b.species = c.cnname and d.plant_id = a.plant_id order by a.plant_id



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



##植物按照平均和最大高度               <----grassBS
select a.*, b.*, d.Gridcount from plantgridrange a,  
(select species, avg(AveHeight) heightavg, max(AveHeight) heightmax from grasslandPlot group by species) b, m_plant c, plantlonlat d 
where c.id = a.plant_id and b.species = c.cnname and d.plant_id = a.plant_id order by a.plant_id



##区域:按照平均和最大高度   <----gridgrassHeight
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