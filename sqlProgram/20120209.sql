-----------------
picea and juniperus distribution before and after altitude
select * from plantonlycounty where plant_id=58
select * from plantonlycounty where plant_id=85
select * from PlantCountyAltitudeValidResultDistinct where plant_id=58
select * from PlantCountyAltitudeValidResultDistinct where plant_id=85
----------------


----------------
select * from PlantCountyAltitudeValidResult where plant_id=58
select * from PlantCountyAltitudeValidResult where plant_id=85

select * from gridspecies
select * from gridspecies01
select * from distinctPlantCounty where plant_id=58
select * from plantCounty where plant_id=58
select * from plantcounty


select * from plantcounty where plant_id = 58
select * from plantcounty where plant_id = 1539
select a.plant_id, a.cnName, b.area, b.id from plantCounty a, m_area b where a.distribution = b.id and a.plant_id = 1539
select distinct(county_code) from distinctPlantCounty where plant_id = 1539
select * from distinctPlantCounty where plant_id = 230


select * from PlantCountyAltitudeValidResultDistinct where plant_id=58
select * from PlantCountyAltitudeValidResultDistinct where plant_id=85
select * from m_plant where id = 85