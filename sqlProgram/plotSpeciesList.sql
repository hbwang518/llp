select top 1 * from arbor

select top 1 * from shrubandGrass

select top 1 * from m_plant

select * from m_plant where cnName in (select species from arbor) or cnName in (select species from shrubAndGrass) order by id

select count(distinct(cnname)),count(distinct(cngenus)), count(distinct(cnfamily)) from m_plant where cnName in (select species from arbor) or cnName in (select species from shrubAndGrass) and id < 7000



select * from xinJiangPlot.dbo.arbor
select * from xinJiangPlot.dbo.shrubAndGrass where plot like '%HC%'


select * from m_plant where cnfamily='��������'

----update m_plant set latinFamily = 'Primulaceae' where latinFamily = 'Primulacae'

select a.*, b.id from grasslandPlantList a, m_plant b where a.cnName =b.cnName order by b.id

select count(distinct(a.cnname)),count(distinct(a.cngenus)), count(distinct(a.cnfamily)) from grasslandPlantList a


select * from m_plant where cnname like '%��é%' order by latinname

select * from m_plant where cnname = '����'
select * from m_plant where cnname = '�����'
select * from m_plant where cnname = '���뻨'
select * from m_plant where cnname = '����'
select * from m_plant where cnname = '������'
select * from m_plant where cnname = '���Ǳ�ĸ'
select * from m_plant where cnname = '����ɽǧ���'
