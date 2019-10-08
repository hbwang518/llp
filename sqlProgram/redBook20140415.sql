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
select * from addInfo where 致危因子 is not null
select * from [0compare]

--mediRed
select '中文名:' + cnName + ' ' + latinName + ' ' + latinFamily + '__' + '拉丁名:' + cnFamily from m_mediRed
select * from addInfo
select * from allType
select * from county2007 where county like '%重庆%'order by province
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
select * from mediInfo where 致危因子 is not null or 保护建议 is not null
select * from addInfo where 致危因子 is not null or 保护建议 is not null
select * from mediInfo order by 中文科名
select * from mediInfo where detailSpecies=1
select * from arbor
select * from shrubAndGrass
select * from environment
select * from plantBJ

select * from distribution
select * from deleteCounty


select * from distribution where cnName like '%林荫银莲花%'
select * from distribution where latinName like '%Anemone flaccida%'

select * from mediInfo where cnName like '%林荫银莲花%'

##mediPart##
select *, SUBSTRING(d.code, LEN(d.code)-1, 2) from medi.dbo.mMedi d



338 - 312 26-- 369 
select * from mediInfo
select * from [0compare] a, mediInfo b where a.cnName=b.中文名
select * from [0compare] a, mediInfo b where a.cnName<>b.中文名

select * from mediInfo where id not in (select id from mediInfo where 中文名 in (select cnName from [0compare]) )

select * from county2007 where county like '%市辖区%'  无,说明全为有意义名称
select * from mediInfo where 致危因子 is not null

select a.riskReason, b.致危因子 from [0compare] a, mediInfo b where a.cnName=b.中文名 and b.致危因子 <> a.riskReason
select a.riskReason, b.致危因子 from [0compare] a, mediInfo b where a.cnName=b.中文名 and b.致危因子 = a.riskReason

369 336 33 312
select * from [0mediSpecies] a, mediInfo b where a.cnName=b.中文名

select * from [0mediSpecies] a, [0compare] b where a.cnName=b.cnName

select * from [0compare] a where auto_id not in (select b.auto_id from [0mediSpecies] a, [0compare] b where a.cnName=b.cnName)

select distinct (cnName) from [0mediSpecies]

select distinct (cnName) from [0compare]

select * from [0mediSpecies] a where auto_id not in (select auto_id from [0mediSpecies] where cnName in (select 中文名 from mediInfo))

select * from [0mediSpecies] a where auto_id not in (select auto_id from [0mediSpecies] where latinName in (select 拉丁名 from mediInfo))
select * from [0mediSpecies] a where auto_id not in (select auto_id from [0mediSpecies] where latinName in (select 拉丁名 from mediInfo) or cnName in (select 中文名 from mediInfo))
select [status] from [0compare] group by [status]
--update [0compare] set [status] = null where [status]=''
select [status] from [0compare] group by [status]
select a.拉丁科名, b.[status] from mediInfo a, [0compare] b where (a.中文名 = b.cnName or a.拉丁名 = b.latinName ) and b.[status]='CR'
select a.拉丁科名, b.[status] from mediInfo a, [0compare] b where (a.中文名 = b.cnName or a.拉丁名 = b.latinName ) group by b.[status], a.拉丁科名 order by b.[status], a.拉丁科名

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

select * from list where cnName in (select 中文名 from list1)

select * from list order by ID

select * from list where cnName='雪莲' and descr = 3
--delete list where cnName='雪莲' and descr = 3

select * from list where cnName not in (select 中文名 from list1)
select * from list1 where 中文名 not in (select cnName  from list)

select * from list a , list1 b where a.cnName= b.中文名 --where cnName not in (select 中文名 from list1)

select * from list where cnName in (
select cnName from list group by cnName having COUNT(cnName) > 1
) order by cnName

select * from list1 where 中文名 in (
select 中文名 from list1   group by 中文名 having COUNT(中文名) > 1
) order by 中文名

select * from list where autoID not in (
select a.autoID from list a, list1 b where a.cnName = b.中文名
)

select * from List1 where 拉丁名 = 'Aconitum kongboense'

select * from list1 where autoID not in (
select b.autoID from list a, list1 b where a.cnName = b.中文名
)

--update list set ID = list1.id from list, list1 where list.cnName=list1.中文名

select * from mediInfo where autoID not in (
select b.autoID from list a, mediInfo b where a.cnName = b.cnName
)

select * from list where autoID not in (
select a.autoID from list a, mediInfo b where a.cnName = b.cnName
)

--insert mediInfo (中文名,拉丁名) select cnName, latinName from list a where a.autoid not in (
select a.autoID from list a, mediInfo b where a.cnName = b.中文名
)

--update mediinfo set id= list.id from mediINfo, list where list.cnName = mediinfo.中文名

select * from mediInfo where 中文名 in (
select 中文名 from mediInfo group by 中文名 having COUNT(中文名) > 1
) order by 中文名

--update mediInfo set descr= list.descr from mediInfo, list where list.cnName = mediinfo.中文名

select * from list
select * from mediInfo
select * from zhao20140627
select * from mediInfo where 中文名 like '%刺参%'
select * from zhao20140627 where 中文名 like '%刺参%'
select * from mediInfo where 濒危等级 ='LC'

select a.中文名,a.大类,b.大类  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.大类 = b.大类
select a.中文名,a.大类,b.大类  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.大类 is null or a.大类 <> b.大类) and b.大类 is not null
--update mediInfo set 大类 = b.大类 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.大类 is null or a.大类 <> b.大类) and b.大类 is not null

select * from zhao20140627 where autoID not in (
select a.autoID from zhao20140627 a, mediInfo b where a.中文名 = b.cnName
)

select * from zhao20140627 where autoID not in (
select a.autoID from zhao20140627 a, mediInfo b where a.拉丁名 = b.latinName
)

select a.中文名,a.定名人,b.定名人  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.定名人 = b.定名人
select a.中文名,a.定名人,b.定名人  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.定名人 is null or a.定名人 <> b.定名人) and b.定名人 is not null
--update mediInfo set 定名人 = b.定名人 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.定名人 is null or a.定名人 <> b.定名人) and b.定名人 is not null

select a.中文名,a.中文科名,b.中文科名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.中文科名 = b.中文科名
select a.中文名,a.中文科名,b.中文科名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.中文科名 is null or a.中文科名 <> b.中文科名) and b.中文科名 is not null
--update mediInfo set 中文科名 = b.中文科名 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.中文科名 is null or a.中文科名 <> b.中文科名) and b.中文科名 is not null and a.中文科名 is null

select a.中文名,a.拉丁科名,b.拉丁科名 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.拉丁科名 = b.拉丁科名
select a.中文名,a.拉丁科名,b.拉丁科名 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.拉丁科名 is null or a.拉丁科名 <> b.拉丁科名) and b.拉丁科名 is not null
--update mediInfo set 拉丁科名 = b.拉丁科名 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.拉丁科名 is null or a.拉丁科名 <> b.拉丁科名) and b.拉丁科名 is not null and a.拉丁科名 is null

select a.中文名,a.中文属名,b.中文属名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.中文属名 = b.中文属名
select a.中文名,a.中文属名,b.中文属名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.中文属名 is null or a.中文属名 <> b.中文属名) and b.中文属名 is not null
--update mediInfo set 中文属名 = b.中文属名 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.中文属名 is null or a.中文属名 <> b.中文属名) and b.中文属名 is not null and a.中文属名 is null

select a.中文名,a.拉丁属名,b.拉丁属名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.拉丁属名 = b.拉丁属名
select a.中文名,a.拉丁属名,b.拉丁属名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.拉丁属名 is null or a.拉丁属名 <> b.拉丁属名) and b.拉丁属名 is not null
--update mediInfo set 拉丁属名 = b.拉丁属名 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.拉丁属名 is null or a.拉丁属名 <> b.拉丁属名) and b.拉丁属名 is not null and a.拉丁属名 is null

需修改
SELECT     autoId, 中文名, 中文异名 FROM zhao20140627
WHERE     (中文名 IN (SELECT     中文名  FROM          mediInfo WHERE      (中文异名 IS NULL))) AND (中文异名 IS NOT NULL)
select a.中文名,a.中文异名,b.中文异名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.中文异名 = b.中文异名
select a.中文名,a.中文异名,b.中文异名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.中文异名 is null or a.中文异名 <> b.中文异名) and b.中文异名 is not null
--update mediInfo set 中文异名 = b.中文异名 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.中文异名 is null or a.中文异名 <> b.中文异名) and b.中文异名 is not null and a.中文异名 is null

select a.中文名,a.拉丁异名,b.拉丁异名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.拉丁异名 = b.拉丁异名
select a.中文名,a.拉丁异名,b.拉丁异名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.拉丁异名 is null or a.拉丁异名 <> b.拉丁异名) and b.拉丁异名 is not null
--update mediInfo set 拉丁异名 = b.拉丁异名 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.拉丁异名 is null or a.拉丁异名 <> b.拉丁异名) and b.拉丁异名 is not null and a.拉丁异名 is null

需修改
select 特有 from zhao20140627 where 特有='中国特有'
--update zhao20140627 set 特有='是' where 特有='中国特有'
select a.中文名,a.特有,b.特有  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.特有 = b.特有
select a.中文名,a.特有,b.特有  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.特有 is null or a.特有 <> b.特有) and b.特有 is not null
--update mediInfo set 特有 = b.特有 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.特有 is null or a.特有 <> b.特有) and b.特有 is not null and a.特有 is null

select a.中文名,a.濒危等级,b.濒危等级  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.濒危等级 = b.濒危等级
select a.中文名,a.濒危等级,b.濒危等级  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.濒危等级 is null or a.濒危等级 <> b.濒危等级) and b.濒危等级 is not null
--update mediInfo set 濒危等级 = b.濒危等级 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.濒危等级 is null or a.濒危等级 <> b.濒危等级) and b.濒危等级 is not null and a.濒危等级 is null

select a.中文名,a.濒危标准,b.濒危标准  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.濒危标准 = b.濒危标准
select a.中文名,a.濒危标准,b.濒危标准  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.濒危标准 is null or a.濒危标准 <> b.濒危标准) and b.濒危标准 is not null
--update mediInfo set 濒危标准 = b.濒危标准 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.濒危标准 is null or a.濒危标准 <> b.濒危标准) and b.濒危标准 is not null and a.濒危标准 is null

select a.中文名,a.省级保护情况,b.省级保护情况  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.省级保护情况 = b.省级保护情况
select a.中文名,a.省级保护情况,b.省级保护情况  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.省级保护情况 is null or a.省级保护情况 <> b.省级保护情况) and b.省级保护情况 is not null
--update mediInfo set 省级保护情况 = b.省级保护情况 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.省级保护情况 is null or a.省级保护情况 <> b.省级保护情况) and b.省级保护情况 is not null and a.省级保护情况 is null

不更新
select a.中文名,a.药材名,b.药材名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.药材名 = b.药材名
select a.中文名,a.药材名,b.药材名  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.药材名 is null or a.药材名 <> b.药材名) and b.药材名 is not null
--update mediInfo set 药材名 = b.药材名 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.药材名 is null or a.药材名 <> b.药材名) and b.药材名 is not null and a.药材名 is null

不更新
select a.中文名,a.保护建议,b.保护建议  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.保护建议 = b.保护建议
select a.中文名,a.保护建议,b.保护建议  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.保护建议 is null or a.保护建议 <> b.保护建议) and b.保护建议 is not null
--update mediInfo set 保护建议 = b.保护建议 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.保护建议 is null or a.保护建议 <> b.保护建议) and b.保护建议 is not null and a.保护建议 is null

修改,待修改?
SELECT     autoId, 中文名, 生境 FROM zhao20140627
WHERE     (中文名 IN (SELECT     中文名  FROM          mediInfo WHERE      (生境 IS NULL))) AND (生境 IS NOT NULL)
select a.中文名,a.生境,b.生境  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.生境 = b.生境
select a.中文名,a.生境,b.生境  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.生境 is null or a.生境 <> b.生境) and b.生境 is not null
--update mediInfo set 生境 = b.生境 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.生境 is null or a.生境 <> b.生境) and b.生境 is not null and a.生境 is null

select a.中文名,a.低海拔,b.低海拔  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.低海拔 = b.低海拔
select a.中文名,a.低海拔,b.低海拔  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.低海拔 is null or a.低海拔 <> b.低海拔) and b.低海拔 is not null
--update mediInfo set 低海拔 = b.低海拔 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.低海拔 is null or a.低海拔 <> b.低海拔) and b.低海拔 is not null and a.低海拔 is null

select a.中文名,a.高海拔,b.高海拔  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.高海拔 = b.高海拔
select a.中文名,a.高海拔,b.高海拔  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.高海拔 is null or a.高海拔 <> b.高海拔) and b.高海拔 is not null
--update mediInfo set 高海拔 = b.高海拔 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.高海拔 is null or a.高海拔 <> b.高海拔) and b.高海拔 is not null and a.高海拔 is null

需修改,未修改,直接更新了
select a.中文名,a.省级分布,b.省级分布  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.省级分布 = b.省级分布
select a.中文名,a.省级分布,b.省级分布  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.省级分布 is null or a.省级分布 <> b.省级分布) and b.省级分布 is not null
--update mediInfo set 省级分布 = b.省级分布 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.省级分布 is null or a.省级分布 <> b.省级分布) and b.省级分布 is not null and a.省级分布 is null

未更新而需以后更新
select a.中文名,a.参考文献,b.参考文献  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.参考文献 = b.参考文献
select a.中文名,a.参考文献,b.参考文献  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.参考文献 is null or a.参考文献 <> b.参考文献) and b.参考文献 is not null
--update mediInfo set 参考文献 = b.参考文献 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.参考文献 is null or a.参考文献 <> b.参考文献) and b.参考文献 is not null and a.参考文献 is null

select a.中文名,a.审核人,b.审核人  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and a.审核人 = b.审核人
select a.中文名,a.审核人,b.审核人  from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.审核人 is null or a.审核人 <> b.审核人) and b.审核人 is not null
--update mediInfo set 审核人 = b.审核人 from mediInfo a, zhao20140627 b where a.中文名 = b.中文名 and (a.审核人 is null or a.审核人 <> b.审核人) and b.审核人 is not null and a.审核人 is null


select a.形态特征, b.形态特征 from mediinfo a, [mediRed].[dbo].[zhao20140617Ori] b where a.中文名 = b.中文名
--update mediinfo set 形态特征 = b.形态特征 from mediInfo a,  [mediRed].[dbo].[zhao20140617Ori] b where a.中文名 = b.中文名

select a.致危因子, b.致危因子 from mediinfo a, addInfo b where a.中文名 = b.中文名
--update mediinfo set 致危因子 = b.致危因子 from mediInfo a, addInfo b where a.中文名 = b.中文名

select a.autoID, a.中文名, a.致危因子, b.评估依据, b.[致危因子(小)], b.[致危因子(大)] from mediInfo a, zhao20140627 b where a.中文名=b.中文名
order by a.autoID

用于修改补充致危因子:
(
SELECT     autoId, 中文名, 致危因子
FROM         mediInfo AS a
WHERE     (中文名 IN
                          (SELECT     中文名
                            FROM          zhao20140627))
ORDER BY autoId
)


select * from mediInfo order by id
select ID, 中文名, 拉丁名, 中文科名, 拉丁科名, 中文属名, 拉丁属名, 濒危等级, 濒危标准, descr from mediInfo

select * from zhao20140627
select * from zhao20140617Ori
select b.IDzhao,a.* from mediInfo a, zhao20140617Ori b where a.中文名= b.中文名

select * from m_mediRed where m_mediRed.cnName not in (select 中文名 from mediInfo)
select * from mediInfo where mediInfo.中文名 not in (select cnName from m_mediRed)

select * from zhao20140806 where 中文名 not in (select 中文名 from mediInfo) and zhao20140806.IDzhao like '%种级%'

select * from zhao20140806 a, mediInfo b where a.保护建议 is null and b.保护建议 is not null and a.中文名= b.中文名
select * from zhao20140806 a, mediInfo b where a.致危因子Liping is null and b.致危因子 is not null and a.中文名= b.中文名

select * from mediInfo where 中文名 like '%白蜡%'
select * from mediInfo where 药用价值和功能主治 is null and (descr =1 or descr = 2)
select * from mediInfo where 药材名 is null and (descr =1 or descr = 2)

select m.* from mediInfo m, qin0906 q where m.中文名=q.中文名 and m.中文名 is not null and q.中文名 is not null

select * from mediInfo where 中文名 is not null and 中文名 not in (select 中文名 from qin0906 where 中文名 is not null)

select * from qin0906 where 中文名 is not null and 中文名 not in (select 中文名 from mediInfo where 中文名 is not null)

##拉丁名
select m.* from mediInfo m, qin0906 q where m.拉丁名=q.拉丁名 and m.拉丁名 is not null and q.拉丁名 is not null

select * from mediInfo where 拉丁名 is not null and 拉丁名 not in (select 拉丁名 from qin0906 where 拉丁名 is not null)

select * from qin0906 where 拉丁名 is not null and 拉丁名 not in (select 拉丁名 from mediInfo where 拉丁名 is not null)


select distinct(中文科名) from (select * from mediInfo where descr=1) a
select COUNT(distinct(拉丁科名)) from (select * from mediInfo where descr=1) a

select distinct(中文属名) from (select * from mediInfo where descr=1) a
select COUNT(distinct(中文属名)) from (select * from mediInfo where descr=1) a

select * from [0distribution]  ##

--select top 1 cnName, county into distribution from distributionZhao

select * from listQin20150428 where detailSpecies = 1


##得到总的结果表 preface 已有
select * from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName order by a.autoId

##To get the detailed species in distribution##
select * from distribution where cnName in (select cnName from listqin20150428 where detailSpecies=1) order by cnName
select * from distribution where (descr is null) 
select * from distribution where (descr is null) and cnName in (select cnName from listqin20150428 where detailSpecies=1) order by cnName
select * from distribution where (descr <> '栽培' and descr <> '删除' and descr <> '疑似删除') and cnName in (select cnName from listqin20150428 where detailSpecies=1) order by cnName
select * from distribution where (descr <> '栽培' and descr <> '删除' and descr <> '疑似删除' and descr <> '疑似删除1') and cnName in (select cnName from listqin20150428 where detailSpecies=1) order by cnName
select * from distribution where (descr = '添加') and cnName in (select cnName from listqin20150428 where detailSpecies=1) order by cnName

##To get the result of only species of detail    #preface 已有
select * from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName 
and a.cnName in (select distinct(cnName) from distribution where (descr is null or descr = '添加') and cnName in (select cnName from listqin20150428 where detailSpecies=1))
order by a.autoId

##
select * from distribution a,county2007 b where a.county = b.county and a.province=b.province 
and a.cnName in (select distinct(cnName) from distribution where cnName in (select cnName from listqin20150428 where detailSpecies=1))
order by a.autoId

select * from distribution a, county2007 b where a.cnName = '红冬蛇菰' and a.county = b.county and a.province=b.province order by a.descr

##
select * from distribution where cnName in (select cnName from listqin20150428 where detailSpecies=1)

select distinct(cnName) from distribution where autoid not in (
select a.autoid from distribution a, mediInfo b where a.cnName=b.cnName
)

select * from mediInfo order by cnName
select * from listQin20150428 order by cnName

select * from distribution where cnName like '东北红豆杉'
select * from county2007 where county like '万宁市'
select * from county2007 where lat < 18
select * from county2007 where county= '勐海县'
select * from county2007 where county= '龙门县'
select * from county2007 where county= '怀安县'
select * from county2007 where county= '漠河县'
select * from county2007 where county= '海口市'
select * from county2007 where county= '上海市'


##未有拉丁相关,12720-11577=1143

select * from distribution a,county2007 b where a.county = b.county and a.cnName = '金毛狗脊' order by a.autoId

select * from distribution where cnName = '冬虫夏草'
select * from distribution where cnName = '金毛狗脊'
select * from distribution where cnName = '小杉兰'
select * from distribution where cnName = '白蜡树'
select * from distribution where cnName = '兜唇石斛'
select * from distribution where cnName = '桃儿七'
select * from distribution where cnName = '内蒙紫草'
select * from distribution where cnName = '银杏'

select distinct(cnName) from distribution

select * from distribution a,county2007 b where a.county = b.county and a.cnName = '马蹄香' order by a.autoId

select * from provinceChecking
select * from distribution

select * from provinceChecking where autoid not in 
(
select p.autoid from provinceChecking p join 
(select a.cnName, b.province from distribution a,county2007 b where a.county = b.county) 
 d 	on p.cnName=d.cnName and p.province=d.province
 )

 
 
 select* from countyAddRaw -- where cnName='金钗石斛' and province='广西' order by autoid
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
 
 select * from county2007 where county like '南阳%'
 select* from countyAddRaw where cnName = '盾叶半夏'
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
and a.countyOri='三都'

select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri
	and a.countyOri in (
	select countyOri from (
		select a.countyOri, b.county from countyAddRaw a, county2007 b where  b.county like (a.countyOri+'%') and b.county <> a.countyOri
		group by a.countyOri, b.county
	) a group by a.countyOri having count(county) > 1
) group by a.countyOri, b.county order by a.countyOri
select * from countyAddRaw where county is null
select * from countyAddRaw where countyOri like '%阿勒泰%'

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
 
 
 select * from countyAddRaw where county = '平顺县'
 
 --delete countyAddRaw where county = '平顺县'
 --update countyAddRaw set province = '重庆' where county='万州区'
 
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

##从莉娜的分布数据整理格式后有问题的,需校正.
select * from distribution where autoid not in (select a.autoid from distribution a, county2007 b where a.county=b.county)

##新疆物种分布
select a.cnName, b.county from speciesRichnessXinJiang.dbo.plantOnlyCounty a, county2007 b, distribution c
where a.county=b.countycode and a.cnName=c.cnName
group by a.cnName, b.county


select * from county2007
select * from countyPlant

select * from distribution where cnName = '兜唇石斛'
select * from distribution where cnName = '草麻黄'
select * from distribution where cnName = '箭根薯'
select * from distribution where cnName = '松叶蕨'
select * from distribution where cnName = '心叶瓶尔小草'

select * from countyModify
select * from countyAddRaw where county is null

select * from distribution  where county in (select countyProblem from countyModify where descri='原始文件删除')
--delete distribution  where county in (select countyProblem from countyModify where descri='原始文件删除')
distribution -- 9814 - 9859
select cnName, county from countyModify where descri='补充新疆' 266
--insert into distribution (cnName, county) select cnName, county from countyModify where descri='补充新疆'
select * from distribution  where autoid > 9859

select autoid, cnName, county from countyModify where descri='检查原始数据'

select a.* from distribution a, countyModify b where b.descri='检查原始数据' and a.autoid=b.autoid
--update distribution set county = b.county from  distribution a, countyModify b where b.descri='检查原始数据' and a.autoid=b.autoid
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
select * from distribution where cnName like '%蔓生白薇%'
select * from m_mediRed where cnName like '%蔓生白薇%'
select * from zhao20140627 where 中文名 like '%蔓生白薇%'
select * from mediInfo where 中文名 like '%白薇%'
select * from list
select * from List1 order by 级别,中文名
--update distribution set cnName='蔓生白薇' where cnName like '%蔓生白薇%'


select distinct(cnName) from distribution where cnName not in (select cnName from listQin20150428 where detailSpecies = 1)
select * from listQin20150428 where cnName not in (select cnName from distribution)

select * from distributionZhao where cnName like '%粗榧%'

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

select * from distribution where cnName = '知母' order by province
select * from distribution where county like '西林%'
select * from distribution where county = '西林区'
select * from distribution where cnName = '七叶一枝花'
select * from listqin20150428 order by cnName

select * from countyChecking order by id
select * from countyChecking a, listqin20150428 b where a.cnName=b.cnName order by id
select * from countyChecking a, mediInfo b where a.cnName=b.cnName order by a.id
select * from mediInfo where cnName not in (select cnName from listqin20150428 )   --where detailSpecies=1
select a.*, b.* from countyChecking a left join listqin20150428 b on a.cnName=b.cnName order by a.id

select a.*, b.* from countyChecking a left join mediInfo b on a.cnName=b.cnName order by a.id

select latinName from listqin20150428 group by latinName having count(latinName) > 1

select * from listqin20150428 where cnName = '葛菌'
select * from listqin20150428 where cnName like  '%红冬%'
select * from mediInfo where cnName = '葛菌'
select * from listqin20150428 where cnName = '鹅掌草'
select * from listqin20150428 where cnName like  '%林荫银莲花%'

select * from distribution where cnName = '葛菌' or cnName like  '%红冬%'
--update distribution set oriName=cnName where cnName = '葛菌' or cnName like  '%红冬%'
--update distribution set cnName='红冬蛇菰' where cnName = '葛菌' or cnName =  '红冬蛇菰'
--update distribution set descr = '删除' where cnName='红冬蛇菰' and autoid not in (
select min(autoid) from distribution where cnName='红冬蛇菰' group by cnName, province, county
)
select * from distribution where cnName='红冬蛇菰' group by cnName, province, county
select * from distribution where cnName='红冬蛇菰'  order by cnName, province, county

--update distribution set oriName=cnName where cnName = '鹅掌草' or cnName = '林荫银莲花'
--update distribution set cnName='鹅掌草' where cnName =  '林荫银莲花'
--update distribution set descr = '删除' where cnName='鹅掌草' and autoid not in (
select min(autoid) from distribution where cnName='鹅掌草' group by cnName, province, county
)


select * from distribution where cnName='细辛' and (province='辽宁' or province='吉林')

select * from distribution where cnName='汉城细辛' and (province='辽宁' or province='吉林') 
--update distribution set cnName='细辛' where cnName='汉城细辛' and autoid not in (
    select autoid from distribution where cnName='汉城细辛' and (province='辽宁' or province='吉林') 
)

select * from distribution where cnName='银杏' and (county='临安市')
--update distribution set descr='栽培' where cnName='银杏' and autoid not in (
select autoid from distribution where cnName='银杏' and (county='临安市')
)


select * from distribution where cnName='莞花叶白前'
select * from distribution where cnName='白前'

select * from distribution where cnName like '%变色白前%'
select * from distribution where cnName like '%蔓生白薇%'

select * from distribution where cnName like '%珠子参(羽叶三七)%'
select * from distribution where cnName like '%疙瘩七%'

select * from distribution where cnName like '%粗榧%'

--update distribution set oriName=cnName where cnName = '珠子参(羽叶三七)' or cnName = '疙瘩七'
--update distribution set cnName='疙瘩七' where cnName =  '珠子参(羽叶三七)'
--update distribution set descr = '删除' where cnName='疙瘩七' and autoid not in (
select min(autoid) from distribution where cnName='疙瘩七' group by cnName, province, county
)


select a.latinName from listqin20150428 a, mediInfo b where a.latinName=b.latinName
select a.cnName from listqin20150428 a, mediInfo b where a.cnName=b.cnName

select * from listqin20150428 where autoid not in (select a.autoid from listqin20150428 a, mediInfo b where a.latinName=b.latinName or a.cnName=b.cnName)
select * from listqin20150428 where autoid not in (select a.autoid from listqin20150428 a, mediInfo b where a.cnName=b.cnName)

select * from mediInfo where autoid not in (select b.autoid from listqin20150428 a, mediInfo b where a.latinName=b.latinName or a.cnName=b.cnName)
select * from mediInfo order by autoId

select a.cnName, b.cnName, a.latinName, b.latinName from listqin20150428 a, mediInfo b where a.cnName=b.cnName and a.cnName='发菜'
select a.cnName, b.cnName, a.latinName, b.latinName from listqin20150428 a, mediInfo b where a.cnName=b.cnName and a.cnName='冬虫夏草'

select * from county2007 where county like '重庆%'

select * from listqin20150428 where cnName = '珠子参(羽叶三七)'order by cnName
select * from listqin20150428 where cnName = '疙瘩七' order by cnName

select * from listqin20150428 where cnName like '%粗榧%' order by cnName
select * from listqin20150428 where cnName like '%贝母%'order by cnName
select * from listqin20150428 where cnName like '%红豆杉%' order by cnName
select * from listqin20150428 where cnName like '%条叶龙胆%' order by cnName
select * from listqin20150428 where cnName like '%夏侧金盏花%' order by cnName

select * from distributionZhao where cnName like '%林荫银莲花%'
select * from listqin20150428 where cnName like '%鹅掌草%' order by cnName
select * from listqin20150428 where detailSpecies = 1

select distinct(NR) from speciesNR
select * from speciesNR where NR = '喀纳斯' and class = 'plant'

select * from distribution where cnName in (select cnName from listqin20150428 where detailSpecies = 1)

--update distribution set descr=b.descr from distribution a, deleteCounty b
where a.cnName=b.cnName and a.province=b.province and a.county=b.county

select a.* from distribution a, deleteCounty b
where a.cnName=b.cnName and a.province=b.province and a.county=b.county

##species in listqin20150428 that is not in distribution##
select * from listqin20150428 where autoid not in (
select autoid from listqin20150428 where cnName in (select cnName from distribution)
)

select * from distribution where cnName = '白芨' and province like '%北京%'
select * from distribution where province like '%北京%'

select distinct(descr) from distribution
select * from distribution where cnName = '红冬蛇菰'

select * from distribution where (descr is null or descr = '添加') and cnName in (select cnName from listqin20150428 where detailSpecies=1)
select * from listqin20150428 where detailSpecies = 1 order by cnName

select * from distribution where cnName = '八角莲' order by province
select * from distribution where cnName = '粉防己' order by province
select a.*,b.lat,b.lon from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName and a.cnName = '八角莲' order by a.province
select a.*,b.lat,b.lon from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName and a.cnName = '粉防己' order by a.province
select * from distribution where cnName = '红景天' order by province

select * from listqin20150428 where cnName like '%红豆杉%'
select * from mediInfo where cnName like '%红豆杉%'
select * from m_mediRed where cnName like '%红豆杉%'
select * from distribution where cnName = '须弥红豆杉' order by province
select * from distribution where cnName = '红豆杉' order by province
select * from distribution where cnName = '南方红豆杉' order by province
select * from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName and a.cnName like '%红豆杉%' order by a.autoId
select * from distribution a,county2007 b where a.county = b.county and a.province=b.province and a.cnName like '%红豆杉%' order by a.autoId
select * from listqin20150428 where cnName like '%黄芪%'
select * from listqin20150428 where cnName like '%草麻黄%'
select * from distribution where cnName like '%草麻黄%' order by province

select * from distribution where cnName like '%黄檗%' order by province
select * from listqin20150428 where cnName like '%马尿泡%'
select * from listqin20150428 where cnName like '%羌活%'
select * from listqin20150428 where cnName like '%肉苁蓉%'
select * from listqin20150428 where cnName like '%夏侧金盏花%'
select * from listqin20150428 where cnName like '%蒟蒻薯%'

select * from county2007 where province like '%广西%' order by lat

select distinct(descr) from distribution 
select * from distribution where countyCode is null
select * from distribution where latinName is null

#county species without province#
select countyCode, count(distinct(cnName)) from distribution where (descr is null or descr like '%添加%')  group by countyCode    
#county species with province#
select countyCode, county, province, count(distinct(cnName)) species from distribution where (descr is null or descr like '%添加%') group by countyCode, county, province order by province, county

#detail species#
select province, count(distinct(a.cnName)) species from distribution a, listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%添加%') group by province 


--update listqin20150428 set endanstatus = a.endanstatus from listqin20150428, mediInfo a
where listqin20150428.cnName = a.cnName


##按照濒危级别
select endanstatus, 
count(distinct(a.cnName)) species,
count(distinct(b.cnFamily)) cnFamily,
count(distinct(b.cnGenus)) cnGenus 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and b.detailSpecies = 1 
and ( descr is null or descr like '%添加%') group by endanstatus
order by endanstatus

##按照省份及濒危级别
select province, endanstatus, 
count(distinct(a.cnName)) species,
count(distinct(b.cnFamily)) cnFamily,
count(distinct(b.cnGenus)) cnGenus 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and b.detailSpecies = 1 
and ( descr is null or descr like '%添加%') group by province,  endanstatus
order by province, endanstatus

##分省及濒危级别统计
--全部物种
select province, 
count(distinct(a.cnName)) species,
count(distinct(b.cnFamily)) cnFamily,
count(distinct(b.cnGenus)) cnGenus 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and (b.detailSpecies = 1 or b.detailSpecies is null) 
and ( descr is null or descr like '%添加%') group by province
order by province

select endanstatus, 
count(distinct(a.cnName)) species,
count(distinct(b.cnFamily)) cnFamily,
count(distinct(b.cnGenus)) cnGenus 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and (b.detailSpecies = 1 or b.detailSpecies is null)
and ( descr is null or descr like '%添加%') group by endanstatus
order by endanstatus

select province, endanstatus, 
count(distinct(a.cnName)) species,
count(distinct(b.cnFamily)) cnFamily,
count(distinct(b.cnGenus)) cnGenus 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and (b.detailSpecies = 1 or b.detailSpecies is null)
and ( descr is null or descr like '%添加%') group by province, endanstatus
order by province, endanstatus

select a.*, b.province from listqin20150428 a, 
(
select distinct(cnName),latinName, province 
from distribution 
where (descr is null or descr like '%添加%') 
) b where a.cnName=b.cnName

select b.* from listqin20150428 a, 
(
select cnName,latinName, province, county
from distribution 
where (descr is null or descr like '%添加%') 
) b where a.cnName=b.cnName and a. detailSpecies = 1

select * from addInfo
select * from classify

select * from distribution order by descr
select * from distribution where descr is null or descr like '%添加%'


select a.province, a.county, a.countyCode, b.plantCount from distribution a, ( 
	select countyCode, count(distinct(a.cnName)) plantCount from distribution a, listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and (descr is null or descr like '%添加%')  group by countyCode
) b where a.countyCode=b.countyCode

select a.province, a.county, a.countyCode, b.plantCount from county2007 a, (
select countyCode, count(distinct(a.cnName)) plantCount from distribution a, listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and (descr is null or descr like '%添加%')  group by countyCode
) b where a.countyCode=b.countyCode

select province, count(distinct(a.cnName))  from distribution a, listqin20150428 b 
where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%添加%')  
and a.cnName in (
	--select a.cnName, count(distinct(a.countyCode)) countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%添加%')  group by a.cnName having count(distinct(a.countyCode)) < 5
	select a.cnName countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%添加%')  group by a.cnName having count(distinct(a.countyCode)) < 10

)
group by province 

select a.province, a.county, a.countyCode, b.plantCount from distribution a, ( 
	select countyCode, count(distinct(a.cnName)) plantCount from distribution a, listqin20150428 b 
	where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%添加%')  
	and a.cnName in 
	(
		--select a.cnName, count(distinct(a.countyCode)) countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%添加%')  group by a.cnName having count(distinct(a.countyCode)) < 5
	select a.cnName countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%添加%')  group by a.cnName having count(distinct(a.countyCode)) < 5
	)
	group by countyCode
) b where a.countyCode=b.countyCode

select distinct(a.province) from distribution a, ( 
	select countyCode, count(distinct(a.cnName)) plantCount from distribution a, listqin20150428 b 
	where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%添加%')  
	and a.cnName in 
	(
		--select a.cnName, count(distinct(a.countyCode)) countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%添加%')  group by a.cnName having count(distinct(a.countyCode)) < 5
	select a.cnName countyCount from distribution a , listqin20150428 b where a.cnName=b.cnName and b.detailSpecies = 1 and ( descr is null or descr like '%添加%')  group by a.cnName having count(distinct(a.countyCode)) < 10
	)
	group by countyCode
) b where a.countyCode=b.countyCode

select * from county2007

--update distribution set countyCode = b.countyCode from distribution a, county2007 b
where a.province=b.province and a.county=b.county

select * from county2007 where county like '连山%' -- '%自治县' 

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

福建、广东、广西、贵州、江西、四川、台湾、云南、浙江



select * from listQin20150428 where autoid not in (
select distinct(b.autoId) from gardenCas0 a, listQin20150428 b where a.cnName = b.cnName or a.latinName=b.latinName
) and detailSpecies = 1

select * from listQin20150428 where autoid not in (
select distinct(b.autoId) from gardenMedi a, listQin20150428 b where a.cnName = b.cnName or a.latinName=b.latinName
) and detailSpecies = 1

##新疆存疑几种删除##
select * from distribution where province = '新疆' and latinName = 'Ephedra sinica'
select * from distribution where province = '新疆' and latinName = 'Przewalskia tangutica'
select * from distribution where province = '新疆' and latinName = 'Fritillaria cirrhosa'
select * from distribution where province = '新疆' and latinName = 'Euphorbia kansui'
select * from distribution where province = '新疆' and latinName = 'Lithospermum erythrorhizon'
select * from distribution where province = '新疆' and latinName = 'Notopterygium incisum'
select * from distribution where province = '新疆' and latinName = 'Anisodus tanguticus'
select * from distribution where province = '新疆' and latinName = 'Adonis aestivalis'
select * from distribution where province = '新疆' and latinName = 'Anemarrhena asphodeloides'
####


###将表综合起来统计,listQin20150428与mediInfo联系起来###
#验证这两个表的物种是否统一
select * from addInfo
select * from mediInfo where cnName like '%林荫银莲花%'
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
select * from mediInfo where latinName = 'Paris polyphylla' ---原表重楼，七叶一枝花 重复了。
 

select * from mediInfo where detailSpecies = 1 and cnFamily is null 

--update mediInfo set cnFamily=a.cnFamily, latinFamily=a.latinFamily, cnGenus=a.cnGenus--, latinGenus=a.latinGenus
from mediInfo, listQin20150428 a where (mediInfo.cnName=a.cnName or mediInfo.latinName=a.latinName) AND mediInfo.detailSpecies = 1 and mediInfo.cnFamily is null 

select cnFamily, latinFamily, cnGenus, latinGenus from 
 
 
 
 
--统计植物园物种数
select cnGarden, count(*) from gardenCas 
where latinName in (select latinName from listQin20150428 where detailSpecies = 1)
or cnName in  (select cnName from listQin20150428 where detailSpecies = 1)
group by cnGarden order by cnGarden

--统计植物园物种数gardenMedi
select cnGarden, count(*) from gardenMedi 
where latinName in (select latinName from listQin20150428 where detailSpecies = 1)
or cnName in  (select cnName from listQin20150428 where detailSpecies = 1)
group by cnGarden


select * from county2007 where province like '%台湾%'

select * from gardenMedi
select * from gardenCas where isCas = 1
--insert gardenCas(cnName, latinName, cnGarden, IsCas) select cnName, latinName, cnGarden, 2 from gardenMedi

select * from gardenMedi
select * from gardenCas

update gardenMedi set cnGarden='版纳药植' where cnGarden='版纳植'
update gardenMedi set cnGarden='恩施药植' where cnGarden='恩施植'
update gardenMedi set cnGarden='贵药植' where cnGarden='贵植'
update gardenMedi set cnGarden='桂药植' where cnGarden='桂植'
update gardenMedi set cnGarden='南山药植' where cnGarden='南山植'

select * from mediInfo where detailSpecies = 1 order by autoId
select * from m_mediRed
select * from list
--update mediInfo set ecoType1=a.ecoType1, ecoType2=a.ecoType2,ecoType3=a.ecoType3
from mediInfo, m_mediRed a where mediInfo.cnName=a.cnName or mediInfo.latinName=a.latinName

--update mediInfo set mediPart=a.mediPart
from mediInfo, m_mediRed a where mediInfo.cnName=a.cnName or mediInfo.latinName=a.latinName

select * from mediInfo where detailSpecies = 1



select * from m_mediRed a, mediInfo b where a.cnName = b.cnName or a.latinName = b.latinName order by b.autoid


select * from distribution where cnName like '%川贝母%' order by province

select * from endemHuang

select * from mediInfo

--update mediInfo set endemHuang=1 from mediInfo, endemHuang a where mediInfo.latinName=a.latinName

select * from county2007 where county like '%恩施土家族苗族自治州%'
select * from county2007 where county like '%贵阳市%'
select * from county2007 where county like '%景洪市%'
select * from county2007 where county like '%昆明市%'
select * from county2007 where county like '%腾冲县%'
select * from county2007 where county like '%贡山%'

select * from listQin20150428 where latinFamily like '%Balanophoraceae%'

select * from endemHuang
select * from listQin20150428 order by cnfamily, cnGenus, autoid


select * from funcXJ

select * from NFCFXJ

--update mediInfo set endem=1 where [特有]='是' or [特有]='是1' or endemHuang=1
--update mediInfo set endem=0 where endem is null
select * from mediInfo where endem=1
select * from mediInfo where endem=0


select * from mediInfo where detailSpecies = 1
select * from classify

select count(cnFamily), count(cnGenus), count(cnName) from mediInfo where endanStatus='CR' group by cnFamily, cnGenus, cnName

select cnFamily, count(*) from mediInfo where endanStatus='CR' group by cnFamily

select distinct(endanStatus) from mediInfo
select '甘', endanStatus, count(distinct(cnFamily))  cnFamily, count(distinct(cnGenus)) cnGenus, count(distinct(cnName))cnName 
from mediInfo where flavour like '%甘%' group by endanStatus;

select * from mediInfo where endanStatus = 'EW'

select distinct(flavour) from mediInfo
select flavour, cnFamily, cnGenus, cnName from mediInfo where flavour like '%甘%'

select flavour, count(distinct(cnFamily)) cnFamily, count(distinct(cnGenus)) cnGenus, count(distinct(cnName)) cnName
from mediInfo where flavour like '%甘%' group by flavour

declare @flavour nvarchar(255), @item


select top 2 'aaa' + str(func1) + func2 + func3 from classify

select cnName,  
case func1 when null then '' else '，' + ltrim(rtrim(str(func1))) end 
+ case func2 when null then '' else '，' + ltrim(rtrim(str(func2))) end
+ case func3 when null then '' else '，' + ltrim(rtrim(str(func3))) end
+ '，' from classify

--update mediInfo set func=a.func from mediInfo, (select cnName,  
case func1 when null then '' else '，' + ltrim(rtrim(str(func1))) end 
+ case func2 when null then '' else '，' + ltrim(rtrim(str(func2))) end
+ case func3 when null then '' else '，' + ltrim(rtrim(str(func3))) end
+ '，' as func from classify) a where mediInfo.cnName=a.cnName
 
select * from mediInfo where detailSpecies = 1 and (cnMediPart is null or mediPart is null)
select * from mediInfo where detailSpecies = 1 and mediPart is null order by id

select b.* from mediInfo a, classify b where a.cnName=b.cnName

--update mediInfo set flavour = a.flavor, property=a.property, channel=a.channel, habitat=a.habitat
from mediInfo, classify a where mediInfo.cnName=a.cnName


#####################统计物种数#################
##ecotype##  preface已有
select ecoType1, count(distinct(cnFamily)), count(distinct(cnGenus)), count(distinct(cnName)) from mediINfo where detailSpecies = 1  group by ecoType1 
select ecoType2, count(distinct(cnFamily)), count(distinct(cnGenus)), count(distinct(cnName)) from mediINfo where detailSpecies = 1  group by ecoType2 
select ecoType3, count(distinct(cnFamily)), count(distinct(cnGenus)), count(distinct(cnName)) from mediINfo where detailSpecies = 1  group by ecoType3 


------科属种-----------------
##各濒危等级物种数##  preface已有
select endanStatus, count(distinct(cnFamily)) cnFamily, count(distinct(cnGenus)) cnGenus, count(distinct(cnName)) cnName
from mediInfo where detailSpecies = 1 group by endanStatus

##各濒危等级生活型##  preface已有
select endanStatus, ecoType1, count(ecotype1) from mediInfo where detailSpecies = 1 group by endanStatus, ecoType1
select endanStatus, ecoType3, count(ecotype3) from mediInfo where detailSpecies = 1 group by endanStatus, ecoType3

##各濒危等级药性特征##
--物种数科属种

--各濒危等级药味
select endanStatus, flavour, count(flavour) from mediInfo where detailSpecies = 1 and flavour like '%苦%' group by endanStatus, flavour
select endanStatus, flavour, count(flavour) from mediInfo where detailSpecies = 1 and flavour like '%辛%' group by endanStatus, flavour
select endanStatus, flavour, count(flavour) from mediInfo where detailSpecies = 1 and flavour like '%酸%' group by endanStatus, flavour
select endanStatus, flavour, count(flavour) from mediInfo where detailSpecies = 1 and flavour like '%甘%' group by endanStatus, flavour
select endanStatus, flavour, count(flavour) from mediInfo where detailSpecies = 1 and flavour like '%咸%' group by endanStatus, flavour


select flavour, count(flavour) 
from mediInfo 
where detailSpecies = 1 and flavour like '%苦%' 
group by endanStatus, flavour

select endanStatus, flavour from mediInfo group by endanStatus, flavour

select endanStatus, flavour, count(*) from 
(
select '苦' as flavour, endanStatus from mediInfo where flavour like '%苦%'
union
select '辛' as flavour, endanStatus from mediInfo where flavour like '%辛%'
union
select '酸' as flavour, endanStatus from mediInfo where flavour like '%酸%'
union
select '甘' as flavour, endanStatus from mediInfo where flavour like '%甘%'
union
select '咸' as flavour, endanStatus from mediInfo where flavour like '%咸%'
) as a group by endanStatus, flavour


##生境特征##
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

select * from county2007 where county like '%丽江%'
select * from county2007 where county like '%大理%'
select * from county2007 where county like '%香格里拉%'
select * from county2007 where county like '%西双版纳%'
select * from county2007 where county like '%腾冲%'


校对mediInfo和listqin20150428
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

select * from listqin20150428 where cnName like '%甘草%'


select * from mediInfo where detailSpecies=1
select * from garden
重复出现 select a.* from garden a, mediInfo b, (select cnName from mediInfo where detailSpecies=1) c where a.cnName =c.cnName order by b.id

##物种--植物园
select * from garden 
where latinName in (select latinName from mediInfo where detailSpecies = 1)
or cnName in (select cnName from mediInfo where detailSpecies = 1)
order by cnName desc

##未植物园栽培的物种
select * from mediInfo where cnName not in (select cnName from garden) and latinName not in (select latinName from garden) and detailSpecies =1

select * from mediInfo where cnName like '%折苞羊耳蒜%'
select * from mediInfo where cnName like '%毛唇芋兰%'
select * from mediInfo where cnName like '%石仙桃%'
select * from mediInfo where cnName like '%独蒜兰%'
select * from mediInfo where cnName like '%云南独蒜兰%'
select * from mediInfo where cnName like '%大百部%'
select * from mediInfo where cnName like '%箭根薯%'
select * from mediInfo where cnName like '%蒟蒻薯%'
select * from mediInfo where cnName like '%香姜%'
select * from mediInfo where cnName like '%海南假砂仁%'
select * from mediInfo where cnName like '%郁金%'
select * from mediInfo where cnName like '%茴香砂仁%'


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


select * from distributionAdd20181110 where latinName = 'Fritillaria walujewii' and county='乌鲁木齐市'
select * from distribution where latinName = 'Fritillaria walujewii' and county='乌鲁木齐市'
select * from distributionAdd20181110 where latinName = 'Cephalotaxus oliveri' and county='万盛区'
select * from distribution where latinName = 'Cephalotaxus oliveri' and county='万盛区'


select distinct latinName from (
    select a.latinName, a.county as aCounty, b.county as bcounty from distributionAdd20181110 a 
	left join distribution b on a.latinname=b.latinName and a.county = b.county
	where a.latinName in (select latinName from distribution)
	union
	select b.latinName, a.county as acounty, b.county as bcounty from distributionAdd20181110 a 
	right join distribution b on a.latinname=b.latinName and a.county = b.county
	where b.latinName in (select latinName from distributionAdd20181110)
) a


---选择物种分布的不同
select a.cnName, a.latinName, a.county as aCounty, b.county as bcounty from distributionAdd20181110 a 
left join distribution b on a.latinname=b.latinName and a.county = b.county
where a.latinName in (select latinName from distribution)
union
select b.cnName, b.latinName, a.county as acounty, b.county as bcounty from distributionAdd20181110 a 
right join distribution b on a.latinname=b.latinName and a.county = b.county
where b.latinName in (select latinName from distributionAdd20181110)


select distinct (descr) from distribution 
select * from distribution where cnName = '篦子三尖杉' and descr is not null
select * from distribution where cnName = '甘草' and descr is not null
select * from distribution where cnName = '新疆贝母' and descr is not null
select * from distribution where cnName = '盐生肉苁蓉' and descr is not null

select * from distribution where cnName = '滇重楼'
select * from distribution where cnName = '千里香'
select * from distribution where cnName = '异形南五味子'
select * from distribution where cnName = '大叶骨碎补'

select * from distribution where latinName = 'Paris polyphylla var. yunnanensis'
select * from distribution where latinName = 'Murraya paniculata'
select * from distribution where latinName = 'Davallia formosana'
select distinct (cnName) from distribution


select * from distributionAdd20181110 order by autoid
select * from distributionAdd20181110 where cnName = '篦子三尖杉'




##冬虫夏草
select * from distribution where cnName like '%冬虫夏草%'
select * from distribution0 where cnName like '%冬虫夏草%'
select * from distributionAdd1 where cnName like '%冬虫夏草%'
select * from distributionAdd20181110 where cnName like '%冬虫夏草%'
select * from distributionZhao where cnName like '%冬虫夏草%'
select * from distributionZhao0 where cnName like '%冬虫夏草%'

select * from county2007 a, countycordyceps b where a.county = b.county
select * from list
select * from countycordyceps


#发菜#
select * from distribution where cnName like '%发菜%'
select * from distribution0 where cnName like '%发菜%'
select * from distributionAdd1 where cnName like '%发菜%'
select * from distributionAdd20181110 where cnName like '%发菜%'
select * from distributionZhao where cnName like '%发菜%'
select * from distributionZhao0 where cnName like '%发菜%'

select * from county2007 where province = '内蒙古' or province = '陕西' or province = '宁夏' or province = '甘肃' or province = '青海' or province = '新疆' order by autoid



##20190722
select * from distribution where cnName = '川黄檗'
select * from distribution a, county2007 b where a.cnName = '新疆贝母' and a. countycode =b.countycode order by a.autoid



select * from distribution where descr is not null
select * from distribution where cnName like '%沙苁蓉%'
select * from distribution
select * from distributionAdd1
select * from distributionAdd20181110

##check the modifying time of the table: 20190727
select modify_date from sys.tables where name='distribution0'    2015-05-14 23:45:13.530
select modify_date from sys.tables where name='distributionAdd1'   2015-05-14 22:14:28.443
select modify_date from sys.tables where name='distributionAdd20181110'   2018-11-10 15:30:14.097
select modify_date from sys.tables where name='distribution'   2015-06-19 06:30:04.100

-- select * into distribution from distribution20190727
# 检查distributionAdd1 是否已经进入distribution表,已经全部进入distribution表.
select distinct  cnName from distributionAdd1 where cnName not in (select cnName from distribution)
select * from distribution where oriname is not null

select distinct  cnName from distributionAdd20181110 where cnName not in (select cnName from distribution)
select distinct  cnName from distributionAdd20181110 where cnName in (select cnName from distribution)

select a.cnName, a.latinName, a.county as aCounty, b.county as bcounty from distributionAdd20181110 a 
left join distribution b on a.latinname=b.latinName and a.county = b.county
where a.latinName in (select latinName from distribution) and a.cnName='桑寄生'
union
select b.cnName, b.latinName, a.county as acounty, b.county as bcounty from distributionAdd20181110 a 
right join distribution b on a.latinname=b.latinName and a.county = b.county
where b.latinName in (select latinName from distributionAdd20181110) and a.cnName='桑寄生'

select * from distribution where cnName='桑寄生'

select * from distributionAdd20181110 where cnName='桑寄生'
select distinct cnname, county from distributionAdd20181110 where cnName='桑寄生'

select distinct cnname, county from distributionAdd20190722
select * from distributionAdd20190722 where cnName='桑寄生'


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

select distinct cnName, latinName from distributionAdd20190722 where cnName='川赤芍'
select distinct cnName, latinName from distributionAdd20181110 where cnName='川赤芍'
--update distributionAdd20181110 set latinName='Paeonia veitchii' where cnName='川赤芍'

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

select    *  from distributionAdd20190722 where countyCode is null AND COUNTY='香格里拉县'
select   *  from distributionAdd20190722 where countyCode is null  order by county

select  * FROM county2007 WHERE COUNTY='香格里拉县'
SELECT * FROM distributionAdd20190722  WHERE countyCode is null and COUNTY='香格里拉县'
SELECT * FROM distributionAdd20190722  WHERE  COUNTY='香格里拉县'
select * from county2007 WHERE COUNTY='北川羌族自治县'
香格里拉县  

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

--update distributionAdd20181110 set county = replace(county, '市辖区', '') where county like '%市辖区'

--update distributionAdd20181110 set county='宝鸡市' where county='宝鸡县';
--update distributionAdd20181110 set county='香格里拉县' where county='中甸县';
--update distributionAdd20181110 set county='怀柔区' where county='怀柔县';
--update distributionAdd20181110 set county='海拉尔区' where county='海拉尔市';
--update distributionAdd20181110 set county='丽江市' where county='丽江纳西族自治县';
--update distributionAdd20181110 set county='离石区' where county='离石市';
--update distributionAdd20181110 set county='耀州区' where county='耀县';
--update distributionAdd20181110 set county='贵池区' where county='贵池市';
--update distributionAdd20181110 set county='丹徒区' where county='丹徒县';
--update distributionAdd20181110 set county='花都区' where county='花都市';
--update distributionAdd20181110 set county='临沧市' where county='临沧县';
--update distributionAdd20181110 set county='南川区' where county='南川市';
--update distributionAdd20181110 set county='黔江区' where county='黔江土家族苗族自治县';
--update distributionAdd20181110 set county='武都区' where county='武都县';
--update distributionAdd20181110 set county='锡山区' where county='锡山市';
--update distributionAdd20181110 set county='襄阳区' where county='襄阳市';
--update distributionAdd20181110 set county='襄阳区' where county='襄阳县';
--update distributionAdd20181110 set county='宜昌市' where county='宜昌县';
--update distributionAdd20181110 set county='宣州区' where county='宣州市';
--update distributionAdd20181110 set county='奉贤区' where county='奉贤县';
--update distributionAdd20181110 set county='井冈山市' where county='宁冈县';
--update distributionAdd20181110 set county='长安区' where county='长安县';      ##陕西
--   浑江区 -->	白山市


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
select * from distribution where cnname in ('淫羊藿', '川赤芍')



select distinct cnName from distribution where  autoId > 18565 order by autoid

select distinct cnName from distribution where cnname = '三七'
select distinct cnName from distribution where cnname like '%三尖杉%'
select distinct cnName from distribution where cnname like '%姜状三七%'
select distinct cnName from distribution where cnname like '%月腺大戟%'  --
select distinct cnName from distribution where cnname like '%桑寄生%'
select distinct cnName from distribution where cnname like '%三分三%'
select distinct cnName from distribution where cnname like '%赛莨菪%'
select distinct cnName from distribution where cnname like '%泡囊草%'
select distinct cnName from distribution where cnname like '%新疆贝母%'

select * from distribution where oriname like '%月腺大戟%'
select * from distribution where oriname like '%狼毒%'
select * from distribution where cnname like '%新疆贝母%'
select * from m_medired where cnfamily like '%大戟科%'

select * from m_medired order by id 
select * from distribution order by autoid

select a.autoid, a.cnName, a.latinName, b.*
from distribution a join county2007 b 
on a.county=b.county and a.countycode=b.countycode order by a.autoid


select * from county2007
select * from distribution where cnname like '%红冬蛇菰%' order by autoid
select * from distributionAdd20190722

select distinct cnName from distribution where cnname in (select distinct cnname from distributionadd20190722)


select * from distribution where --descr is not null and 
(descr is null or ( descr <> '栽培' and descr <> '删除' and descr <> '疑似删除'  and descr <> '疑似删除1')) and
cnName in ('大叶骨碎补','卷柏','宽叶羌活','当归','白术','淫羊藿','巫山淫羊藿','降香','川赤芍','芍药','乌头','金莲花','川黄檗','千里香','玄参','黄山药','假百合','滇重楼','发菜','篦子三尖杉','三七','姜状三七','月腺大戟','桑寄生','三分三','赛莨菪','泡囊草','新疆贝母')

select distinct cnName from distribution where --descr is not null and 
(descr is null or ( descr <> '栽培' and descr <> '删除' and descr <> '疑似删除'  and descr <> '疑似删除1')) and
cnName in ('冬虫夏草','大叶骨碎补','卷柏','宽叶羌活','当归','白术','淫羊藿','巫山淫羊藿','降香','川赤芍','芍药','乌头','金莲花','川黄檗','千里香','玄参','黄山药','假百合','滇重楼','发菜','篦子三尖杉','三七','姜状三七','月腺大戟','桑寄生','三分三','赛莨菪','泡囊草','新疆贝母')

select a.autoId, a.cnName, a.latinName,b.provinceCode, b.province,b.countyCode, b.county,b.lat, b.lon
from distribution a, county2007 b
where a.county=b.county and 
(a.descr is null or ( a.descr <> '栽培' and a.descr <> '删除' and a.descr <> '疑似删除'  and a.descr <> '疑似删除1')) and
a.cnName in ('冬虫夏草','大叶骨碎补','卷柏','宽叶羌活','当归','白术','淫羊藿','巫山淫羊藿','降香','川赤芍','芍药','乌头','金莲花','川黄檗','千里香','玄参','黄山药','假百合','滇重楼','发菜','篦子三尖杉','三七','姜状三七','月腺大戟','桑寄生','三分三','赛莨菪','泡囊草','新疆贝母')
order by a.autoId

select county
from distribution where cnName in ('冬虫夏草') and county in ('阿坝县','松潘县','小金县','丁青县','洛隆县','芒康县','德钦县','迭部县','玛曲县','夏河县','巴塘县','白玉县','德格县','康定县','石渠县','乡城县','雅江县','班玛县','达日县','甘德县','玛沁县','刚察县','门源回族自治县','祁连县','互助土族自治县','化隆回族自治县','贵德县','贵南县','同德县','兴海县','天峻县','河南蒙古族自治县','城关区','达孜县','当雄县','墨竹工卡县','玉龙纳西族自治县','察隅县','林芝县','米林县','比如县','那曲县','聂拉木县','大通回族土族自治县','湟源县','湟中县','曲麻莱县','玉树县','杂多县','共和县')
group by county having count(*) > 1
order by a.county,

select b.county
from distribution a, county2007 b
where a.county=b.county and 
a.cnName in ('冬虫夏草')
group by b.county having count(*) > 1
