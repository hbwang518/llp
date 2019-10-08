select * from plantXJ
select * from allType
select * from eremoChina where typeWH is null
select * from eremoChina where woody is null and herbal is null
--update eremoChina set typewh='w' where woody='y' 
--update eremoChina set typewh='h' where herbal='y' 

select * from eremoChina where latinName in (select latinName from medi.dbo.plantxj)

--update eremoChina set inLi = '1' where latinName in (select latinName from medi.dbo.plantxj)


select * from eremoChina where inLi is not null and inXJ is null

select top 100 * from plantCountyAltitudeValidResultDistinct 

select * from medi.dbo.plantxj
select * from eremoChina

select a.id, a.plant_id, a.altitude_min, a.altitude_max, b.cnname, b.latinname from plantCountyAltitudeValidResultDistinct a, medi.dbo.plantxj b, eremoChina c
where b.latinName = c. latinname and b.id= a.plant_id
order by a.id, a.plant_id




#######The second time#####
eremoChina2

select * from eremoChina2 where latinName in (select latinName from medi.dbo.plantxj)

--update eremoChina2 set inLi = '1' where latinName in (select latinName from medi.dbo.plantxj)

select * from eremoChina2 where inLi is not null and inXJ is null

select a.id, a.plant_id, a.altitude_min, a.altitude_max, b.cnname, b.latinname from plantCountyAltitudeValidResultDistinct a, medi.dbo.plantxj b, eremoChina2 c
where b.latinName = c. latinname and b.id= a.plant_id
order by a.id, a.plant_id

select a.id, count(a.plant_id) from plantCountyAltitudeValidResultDistinct a, medi.dbo.plantxj b, eremoChina2 c
where b.latinName = c. latinname and b.id= a.plant_id
group by a.id
order by a.id