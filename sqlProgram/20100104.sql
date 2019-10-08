select Count(*) from 
(select plant_id from plantCountyAltitudeValidResultDistinct where id='') a,
(select plant_id from plantCountyAltitudeValidResultDistinct where id='') b,
where a.Plant_id=b.Plant_id

select  * from grid_gridScope where gridSorensonHorizon > 0
select  * from grid_gridScope where gridSorensonVertical > 0

--update grid_gridScope set gridSorensonVertical = -1 where gridSorensonVertical is null

select * from grid_gridscope order by Grid_id
select * from PlantGridExtremum
select * from PlantLonLat
select * from PlantGridRange
select * from m_plant
select * from xinjiangplot order by id

select cngenus, count(cnname) a from m_plant group by cngenus order by a
select cnfamily, count(cnname) a from m_plant group by cnfamily order by a

