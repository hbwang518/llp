select * from alltype

select * from m_plant
select * from plantXJworlddistribution
select * from listpowos 
select distinct(typecode) from m_plant

select * from m_plant a, listpowos b where a. id=b.id and (a.typecode= 1 or a.typecode =3)
select * from m_plant a, listpowos b where a. id=b.id and a.typecode= 2

select * from plantTNRS order by id

select * from altAdd order by id
select * from a0dem order by id


select * from animalbs order by id
select * from m_animal order by id
select * from animalCounty order by animal_id
select top 100 * from AnimalCountyAltitudeResult order by animal_id
select top 100 * from animalcountyaltitudevalidresult order by animal_id
select top 100 * from AnimalGridExtremum order by Grid_id
select top 100 * from AnimalGridRange order by Grid_id

select count(animal_id) from animalcountyaltitudevalidresult



--Huawei
select * from m_plant where del=0 and id < 7000 order by id

select * from m_plant where id not in
(
select id from m_plant where CHARINDEX(latinName, latinGenusOri) =0
)

select * from m_plant where id not in
(
select id from m_plant where left(latinName, charIndex(' ', latinName)) = latinGenusOri

) and id < 7000 and del = 0

SELECT id, minid, cnName, latinName, cnFamily, latinFamily, cnGenus, latinGenus, cnNameOri, latinNameOri, speciesFlag, cnFamilyOri, latinFamilyOri, cnGenusOri, latinGenusOri, del, latinNameFull, latinGenusFull, menClass, yearFlag, typeFlag, habitate, protectionValue, lowAltitude, highAltitude, culAndWildFlag, yearCode, typeCode, menCode, endangeredFlag, ephemeralFlag, endemismFlag, 
         xjEndangeredFlag, halophilousFlag, quartile, RA, extentWE, extentNS, heightmaxF, heightminF, heightmeanF, TDWG3, heightmaxFori, heightminFori, heightmeanFori, RAori, ExtentWEori, ExtentNSori, lowAltitudeOri, highAltitudeOri, endemismFlagOri, xjEndangeredFlagOri
FROM  m_plant
WHERE (id NOT IN
             (SELECT id
            FROM  m_plant AS m_plant_1
            WHERE (LEFT(latinName, CHARINDEX(' ', latinName)) = latinGenus)))

--update m_plant set latinGenus=left(latinName, charIndex(' ', latinName))
--update m_plant set latinGenus=latinGenusOri
--update m_plant set cnGenus=cnGenusOri
--update m_plant set cnFamily=cnFamilyOri
--update m_plant set latinFamily=latinFamilyOri
--372 rows
Astragalus
Astragalus hebecarpus


select * from m_plant where left(latinName, charIndex(' ', latinName)) = latinGenusOri 

select * from m_plant where CHARINDEX(latinName, latinFamilyOri) =0

select latinName, left(latinName, charIndex(' ', latinName)) from m_plant 


select * from listPOWOs order by id

--Huawei
select * from m_plant where id < 7000 order by id   del=0 and
select * from listPOWOs

select * from m_plant a, listPOWOs b where a.id=b.id and a.id < 7000 and (a.culandwildflag =1 or a.culandwildflag=3) order by a.del, a.id

select * from m_plant a, listPOWOs b where a.id=b.id and a.id < 7000 and (a.culandwildflag =1 or a.culandwildflag=3) and a.del = 0 order by a.id


select * from m_plant where del <> 0
select * from m_plant where lowaltitude < 0 order by lowaltitude

select * from m_plant where lowaltitude < 0 order by lowaltitude
select * from m_plant0 where lowaltitude < 0 order by lowaltitude
select * from m_plant1 where lowaltitude < 0 order by lowaltitude
select * from m_plant20191008 where lowaltitude < 0 order by lowaltitude


select sum(id) from listPOWOs
select sum(id) from m_plant where id < 7000 

select * from m_grid
select * from namechange order by id

--Huawei final
--by species
--plant在excel中区分野生与栽培
select * from m_plant a, listPOWOs b where a.id=b.id and a.id < 7000 and  a.del = 0 order by a.culandwildflag, a.id
--动物,
select * from m_animal where del = 0 order by id 

--by grid
--plant

--mammal

--bird

