use speciesRichnessXinJiang

select * from grid_gridScope

select a.id, avg(b.GridCount) meanGridCount, Count(*) plantCount
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b,
(   select id from m_plant,
	(
	        select latinGenus from m_plant group by latinGenus having Count(*) >=20
	) genus
where m_plant.latinGenus=genus.latinGenus
) z
where a.plant_id=b.plant_id and a.plant_id=z.id
group by a.id
order by a.id

select a.id, b.GridCount
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b,
(   select id from m_plant,
    (
            select latinGenus from m_plant group by latinGenus having Count(*) >=20
    ) genus
    where m_plant.latinGenus=genus.latinGenus
) z
where a.plant_id=b.plant_id and a.plant_id=z.id
order by a.id


select a.id, avg(log(b.GridCount)) meanGridCount, Count(*) plantCount
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.plant_id and a.id=32017
group by a.id
order by a.id

select a.id, log(b.GridCount)
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.plant_id and a.id=32017
order by a.id

--º∆À„skewness
-- mean(power((xi-xm),3))/power(mean((power(xi-xm),2)),1.5)

select a.id, (sum(power(log(b.GridCount)-9.3210436639619552),3))/173--/(power(sum(power(log(b.GridCount)-9.3210436639619552),2))/173),1.5), 

from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.plant_id and a.id=32017
order by a.id

select a.id, sum( power((log(b.GridCount)-9.3210436639619552),3))/173 / power( ( sum( power((log(b.GridCount)-9.3210436639619552),2)) /173),1.5)

from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.plant_id and a.id=32017
group by a.id
order by a.id