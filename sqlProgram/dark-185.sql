
select * from baihuashan 
select * from names     #�����ص�����������������ֶ�Ӧ,�Եõ�������
select * from speciesplot order by autoid
select * from speciesplotold




select * from baihuashan where [delete] is null

select distinct(latinname) from baihuashan 
select * from baihuashan where [delete] = '1'

--���ظ�������ȥ��,���deleteΪ1
select * from baihuashan where latinname in (select latinname from baihuashan group by latinname having count(*) > 1)
order by latinname


--ALTER DATABASE dd SET SINGLE_USER WITH ROLLBACK IMMEDIATE
--ALTER DATABASE dd COLLATE Chinese_PRC_CI_AS
--ALTER DATABASE dd SET MULTI_USER WITH ROLLBACK IMMEDIATE
select * from names
--delete names where cnnameplot is null
--update names set cnnamecheck=cnnameplot where cnnamecheck is null
select distinct(growthform) from names

select * from names where growthform ='shrub'


--update speciesplot set latinName=a.latinname from speciesplot s join names a on s.cnName=a.cnnameplot

select s.cnName,a.latinName from speciesplot s join names a on s.cnName=a.cnnameplot
--update speciesplot set cnName=a.cnnamecheck from speciesplot s join names a on s.cnName=a.cnnameplotselec

select plotno, cnName, count(*) from speciesplot
group by plotno, cnName having count(*) > 1

--result:autoid=72, 884, 595, 681 �ظ��ˣ�ɾ��

select cnname, count(cnname) a from speciesplot group by cnname order by a desc


--��ֵ�Ƿ�ΪȺ������:0,1,2,3
--update speciesplot set communityspecies = aaa.sno from speciesplot ss join
(
select s.autoid,s.cnname, aa.a, case when aa.a > 7 then 3 when aa.a > 2 then 2 else 1 end as sno from speciesplot s ,
(
select cnname, count(cnname) a from speciesplot group by cnname
) aa where aa.cnname = s.cnname
) aaa on aaa.autoid=ss.autoid



select b.* from baihuashan a, speciesplot b where b.latinname not in (select latinname from baihuashan)


select * from speciesplot where plotno like '%D8%'

select plotno, sum(coverage) from speciesplot group by plotno

--update names set growthform='erect leafy' where growthform='herbs'

--update speciesplot set growthform=a.growthform from speciesplot join names a on a.cnname= speciesplot.cnname

 select distinct cnname, latinName from speciesplot where latinName not in (select latinName from baihuashan)

 select * from baihuashan where latinName like '%Aster%'
 --update  baihuashan set latinName=ltrim(rtrim(latinName))

 select * from baihuashan where cnName like '%���޻�%'

 select * from names where latinName like '%Aster%'