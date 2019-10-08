select id, cnName, lowAltitude, highaltitude, (highaltitude - lowAltitude) altOdds  from m_plant where lowaltitude > -1000 order by altOdds desc

select a.plant_id, b.cnName, Count(distinct(a.id)) idCount from plantCountyaltitudeValidResult a, m_plant b where a.plant_id = b.id group by a.plant_id,b.cnName order by idCount

select a.plant_id, b.cnName, Count(distinct(a.id)) idCount from plantCountyaltitudeValidResult a, m_plant b where a.plant_id = b.id group by a.plant_id,b.cnName order by idCount

select distinct(id), plant_id from plantCountyaltitudeValidResult

select count(*) from plantCountyaltitudeValidResult

select sum(Count(distinct(id)))  from plantCountyaltitudeValidResult group by plant_id having Count(distinct(id)) < 2500 

select sum(idCount) from
(
    select Count(distinct(id)) idCount, plant_id  from plantCountyaltitudeValidResult group by plant_id
) z where idCount >= 2500 and idCount < 5000

select sum(idCount) from
(
    select Count(distinct(id)) idCount, plant_id  from plantCountyaltitudeValidResult group by plant_id
) z where idCount >= 5000 and idCount < 10000

select sum(idCount) from
(
    select Count(distinct(id)) idCount, plant_id  from plantCountyaltitudeValidResult group by plant_id
) z where idCount >= 10000