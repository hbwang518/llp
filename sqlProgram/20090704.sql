select * from m_plant where cnname ='����������ɼ' or cnname ='����������Ҷ��' or cnname ='����Բ��' or cnname ='���ط�֦��' or cnname ='�������Ǻ���' or cnname ='����������ɼ'

select b.sitecode,count(distinct(species)) from shrubandgrassneedle a, environmentneedle b where a.plot =b.plot group by b.sitecode
select b.sitecode,count(distinct(species)) from shrubandgrass a, environment b where a.plot =b.plot group by b.sitecode
select * from shrubandgrassneedle

select z.sitecode, count(distinct(z.species)), count(distinct(z.cnGenus)),count(distinct(z.cnFamily)) from 

(

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.sitecode  from speciesRichnessXinJiang.dbo.m_plant a, shrubandgrassneedle b, environmentneedle c where  a.cnName = b.species and b.plot =c.plot 

union all

select b.species, a.cnName,a.cnGenus, a.cnFamily ,c.sitecode  from speciesRichnessXinJiang.dbo.m_plant a, arborneedle b,  environmentneedle c where  a.cnName = b.species and  b.plot =c.plot 

) z group by z.sitecode