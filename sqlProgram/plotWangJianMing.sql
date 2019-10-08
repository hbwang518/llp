select a.id, b.id
		from m_grid a join wangjianmingPlot b
		on a.lon + 0.05 >= b.lon and a.lon-0.05 <  b.lon
		and a.lat + 0.05 >= b.lat and a.lat-0.05 <  b.lat


select a.id, b.id, count(distinct(c.plant_id))
from m_grid a join wangjianmingPlot b
on a.lon + 0.05 >= b.lon and a.lon-0.05 <  b.lon
		and a.lat + 0.05 >= b.lat and a.lat-0.05 <  b.lat
join plantCountyAltitudeValidResultDistinct c on a.id=c.id
group by a.id, b.id
order by b.id




select plot,species,count(species) from arbor group by plot,species order by plot

select * from grasslandplot
select * from grasslandbiomass
select * from grasslandenvironment

select distinct(plot) from shrubAndGrass where species like '%ил%'
select distinct(plot) from arbor where species like '%ил%'
select * from shrubAndGrass where plot in (select distinct(plot) from arbor where species like '%ил%')
select * from arbor where species like '%ил%'
select * from arbor where plot in (select distinct(plot) from arbor where species like '%ил%')
select * from environment where plot in (select distinct(plot) from arbor where species like '%ил%')
