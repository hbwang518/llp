
---20230108
select * from distinctanimalcounty where county_code = 652101

select * from distinctplantcounty where county_code = 652101

select * from m_county

select * from m_animal
where id in (select animal_id from distinctanimalcounty where county_code = 652101) order by id

select * from m_plant 
where id in (select plant_id from distinctplantcounty where county_code = 652101) order by id


---20231029
--alter database turpan collate chinese_prc_ci_as
select * from cvhturpan
select * from cvhturpan where county like '%�п�ѷ��%'
select * from cvhturpan where locality like '%AAa%'

select distinct(cnname) from cvhturpan

select cnName, latinname, string_agg(locality,',') from cvhturpan where county like '%�п�ѷ��%' and cnName is not null and locality is not null
group by cnName,latinname

select cnName, latinname, string_agg(locality,',') from cvhturpan where county like '%۷����%' and cnName is not null and locality is not null
group by cnName, latinname

select cnName, latinname, string_agg(locality,',') from cvhturpan where county like '%��³������%' and cnName is not null and locality is not null
group by cnName,latinname
