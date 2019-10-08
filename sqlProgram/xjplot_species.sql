
选择样方，县和site三水平记录到的全部物种数
select z.plot, count(distinct(z.species)), count(distinct(z.cnGenus)),count(distinct(z.cnFamily)) from 

(

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrassneedle b, environmentneedle c where  a.cnName = b.species and b.plot =c.plot 

union all

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from speciesRichnessXinJiang.dbo.m_plant a, arborneedle b,  environmentneedle c where  a.cnName = b.species and  b.plot =c.plot 

) z group by z.plot

---
select z.countycode, count(distinct(z.species)), count(distinct(z.cnGenus)),count(distinct(z.cnFamily)) from 

(

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.countycode  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrassneedle b, environmentneedle c where  a.cnName = b.species and b.plot =c.plot 

union all

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.countycode  from speciesRichnessXinJiang.dbo.m_plant a, arborneedle b,  environmentneedle c where  a.cnName = b.species and  b.plot =c.plot 

) z group by z.countycode

---

select z.sitecode, count(distinct(z.species)), count(distinct(z.cnGenus)),count(distinct(z.cnFamily)) from 

(

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.sitecode  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrassneedle b, environmentneedle c where  a.cnName = b.species and b.plot =c.plot 

union all

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.sitecode  from speciesRichnessXinJiang.dbo.m_plant a, arborneedle b,  environmentneedle c where  a.cnName = b.species and  b.plot =c.plot 

) z group by z.sitecode

---


统计样方，县和site三水平样方平均物种数
select z.plot, count(distinct(z.species)), count(distinct(z.cnGenus)),count(distinct(z.cnFamily)) from 

(

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrassneedle b, environmentneedle c where  a.cnName = b.species and b.plot =c.plot 

union all

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.plot  from speciesRichnessXinJiang.dbo.m_plant a, arborneedle b,  environmentneedle c where  a.cnName = b.species and  b.plot =c.plot 

) z group by z.plot

---
select z.countycode, count(distinct(z.species)), count(distinct(z.cnGenus)),count(distinct(z.cnFamily)) from 

(

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.countycode  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrassneedle b, environmentneedle c where  a.cnName = b.species and b.plot =c.plot 

union all

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.countycode  from speciesRichnessXinJiang.dbo.m_plant a, arborneedle b,  environmentneedle c where  a.cnName = b.species and  b.plot =c.plot 

) z group by z.countycode

---

select z.sitecode, count(distinct(z.species)), count(distinct(z.cnGenus)),count(distinct(z.cnFamily)) from 

(

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.sitecode  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrassneedle b, environmentneedle c where  a.cnName = b.species and b.plot =c.plot 

union all

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.sitecode  from speciesRichnessXinJiang.dbo.m_plant a, arborneedle b,  environmentneedle c where  a.cnName = b.species and  b.plot =c.plot 

) z group by z.sitecode


------
select a.plot,avg(Taperness), sum(volume)*10000/b.plotarea from arborneedle a, environmentneedle b where a.plot=b.plot group by a.plot,b.plotArea order by a.plot


