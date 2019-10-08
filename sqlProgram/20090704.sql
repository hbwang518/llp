select * from m_plant where cnname ='西伯利亚云杉' or cnname ='西伯利亚落叶松' or cnname ='昆仑圆柏' or cnname ='昆仑方枝柏' or cnname ='西伯利亚红松' or cnname ='西伯利亚冷杉'

select b.sitecode,count(distinct(species)) from shrubandgrassneedle a, environmentneedle b where a.plot =b.plot group by b.sitecode
select b.sitecode,count(distinct(species)) from shrubandgrass a, environment b where a.plot =b.plot group by b.sitecode
select * from shrubandgrassneedle

select z.sitecode, count(distinct(z.species)), count(distinct(z.cnGenus)),count(distinct(z.cnFamily)) from 

(

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.sitecode  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrassneedle b, environmentneedle c where  a.cnName = b.species and b.plot =c.plot 

union all

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.sitecode  from speciesRichnessXinJiang.dbo.m_plant a, arborneedle b,  environmentneedle c where  a.cnName = b.species and  b.plot =c.plot 

) z group by z.sitecode