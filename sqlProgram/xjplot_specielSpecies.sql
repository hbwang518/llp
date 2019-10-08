select plot, max(heightEye), Max(heightMeasured) from arborNeedle group by plot

select avg(heightEye), avg(heightMeasured) from arborNeedle


--select avg(heightEye) from arborNeedle where heightEye is not null and heightEye > 0

--select avg(heightEye) from arborNeedle 

select avg(heightEye), avg(heightMeasured) from arborNeedle

--avg height
select plot, avg(heightMeasured)
from
(
select plot, heightMeasured from arborNeedle where heightMeasured is not null 
union 
select plot, heightEye as heightMeasured from arborNeedle where (heightMeasured is null ) and heightEye is not null 
) z group by plot order by plot

--max height
select plot, max(heightMeasured)
from
(
select plot, heightMeasured from arborNeedle where heightMeasured is not null 
union 
select plot, heightEye as heightMeasured from arborNeedle where (heightMeasured is null ) and heightEye is not null 
) z group by plot order by plot

-- arborNeedle and heightMeasured is null
select * from arborNeedle where (heightMeasured is null or heightMeasured <= 0) and (heightEye is null or heightEye <= 0)

select plot, avg(breast)/3.14, max(breast)/3.14 from arborNeedle group by plot order by plot

select plot, sum(3.14*(breast/(2*3.14))*(breast/(2*3.14))/10000) from arborNeedle group by plot order by plot

select plot,count(distinct(species)) from shrubandgrassneedle group by plot order by plot

select * from arborneedle where plot ='YC17' or plot = 'YC2'
select * from environmentneedle where plot ='YC17' or plot = 'YC2'

select distinct(b.countyCode) from shrubAndGrass a, environment b where a.plot = b.plot

select distinct(b.countyCode) from  environmentNeedle b 

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.CountyCode='1' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.countyCode<>'1')
select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.CountyCode='2' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.countyCode<>'2')

select distinct(b.siteCode) from  environmentNeedle b 

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='1' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode<>'1')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='2' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode<>'2')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='3' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode<>'3' and a.species is not null)

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='4' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode<>'4')

---

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and (b.siteCode='1' or b.siteCode='2') and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and (b.siteCode='3' or b.siteCode='4'))

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='2' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='3' and a.species is not null)

----

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='1' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='2')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='1' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='3')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='1' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='4')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='2' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='1')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='2' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='3')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='2' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='4')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='3' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='1')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='3' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='2')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='3' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='4')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='4' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='1')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='4' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='2')

select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='4' and a.species not in (select distinct(a.species) from shrubAndGrassNeedle a,environmentNeedle b where a.plot = b.plot and b.siteCode='3')

select * from environmentNeedle