--medi
select * from animalXJ
select * from mclass    ###mclass.id= mfamily.classid
select * from redListXJ
select * from GBRL
select * from MediChinaOri
select * from mediXJ01
select * from mediZhiRL
select * from mfamily order by classid
select * from mhz
select * from mMedi where mediName is not null  ###mpam.id=mMedi.pamid, the last two numbers of code is the medi part
select * from mMediUG   ###mediName of Ugure medicine
select * from mpam where LatinNameGBRL is not null
select * from mug
select * from plantXJ
select * from mhz
select * from mMediUG
select * from distributionZhao0
select * from distributionZhao order by cnName
select * from distribution where cnName like '%(%'
select * from addInfo where ��Σ���� is not null
select * from [0compare]

--mediRed
select '������:' + cnName + ' ' + latinName + ' ' + latinFamily + '__' + '������:' + cnFamily from m_mediRed
select * from addInfo
select * from allType
select * from county2007 where county like '%����%'order by province
select * from countyPlant
select * from distribution
select * from evaOri
select * from evaProv
select * from List
select * from List1
select * from m_mediRed
select * from qin1101
select * from score
select * from scoreResult order by id
select * from mediInfo where ��Σ���� is not null or �������� is not null
select * from addInfo where ��Σ���� is not null or �������� is not null
select * from mediInfo order by ���Ŀ���
select * from mediInfo where detailSpecies=1
select * from arbor
select * from shrubAndGrass
select * from environment
select * from plantBJ

select * from distribution
select * from deleteCounty


select * from distribution where cnName like '%����������%'
select * from distribution where latinName like '%Anemone flaccida%'

select * from mediInfo where cnName like '%����������%'

##mediPart##
select *, SUBSTRING(d.code, LEN(d.code)-1, 2) from medi.dbo.mMedi d



338 - 312 26-- 369 
select * from mediInfo
select * from [0compare] a, mediInfo b where a.cnName=b.������
select * from [0compare] a, mediInfo b where a.cnName<>b.������

select * from mediInfo where id not in (select id from mediInfo where ������ in (select cnName from [0compare]) )

select * from county2007 where county like '%��Ͻ��%'  ��,˵��ȫΪ����������
select * from mediInfo where ��Σ���� is not null

select a.riskReason, b.��Σ���� from [0compare] a, mediInfo b where a.cnName=b.������ and b.��Σ���� <> a.riskReason
select a.riskReason, b.��Σ���� from [0compare] a, mediInfo b where a.cnName=b.������ and b.��Σ���� = a.riskReason

369 336 33 312
select * from [0mediSpecies] a, mediInfo b where a.cnName=b.������

select * from [0mediSpecies] a, [0compare] b where a.cnName=b.cnName

select * from [0compare] a where auto_id not in (select b.auto_id from [0mediSpecies] a, [0compare] b where a.cnName=b.cnName)

select distinct (cnName) from [0mediSpecies]

select distinct (cnName) from [0compare]

select * from [0mediSpecies] a where auto_id not in (select auto_id from [0mediSpecies] where cnName in (select ������ from mediInfo))

select * from [0mediSpecies] a where auto_id not in (select auto_id from [0mediSpecies] where latinName in (select ������ from mediInfo))
select * from [0mediSpecies] a where auto_id not in (select auto_id from [0mediSpecies] where latinName in (select ������ from mediInfo) or cnName in (select ������ from mediInfo))
select [status] from [0compare] group by [status]
--update [0compare] set [status] = null where [status]=''
select [status] from [0compare] group by [status]
select a.��������, b.[status] from mediInfo a, [0compare] b where (a.������ = b.cnName or a.������ = b.latinName ) and b.[status]='CR'
select a.��������, b.[status] from mediInfo a, [0compare] b where (a.������ = b.cnName or a.������ = b.latinName ) group by b.[status], a.�������� order by b.[status], a.��������

select b.[status], count(distinct(a.latinFamily)) family,count(distinct(a.latinGenus)) genus,count(distinct(a.latinName)) species from mediInfo a, [0compare] b where (a.cnName = b.cnName or a.latinName = b.latinName ) group by b.[status] order by b.[status]
select * from [0compare] where photo is null
select * from [0compare] where status is null


--update m_mediRed set version = null 
--update m_mediRed set version = 0
--update m_mediRed set medipart = SUBSTRING(b.code, LEN(b.code)-1, 2) from m_mediRed a, medi.dbo.mMedi b where a.cnName = b.mediName
select * from m_medired where medipart is not null
select * from medi.dbo.mpam
select * from medi.dbo.mMedi



select * from List where descr = '4'
select * from List order by latinName

USE [master] 
GO 
EXEC dbo.sp_dbcmptlevel @dbname='mediRed', @new_cmptlevel=90 
GO 


select COUNT(distinct(cnFamily)) from qin1101
select COUNT(distinct(cnFamily)) from m_mediRed
select COUNT(distinct(province)) from evaOri
select COUNT(distinct(cnFamily)) from scoreResult

select * from m_mediRed
select * from List
select * from List1
select * from mediInfo
select * from zhao20140627

select * from list where cnName in (select ������ from list1)

select * from list order by ID

select * from list where cnName='ѩ��' and descr = 3
--delete list where cnName='ѩ��' and descr = 3

select * from list where cnName not in (select ������ from list1)
select * from list1 where ������ not in (select cnName  from list)

select * from list a , list1 b where a.cnName= b.������ --where cnName not in (select ������ from list1)

select * from list where cnName in (
select cnName from list group by cnName having COUNT(cnName) > 1
) order by cnName

select * from list1 where ������ in (
select ������ from list1   group by ������ having COUNT(������) > 1
) order by ������

select * from list where autoID not in (
select a.autoID from list a, list1 b where a.cnName = b.������
)

select * from List1 where ������ = 'Aconitum kongboense'

select * from list1 where autoID not in (
select b.autoID from list a, list1 b where a.cnName = b.������
)

--update list set ID = list1.id from list, list1 where list.cnName=list1.������

select * from mediInfo where autoID not in (
select b.autoID from list a, mediInfo b where a.cnName = b.cnName
)

select * from list where autoID not in (
select a.autoID from list a, mediInfo b where a.cnName = b.cnName
)

--insert mediInfo (������,������) select cnName, latinName from list a where a.autoid not in (
select a.autoID from list a, mediInfo b where a.cnName = b.������
)

--update mediinfo set id= list.id from mediINfo, list where list.cnName = mediinfo.������

select * from mediInfo where ������ in (
select ������ from mediInfo group by ������ having COUNT(������) > 1
) order by ������

--update mediInfo set descr= list.descr from mediInfo, list where list.cnName = mediinfo.������

select * from list
select * from mediInfo
select * from zhao20140627
select * from mediInfo where ������ like '%�̲�%'
select * from zhao20140627 where ������ like '%�̲�%'
select * from mediInfo where ��Σ�ȼ� ='LC'

select a.������,a.����,b.����  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.���� = b.����
select a.������,a.����,b.����  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.���� is null or a.���� <> b.����) and b.���� is not null
--update mediInfo set ���� = b.���� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.���� is null or a.���� <> b.����) and b.���� is not null

select * from zhao20140627 where autoID not in (
select a.autoID from zhao20140627 a, mediInfo b where a.������ = b.cnName
)

select * from zhao20140627 where autoID not in (
select a.autoID from zhao20140627 a, mediInfo b where a.������ = b.latinName
)

select a.������,a.������,b.������  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.������ = b.������
select a.������,a.������,b.������  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.������ is null or a.������ <> b.������) and b.������ is not null
--update mediInfo set ������ = b.������ from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.������ is null or a.������ <> b.������) and b.������ is not null

select a.������,a.���Ŀ���,b.���Ŀ���  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.���Ŀ��� = b.���Ŀ���
select a.������,a.���Ŀ���,b.���Ŀ���  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.���Ŀ��� is null or a.���Ŀ��� <> b.���Ŀ���) and b.���Ŀ��� is not null
--update mediInfo set ���Ŀ��� = b.���Ŀ��� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.���Ŀ��� is null or a.���Ŀ��� <> b.���Ŀ���) and b.���Ŀ��� is not null and a.���Ŀ��� is null

select a.������,a.��������,b.�������� from mediInfo a, zhao20140627 b where a.������ = b.������ and a.�������� = b.��������
select a.������,a.��������,b.�������� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null
--update mediInfo set �������� = b.�������� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null and a.�������� is null

select a.������,a.��������,b.��������  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.�������� = b.��������
select a.������,a.��������,b.��������  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null
--update mediInfo set �������� = b.�������� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null and a.�������� is null

select a.������,a.��������,b.��������  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.�������� = b.��������
select a.������,a.��������,b.��������  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null
--update mediInfo set �������� = b.�������� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null and a.�������� is null

���޸�
SELECT     autoId, ������, �������� FROM zhao20140627
WHERE     (������ IN (SELECT     ������  FROM          mediInfo WHERE      (�������� IS NULL))) AND (�������� IS NOT NULL)
select a.������,a.��������,b.��������  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.�������� = b.��������
select a.������,a.��������,b.��������  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null
--update mediInfo set �������� = b.�������� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null and a.�������� is null

select a.������,a.��������,b.��������  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.�������� = b.��������
select a.������,a.��������,b.��������  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null
--update mediInfo set �������� = b.�������� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null and a.�������� is null

���޸�
select ���� from zhao20140627 where ����='�й�����'
--update zhao20140627 set ����='��' where ����='�й�����'
select a.������,a.����,b.����  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.���� = b.����
select a.������,a.����,b.����  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.���� is null or a.���� <> b.����) and b.���� is not null
--update mediInfo set ���� = b.���� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.���� is null or a.���� <> b.����) and b.���� is not null and a.���� is null

select a.������,a.��Σ�ȼ�,b.��Σ�ȼ�  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.��Σ�ȼ� = b.��Σ�ȼ�
select a.������,a.��Σ�ȼ�,b.��Σ�ȼ�  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.��Σ�ȼ� is null or a.��Σ�ȼ� <> b.��Σ�ȼ�) and b.��Σ�ȼ� is not null
--update mediInfo set ��Σ�ȼ� = b.��Σ�ȼ� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.��Σ�ȼ� is null or a.��Σ�ȼ� <> b.��Σ�ȼ�) and b.��Σ�ȼ� is not null and a.��Σ�ȼ� is null

select a.������,a.��Σ��׼,b.��Σ��׼  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.��Σ��׼ = b.��Σ��׼
select a.������,a.��Σ��׼,b.��Σ��׼  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.��Σ��׼ is null or a.��Σ��׼ <> b.��Σ��׼) and b.��Σ��׼ is not null
--update mediInfo set ��Σ��׼ = b.��Σ��׼ from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.��Σ��׼ is null or a.��Σ��׼ <> b.��Σ��׼) and b.��Σ��׼ is not null and a.��Σ��׼ is null

select a.������,a.ʡ���������,b.ʡ���������  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.ʡ��������� = b.ʡ���������
select a.������,a.ʡ���������,b.ʡ���������  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.ʡ��������� is null or a.ʡ��������� <> b.ʡ���������) and b.ʡ��������� is not null
--update mediInfo set ʡ��������� = b.ʡ��������� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.ʡ��������� is null or a.ʡ��������� <> b.ʡ���������) and b.ʡ��������� is not null and a.ʡ��������� is null

������
select a.������,a.ҩ����,b.ҩ����  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.ҩ���� = b.ҩ����
select a.������,a.ҩ����,b.ҩ����  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.ҩ���� is null or a.ҩ���� <> b.ҩ����) and b.ҩ���� is not null
--update mediInfo set ҩ���� = b.ҩ���� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.ҩ���� is null or a.ҩ���� <> b.ҩ����) and b.ҩ���� is not null and a.ҩ���� is null

������
select a.������,a.��������,b.��������  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.�������� = b.��������
select a.������,a.��������,b.��������  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null
--update mediInfo set �������� = b.�������� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�������� is null or a.�������� <> b.��������) and b.�������� is not null and a.�������� is null

�޸�,���޸�?
SELECT     autoId, ������, ���� FROM zhao20140627
WHERE     (������ IN (SELECT     ������  FROM          mediInfo WHERE      (���� IS NULL))) AND (���� IS NOT NULL)
select a.������,a.����,b.����  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.���� = b.����
select a.������,a.����,b.����  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.���� is null or a.���� <> b.����) and b.���� is not null
--update mediInfo set ���� = b.���� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.���� is null or a.���� <> b.����) and b.���� is not null and a.���� is null

select a.������,a.�ͺ���,b.�ͺ���  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.�ͺ��� = b.�ͺ���
select a.������,a.�ͺ���,b.�ͺ���  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�ͺ��� is null or a.�ͺ��� <> b.�ͺ���) and b.�ͺ��� is not null
--update mediInfo set �ͺ��� = b.�ͺ��� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�ͺ��� is null or a.�ͺ��� <> b.�ͺ���) and b.�ͺ��� is not null and a.�ͺ��� is null

select a.������,a.�ߺ���,b.�ߺ���  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.�ߺ��� = b.�ߺ���
select a.������,a.�ߺ���,b.�ߺ���  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�ߺ��� is null or a.�ߺ��� <> b.�ߺ���) and b.�ߺ��� is not null
--update mediInfo set �ߺ��� = b.�ߺ��� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�ߺ��� is null or a.�ߺ��� <> b.�ߺ���) and b.�ߺ��� is not null and a.�ߺ��� is null

���޸�,δ�޸�,ֱ�Ӹ�����
select a.������,a.ʡ���ֲ�,b.ʡ���ֲ�  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.ʡ���ֲ� = b.ʡ���ֲ�
select a.������,a.ʡ���ֲ�,b.ʡ���ֲ�  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.ʡ���ֲ� is null or a.ʡ���ֲ� <> b.ʡ���ֲ�) and b.ʡ���ֲ� is not null
--update mediInfo set ʡ���ֲ� = b.ʡ���ֲ� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.ʡ���ֲ� is null or a.ʡ���ֲ� <> b.ʡ���ֲ�) and b.ʡ���ֲ� is not null and a.ʡ���ֲ� is null

δ���¶����Ժ����
select a.������,a.�ο�����,b.�ο�����  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.�ο����� = b.�ο�����
select a.������,a.�ο�����,b.�ο�����  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�ο����� is null or a.�ο����� <> b.�ο�����) and b.�ο����� is not null
--update mediInfo set �ο����� = b.�ο����� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.�ο����� is null or a.�ο����� <> b.�ο�����) and b.�ο����� is not null and a.�ο����� is null

select a.������,a.�����,b.�����  from mediInfo a, zhao20140627 b where a.������ = b.������ and a.����� = b.�����
select a.������,a.�����,b.�����  from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.����� is null or a.����� <> b.�����) and b.����� is not null
--update mediInfo set ����� = b.����� from mediInfo a, zhao20140627 b where a.������ = b.������ and (a.����� is null or a.����� <> b.�����) and b.����� is not null and a.����� is null


select a.��̬����, b.��̬���� from mediinfo a, [mediRed].[dbo].[zhao20140617Ori] b where a.������ = b.������
--update mediinfo set ��̬���� = b.��̬���� from mediInfo a,  [mediRed].[dbo].[zhao20140617Ori] b where a.������ = b.������

select a.��Σ����, b.��Σ���� from mediinfo a, addInfo b where a.������ = b.������
--update mediinfo set ��Σ���� = b.��Σ���� from mediInfo a, addInfo b where a.������ = b.������

select a.autoID, a.������, a.��Σ����, b.��������, b.[��Σ����(С)], b.[��Σ����(��)] from mediInfo a, zhao20140627 b where a.������=b.������
order by a.autoID

�����޸Ĳ�����Σ����:
(
SELECT     autoId, ������, ��Σ����
FROM         mediInfo AS a
WHERE     (������ IN
                          (SELECT     ������
                            FROM          zhao20140627))
ORDER BY autoId
)


select * from mediInfo order by id
select ID, ������, ������, ���Ŀ���, ��������, ��������, ��������, ��Σ�ȼ�, ��Σ��׼, descr from mediInfo

select * from zhao20140627
select * from zhao20140617Ori
select b.IDzhao,a.* from mediInfo a, zhao20140617Ori b where a.������= b.������

select * from m_mediRed where m_mediRed.cnName not in (select ������ from mediInfo)
select * from mediInfo where mediInfo.������ not in (select cnName from m_mediRed)

select * from zhao20140806 where ������ not in (select ������ from mediInfo) and zhao20140806.IDzhao like '%�ּ�%'

select * from zhao20140806 a, mediInfo b where a.�������� is null and b.�������� is not null and a.������= b.������
select * from zhao20140806 a, mediInfo b where a.��Σ����Liping is null and b.��Σ���� is not null and a.������= b.������

select * from mediInfo where ������ like '%����%'
select * from mediInfo where ҩ�ü�ֵ�͹������� is null and (descr =1 or descr = 2)
select * from mediInfo where ҩ���� is null and (descr =1 or descr = 2)

select m.* from mediInfo m, qin0906 q where m.������=q.������ and m.������ is not null and q.������ is not null

select * from mediInfo where ������ is not null and ������ not in (select ������ from qin0906 where ������ is not null)

select * from qin0906 where ������ is not null and ������ not in (select ������ from mediInfo where ������ is not null)

##������
select m.* from mediInfo m, qin0906 q where m.������=q.������ and m.������ is not null and q.������ is not null

select * from mediInfo where ������ is not null and ������ not in (select ������ from qin0906 where ������ is not null)

select * from qin0906 where ������ is not null and ������ not in (select ������ from mediInfo where ������ is not null)


select distinct(���Ŀ���) from (select * from mediInfo where descr=1) a
select COUNT(distinct(��������)) from (select * from mediInfo where descr=1) a

select distinct(��������) from (select * from mediInfo where descr=1) a
select COUNT(distinct(��������)) from (select * from mediInfo where descr=1) a

select * from [0distribution]  ##

--select top 1 cnName, county into distribution from distributionZhao

select * from listQin20150428 where detailSpecies = 1


##�õ��ܵĽ���� preface ����
select * from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName order by a.autoId

##To get the detailed species in distribution##
select * from distribution where cnName in (select cnName from listqin20150428 where detailSpecies=1) order by cnName
select * from distribution where (descr is null) 
select * from distribution where (descr is null) and cnName in (select cnName from listqin20150428 where detailSpecies=1) order by cnName
select * from distribution where (descr <> '����' and descr <> 'ɾ��' and descr <> '����ɾ��') and cnName in (select cnName from listqin20150428 where detailSpecies=1) order by cnName
select * from distribution where (descr <> '����' and descr <> 'ɾ��' and descr <> '����ɾ��' and descr <> '����ɾ��1') and cnName in (select cnName from listqin20150428 where detailSpecies=1) order by cnName
select * from distribution where (descr = '���') and cnName in (select cnName from listqin20150428 where detailSpecies=1) order by cnName

##To get the result of only species of detail    #preface ����
select * from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName 
and a.cnName in (select distinct(cnName) from distribution where (descr is null or descr = '���') and cnName in (select cnName from listqin20150428 where detailSpecies=1))
order by a.autoId

##
select * from distribution a,county2007 b where a.county = b.county and a.province=b.province 
and a.cnName in (select distinct(cnName) from distribution where cnName in (select cnName from listqin20150428 where detailSpecies=1))
order by a.autoId

select * from distribution a, county2007 b where a.cnName = '�춬����' and a.county = b.county and a.province=b.province order by a.descr

##
select * from distribution where cnName in (select cnName from listqin20150428 where detailSpecies=1)

select distinct(cnName) from distribution where autoid not in (
select a.autoid from distribution a, mediInfo b where a.cnName=b.cnName
)

select * from mediInfo order by cnName
select * from listQin20150428 order by cnName

select * from distribution where cnName like '�����춹ɼ'
select * from county2007 where county like '������'
select * from county2007 where lat < 18
select * from county2007 where county= '�º���'
select * from county2007 where county= '������'
select * from county2007 where county= '������'
select * from county2007 where county= 'Į����'
select * from county2007 where county= '������'
select * from county2007 where county= '�Ϻ���'


##δ���������,12720-11577=1143

select * from distribution a,county2007 b where a.county = b.county and a.cnName = '��ë����' order by a.autoId

select * from distribution where cnName = '�����Ĳ�'
select * from distribution where cnName = '��ë����'
select * from distribution where cnName = 'Сɼ��'
select * from distribution where cnName = '������'
select * from distribution where cnName = '����ʯ��'
select * from distribution where cnName = '�Ҷ���'
select * from distribution where cnName = '�����ϲ�'
select * from distribution where cnName = '����'

select distinct(cnName) from distribution

select * from distribution a,county2007 b where a.county = b.county and a.cnName = '������' order by a.autoId

select * from provinceChecking
select * from distribution

select * from provinceChecking where autoid not in 
(
select p.autoid from provinceChecking p join 
(select a.cnName, b.province from distribution a,county2007 b where a.county = b.county) 
 d 	on p.cnName=d.cnName and p.province=d.province
 )

 
 
 select* from countyAddRaw -- where cnName='����ʯ��' and province='����' order by autoid
 select * from county2007
 
 --update countyAddRaw set county=county2007.county from countyAddRaw, county2007 where countyAddRaw.countyOri = county2007.county 
 select * from countyAddRaw where county is not null
  
 select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.county is null
 
 select distinct(a.countyOri), b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.county is null
  
 select a.autoid, a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.county is null
 select distinct(a.autoid) from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.county is null
 
 select* from countyAddRaw where county is null
   
 select * from countyAddRaw where autoid not in (
 select distinct(a.autoid) from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.county is null
 ) and county is null
 
 select * from county2007 where county like '����%'
 select* from countyAddRaw where cnName = '��Ҷ����'
 select* from countyAddRaw where county is null
 
 select * from countyAddRaw where autoid not in (
 select distinct(a.autoid) from countyAddRaw a, county2007 b where  b.county = a.county and a.county is not null
 ) and county is not null
 
 select * from countyAddRaw where autoid not in (
 select distinct(a.autoid) from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.county is null
 ) and county is null
 
select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri
select a.autoid from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county !<> a.countyOri
group by a.autoid having count(a.autoid) > 1

select a.countyOri, count(b.county) bcount from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri
 group by a.countyOri having count(b.county) > 1
 
select a.countyOri, b.county bcount from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri
and a.countyOri='����'

select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri
	and a.countyOri in (
	select countyOri from (
		select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri
		group by a.countyOri, b.county
	) a group by a.countyOri having count(county) > 1
) group by a.countyOri, b.county order by a.countyOri
select * from countyAddRaw where county is null
select * from countyAddRaw where countyOri like '%����̩%'

select a.*,b.province, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri and a.province=b.province
	and a.countyOri in (
	select countyOri from (
		select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.province=b.province and b.county <> a.countyOri
		group by a.countyOri, b.county
	) a group by a.countyOri having count(county) = 1
) order by a.province --group by a.countyOri, b.county order by a.countyOri 


 select a.province, b.province, a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.province=b.province and b.county <> a.countyOri
 
 select a.province, a.county, b.province, b.county from countyAddRaw a, county2007 b 
 where  a.county=b.county and a.province <> b.province
 
 
 select * from countyAddRaw where county = 'ƽ˳��'
 
 --delete countyAddRaw where county = 'ƽ˳��'
 --update countyAddRaw set province = '����' where county='������'
 
 select a.*,b.province, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri and a.province=b.province
	and a.countyOri in (
	select countyOri from (
		select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.province=b.province and b.county <> a.countyOri
		group by a.countyOri, b.county
	) a group by a.countyOri having count(county) = 1
)
 
 --update countyAddRaw set county = aa.county from countyAddRaw r,
 ( 
	 select a.autoid, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri and a.province=b.province
		and a.countyOri in (
		select countyOri from (
			select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.province=b.province and b.county <> a.countyOri
			group by a.countyOri, b.county
		) a group by a.countyOri having count(county) = 1
	)
) aa where r.autoid=aa.autoid and r.county is null

select * from countyAddRaw where county is null

 select a.*,b.province, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri and a.province=b.province
	and a.countyOri in (
	select countyOri from (
		select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.province=b.province and b.county <> a.countyOri
		group by a.countyOri, b.county
	) a group by a.countyOri having count(county) = 1
	)

select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and a.province=b.province and a.county is null
		
select cnName, county from distribution group by cnName, county

##�����ȵķֲ����������ʽ���������,��У��.
select * from distribution where autoid not in (select a.autoid from distribution a, county2007 b where a.county=b.county)

##�½����ֲַ�
select a.cnName, b.county from speciesRichnessXinJiang.dbo.plantOnlyCounty a, county2007 b, distribution c
where a.county=b.countycode and a.cnName=c.cnName
group by a.cnName, b.county


select * from county2007
select * from countyPlant

select * from distribution where cnName = '����ʯ��'
select * from distribution where cnName = '�����'
select * from distribution where cnName = '������'
select * from distribution where cnName = '��Ҷާ'
select * from distribution where cnName = '��Ҷƿ��С��'

select * from countyModify
select * from countyAddRaw where county is null

select * from distribution  where county in (select countyProblem from countyModify where descri='ԭʼ�ļ�ɾ��')
--delete distribution  where county in (select countyProblem from countyModify where descri='ԭʼ�ļ�ɾ��')
distribution -- 9814 - 9859
select cnName, county from countyModify where descri='�����½�' 266
--insert into distribution (cnName, county) select cnName, county from countyModify where descri='�����½�'
select * from distribution  where autoid > 9859

select autoid, cnName, county from countyModify where descri='���ԭʼ����'

select a.* from distribution a, countyModify b where b.descri='���ԭʼ����' and a.autoid=b.autoid
--update distribution set county = b.county from  distribution a, countyModify b where b.descri='���ԭʼ����' and a.autoid=b.autoid
--10125
--insert into distribution (cnName, county) select cnName, county from countyAddRaw
select * from distribution  where autoid > 10125

select * from distribution where autoid not in
(
    select autoid from distribution where county in (select county from county2007)
)


select * from county2007 where county in (
    select county from county2007 group by county having count(*) > 1
)

select * from distribution where county in 
(
    select county from county2007 group by county having count(*) > 1
)


select cnName,province, county from distribution group by cnName, province, county having count(*) > 1

select min(autoid), cnName,province, county from distribution group by cnName, province, county having count(*) > 1



--update distribution set province = b.province from distribution a, county2007 b
where a.county = b.county and b.autoid not in (
    select autoid from county2007 where county in (select county from county2007 group by county having count(*) > 1)
)

select * from distribution where province is null
--delete distribution where autoid in (
	select autoid from distribution a, (
	select cnName,province, county from distribution group by cnName, province, county having count(*) > 1 --order by cnName,province, county
	) b where a.cnName=b.cnName and a.province=b.province and a.county=b.county 
	
)

and autoid not in (
		select min(autoid) from distribution group by cnName, province, county having count(*) > 1
	)
select * into distribution from distribution0

684-334
select min(autoid), cnName,province, county from distribution group by cnName, province, county having count(*) > 1

select distinct (cnName) from distribution order by cnName
select * from distribution where cnName like '%������ޱ%'
select * from m_mediRed where cnName like '%������ޱ%'
select * from zhao20140627 where ������ like '%������ޱ%'
select * from mediInfo where ������ like '%��ޱ%'
select * from list
select * from List1 order by ����,������
--update distribution set cnName='������ޱ' where cnName like '%������ޱ%'


select distinct(cnName) from distribution where cnName not in (select cnName from listQin20150428 where detailSpecies = 1)
select * from listQin20150428 where cnName not in (select cnName from distribution)

select * from distributionZhao where cnName like '%���%'

select * from trancateAdd

select * from distributionADD1

--update distributionADD1 set province=b.province from distributionADD1 a, county2007 b 
where a.county=b.county and a.county not in (
select a.county from (
select distinct(county) from distributionADD1 ) a, county2007 b where a.county=b.county 
group by a.county having Count(*) > 1 
) and a.province is null

select * from distributionADD1 where province is null
--insert into distribution (cnName, province, county) select cnName, province, county from distributionADD1 --where province is null

 
--select top 0 * into distributionAdd1 from distribution

select * from distribution where province is null
select * from distribution where descr is not null

select * from distribution where cnName = '֪ĸ' order by province
select * from distribution where county like '����%'
select * from distribution where county = '������'
select * from distribution where cnName = '��Ҷһ֦��'
select * from listqin20150428 order by cnName

select * from countyChecking order by id
select * from countyChecking a, listqin20150428 b where a.cnName=b.cnName order by id
select * from countyChecking a, mediInfo b where a.cnName=b.cnName order by a.id
select * from mediInfo where cnName not in (select cnName from listqin20150428 )   --where detailSpecies=1
select a.*, b.* from countyChecking a left join listqin20150428 b on a.cnName=b.cnName order by a.id

select a.*, b.* from countyChecking a left join mediInfo b on a.cnName=b.cnName order by a.id

select latinName from listqin20150428 group by latinName having count(latinName) > 1

select * from listqin20150428 where cnName = '���'
select * from listqin20150428 where cnName like  '%�춬%'
select * from mediInfo where cnName = '���'
select * from listqin20150428 where cnName = '���Ʋ�'
select * from listqin20150428 where cnName like  '%����������%'

select * from distribution where cnName = '���' or cnName like  '%�춬%'
--update distribution set oriName=cnName where cnName = '���' or cnName like  '%�춬%'
--update distribution set cnName='�춬����' where cnName = '���' or cnName =  '�춬����'
--update distribution set descr = 'ɾ��' where cnName='�춬����' and autoid not in (
select min(autoid) from distribution where cnName='�춬����' group by cnName, province, county
)
select * from distribution where cnName='�춬����' group by cnName, province, county
select * from distribution where cnName='�춬����'  order by cnName, province, county

--update distribution set oriName=cnName where cnName = '���Ʋ�' or cnName = '����������'
--update distribution set cnName='���Ʋ�' where cnName =  '����������'
--update distribution set descr = 'ɾ��' where cnName='���Ʋ�' and autoid not in (
select min(autoid) from distribution where cnName='���Ʋ�' group by cnName, province, county
)


select * from distribution where cnName='ϸ��' and (province='����' or province='����')

select * from distribution where cnName='����ϸ��' and (province='����' or province='����') 
--update distribution set cnName='ϸ��' where cnName='����ϸ��' and autoid not in (
    select autoid from distribution where cnName='����ϸ��' and (province='����' or province='����') 
)

select * from distribution where cnName='����' and (county='�ٰ���')
--update distribution set descr='����' where cnName='����' and autoid not in (
select autoid from distribution where cnName='����' and (county='�ٰ���')
)


select * from distribution where cnName='ݸ��Ҷ��ǰ'
select * from distribution where cnName='��ǰ'

select * from distribution where cnName like '%��ɫ��ǰ%'
select * from distribution where cnName like '%������ޱ%'

select * from distribution where cnName like '%���Ӳ�(��Ҷ����)%'
select * from distribution where cnName like '%�����%'

select * from distribution where cnName like '%���%'

--update distribution set oriName=cnName where cnName = '���Ӳ�(��Ҷ����)' or cnName = '�����'
--update distribution set cnName='�����' where cnName =  '���Ӳ�(��Ҷ����)'
--update distribution set descr = 'ɾ��' where cnName='�����' and autoid not in (
select min(autoid) from distribution where cnName='�����' group by cnName, province, county
)


select a.latinName from listqin20150428 a, mediInfo b where a.latinName=b.latinName
select a.cnName from listqin20150428 a, mediInfo b where a.cnName=b.cnName

select * from listqin20150428 where autoid not in (select a.autoid from listqin20150428 a, mediInfo b where a.latinName=b.latinName or a.cnName=b.cnName)
select * from listqin20150428 where autoid not in (select a.autoid from listqin20150428 a, mediInfo b where a.cnName=b.cnName)

select * from mediInfo where autoid not in (select b.autoid from listqin20150428 a, mediInfo b where a.latinName=b.latinName or a.cnName=b.cnName)
select * from mediInfo order by autoId

select a.cnName, b.cnName, a.latinName, b.latinName from listqin20150428 a, mediInfo b where a.cnName=b.cnName and a.cnName='����'
select a.cnName, b.cnName, a.latinName, b.latinName from listqin20150428 a, mediInfo b where a.cnName=b.cnName and a.cnName='�����Ĳ�'

select * from county2007 where county like '����%'

select * from listqin20150428 where cnName = '���Ӳ�(��Ҷ����)'order by cnName
select * from listqin20150428 where cnName = '�����' order by cnName

select * from listqin20150428 where cnName like '%���%' order by cnName
select * from listqin20150428 where cnName like '%��ĸ%'order by cnName
select * from listqin20150428 where cnName like '%�춹ɼ%' order by cnName
select * from listqin20150428 where cnName like '%��Ҷ����%' order by cnName
select * from listqin20150428 where cnName like '%�Ĳ��յ��%' order by cnName

select * from distributionZhao where cnName like '%����������%'
select * from listqin20150428 where cnName like '%���Ʋ�%' order by cnName
select * from listqin20150428 where detailSpecies = 1

select distinct(NR) from speciesNR
select * from speciesNR where NR = '����˹' and class = 'plant'

select * from distribution where cnName in (select cnName from listqin20150428 where detailSpecies = 1)

--update distribution set descr=b.descr from distribution a, deleteCounty b
where a.cnName=b.cnName and a.province=b.province and a.county=b.county

select a.* from distribution a, deleteCounty b
where a.cnName=b.cnName and a.province=b.province and a.county=b.county

##species in listqin20150428 that is not in distribution##
select * from listqin20150428 where autoid not in (
select autoid from listqin20150428 where cnName in (select cnName from distribution)
)

select * from distribution where cnName = '��ܸ' and province like '%����%'
select * from distribution where province like '%����%'

select distinct(descr) from distribution
select * from distribution where cnName = '�춬����'

select * from distribution where (descr is null or descr = '���') and cnName in (select cnName from listqin20150428 where detailSpecies=1)
select * from listqin20150428 where detailSpecies = 1 order by cnName

select * from distribution where cnName = '�˽���' order by province
select * from distribution where cnName = '�۷���' order by province
select a.*,b.lat,b.lon from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName and a.cnName = '�˽���' order by a.province
select a.*,b.lat,b.lon from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName and a.cnName = '�۷���' order by a.province
select * from distribution where cnName = '�쾰��' order by province

select * from listqin20150428 where cnName like '%�춹ɼ%'
select * from mediInfo where cnName like '%�춹ɼ%'
select * from m_mediRed where cnName like '%�춹ɼ%'
select * from distribution where cnName = '���ֺ춹ɼ' order by province
select * from distribution where cnName = '�춹ɼ' order by province
select * from distribution where cnName = '�Ϸ��춹ɼ' order by province
select * from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName and a.cnName like '%�춹ɼ%' order by a.autoId
select * from distribution a,county2007 b where a.county = b.county and a.province=b.province and a.cnName like '%�춹ɼ%' order by a.autoId
select * from listqin20150428 where cnName like '%����%'
select * from listqin20150428 where cnName like '%�����%'
select * from distribution where cnName like '%�����%' order by province

select * from distribution where cnName like '%����%' order by province
select * from listqin20150428 where cnName like '%������%'
select * from listqin20150428 where cnName like '%Ǽ��%'
select * from listqin20150428 where cnName like '%������%'
select * from listqin20150428 where cnName like '%�Ĳ��յ��%'
select * from listqin20150428 where cnName like '%�X�m��%'

select * from county2007 where province like '%����%' order by lat

select distinct(descr) from distribution 
select * from distribution where countyCode is null
select * from distribution where latinName is null

#county species without province#
select countyCode, count(distinct(cnName)) from distribution where (descr is null or descr like '%���%')  group by countyCode    
#county species with province#
select countyCode, county, province, count(distinct(cnName)) species from distribution where (descr is null or descr like '%���%') group by countyCode, county, province order by province, county

#detail species#
select province, count(distinct(a.cnName)) species from distribution a, listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%���%') group by province 


--update listqin20150428 set endanstatus = a.endanstatus from listqin20150428, mediInfo a
where listqin20150428.cnName = a.cnName


##���ձ�Σ����
select endanstatus, 
count(distinct(a.cnName)) species,
count(distinct(b.cnFamily)) cnFamily,
count(distinct(b.cnGenus)) cnGenus 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and b.detailSpecies = 1 
and ( descr is null or descr like '%���%') group by endanstatus
order by endanstatus

##����ʡ�ݼ���Σ����
select province, endanstatus, 
count(distinct(a.cnName)) species,
count(distinct(b.cnFamily)) cnFamily,
count(distinct(b.cnGenus)) cnGenus 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and b.detailSpecies = 1 
and ( descr is null or descr like '%���%') group by province,  endanstatus
order by province, endanstatus

##��ʡ����Σ����ͳ��
--ȫ������
select province, 
count(distinct(a.cnName)) species,
count(distinct(b.cnFamily)) cnFamily,
count(distinct(b.cnGenus)) cnGenus 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and (b.detailSpecies = 1 or b.detailSpecies is null) 
and ( descr is null or descr like '%���%') group by province
order by province

select endanstatus, 
count(distinct(a.cnName)) species,
count(distinct(b.cnFamily)) cnFamily,
count(distinct(b.cnGenus)) cnGenus 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and (b.detailSpecies = 1 or b.detailSpecies is null)
and ( descr is null or descr like '%���%') group by endanstatus
order by endanstatus

select province, endanstatus, 
count(distinct(a.cnName)) species,
count(distinct(b.cnFamily)) cnFamily,
count(distinct(b.cnGenus)) cnGenus 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and (b.detailSpecies = 1 or b.detailSpecies is null)
and ( descr is null or descr like '%���%') group by province, endanstatus
order by province, endanstatus

select a.*, b.province from listqin20150428 a, 
(
select distinct(cnName),latinName, province 
from distribution 
where (descr is null or descr like '%���%') 
) b where a.cnName=b.cnName

select b.* from listqin20150428 a, 
(
select cnName,latinName, province, county
from distribution 
where (descr is null or descr like '%���%') 
) b where a.cnName=b.cnName and a. detailSpecies = 1

select * from addInfo
select * from classify

select * from distribution order by descr
select * from distribution where descr is null or descr like '%���%'


select a.province, a.county, a.countyCode, b.plantCount from distribution a, ( 
	select countyCode, count(distinct(a.cnName)) plantCount from distribution a, listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and (descr is null or descr like '%���%')  group by countyCode
) b where a.countyCode=b.countyCode

select a.province, a.county, a.countyCode, b.plantCount from county2007 a, (
select countyCode, count(distinct(a.cnName)) plantCount from distribution a, listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and (descr is null or descr like '%���%')  group by countyCode
) b where a.countyCode=b.countyCode

select province, count(distinct(a.cnName))  from distribution a, listqin20150428 b 
where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%���%')  
and a.cnName in (
	--select a.cnName, count(distinct(a.countyCode)) countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%���%')  group by a.cnName having count(distinct(a.countyCode)) < 5
	select a.cnName countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%���%')  group by a.cnName having count(distinct(a.countyCode)) < 10

)
group by province 

select a.province, a.county, a.countyCode, b.plantCount from distribution a, ( 
	select countyCode, count(distinct(a.cnName)) plantCount from distribution a, listqin20150428 b 
	where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%���%')  
	and a.cnName in 
	(
		--select a.cnName, count(distinct(a.countyCode)) countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%���%')  group by a.cnName having count(distinct(a.countyCode)) < 5
	select a.cnName countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%���%')  group by a.cnName having count(distinct(a.countyCode)) < 5
	)
	group by countyCode
) b where a.countyCode=b.countyCode

select distinct(a.province) from distribution a, ( 
	select countyCode, count(distinct(a.cnName)) plantCount from distribution a, listqin20150428 b 
	where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%���%')  
	and a.cnName in 
	(
		--select a.cnName, count(distinct(a.countyCode)) countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%���%')  group by a.cnName having count(distinct(a.countyCode)) < 5
	select a.cnName countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%���%')  group by a.cnName having count(distinct(a.countyCode)) < 10
	)
	group by countyCode
) b where a.countyCode=b.countyCode

select * from county2007

--update distribution set countyCode = b.countyCode from distribution a, county2007 b
where a.province=b.province and a.county=b.county

select * from county2007 where county like '��ɽ%' -- '%������' 

--update distribution set latinName = b.latinName from distribution a, listqin20150428 b
where a.cnName=b.cnName

--update distribution set latinName = b.latinName from distribution a, mediInfo b
where a.cnName=b.cnName and a.latinName is null

select distinct(cnName) from distribution where latinName is null

select * from mediInfo

--select top 0 * into gardenMedi from gardenMedi0
select *  from gardenMedi0
select *  from gardenMedi

select * from gardenCas

--select top 0 * into garden from gardenCas0

�������㶫�����������ݡ��������Ĵ���̨�塢���ϡ��㽭



select * from listQin20150428 where autoid not in (
select distinct(b.autoId) from gardenCas0 a, listQin20150428 b where a.cnName = b.cnName or a.latinName=b.latinName
) and detailSpecies = 1

select * from listQin20150428 where autoid not in (
select distinct(b.autoId) from gardenMedi a, listQin20150428 b where a.cnName = b.cnName or a.latinName=b.latinName
) and detailSpecies = 1

##�½����ɼ���ɾ��##
select * from distribution where province = '�½�' and latinName = 'Ephedra sinica'
select * from distribution where province = '�½�' and latinName = 'Przewalskia tangutica'
select * from distribution where province = '�½�' and latinName = 'Fritillaria cirrhosa'
select * from distribution where province = '�½�' and latinName = 'Euphorbia kansui'
select * from distribution where province = '�½�' and latinName = 'Lithospermum erythrorhizon'
select * from distribution where province = '�½�' and latinName = 'Notopterygium incisum'
select * from distribution where province = '�½�' and latinName = 'Anisodus tanguticus'
select * from distribution where province = '�½�' and latinName = 'Adonis aestivalis'
select * from distribution where province = '�½�' and latinName = 'Anemarrhena asphodeloides'
####


###�����ۺ�����ͳ��,listQin20150428��mediInfo��ϵ����###
#��֤��������������Ƿ�ͳһ
select * from addInfo
select * from mediInfo where cnName like '%����������%'
--update mediInfo set detailSpecies=1 where cnName in (select cnName from listQin20150428 where  detailSpecies = 1) or latinName in (select latinName from listQin20150428 where  detailSpecies = 1)

select * from mediInfo where cnName in (select cnName from listQin20150428 where  detailSpecies = 1) or latinName in (select latinName from listQin20150428 where  detailSpecies = 1) order by autoId

select cnName from listQin20150428 where  detailSpecies = 1
select latinName from listQin20150428 where  detailSpecies = 1

select * from mediInfo WHERE AUTOID NOT IN (SELECT autoid from mediInfo where cnName in (select cnName from listQin20150428 where  detailSpecies = 1)) 
and detailSpecies = 1

select * from mediInfo WHERE AUTOID NOT IN (SELECT autoid from mediInfo where latinName in (select latinName from listQin20150428 where  detailSpecies = 1)) 
and detailSpecies = 1

select * from listQin20150428 where detailSpecies = 1 and cnName in (select cnName from mediInfo) 
select * from listQin20150428 where autoid not in (
	select autoid from listQin20150428 where detailSpecies = 1 and cnName in (select cnName from mediInfo) 
) and detailSpecies = 1

select * from listQin20150428 where autoid not in (
	select autoid from listQin20150428 where detailSpecies = 1 and latinName in (select latinName from mediInfo) 
) and detailSpecies = 1

select cnName, count(cnName) from mediInfo where detailSpecies = 1 group by cnName
select latinName, count(latinName) from mediInfo where detailSpecies = 1 group by  latinName
select * from mediInfo where latinName = 'Paris polyphylla' ---ԭ����¥����Ҷһ֦�� �ظ��ˡ�
 

select * from mediInfo where detailSpecies = 1 and cnFamily is null 

--update mediInfo set cnFamily=a.cnFamily, latinFamily=a.latinFamily, cnGenus=a.cnGenus--, latinGenus=a.latinGenus
from mediInfo, listQin20150428 a where (mediInfo.cnName=a.cnName or mediInfo.latinName=a.latinName) AND mediInfo.detailSpecies = 1 and mediInfo.cnFamily is null 

select cnFamily, latinFamily, cnGenus, latinGenus from 
 
 
 
 
--ͳ��ֲ��԰������
select cnGarden, count(*) from gardenCas 
where latinName in (select latinName from listQin20150428 where detailSpecies = 1)
or cnName in  (select cnName from listQin20150428 where detailSpecies = 1)
group by cnGarden order by cnGarden

--ͳ��ֲ��԰������gardenMedi
select cnGarden, count(*) from gardenMedi 
where latinName in (select latinName from listQin20150428 where detailSpecies = 1)
or cnName in  (select cnName from listQin20150428 where detailSpecies = 1)
group by cnGarden


select * from county2007 where province like '%̨��%'

select * from gardenMedi
select * from gardenCas where isCas = 1
--insert gardenCas(cnName, latinName, cnGarden, IsCas) select cnName, latinName, cnGarden, 2 from gardenMedi

select * from gardenMedi
select * from gardenCas

update gardenMedi set cnGarden='����ҩֲ' where cnGarden='����ֲ'
update gardenMedi set cnGarden='��ʩҩֲ' where cnGarden='��ʩֲ'
update gardenMedi set cnGarden='��ҩֲ' where cnGarden='��ֲ'
update gardenMedi set cnGarden='��ҩֲ' where cnGarden='��ֲ'
update gardenMedi set cnGarden='��ɽҩֲ' where cnGarden='��ɽֲ'

select * from mediInfo where detailSpecies = 1 order by autoId
select * from m_mediRed
select * from list
--update mediInfo set ecoType1=a.ecoType1, ecoType2=a.ecoType2,ecoType3=a.ecoType3
from mediInfo, m_mediRed a where mediInfo.cnName=a.cnName or mediInfo.latinName=a.latinName

--update mediInfo set mediPart=a.mediPart
from mediInfo, m_mediRed a where mediInfo.cnName=a.cnName or mediInfo.latinName=a.latinName

select * from mediInfo where detailSpecies = 1



select * from m_mediRed a, mediInfo b where a.cnName = b.cnName or a.latinName = b.latinName order by b.autoid


select * from distribution where cnName like '%����ĸ%' order by province

select * from endemHuang

select * from mediInfo

--update mediInfo set endemHuang=1 from mediInfo, endemHuang a where mediInfo.latinName=a.latinName

select * from county2007 where county like '%��ʩ����������������%'
select * from county2007 where county like '%������%'
select * from county2007 where county like '%������%'
select * from county2007 where county like '%������%'
select * from county2007 where county like '%�ڳ���%'
select * from county2007 where county like '%��ɽ%'

select * from listQin20150428 where latinFamily like '%Balanophoraceae%'

select * from endemHuang
select * from listQin20150428 order by cnfamily, cnGenus, autoid


select * from funcXJ

select * from NFCFXJ

--update mediInfo set endem=1 where [����]='��' or [����]='��1' or endemHuang=1
--update mediInfo set endem=0 where endem is null
select * from mediInfo where endem=1
select * from mediInfo where endem=0


select * from mediInfo where detailSpecies = 1
select * from classify

select count(cnFamily), count(cnGenus), count(cnName) from mediInfo where endanStatus='CR' group by cnFamily, cnGenus, cnName

select cnFamily, count(*) from mediInfo where endanStatus='CR' group by cnFamily

select distinct(endanStatus) from mediInfo
select '��', endanStatus, count(distinct(cnFamily))  cnFamily, count(distinct(cnGenus)) cnGenus, count(distinct(cnName))cnName 
from mediInfo where flavour like '%��%' group by endanStatus;

select * from mediInfo where endanStatus = 'EW'

select distinct(flavour) from mediInfo
select flavour, cnFamily, cnGenus, cnName from mediInfo where flavour like '%��%'

select flavour, count(distinct(cnFamily)) cnFamily, count(distinct(cnGenus)) cnGenus, count(distinct(cnName)) cnName
from mediInfo where flavour like '%��%' group by flavour

declare @flavour nvarchar(255), @item


select top 2 'aaa' + str(func1) + func2 + func3 from classify

select cnName,  
case func1 when null then '' else '��' + ltrim(rtrim(str(func1))) end 
+ case func2 when null then '' else '��' + ltrim(rtrim(str(func2))) end
+ case func3 when null then '' else '��' + ltrim(rtrim(str(func3))) end
+ '��' from classify

--update mediInfo set func=a.func from mediInfo, (select cnName,  
case func1 when null then '' else '��' + ltrim(rtrim(str(func1))) end 
+ case func2 when null then '' else '��' + ltrim(rtrim(str(func2))) end
+ case func3 when null then '' else '��' + ltrim(rtrim(str(func3))) end
+ '��' as func from classify) a where mediInfo.cnName=a.cnName
 
select * from mediInfo where detailSpecies = 1 and (cnMediPart is null or mediPart is null)
select * from mediInfo where detailSpecies = 1 and mediPart is null order by id

select b.* from mediInfo a, classify b where a.cnName=b.cnName

--update mediInfo set flavour = a.flavor, property=a.property, channel=a.channel, habitat=a.habitat
from mediInfo, classify a where mediInfo.cnName=a.cnName


#####################ͳ��������#################
##ecotype##  preface����
select ecoType1, count(distinct(cnFamily)), count(distinct(cnGenus)), count(distinct(cnName)) from mediINfo where detailSpecies = 1  group by ecoType1 
select ecoType2, count(distinct(cnFamily)), count(distinct(cnGenus)), count(distinct(cnName)) from mediINfo where detailSpecies = 1  group by ecoType2 
select ecoType3, count(distinct(cnFamily)), count(distinct(cnGenus)), count(distinct(cnName)) from mediINfo where detailSpecies = 1  group by ecoType3 


------������-----------------
##����Σ�ȼ�������##  preface����
select endanStatus, count(distinct(cnFamily)) cnFamily, count(distinct(cnGenus)) cnGenus, count(distinct(cnName)) cnName
from mediInfo where detailSpecies = 1 group by endanStatus

##����Σ�ȼ�������##  preface����
select endanStatus, ecoType1, count(ecotype1) from mediInfo where detailSpecies = 1 group by endanStatus, ecoType1
select endanStatus, ecoType3, count(ecotype3) from mediInfo where detailSpecies = 1 group by endanStatus, ecoType3

##����Σ�ȼ�ҩ������##
--������������

--����Σ�ȼ�ҩζ
select endanStatus, flavour, count(flavour) from mediInfo where detailSpecies = 1 and flavour like '%��%' group by endanStatus, flavour
select endanStatus, flavour, count(flavour) from mediInfo where detailSpecies = 1 and flavour like '%��%' group by endanStatus, flavour
select endanStatus, flavour, count(flavour) from mediInfo where detailSpecies = 1 and flavour like '%��%' group by endanStatus, flavour
select endanStatus, flavour, count(flavour) from mediInfo where detailSpecies = 1 and flavour like '%��%' group by endanStatus, flavour
select endanStatus, flavour, count(flavour) from mediInfo where detailSpecies = 1 and flavour like '%��%' group by endanStatus, flavour


select flavour, count(flavour) 
from mediInfo 
where detailSpecies = 1 and flavour like '%��%' 
group by endanStatus, flavour

select endanStatus, flavour from mediInfo group by endanStatus, flavour

select endanStatus, flavour, count(*) from 
(
select '��' as flavour, endanStatus from mediInfo where flavour like '%��%'
union
select '��' as flavour, endanStatus from mediInfo where flavour like '%��%'
union
select '��' as flavour, endanStatus from mediInfo where flavour like '%��%'
union
select '��' as flavour, endanStatus from mediInfo where flavour like '%��%'
union
select '��' as flavour, endanStatus from mediInfo where flavour like '%��%'
) as a group by endanStatus, flavour


##��������##
select endanStatus, habitat, count(habitat) from mediInfo where detailSpecies = 1 and habitat like '%1%' group by endanStatus, habitat
select endanStatus, habitat, count(habitat) from mediInfo where detailSpecies = 1 and habitat like '%2%' group by endanStatus, habitat
select endanStatus, habitat, count(habitat) from mediInfo where detailSpecies = 1 and habitat like '%3%' group by endanStatus, habitat
select endanStatus, habitat, count(habitat) from mediInfo where detailSpecies = 1 and habitat like '%4%' group by endanStatus, habitat
select endanStatus, habitat, count(habitat) from mediInfo where detailSpecies = 1 and habitat like '%5%' group by endanStatus, habitat
select endanStatus, habitat, count(habitat) from mediInfo where detailSpecies = 1 and habitat like '%6%' group by endanStatus, habitat
select endanStatus, habitat, count(habitat) from mediInfo where detailSpecies = 1 and habitat like '%7%' group by endanStatus, habitat
select endanStatus, habitat, count(habitat) from mediInfo where detailSpecies = 1 and habitat like '%8%' group by endanStatus, habitat

select * from mediInfo where detailSpecies = 1

##garden##
select * from garden
select * from gardenCas
select * from gardenMedi

select * from county2007 where county like '%����%'
select * from county2007 where county like '%����%'
select * from county2007 where county like '%�������%'
select * from county2007 where county like '%��˫����%'
select * from county2007 where county like '%�ڳ�%'


У��mediInfo��listqin20150428
select * from listqin20150428 
where latinName like 'Anemone flaccida' or latinName like 'Arnebia euchroma' 
or latinName like 'Arnebia guttata' or latinName like 'Dendrobium nobile'
or latinName like 'Balanophora harlandii'

select * from listqin20150428 where autoid not in (
select autoid from listqin20150428 where detailSpecies=1 and 
latinName in (select latinName from mediInfo where detailSpecies = 1)
) and detailSpecies=1

--update mediInfo set detailSpecies=2 where (cnName in 
(select cnName from listqin20150428 where detailSpecies=2)
or latinName in (select latinName from listqin20150428 where detailSpecies=2))

select * from mediInfo where detailSpecies=2 and id not in (
select id from mediInfo where (cnName in 
	(select cnName from listqin20150428 where detailSpecies=2)
	or latinName in (select latinName from listqin20150428 where detailSpecies=2))
)

select cnName, count(*) from listqin20150428 where detailSpecies=2 group by cnName having count(*) > 1
select latinName, count(*) from listqin20150428 where detailSpecies=2 group by latinName having count(*) > 1

select * from mediInfo where detailSpecies=2 and cnName not in (select cnName from listqin20150428 where detailSpecies=2)
select * from mediInfo where detailSpecies=2 and latinName not in (select latinName from listqin20150428 where detailSpecies=2)
select distinct(detailSpecies) from mediInfo

select * from listqin20150428 where detailSpecies=2 and cnName not in (select cnName from mediInfo where detailSpecies=2)
select latinName from listqin20150428 where detailSpecies=2 and latinName not in (select latinName from mediInfo where detailSpecies=2)

select * from listqin20150428 where autoid not in (
select a.autoid from listqin20150428 a, mediInfo b where a.latinName=b.latinName and a.detailSpecies=2
union 
select a.autoid from listqin20150428 a, mediInfo b where a.cnName=b.cnName and a.detailSpecies=2
) and detailSpecies=2

select * from ecoType
--update mediinfo set ecoType1=a.ecotype1, ecoType2=a.ecotype2, ecoType3=a.ecotype3
from mediInfo b, ecoType a where b.cnName=a.cnName or a.latinName=b.latinName

select b.* from proList12 a, medi.dbo.mpam b where a.cnName=b.cnName or a.latinName=b.latinName

select * from mediProList
Panthera tigris Linnaeus
update mediProList set latinNameOri=ltrim(rtrim(latinNameOri))
select latinNameOri, 
SUBSTRING(latinNameOri, CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri)),
left(latinNameOri, CHARINDEX(' ', latinNameOri)) + ' ' 
+left(
	SUBSTRING(latinNameOri, 
		CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri)
	), 
	CHARINDEX(' ', 
		SUBSTRING(latinNameOri, 
			CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri)
		)
	)
)
from mediProList 
select * from mediProList

update mediProList set latinName=left(latinNameOri, CHARINDEX(' ', latinNameOri)) + ' ' 
+left(
	SUBSTRING(latinNameOri, 
		CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri)
	), 
	CHARINDEX(' ', 
		SUBSTRING(latinNameOri, 
			CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri)
		)
	)
)
where latinName is null

select * from redfu

select left(latinNameOri, CHARINDEX(' ', latinNameOri)) + ' ' 
+left(
	SUBSTRING(latinNameOri, 
		CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri)
	), 
	CHARINDEX(' ', 
		SUBSTRING(latinNameOri, 
			CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri)
		)
	)
) 
from redfu

update redfu set latinName=left(latinNameOri, CHARINDEX(' ', latinNameOri)) + ' ' 
+left(
	SUBSTRING(latinNameOri, 
		CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri)
	), 
	CHARINDEX(' ', 
		SUBSTRING(latinNameOri, 
			CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri)
		)
	)
) 
where latinName is null

update 
where CHARINDEX(' ', latinNameOri) > 0 and CHARINDEX(' ', SUBSTRING(latinNameOri, CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri))) > 0

select latinNameOri, SUBSTRING(latinNameOri, CHARINDEX(' ', latinNameOri)+1, len(latinNameOri)-CHARINDEX(' ', latinNameOri)) from mediProList where CHARINDEX(' ', latinNameOri) > 0

select * from proList12 where tag=1
select * from proList12 where (cnName in (select cnName from medi.dbo.mpam)
or latinName in (select latinName from medi.dbo.mpam)) --and upper(latinFamily) !=  upper('Orchidaceae')
and id not in (
	select id from proList12 where upper(latinFamily) =  upper('Orchidaceae') and tag=2
	and (
	cnName in (select cnName from medi.dbo.mpam)
	or latinName in (select latinName from medi.dbo.mpam)
	)
)

select * from redfu where (cnName in (select cnName from medi.dbo.mpam)
or latinName in (select latinName from medi.dbo.mpam)) --and upper(latinFamily) !=  upper('Orchidaceae')
and id not in (
	select id from redfu where upper(latinFamily) =  upper('Orchidaceae')
	and (
	cnName in (select cnName from medi.dbo.mpam)
	or latinName in (select latinName from medi.dbo.mpam)
	)
)

select latinName, left(latinName, CHARINDEX(' ', latinName)) from redfu
--update redfu set latinGenus = left(latinName, CHARINDEX(' ', latinName)) 
--update redfu set latinFamily = b.latinFamily from redfu a, medi.dbo.mpam b 
where a.latinGenus=b.latinGenus
select * from medi.dbo.mpam

--update redfu set latinFamily = b1.latinFamily from redfu a,
(
	select a.latinName latinFamily, b.latinGenus from medi.dbo.mfamily a, medi.dbo.mpam b
	where a.id=b.familyId
) b1 where a.latinGenus=b1.latinGenus

select * from medi.dbo.mfamily


select * from redfu where cnName in (select cnName from medi.dbo.mpam)
or latinName in (select latinName from medi.dbo.mpam)


select * from distribution where oriName is not null order by oriName

select * from listqin20150428 where latinName like '%Balanophora%' order by latinName

select * from listqin20150428 where cnName like '%�ʲ�%'


select * from mediInfo where detailSpecies=1
select * from garden
�ظ����� select a.* from garden a, mediInfo b, (select cnName from mediInfo where detailSpecies=1) c where a.cnName =c.cnName order by b.id

##����--ֲ��԰
select * from garden 
where latinName in (select latinName from mediInfo where detailSpecies = 1)
or cnName in (select cnName from mediInfo where detailSpecies = 1)
order by cnName desc

##δֲ��԰���������
select * from mediInfo where cnName not in (select cnName from garden) and latinName not in (select latinName from garden) and detailSpecies =1

select * from mediInfo where cnName like '%�۰������%'
select * from mediInfo where cnName like '%ë������%'
select * from mediInfo where cnName like '%ʯ����%'
select * from mediInfo where cnName like '%������%'
select * from mediInfo where cnName like '%���϶�����%'
select * from mediInfo where cnName like '%��ٲ�%'
select * from mediInfo where cnName like '%������%'
select * from mediInfo where cnName like '%�X�m��%'
select * from mediInfo where cnName like '%�㽪%'
select * from mediInfo where cnName like '%���ϼ�ɰ��%'
select * from mediInfo where cnName like '%����%'
select * from mediInfo where cnName like '%����ɰ��%'


select * from distribution where descr is null
select * from mediInfo where detailSpecies = 1
select * from listqin20150428



select * from mediInfo order by id

select * from distribution
select * from county2007
select * from distributionAdd20181110
select latinName, county, count(*), min(autoId) from distributionAdd20181110 group by latinName, county

select * from  distributionAdd20181110 
where autoid not in (select min(autoId) from distributionAdd20181110 group by latinName, county)
--delete distributionAdd20181110 
--where autoid not in (select min(autoId) from distributionAdd20181110 group by latinName, county)
select * from distributionAdd20181110 where latinName in (select latinName from distribution)
select * from distributionAdd20181110 a join distribution b on a.latinname=b.latinName and a.county = b.county


select * from distributionAdd20181110 where latinName = 'Fritillaria walujewii' and county='��³ľ����'
select * from distribution where latinName = 'Fritillaria walujewii' and county='��³ľ����'
select * from distributionAdd20181110 where latinName = 'Cephalotaxus oliveri' and county='��ʢ��'
select * from distribution where latinName = 'Cephalotaxus oliveri' and county='��ʢ��'


select distinct latinName from (
    select a.latinName, a.county as aCounty, b.county as bcounty from distributionAdd20181110 a 
	left join distribution b on a.latinname=b.latinName and a.county = b.county
	where a.latinName in (select latinName from distribution)
	union
	select b.latinName, a.county as acounty, b.county as bcounty from distributionAdd20181110 a 
	right join distribution b on a.latinname=b.latinName and a.county = b.county
	where b.latinName in (select latinName from distributionAdd20181110)
) a


---ѡ�����ֲַ��Ĳ�ͬ
select a.cnName, a.latinName, a.county as aCounty, b.county as bcounty from distributionAdd20181110 a 
left join distribution b on a.latinname=b.latinName and a.county = b.county
where a.latinName in (select latinName from distribution)
union
select b.cnName, b.latinName, a.county as acounty, b.county as bcounty from distributionAdd20181110 a 
right join distribution b on a.latinname=b.latinName and a.county = b.county
where b.latinName in (select latinName from distributionAdd20181110)


select distinct (descr) from distribution 
select * from distribution where cnName = '��������ɼ' and descr is not null
select * from distribution where cnName = '�ʲ�' and descr is not null
select * from distribution where cnName = '�½���ĸ' and descr is not null
select * from distribution where cnName = '����������' and descr is not null

select * from distribution where cnName = '����¥'
select * from distribution where cnName = 'ǧ����'
select * from distribution where cnName = '��������ζ��'
select * from distribution where cnName = '��Ҷ���鲹'

select * from distribution where latinName = 'Paris polyphylla var. yunnanensis'
select * from distribution where latinName = 'Murraya paniculata'
select * from distribution where latinName = 'Davallia formosana'
select distinct (cnName) from distribution


select * from distributionAdd20181110 order by autoid
select * from distributionAdd20181110 where cnName = '��������ɼ'




##�����Ĳ�
select * from distribution where cnName like '%�����Ĳ�%'
select * from distribution0 where cnName like '%�����Ĳ�%'
select * from distributionAdd1 where cnName like '%�����Ĳ�%'
select * from distributionAdd20181110 where cnName like '%�����Ĳ�%'
select * from distributionZhao where cnName like '%�����Ĳ�%'
select * from distributionZhao0 where cnName like '%�����Ĳ�%'

select * from county2007 a, countycordyceps b where a.county = b.county
select * from list
select * from countycordyceps


#����#
select * from distribution where cnName like '%����%'
select * from distribution0 where cnName like '%����%'
select * from distributionAdd1 where cnName like '%����%'
select * from distributionAdd20181110 where cnName like '%����%'
select * from distributionZhao where cnName like '%����%'
select * from distributionZhao0 where cnName like '%����%'

select * from county2007 where province = '���ɹ�' or province = '����' or province = '����' or province = '����' or province = '�ຣ' or province = '�½�' order by autoid



##20190722
select * from distribution where cnName = '������'
select * from distribution a, county2007 b where a.cnName = '�½���ĸ' and a. countycode =b.countycode order by a.autoid



select * from distribution where descr is not null
select * from distribution where cnName like '%ɳ����%'
select * from distribution
select * from distributionAdd1
select * from distributionAdd20181110

##check the modifying time of the table: 20190727
select modify_date from sys.tables where name='distribution0'    2015-05-14 23:45:13.530
select modify_date from sys.tables where name='distributionAdd1'   2015-05-14 22:14:28.443
select modify_date from sys.tables where name='distributionAdd20181110'   2018-11-10 15:30:14.097
select modify_date from sys.tables where name='distribution'   2015-06-19 06:30:04.100

-- select * into distribution from distribution20190727
# ���distributionAdd1 �Ƿ��Ѿ�����distribution��,�Ѿ�ȫ������distribution��.
select distinct  cnName from distributionAdd1 where cnName not in (select cnName from distribution)
select * from distribution where oriname is not null

select distinct  cnName from distributionAdd20181110 where cnName not in (select cnName from distribution)
select distinct  cnName from distributionAdd20181110 where cnName in (select cnName from distribution)

select a.cnName, a.latinName, a.county as aCounty, b.county as bcounty from distributionAdd20181110 a 
left join distribution b on a.latinname=b.latinName and a.county = b.county
where a.latinName in (select latinName from distribution) and a.cnName='ɣ����'
union
select b.cnName, b.latinName, a.county as acounty, b.county as bcounty from distributionAdd20181110 a 
right join distribution b on a.latinname=b.latinName and a.county = b.county
where b.latinName in (select latinName from distributionAdd20181110) and a.cnName='ɣ����'

select * from distribution where cnName='ɣ����'

select * from distributionAdd20181110 where cnName='ɣ����'
select distinct cnname, county from distributionAdd20181110 where cnName='ɣ����'

select distinct cnname, county from distributionAdd20190722
select * from distributionAdd20190722 where cnName='ɣ����'


delete distributionAdd20190722 where id in 
(select max(id) from distributionAdd20190722 group by cnname, county having count(*) > 1  )

select * from distributionAdd20190722 a join 
(
select cnName, county from distributionAdd20190722 group by cnname, county having count(*) > 1
) b on a.cnName=b.cnName and a.county=b.county order by a.cnname, a.county

select * from distribution
select * from countyCordyceps
select a.autoid from countyCordyceps a join distribution b 
on a.cnName=b.cnName and a.county=b.county and a.countyCode=b.countyCode

insert into distribution (cnName, latinName, county, countycode,province) 
select a.cnName, a.latinName, a.county, a.countycode, b.province 
from countyCordyceps a join county2007 b on a.countycode = b.countyCode

select * from county2007
select * from countyCordyceps a join county2007 b on a.countycode = b.countyCode

select distinct  cnName from distributionAdd20190722 where cnName not in (select cnName from distribution)
select distinct  cnName from distributionAdd20190722 where cnName  in (select cnName from distribution)

select distinct  cnName from distributionAdd20181110 where cnName not in (select cnName from distribution)
select distinct  cnName from distributionAdd20181110 where cnName  in (select cnName from distribution)

select * from distributionAdd20181110
select * from distributionAdd20190722



select a.cnName, a.latinName, a.county, b.countycode, b.province 
(
select cnName, latinName, county from distributionAdd20190722
union 
select cnName, latinName, county from distributionAdd20181110
) a join county2007 b on a.countycode = b.countyCode

select distinct cnName, latinName from
(
select cnName, latinName, county from distributionAdd20190722
union 
select cnName, latinName, county from distributionAdd20181110
) a order by cnName, latinName

select * from distributionAdd20190722 where latinName not in (select latinName from distributionAdd20181110)

select distinct cnName, latinName from distributionAdd20190722 where cnName='������'
select distinct cnName, latinName from distributionAdd20181110 where cnName='������'
--update distributionAdd20181110 set latinName='Paeonia veitchii' where cnName='������'

select distinct cnName, latinName from distributionAdd20190722
union 
select distinct cnName, latinName from distributionAdd20181110


insert into distribution (cnName, latinName, county, countycode,province) 
select a.cnName, a.latinName, a.county, b.countycode, b.province 
from distributionAdd20190722 a join county2007 b on a.county = b.county
where cnName not in (select cnName from distribution)

select distinct a.county, b.countycode --, b.province
from distributionAdd20190722 a join county2007 b on a.county = b.county

select * from county2007 where county in (
select county from 
(
select distinct a.county, b.countycode --, b.province
from distributionAdd20190722 a join county2007 b on a.county = b.county
) x
group by county having count(*) > 1
) 

update distributionAdd20190722 set countyCode=bb.countycode 

from distributionAdd20190722 aa , 
(
	select county, countyCode from county2007 where county in (
	select county from 
	(
	select distinct a.county, b.countycode --, b.province
	from distributionAdd20190722 a join county2007 b on a.county = b.county where a.countycode is null
	) x
	group by county having count(*) = 1
	) 
)bb where aa.county=bb.county and aa.countyCode is null

select    *  from distributionAdd20190722 where countyCode is null AND COUNTY='���������'
select   *  from distributionAdd20190722 where countyCode is null  order by county

select  * FROM county2007 WHERE COUNTY='���������'
SELECT * FROM distributionAdd20190722  WHERE countyCode is null and COUNTY='���������'
SELECT * FROM distributionAdd20190722  WHERE  COUNTY='���������'
select * from county2007 WHERE COUNTY='����Ǽ��������'
���������  

--update distributionAdd20190722 set county=rtrim(ltrim(county)) where cnName not in (select cnName from distribution)

SELECT   id, latinName, cnName, County, CountyCode
FROM      distributionAdd20190722
WHERE   (CountyCode IS NULL)
ORDER BY County, cnName

--insert into distribution (cnName, latinName, county, countycode,province) 
select a.cnName, a.latinName, b.county, b.countycode, b.province 
from distributionAdd20190722 a join county2007 b on CAST(a.countyCodeInt AS INT) = b.countyCode
where cnName not in (select cnName from distribution)

select * from distributionAdd20190722 where countyCodeInt is null

--update distributionAdd20190722  set countyCode=rtrim(ltrim(countyCode))
select * from distributionAdd20190722 where countyCode like '%500119%' 
--update distributionAdd20190722 set countyCode = '532600' where countyCode like '%532600%' 
select * from distributionAdd20190722  where countycode like'%char(13)%'


		
--update distributionAdd20190722 set countyCodeInt=REPLACE(countyCodeInt,char(13), '')

--insert into distribution (cnName, latinName, county, countycode,province) 
select a.cnName, a.latinName, b.county, b.countycode, b.province 
from distributionAdd20181110 a join county2007 b 
on STR(a.lat, 5, 2) =STR(b.lat, 5, 2) and STR(a.lon, 6, 2)=STR(b.lon, 6, 2)
where cnName not in (select cnName from distribution)

select lat, STR(lat, 5, 2), substring(str(lat),1,5) from distributionAdd20181110 where county not in (select county from )
select lon, STR(lon, 6, 2), substring(str(lon),1,5) from distributionAdd20181110 

select distinct county from distributionAdd20181110 where county not in (select county from county2007)

--update distributionAdd20181110 set county = replace(county, '��Ͻ��', '') where county like '%��Ͻ��'

--update distributionAdd20181110 set county='������' where county='������';
--update distributionAdd20181110 set county='���������' where county='�е���';
--update distributionAdd20181110 set county='������' where county='������';
--update distributionAdd20181110 set county='��������' where county='��������';
--update distributionAdd20181110 set county='������' where county='����������������';
--update distributionAdd20181110 set county='��ʯ��' where county='��ʯ��';
--update distributionAdd20181110 set county='ҫ����' where county='ҫ��';
--update distributionAdd20181110 set county='�����' where county='�����';
--update distributionAdd20181110 set county='��ͽ��' where county='��ͽ��';
--update distributionAdd20181110 set county='������' where county='������';
--update distributionAdd20181110 set county='�ٲ���' where county='�ٲ���';
--update distributionAdd20181110 set county='�ϴ���' where county='�ϴ���';
--update distributionAdd20181110 set county='ǭ����' where county='ǭ������������������';
--update distributionAdd20181110 set county='�䶼��' where county='�䶼��';
--update distributionAdd20181110 set county='��ɽ��' where county='��ɽ��';
--update distributionAdd20181110 set county='������' where county='������';
--update distributionAdd20181110 set county='������' where county='������';
--update distributionAdd20181110 set county='�˲���' where county='�˲���';
--update distributionAdd20181110 set county='������' where county='������';
--update distributionAdd20181110 set county='������' where county='������';
--update distributionAdd20181110 set county='����ɽ��' where county='������';
--update distributionAdd20181110 set county='������' where county='������';      ##����
--   �뽭�� -->	��ɽ��


--insert into distribution (cnName, latinName, county, countycode,province) 
select a.cnName, a.latinName, b.county, b.countycode, b.province 
from distributionAdd20181110 a join county2007 b 
on a.county=b.county
where cnName not in (select cnName from distribution)

select distinct b.county
from distributionAdd20181110 a join county2007 b 
on a.county=b.county

select * from distributionAdd20181110 where county in 
(
select county
from (
    select distinct a.county, b.countyCode from distributionAdd20181110 a join county2007 b 
on a.county=b.county ) aa
group by county having count(*) > 1
)
select * from distribution where cnname in ('����޽', '������')



select distinct cnName from distribution where  autoId > 18565 order by autoid

select distinct cnName from distribution where cnname = '����'
select distinct cnName from distribution where cnname like '%����ɼ%'
select distinct cnName from distribution where cnname like '%��״����%'
select distinct cnName from distribution where cnname like '%���ٴ��%'  --
select distinct cnName from distribution where cnname like '%ɣ����%'
select distinct cnName from distribution where cnname like '%������%'
select distinct cnName from distribution where cnname like '%��ݹ��%'
select distinct cnName from distribution where cnname like '%���Ҳ�%'
select distinct cnName from distribution where cnname like '%�½���ĸ%'

select * from distribution where oriname like '%���ٴ��%'
select * from distribution where oriname like '%�Ƕ�%'
select * from distribution where cnname like '%�½���ĸ%'
select * from m_medired where cnfamily like '%��꪿�%'

select * from m_medired order by id 
select * from distribution order by autoid

select a.autoid, a.cnName, a.latinName, b.*
from distribution a join county2007 b 
on a.county=b.county and a.countycode=b.countycode order by a.autoid


select * from county2007
select * from distribution where cnname like '%�춬����%' order by autoid
select * from distributionAdd20190722

select distinct cnName from distribution where cnname in (select distinct cnname from distributionadd20190722)


select * from distribution where --descr is not null and 
(descr is null or ( descr <> '����' and descr <> 'ɾ��' and descr <> '����ɾ��'  and descr <> '����ɾ��1')) and
cnName in ('��Ҷ���鲹','���','��ҶǼ��','����','����','����޽','��ɽ����޽','����','������','��ҩ','��ͷ','������','������','ǧ����','����','��ɽҩ','�ٰٺ�','����¥','����','��������ɼ','����','��״����','���ٴ��','ɣ����','������','��ݹ��','���Ҳ�','�½���ĸ')

select distinct cnName from distribution where --descr is not null and 
(descr is null or ( descr <> '����' and descr <> 'ɾ��' and descr <> '����ɾ��'  and descr <> '����ɾ��1')) and
cnName in ('�����Ĳ�','��Ҷ���鲹','���','��ҶǼ��','����','����','����޽','��ɽ����޽','����','������','��ҩ','��ͷ','������','������','ǧ����','����','��ɽҩ','�ٰٺ�','����¥','����','��������ɼ','����','��״����','���ٴ��','ɣ����','������','��ݹ��','���Ҳ�','�½���ĸ')

select a.autoId, a.cnName, a.latinName,b.provinceCode, b.province,b.countyCode, b.county,b.lat, b.lon
from distribution a, county2007 b
where a.county=b.county and 
(a.descr is null or ( a.descr <> '����' and a.descr <> 'ɾ��' and a.descr <> '����ɾ��'  and a.descr <> '����ɾ��1')) and
a.cnName in ('�����Ĳ�','��Ҷ���鲹','���','��ҶǼ��','����','����','����޽','��ɽ����޽','����','������','��ҩ','��ͷ','������','������','ǧ����','����','��ɽҩ','�ٰٺ�','����¥','����','��������ɼ','����','��״����','���ٴ��','ɣ����','������','��ݹ��','���Ҳ�','�½���ĸ')
order by a.autoId

select county
from distribution where cnName in ('�����Ĳ�') and county in ('������','������','С����','������','��¡��','â����','������','������','������','�ĺ���','������','������','�¸���','������','ʯ����','�����','�Ž���','������','������','�ʵ���','������','�ղ���','��Դ����������','������','��������������','��¡����������','�����','������','ͬ����','�˺���','�����','�����ɹ���������','�ǹ���','������','������','ī�񹤿���','����������������','������','��֥��','������','������','������','����ľ��','��ͨ��������������','��Դ��','������','��������','������','�Ӷ���','������')
group by county having count(*) > 1
order by a.county,

select b.county
from distribution a, county2007 b
where a.county=b.county and 
a.cnName in ('�����Ĳ�')
group by b.county having count(*) > 1
