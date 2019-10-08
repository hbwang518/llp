SELECT * FROM GridSpecies02

SELECT * FROM GridSpecies08

SELECT AVG(SPECIES) FROM GridSpecies02

SELECT AVG(SPECIES) FROM GridSpecies08

select * from grid02

select * from grid08

select b.Id, a.plant_id, a.county_code,a.lowAltitude PlantLowAltitude,a.highAltitude PlantHighAltitude,b.altitude_min GridAltitudeMin,b.altitude_max GridAltitudeMax
from distinctPlantCounty02 a ,Grid02 b, m_plant c
where a.plant_id=c.id and b.county=a.county_code and c.culAndWildFlag=1 

select b.Id, a.plant_id, a.county_code,a.lowAltitude PlantLowAltitude,a.highAltitude PlantHighAltitude,b.altitude_min GridAltitudeMin,b.altitude_max GridAltitudeMax
from distinctPlantCounty02 a ,Grid08 b, m_plant c
where a.plant_id=c.id and b.county=a.county_code and c.culAndWildFlag=1 

select * from PlantCountyAltitudeResult08

select * from PlantCountyAltitudeResult02