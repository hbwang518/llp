select *from Grid_GridScope
select * from plantGridRange
select * from plantlonlat

select plant_id, GridCount from plantlonlat where plant_id < 7000 order by GridCount

select * from m_plant

--alter table m_plant add quartile int

update m_plant set quartile = 1 where id in (select top 870 plant_id from plantlonlat where plant_id < 7000 order by GridCount)

update m_plant set quartile = 2 where id in (select top 870 plant_id from plantlonlat where plant_id < 7000 and plant_id not in (select top 870 plant_id from plantlonlat where plant_id < 7000 order by GridCount) order by GridCount)

update m_plant set quartile = 3 where id in (select top 870 plant_id from plantlonlat where plant_id < 7000 and plant_id not in (select top 1740 plant_id from plantlonlat where plant_id < 7000 order by GridCount) order by GridCount)

update m_plant set quartile = 4 where id in (select top 870 plant_id from plantlonlat where plant_id < 7000 and plant_id not in (select top 2610 plant_id from plantlonlat where plant_id < 7000 order by GridCount) order by GridCount)


SELECT * FROM PlantCountyAltitudeValidResultQuartile01
SELECT count(id) FROM PlantCountyAltitudeValidResultQuartile02
SELECT count(id) FROM PlantCountyAltitudeValidResultQuartile03
SELECT count(id) FROM PlantCountyAltitudeValidResultQuartile04

select a.*, b.* from plantlonlat a, m_plant b where a.plant_id=b.id