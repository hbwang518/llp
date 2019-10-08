select a.cnName from m_plant a, plantCountyAltitudeValidResultDistinct b where a.id=b.plant_id and b.plant_id
in (select top 100 count(id) from plantCountyAltitudeValidResultDistinct group by id,plant_id )

select top 1 * from plantCountyAltitudeValidResultDistinct
select * from m_plant

select * from arbor where plot like '%XTS%'
select distinct(plot) from arbor where species = '西伯利亚落叶松'
select * from arbor where species = '西伯利亚落叶松' order by breast


select * from shrubAndGrass where speciesflag=2 order by plot
select COUNT(distinct(species)) from shrubAndGrass where speciesflag=2