select * from evaOri
select * from m_mediRed
select * from evaProv
select * from evaPlant
select * from score order by id
select * from scoreResult order by latinName
select distinct(expert),province from score group by expert  +
select * from qin1101 where cnName not in (select cnName from score)
select * from qin1101 where cnName in (select cnName from score)
select * from qin1101 where cnName in (select cnName from m_mediRed)


select * from scoreresult where cnName in (select distinct(cnName) from m_medired)  
select * from scoreresult where cnName not in (select distinct(cnName) from m_medired)  
select * from score where cnName in (select cnName from m_mediRed) and cnName not in (select cnName from scoreResult) 
select * from score where cnName not in (select cnName from m_mediRed) and cnName not in (select cnName from scoreResult)
select * from m_medired where cnName not in (select cnName from score) 
select * from m_medired where cnName not in (select distinct(cnName) from scoreresult) and cnName in (select cnName from score) 


select distinct(cnName), latinName from evaOri where cnName not in (select cnName from m_mediRed)
select distinct(cnName), latinName from evaOri where cnName in (select cnName from m_mediRed)
select * from m_mediRed where cnName not in (select cnName from evaPlant)
select * from evaPlant where cnName in (select cnName from m_mediRed)
select * from evaPlant where cnName not in (select cnName from m_mediRed)

--get all sumvalue
select id, cnName, latinName, cnFamily, province, expert, (cast(amount as float) + cast(frequency as float) + cast(distribution as float) + cast(regeneration as float) + cast(sd as float)) sumvalue
from score where amount is not null and frequency is not null and distribution is not null and regeneration is not null and sd is not null
                 and ltrim(rtrim(amount)) <>'' and ltrim(rtrim(frequency)) <>'' and ltrim(rtrim(distribution)) <>'' and ltrim(rtrim(regeneration)) <>'' and ltrim(rtrim(sd)) <>''
order by sumvalue desc


----get not max value
select id, cnName, latinName, cnFamily, province, expert, (cast(amount as float) + cast(frequency as float) + cast(distribution as float) + cast(regeneration as float) + cast(sd as float)) sumvalue
from score where amount is not null and frequency is not null and distribution is not null and regeneration is not null and sd is not null
                 and ltrim(rtrim(amount)) <>'' and ltrim(rtrim(frequency)) <>'' and ltrim(rtrim(distribution)) <>'' and ltrim(rtrim(regeneration)) <>'' and ltrim(rtrim(sd)) <>''
and
id not in
(
select s.id from (
select id, cnName, latinName, cnFamily, province, expert, (cast(amount as float) + cast(frequency as float) + cast(distribution as float) + cast(regeneration as float) + cast(sd as float)) sumvalue
from score where amount is not null and frequency is not null and distribution is not null and regeneration is not null and sd is not null
                 and ltrim(rtrim(amount)) <>'' and ltrim(rtrim(frequency)) <>'' and ltrim(rtrim(distribution)) <>'' and ltrim(rtrim(regeneration)) <>'' and ltrim(rtrim(sd)) <>''
)s, (
select cnName, max(sumvalue) sumvaluemax
from(
select id,cnName, latinName, cnFamily, province, expert, (cast(amount as float) + cast(frequency as float) + cast(distribution as float) + cast(regeneration as float) + cast(sd as float)) sumvalue
from score where amount is not null and frequency is not null and distribution is not null and regeneration is not null and sd is not null
                 and ltrim(rtrim(amount)) <>'' and ltrim(rtrim(frequency)) <>'' and ltrim(rtrim(distribution)) <>'' and ltrim(rtrim(regeneration)) <>'' and ltrim(rtrim(sd)) <>''
) a group by cnName   ) b where s.cnName = b.cnName and s.sumvalue = b.sumvaluemax  
)          

-----get max value
select s.* from (
select id, cnName, latinName, cnFamily, province, expert, (cast(amount as float) + cast(frequency as float) + cast(distribution as float) + cast(regeneration as float) + cast(sd as float)) sumvalue
from score where amount is not null and frequency is not null and distribution is not null and regeneration is not null and sd is not null
                 and ltrim(rtrim(amount)) <>'' and ltrim(rtrim(frequency)) <>'' and ltrim(rtrim(distribution)) <>'' and ltrim(rtrim(regeneration)) <>'' and ltrim(rtrim(sd)) <>''
)s, (
select cnName, max(sumvalue) sumvaluemax
from(
select id,cnName, latinName, cnFamily, province, expert, (cast(amount as float) + cast(frequency as float) + cast(distribution as float) + cast(regeneration as float) + cast(sd as float)) sumvalue
from score where amount is not null and frequency is not null and distribution is not null and regeneration is not null and sd is not null
                 and ltrim(rtrim(amount)) <>'' and ltrim(rtrim(frequency)) <>'' and ltrim(rtrim(distribution)) <>'' and ltrim(rtrim(regeneration)) <>'' and ltrim(rtrim(sd)) <>''
) a group by cnName   ) b where s.cnName = b.cnName and s.sumvalue = b.sumvaluemax 



select * from qin1101 where cnName not in (select cnName from scoreResult) and cnName not in (select cnName from m_mediRed)
select * from qin1101 where cnName in (select cnName from scoreResult)
select * from qin1101 where cnName not in (select cnName from score) and cnName not in (select cnName from m_mediRed)
select * from qin1101 where cnName in (select cnName from score) and cnName not in (select cnName from scoreResult)
select * from qin1101 where cnName in (select cnName from m_mediRed)
select * from qin1101 where cnName not in (select cnName from m_mediRed) and cnName not in (select cnName from score)
select * from m_mediRed where cnName not in (select cnName from qin1101)
select * from m_mediRed where cnName in (select cnName from qin1101)
select * from scoreResult where cnName not in (select cnName from qin1101)
select * from scoreResult where cnName in (select cnName from qin1101)
select distinct(cnName) from score where cnName not in (select cnName from qin1101) and cnName not in (select cnName from scoreResult)
select distinct(cnName) from score where cnName in (select cnName from qin1101)
select * from qin1101 where cnName not in (select distinct(a.cnName) from score a union select distinct(b.cnName) from m_mediRed b) 


select distinct(cnName) from 
(select distinct(a.cnName) from score a union select distinct(b.cnName) from m_mediRed b
) a
where cnName not in (select cnName from qin1101)

select * from m_mediRed where latinName like '%Ferula%'
select * from qin1101 where latinName like '%Ferula%'
select * from qin1101 where latinName like '%Panax %'
select * from qin1101 where latinName like '%Asarum%'
select * from qin1101 where latinName like '%Balanophora%'
select * from qin1101 where latinName like '%Dysosma%'
select * from qin1101 where latinName like '%Epimedium%'
select * from qin1101 where latinName like '%Mahonia%'
select * from qin1101 where latinName like '%Arnebia%'
select * from qin1101 where latinName like '%Codonopsis%'
select * from qin1101 where latinName like '%Rhodiola%'
select * from qin1101 where latinName like '%Paris%'
select * from qin1101 where latinName like '%Gynostemma%'
select * from qin1101 where latinName like '%Trichosanthes%'
select * from qin1101 where latinName like '%Glycyrrhiza%'
select * from qin1101 where latinName like '%Dioscorea%'

select * from qin1101 where latinName like '%Dracaena%'
select * from qin1101 where latinName like '%Fritillaria%'
select * from qin1101 where latinName like '%Stephania%'
select * from qin1101 where latinName like '%Bletilla%'
select * from qin1101 where latinName like '%Dendrobium%'
select * from qin1101 where latinName like '%Gymnadenia%'
select * from qin1101 where latinName like '%Nervilia%'
select * from qin1101 where latinName like '%Cistanche%'
select * from qin1101 where latinName like '%Paeonia%'
select * from qin1101 where latinName like '%Coptis%'
select * from qin1101 where latinName like '%Camellia%'
select * from qin1101 where latinName like '%Taxus%'
select * from qin1101 where latinName like '%Ephedra%'
select * from qin1101 where latinName like '%Cephalotaxus%'
select * from scoreResult where cnName like '%桫椤%'

select * from m_mediRed where cnName like '%鸡血藤%'
select * from score where cnName like '%塔里木树柳%'
select * from m_mediRed where cnName like '%藏报春%'
select * from score where cnName like '%小花龙血树%'
update score set cnName = '塔里木柽柳' where cnName = '塔里木树柳'
select * from score where cnName like '%千层塔%'
update score set cnName = '蛇足石杉' where cnName = '千层塔'
select * from score where cnName like '%三七%' and amount is not null and  amount <>''

select CAST(amount as float) from score where amount is not null

select distinct(cnName), province from evaOri where cnName not in (select cnName from m_mediRed) order by province
select count(distinct(cnName)) new, province from evaOri where cnName not in (select cnName from m_mediRed) group by province order by province
select distinct(cnName) from evaPlant where cnName not in (select cnName from m_mediRed)
select * from evaPlant where cnName in (select cnName from m_mediRed)

amount	frequency	distribution	regeneration	growthCycle	exclusiveness	extinRate	sale1	sale2	sale3	sd1	sd2	sd3	province
ALTER TABLE evaOri alter COLUMN amount int
ALTER TABLE evaOri alter COLUMN frequency int
ALTER TABLE evaOri alter COLUMN distribution int
ALTER TABLE evaOri alter COLUMN regeneration int
ALTER TABLE evaOri alter COLUMN growthCycle int
ALTER TABLE evaOri alter COLUMN exclusiveness int
ALTER TABLE evaOri alter COLUMN extinRate int
ALTER TABLE evaOri alter COLUMN sale1 int
ALTER TABLE evaOri alter COLUMN sale2 int
ALTER TABLE evaOri alter COLUMN sale3 int
ALTER TABLE evaOri alter COLUMN sd1 int
ALTER TABLE evaOri alter COLUMN sd2 int
ALTER TABLE evaOri alter COLUMN sd3 int
select sum (case amount when amount is null then 0 else (cast(amount) as float) end)/ count (case amount when amount is null then 0 else 1 end) from table evaOri 
select count (case amount when amount is null then 0 else 1 end) from table evaOri 

select province, avg(amount*1.0) amount, AVG(frequency) from evaOri group by province

select province, cnName, avg(amount*1.0) amount,avg(frequency*1.0) frequency, avg(distribution*1.0) distribution, avg(regeneration*1.0) regeneration, avg(growthCycle*1.0) growthCycle
, avg(exclusiveness*1.0) exclusiveness, avg(extinRate*1.0) extinRate, avg(sale1*1.0) sale1, avg(sale2*1.0) sale2, avg(sale3*1.0) sale3, avg(sd1*1.0) sd1, avg(sd2*1.0) sd2, avg(sd3*1.0) sd3 
into evaProv
from evaOri group by province, cnName

select province, cnName, avg(amount) amount 
from evaOri 
where amount is not null
group by province, cnName 



select * from evaProv

select cnName, avg(amount*1.0) amount,avg(frequency*1.0) frequency, avg(distribution*1.0) distribution, avg(regeneration*1.0) regeneration, avg(growthCycle*1.0) growthCycle
, avg(exclusiveness*1.0) exclusiveness, avg(extinRate*1.0) extinRate, avg(sale1*1.0) sale1, avg(sale2*1.0) sale2, avg(sale3*1.0) sale3, avg(sd1*1.0) sd1, avg(sd2*1.0) sd2, avg(sd3*1.0) sd3 
into evaPlant
from evaOri group by cnName




select cnName, avg(amount*1.0) amount,avg(frequency*1.0) frequency, avg(distribution*1.0) distribution, avg(regeneration*1.0) regeneration, avg(growthCycle*1.0) growthCycle
, avg(exclusiveness*1.0) exclusiveness, avg(extinRate*1.0) extinRate, avg(sale1*1.0) sale1, avg(sale2*1.0) sale2, avg(sale3*1.0) sale3, avg(sd1*1.0) sd1, avg(sd2*1.0) sd2, avg(sd3*1.0) sd3 

from evaOri group by cnName

select cnName, SUM(amount*1.0)/(sum(case when amount IS null then 0 else 1 end)),COUNT(amount) count1
from evaOri group by cnName order by cnName

select 'aa' = case when amount IS null then 0 else 1 end from evaOri 
group by cnName


select cnName, SUM(sd1*1.0)/(sum(case when sd1 IS null then 0 else 1 end)),sum(case when sd1 IS null OR sd1=''  then 0 when sd1=0 then 1 else 1 end) sd1
from evaOri group by cnName order by cnName




