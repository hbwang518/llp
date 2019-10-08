select * from distinctplantcounty02


select * from distinctPlantCounty02
*/
select plant_id,county_code,lowAltitude,highAltitude into distinctPlantCounty02 from
( 
	--取单海拔
	select M_Plant.id plant_id,w.county_code,M_Plant.lowAltitude,M_Plant.highAltitude from M_Plant left join 
	(
		--取county和area中的county
		select distinct(plant_id) plant_id ,distribution county_code from plantCounty where distribution in (select code from m_county) and plant_id not in (select plant_id from MultiAltitude)
		union
		select distinct( a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution = b.area_id and a.distribution in (select id from m_area) and a.plant_id not in (select plant_id from MultiAltitude)
                --select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution = b.area_id and a.plant_id not in (select plant_id from MultiAltitude)
                --select distinct(a.plant_id) plant_id,b.county_code county_code from plantCounty a,areaToCounty b where a.distribution in (select id from m_area) and a.plant_id not in (select plant_id from MultiAltitude)
	) as w on M_Plant.id = w.plant_id  	
) as z



--programme forth
select * from grid02
--m_grid 表的county 和 piaoCountyCode 的id关联， piaoCountyCode 的 code (邮政编码) 和 distinctPlantCounty的 code 邮政编码 关联 所以 distinctPlantCounty就和m_grid建立的联系
select b.Id, a.plant_id, a.county_code,a.lowAltitude PlantLowAltitude,a.highAltitude PlantHighAltitude,b.altitude_min GridAltitudeMin,b.altitude_max GridAltitudeMax into PlantCountyAltitudeResult07
from distinctPlantCounty02 a ,Grid07 b, m_plant c
where a.plant_id=c.id and b.county=a.county_code and c.culAndWildFlag=1 


--programme fifth 得到PlantCountyAltitudeValidResult，根据海拔信息过滤出有效数据


select * into PlantCountyAltitudeValidResult07 from PlantCountyAltitudeResult07 
where 
(	PlantLowAltitude < -8000 
	or (GridAltitudeMin >= PlantLowAltitude and GridAltitudeMin <= PlantHighAltitude ) 
	or (GridAltitudeMax >= PlantLowAltitude and GridAltitudeMax <= PlantHighAltitude ) 
	or (GridAltitudeMin <= PlantLowAltitude and GridAltitudeMax >= PlantHighAltitude )
)

--programme sixth	

CREATE INDEX PlantCountyAltitudeValidResult07_Plant_id ON PlantCountyAltitudeValidResult07 (plant_id)
CREATE INDEX PlantCountyAltitudeValidResult07_Id ON PlantCountyAltitudeValidResult07 (Id)
CREATE INDEX plant_index  ON M_Plant  (id)

select Id,count(distinct(plant_id)) Species,count(distinct(cnFamily)) Family,count(distinct(cnGenus)) Genus into a0  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id) w group by w.Id 
select Id,count(distinct(plant_id)) Species12,count(distinct(cnFamily)) Family12,count(distinct(cnGenus)) Genus12 into a1  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and (b.yearCode ='2' or b.yearCode ='1')) w group by w.Id 
select Id,count(distinct(plant_id)) Species3,count(distinct(cnFamily)) Family3,count(distinct(cnGenus)) Genus3 into a2  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and b.yearCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesWoody,count(distinct(cnFamily)) FamilyWoody,count(distinct(cnGenus)) GenusWoody into a3  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and (b.typeCode ='1' or b.typeCode ='3')) w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesHerb,count(distinct(cnFamily)) FamilyHerb,count(distinct(cnGenus)) GenusHerb into a4  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and (b.typeCode ='2' or b.typeCode ='4')) w group by w.Id
select Id,count(distinct(plant_id)) SpeciesFern,count(distinct(cnFamily)) FamilyFern,count(distinct(cnGenus)) GenusFern into a5  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and b.menCode ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesGym,count(distinct(cnFamily)) FamilyGym,count(distinct(cnGenus)) GenusGym into a6  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and b.menCode ='2') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesAng,count(distinct(cnFamily)) FamilyAng,count(distinct(cnGenus)) GenusAng into a7  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and b.menCode ='3') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesDan,count(distinct(cnFamily)) FamilyDan,count(distinct(cnGenus)) GenusDan into a8 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and b.endangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesEph,count(distinct(cnFamily)) FamilyEph,count(distinct(cnGenus)) GenusEph into a9 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and b.ephemeralFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesEnd,count(distinct(cnFamily)) FamilyEnd,count(distinct(cnGenus)) GenusEnd into a10 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and b.endemismFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesXJDan,count(distinct(cnFamily)) FamilyXJDan ,count(distinct(cnGenus)) GenusXJDan into a11 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and b.xjEndangeredFlag ='1') w group by w.Id 
select Id,count(distinct(plant_id)) SpeciesHal,count(distinct(cnFamily)) FamilyHal,count(distinct(cnGenus)) GenusHal into a12 from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult07 a,M_Plant b where a.plant_id=b.id and b.halophilousFlag ='1') w group by w.Id 
			

--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a13  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.yearCode ='1') w group by w.Id 
--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a14  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.yearCode ='2') w group by w.Id 																							 
--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a15  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.typeCode ='1') w group by w.Id 
--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a16  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.typeCode ='2') w group by w.Id
--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a17  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.typeCode ='3') w group by w.Id 
--select Id,count(distinct(plant_id)) plant_id,count(distinct(cnFamily)) cnFamily ,count(distinct(cnGenus)) cnGenus into a18  from (select a.Id,b.id plant_id,b.cnFamily,b.cnGenus from PlantCountyAltitudeValidResult02 a,M_Plant b where a.plant_id=b.id and b.typeCode ='4') w group by w.Id


CREATE INDEX plant_ida0   ON a0  (species)
CREATE INDEX plant_ida1   ON a1  (species12)
CREATE INDEX plant_ida2   ON a2  (species3)
CREATE INDEX plant_ida3   ON a3  (specieswoody)
CREATE INDEX plant_ida4   ON a4  (speciesherb)
CREATE INDEX plant_ida5   ON a5  (speciesfern)
CREATE INDEX plant_ida6   ON a6  (speciesgym)
CREATE INDEX plant_ida7   ON a7  (speciesang)
CREATE INDEX plant_ida8   ON a8  (speciesdan)
CREATE INDEX plant_ida9   ON a9  (specieseph)
CREATE INDEX plant_ida10  ON a10 (speciesend)
CREATE INDEX plant_ida11  ON a11 (speciesxjdan)
CREATE INDEX plant_ida12  ON a12 (specieshal)

--CREATE INDEX plant_ida13   ON a13  (plant_id)
--CREATE INDEX plant_ida14   ON a14  (plant_id)
--CREATE INDEX plant_ida15   ON a15  (plant_id)
--CREATE INDEX plant_ida16  ON a16 (plant_id)
--CREATE INDEX plant_ida17  ON a17 (plant_id)
--CREATE INDEX plant_ida18  ON a18 (plant_id)	
 

select z.id as id, a0.species,a0.genus,a0.family,a1.species12,a1.genus12,a1.family12,a2.species3,a2.genus3,a2.family3,
a3.specieswoody,a3.genuswoody,a3.familywoody,a4.speciesherb,a4.genusherb,a4.familyherb,a5.speciesfern,a5.genusfern,a5.familyfern,
a6.speciesGym,a6.genusGym,a6.familygym,a7.speciesAng,a7.genusAng,a7.familyAng,a8.speciesDan,a8.genusDan,a8.familyDan,
a9.speciesEph,a9.genusEph,a9.familyEph,a10.speciesEnd,a10.genusEnd,a10.familyEnd,a11.speciesxjDan,a11.genusxjDan,a11.familyxjDan,
a12.speciesHal,a12.genusHal,a12.familyHal
into GridSpecies07 from Grid07 z	
left join a0  on z.id=a0.id
left join a1  on z.id=a1.id
left join a2  on z.id=a2.id
left join a3  on z.id=a3.id
left join a4  on z.id=a4.id
left join a5  on z.id=a5.id
left join a6  on z.id=a6.id
left join a7  on z.id=a7.id
left join a8  on z.id=a8.id
left join a9  on z.id=a9.id
left join a10 on z.id=a10.id
left join a11 on z.id=a11.id
left join a12 on z.id=a12.id
order by z.id

/*select z.id as id, a13.*,a14.*,a15.*,a16.*,a17.*,a18.* from m_grid z	
left join a13  on z.id=a13.id
left join a14  on z.id=a14.id
left join a15  on z.id=a15.id
left join a16  on z.id=a16.id
left join a17  on z.id=a17.id
left join a18  on z.id=a18.id
order by z.id
*/


应该将这些气候等信息全部列入grid的主表里。
--select * from gridspecies02
--UPDATE Gridspecies02 set MAT=b.MAT, MAP=b.MAP, GST=b.GST, GSP=b.GSP from gridspecies02 a, climate02 b where a.id =b.grid

