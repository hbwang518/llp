
select * from mMediUG

select * from mpam
select * from mug
select * from mhz
select * from plantxj where (mediid is not null) and culAndWildFlag=1

##check the modifying time of the table:
select modify_date from sys.tables where name='NFCFXJ20141230'
select modify_date from sys.tables where name='NFCFXJ'         #2019-04-30
select modify_date from sys.tables where name='funcxj'         #2018-08-13
select modify_date from sys.tables where name='chemical'       #2018-04-27
select modify_date from sys.tables where name='funcxjhalf'     #2015-02-01
select modify_date from sys.tables where name='NFCFXJpa20180427'    #2018-04-27

##select * into NFCFXJpa from NFCFXJpa20180427

select * from funcxj
select * from NFCFXJ
select * from NFCFXJpa   ##include the flavor nature and chemical
select * from funcxjhalf   #functions with half of the species
select * from NFCFXJ20141230
select * from chemical

select * from animalXJ  ##whole animals
select * from checklist  ##medi
select * from checklistManual order by manual  ##some plants marked deleted
select * from GBRL
select * from mclass
select * from mediXJ01
select * from mediXJbook   ##book zhu & li
select * from mfamily  ##whole medicinal family
select * from mMedi   ##whole medicinal lives
select * from mMediUG   ##whole UG medicinal lives with only cnName
select * from mpam









select a.*, b.* from NFCFXJ a, funcxj b where a.id=b.id

select a.*, b.*, c.* from NFCFXJ a left join chemical b on a.id=b.id 
left join funcxj c on a.id=c.id

select a.*, c.* from NFCFXJ a left join funcxj c on a.cnName=c.cnName
select distinct cnName from funcxj
select cnname, count(*) from funcxj group by cnname having count(*) > 1
select * from funcxj where cnName in (select cnname from funcxj group by cnname having count(*) > 1)

--select id,cnName, latinName into NFCFXJpa from NFCFXJ
--select * into NFCFXJ from NFCFXJ20141230


select distinct flavour from NFCFXJ
select distinct nature from NFCFXJ


## presence & absence
--update NFCFXJpa set bitter=0
--update NFCFXJpa set pungent=0 
--update NFCFXJpa set sweet=0
--update NFCFXJpa set sour=0
--update NFCFXJpa set salty=0
--update NFCFXJpa set cold=0
--update NFCFXJpa set cool=0 
--update NFCFXJpa set plain=0 
--update NFCFXJpa set warm=0 
--update NFCFXJpa set hot=0 


--update NFCFXJpa set bitter=1 from NFCFXJpa a join NFCFXJ b  on a.cnName=b.cnName and b.flavour like '%��%'
--update NFCFXJpa set pungent=1 from NFCFXJpa a join NFCFXJ b  on a.cnName=b.cnName and b.flavour like '%��%'
--update NFCFXJpa set sweet=1 from NFCFXJpa a join NFCFXJ b  on a.cnName=b.cnName and b.flavour like '%��%'
--update NFCFXJpa set sour=1 from NFCFXJpa a join NFCFXJ b  on a.cnName=b.cnName and b.flavour like '%��%'
--update NFCFXJpa set salty=1 from NFCFXJpa a join NFCFXJ b  on a.cnName=b.cnName and b.flavour like '%��%'
--update NFCFXJpa set cold=1 from NFCFXJpa a join NFCFXJ b  on a.cnName=b.cnName and b.nature like '%��%'
--update NFCFXJpa set cool=1 from NFCFXJpa a join NFCFXJ b  on a.cnName=b.cnName and b.nature like '%��%'
--update NFCFXJpa set plain=1 from NFCFXJpa a join NFCFXJ b  on a.cnName=b.cnName and b.nature like '%ƽ%'
--update NFCFXJpa set warm=1 from NFCFXJpa a join NFCFXJ b  on a.cnName=b.cnName and b.nature like '%��%'
--update NFCFXJpa set hot=1 from NFCFXJpa a join NFCFXJ b  on a.cnName=b.cnName and b.nature like '%��%'


select * from NFCFXJpa where bitter = 1
select * from NFCFXJ where flavour like '%��%'

select * from NFCFXJpa where bitter = 1
select * from NFCFXJ where flavour like '%��%'

select * from NFCFXJpa where bitter = 1
select * from NFCFXJ where flavour like '%��%'

select * from NFCFXJpa where bitter = 1
select * from NFCFXJ where flavour like '%��%'

select * from NFCFXJpa where bitter = 1
select * from NFCFXJ where flavour like '%��%'


select * from NFCFXJpa where cold = 1
select * from NFCFXJ where nature like '%��%'

select * from NFCFXJpa where cold = 1
select * from NFCFXJ where nature like '%��%'

select * from NFCFXJpa where cold = 1
select * from NFCFXJ where nature like '%��%'

select * from NFCFXJpa where cold = 1
select * from NFCFXJ where nature like '%ƽ%'

select * from NFCFXJpa where cold=1 and warm=1
select * from NFCFXJpa where cool=1 and warm=1

select distinct chemicaltype from chemical
--alter table NFCFXJpa add CA bit
--alter table NFCFXJpa add CB bit
--alter table NFCFXJpa add CC bit
--alter table NFCFXJpa add CD bit
--alter table NFCFXJpa add CE bit
--alter table NFCFXJpa add CF bit
--alter table NFCFXJpa add CG bit
--alter table NFCFXJpa add CH bit
--alter table NFCFXJpa add CI bit
--alter table NFCFXJpa add CJ bit
--alter table NFCFXJpa add CK bit
--alter table NFCFXJpa add CL bit
--alter table NFCFXJpa add CM bit

--update NFCFXJpa set CA=0
--update NFCFXJpa set CB=0
--update NFCFXJpa set CC=0
--update NFCFXJpa set CD=0
--update NFCFXJpa set CE=0
--update NFCFXJpa set CF=0
--update NFCFXJpa set CG=0
--update NFCFXJpa set CH=0
--update NFCFXJpa set CI=0
--update NFCFXJpa set CJ=0
--update NFCFXJpa set CK=0
--update NFCFXJpa set CL=0
--update NFCFXJpa set CM=0

select a.cnName, a.ca, b.chemicalType from NFCFXJpa a join chemical b  on a.cnName=b.cnName where ca=1
--update NFCFXJpa set CA=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%A%'
--update NFCFXJpa set CB=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%B%'
--update NFCFXJpa set CC=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%C%'
--update NFCFXJpa set CD=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%D%'
--update NFCFXJpa set CE=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%E%'
--update NFCFXJpa set CF=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%F%'
--update NFCFXJpa set CG=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%G%'
--update NFCFXJpa set CH=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%H%'
--update NFCFXJpa set CI=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%I%'
--update NFCFXJpa set CJ=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%J%'
--update NFCFXJpa set CK=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%K%'
--update NFCFXJpa set CL=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%L%'
--update NFCFXJpa set CM=1 from NFCFXJpa a join chemical b  on a.cnName=b.cnName and b.chemicalType like '%M%'



select * from funcxj
select distinct flavour from NFCFXJ
select distinct nature from NFCFXJ

select '��', a.* from NFCFXJ a where a.flavour like '%��%'
union
select '��', a.* from NFCFXJ a where a.flavour like '%��%'
union
select '��', a.* from NFCFXJ a where a.flavour like '%��%'
union
select '��', a.* from NFCFXJ a where a.flavour like '%��%'
union
select '��', a.* from NFCFXJ a where a.flavour like '%��%'
union

select '��', a.* from NFCFXJ a where a.nature like '%��%'
union
select '��', a.* from NFCFXJ a where a.nature like '%��%'
union
select '��', a.* from NFCFXJ a where a.nature like '%��%'
union
select '��', a.* from NFCFXJ a where a.nature like '%��%'
union
select 'ƽ', a.* from NFCFXJ a where a.nature like '%ƽ%'


select * from NFCFXJ where nature like '��'
select * from NFCFXJ where cngenus like '��ͷ'



##endemism
select * from m_plant where endemismflag is not null and cnname in 
('����������ɼ', 'ѩ����ɼ', '����������ɼ', '����������Ҷ��', '�������Ǻ���', '���ط�֦��', '����Բ��', 
'ŷ��ɽ��', '�ƻ���', '����', '����', '��֦��', '����', '׼����ɽ�', '��ɽ���', '�½�Ұƻ��', '��', 'ӣ����')

select * from mediRed.dbo.endemHuang
select * from speciesrichnessxinjiang.dbo.m_plant a, mediRed.dbo.endemHuang b where a.latinName = b.latinName and a.endemismFlag is not null order by a.id


select * from redListXJ where cnname in (select cnname from plantxj where (mediid is not null or ugid is not null or hzid is not null))
select * from redListXJ where latinname in (select latinname from plantxj where (mediid is not null or ugid is not null or hzid is not null))

select * from list where cnname in (select distinct(cnname) from distribution where province = '�½�' and (descr is null or  descr <> 'ɾ��'))


select * from plantxj
select * from medizhirl
select * from plantxj where latinname in (select ������ from medizhirl)
select * from redlistxj