

---Altay

select * into m_plantAltay from m_plant where id in 

(
select distinct(plant_Id) from plantcountyAltitudeValidResult a, m_grid 
where a.id=m_grid.id and m_grid.lastRegion=1 
)

select * from m_plantAltay

update m_plantAltay set lowAltitude = b.lowAltitude , highAltitude = b.highaltitude from m_plantAltay, nurbayaltitude b where m_plantAltay.id=b.plant_id and m_plantAltay.lowAltitude < -10000

select m_plantAltay.* from m_plantAltay, nurbayaltitude b where m_plantAltay.id=b.plant_id and m_plantAltay.lowAltitude < -10000


select * from m_plantAltay


---Tianshan

select * into m_plantTianshan from m_plant where id in 

(
select distinct(plant_Id) from plantcountyAltitudeValidResult a, m_grid 
where a.id=m_grid.id and m_grid.lastRegion=3
)

select * from m_plantTianshan

update m_plantTianshan set lowAltitude = b.lowAltitude , highAltitude = b.highaltitude from m_plantTianshan, nurbayaltitude b where m_plantTianshan.id=b.plant_id and m_plantTianshan.lowAltitude < -10000

select m_plantTianshan.* from m_plantTianshan, nurbayaltitude b where m_plantTianshan.id=b.plant_id and m_plantTianshan.lowAltitude < -10000


select * from m_plantTianshan


---Kunlunshan


select * into m_plantKunlun from m_plant where id in 

(
select distinct(plant_Id) from plantcountyAltitudeValidResult a, m_grid 
where a.id=m_grid.id and m_grid.lastRegion=4 
)

select * from m_plantKunlun

update m_plantKunlun set lowAltitude = b.lowAltitude , highAltitude = b.highaltitude from m_plantKunlun, nurbayaltitude b where m_plantKunlun.id=b.plant_id and m_plantKunlun.lowAltitude < -10000

select m_plantKunlun.* from m_plantKunlun, nurbayaltitude b where m_plantKunlun.id=b.plant_id and m_plantKunlun.lowAltitude < -10000


select * from m_plantKunlun


