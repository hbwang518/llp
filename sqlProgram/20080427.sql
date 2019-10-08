select * from shrubandgrass order by sPlotNo

select count(distinct(a.species)) from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrass b, environment c where b.plot =c.plot and c.sitecode=5 group by c.plot

select count(distinct(b.cnName)) from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrass b, environment c, arbor d where  a.cnName = b.species and a.cnName=d.species and b.plot =c.plot and c.sitecode=5 group by c.plot

select count(distinct(z.species)), count(distinct(z.cnGenus)),count(distinct(z.cnFamily)) from 

(

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrass b, environment c where  a.cnName = b.species and b.plot =c.plot and c.sitecode=5 

union all

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from speciesRichnessXinJiang.dbo.m_plant a, arbor b,  environment c where  a.cnName = b.species and  b.plot =c.plot and c.sitecode=5

) z group by z.plot

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrass b, environment c where  a.cnName = b.species and b.plot =c.plot and c.sitecode=5  order by c.plot

select distinct(a.species),count(a.species) as z,c.latinName from shrubandgrass a,environment b,speciesRichnessXinJiang.dbo.m_plant c where a.plot = b.plot and b.sitecode =5 and c.cnName = a.species and c.typecode=2 group by a.species,c.latinname order by z



select count(distinct(b.species)), count(distinct(a.cnGenus)), count(distinct(a.cnFamily))  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrass b, environment c where  a.cnName = b.species and b.plot =c.plot and c.sitecode=5 

