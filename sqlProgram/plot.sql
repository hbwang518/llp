--For Chunyan NSFC
--database:speciesrichnessxinjiang
--the species in grassland and the environment of plots 
select * from grasslandEnvironment order by plot
select plot, species, specieslatin from grasslandplot group by plot, species, specieslatin order by plot

--the species in grassland and the environment of plots 
--database:xinjiangplot
select * from environment order by plot
select plotno, plot, species from shrubandgrass group by plotno, plot, species order by plot  --4940
select plotno, plot, species from arbor group by plotno, plot, species order by plot  --319
select plotno, plot, species from HCZLWoody group by plotno, plot, species order by plot  -- 333

select * from arbor
select * from shrubandgrass
select plotno, plot, count(distinct(species)) from arbor group by plotno, plot order by plot 
select plotno, plot, count(distinct(species)) from shrubandgrass group by plotno, plot order by plot


--for zhanglin
select * from environment order by plot

select ss.plotno,ss.plot, aa.speciesCount from 
(select distinct plotno, plot from environment) ss
left join
(select plotno, plot, count(distinct(species)) speciescount 
from shrubandgrass where speciesflag=2 
group by plotno, plot ) aa on aa.plotNo=ss.plotNo
order by plot

select ss.plotno,ss.plot, aa.speciesCount from 
(select distinct plotno, plot from environment) ss
left join (
	select plotno, plot, count(distinct(species)) speciesCount
	from (
		select plotno, plot, species from arbor 
		union 
		select plotno, plot, species from shrubandgrass where  speciesflag=1
	) a
	group by plotno, plot 
) aa on aa.plotNo=ss.plotNo
order by plot

--woody 霍城资料野果林
select * from HCZLwoody
select plotno, plot, count(distinct(species)) from HCZLwoody group by plotno, plot order by plot
select plotno, plot, species,speciesflag from shrubandgrass where plot like '%HCZL%' order by plot

select * from environmentindex
select * from shrubandgrass
select * from arbor

----
--copy them together and then remove duplicate in excel, select all columns to remove all identical rows except for the first identical row found
--https://www.excel-easy.com/examples/remove-duplicates.html

---speciesrichnessXinjiang
select * from grasslandplot order by plot
select * from grasslandbiomass order by plot 


select * from alltype
select * from plotdistribution

select * from shrubandgrass
select * from arbor

select distinct (plot) from arbor

select distinct(plot) from shrubandgrass order by plot   --211
select distinct(plot) from arbor order by plot   --160
select distinct(plot) from environment order by plot   --212
select distinct(plot) from HCZLWoody    --44

select * from HCZLWoody 

select * from shrubandgrass order by plot


select * from grasslandplot order by plot, sPlotNo
select distinct(plot) from grasslandplot
select * from grasslandplantlist


select * from grasslandbiomass order by plot

select * from xinjiangplot a, m_plant b where a.id =b.id order by a.id

select * from plotplant
select distinct(plot) from plotplant



select * from plotpool
select distinct(plot) from plotpool
select * from plotdistribution




select * from m_plant where endemismflag is not null




select * from plotpool

select * from xinjiangplot

select * from plotplant

select * from plantXJworlddistribution

select * from plantlonlat

select * from PlantBodySize

select * from grasslandplot

select distinct(plot) from grasslandplot

select * from grasslandPlantList



select * from shrubandgrass

-----grassland 2021------
select * from Sheet3$
select * from gsoil2021
update gsoil2021 set freshSoil= [样品袋+土壤鲜重] - 18.9
update gsoil2021 set airdrySoil= [样品袋+土壤干重] - 18.9
update gsoil2021 set aftersieveSoil= [筛后样品袋+土壤干重] - 18.9

update gsoil2021 set stoneOnsite = [砾石干重(毛，野外)]- 
(case 
when [信封] = 1 then 4.045 
when [信封] = 2 then 3.5 
when [信封] = 3 then 3.49 
when [信封] = 4 then 3.49
when [信封] = 5 then 4.414 
when [信封] = 6 then 3.63 
when [信封] = 7 then 2.2085 
when [信封] = 8 then 4.57 
else 0 end)
where [砾石干重(毛，野外)] is not  null and [砾石干重(毛，野外)] > 0 

--update gsoil2021 set stoneOnsite=null
update gsoil2021 set stoneExsite = [砾石干重(毛，风干)] - 
(case 
when [信封] = 1 then 4.045 
when [信封] = 2 then 3.5 
when [信封] = 3 then 3.49 
when [信封] = 4 then 3.49
when [信封] = 5 then 4.414 
when [信封] = 6 then 3.63 
when [信封] = 7 then 2.2085 
when [信封] = 8 then 4.57 
else 0 end)
where [砾石干重(毛，风干)]  is not  null and [砾石干重(毛，风干)]  > 0 

update gsoil2021 set stoneExsite = [砾石净干重(风干)] where [砾石净干重(风干)] is not null and stoneExsite is null


select * from gsoil2021 where [砾石净干重(野外)] is not null or [砾石净干重(风干)] is not null



select * from gsoil2021 where freshSoil  is null

--update gsoil2021 set [信封] = FLOOR([信封])
select [信封], FLOOR([信封]) from gsoil2021

select * from gsoil2021 where [筛后样品袋+土壤干重]  is not null
select * from gsoil2021 where aftersieveSoil  is not null

select * from gsoil2021 where freshSoil  is  null
select *  from gsoil2021 where airdrySoil  is  null
select *  from gsoil2021 where [筛后样品袋+土壤干重]  is  null
select *  from gsoil2021 where [筛后样品袋+土壤干重]  is not null
select *  from gsoil2021 where [砾石干重(毛，野外)]  is  null or [砾石干重(毛，野外)]=0
select freshSoil,  aftersieveSoil*0.9462+151.54, 
aftersieveSoil+(case when stoneOnsite is not null then stoneOnsite when stoneExsite is not null then stoneExsite else 0 end),
case when (aftersieveSoil*0.9462+151.54 - (aftersieveSoil+ case when stoneOnsite is not null then stoneOnsite when stoneExsite is not null then stoneExsite else 0 end)) > 0 then (aftersieveSoil*0.9462+151.54) else ( aftersieveSoil+(case when stoneOnsite is not null then stoneOnsite when stoneExsite is not null then stoneExsite else 0 end)) end
from gsoil2021 where aftersieveSoil is not null and freshSoil is null

update gsoil2021 
set freshSoilCal = case when (aftersieveSoil*0.9462+151.54 - (aftersieveSoil+ case when stoneOnsite is not null then stoneOnsite when stoneExsite is not null then stoneExsite else 0 end)) > 0 then (aftersieveSoil*0.9462+151.54) else ( aftersieveSoil+(case when stoneOnsite is not null then stoneOnsite when stoneExsite is not null then stoneExsite else 0 end)) end
where aftersieveSoil is not null and freshSoil is null

update gsoil2021 set freshSoil = freshSoilCal where freshSoilCal is not null and freshSoil is null


select *   from gsoil2021 where aftersieveSoil is not null
CREATE TABLE [dbo].[gsoil2021](
	[plot] [nvarchar](255) NOT NULL,
	[splot] [int] NULL,
	[layer] [nvarchar](255) NULL,
	[样品袋+土壤鲜重] [decimal](18, 3) NULL,
	[freshSoil] [decimal](18, 3) NULL,
	[样品袋+土壤干重] [decimal](18, 3) NULL,
	[airdrySoil] [decimal](18, 3) NULL,
	[筛后样品袋+土壤干重] [decimal](18, 3) NULL,
	[aftersieveSoil] [decimal](18, 3) NULL,
	[砾石干重(毛，野外)] [decimal](18, 3) NULL,
	[stoneOnsite] [decimal](18, 3) NULL,
	[砾石干重(毛，风干)] [decimal](18, 3) NULL,
	[stoneExsite] [decimal](18, 3) NULL,
	[信封] [nvarchar](50) NULL,
	[砾石净干重(野外)] [decimal](18, 3) NULL,
	[砾石净干重(风干)] [decimal](18, 3) NULL,
	[砾石体积/ML] [decimal](18, 1) NULL,
	[备注] [nvarchar](255) NULL,
	[备注2] [nvarchar](255) NULL
) ON [PRIMARY]
GO

--delete gsoil2021

insert into gsoil2021 (plot
      ,splot
      ,layer
      ,[样品袋+土壤鲜重]
      ,[样品袋+土壤干重]
      ,[筛后样品袋+土壤干重]
      ,[砾石干重(毛，野外)]
      ,[砾石干重(毛，风干)]
      ,[信封]
      ,[砾石净干重(野外)]
      ,[砾石净干重(风干)]
      ,[砾石体积/ML]
      ,[备注]
      ,[备注2])

SELECT  [样地编号] as plot
      ,[样方编号] as splot
      ,[深度] as layer
      ,[样品袋+土壤鲜重]
      ,[样品袋+土壤干重]
      ,[筛后样品袋+土壤干重]
      ,[砾石干重(毛，野外)]
      ,[砾石干重(毛，风干)]
      ,[信封]
      ,[砾石净干重(野外)]
      ,[砾石净干重(风干)]
      ,[砾石体积/ML]
      ,[备注]
      ,[备注2]
  FROM [xinjiangPlot].[dbo].[Sheet3$]




  ----------
  select * from groot2021

 -- alter table groot2021 add freshRoot decimal(18,3)
  --alter table groot2021 add airDryRoot decimal(18,3)
  --alter table groot2021 add ovenDryRoot decimal(18,3)
  alter table groot2021 add ovenDryRoot0 decimal(18,3)
  update groot2021 set freshRoot = [样品袋+根鲜重]- 
(case 
when [信封] = 1 then 3.6 
when [信封] = 2 then 3.5 
when [信封] = 3 then 3.49 
when [信封] = 4 then 3.49
when [信封] = 5 then 4.414 
when [信封] = 6 then 3.63 
when [信封] = 7 then 2.2085 
when [信封] = 8 then 4.57 
else 0 end)
where [样品袋+根鲜重] is not  null

  update groot2021 set ovenDryRoot = [烘干毛重]- 
(case 
when [信封] = 1 then 3.6 
when [信封] = 2 then 3.5 
when [信封] = 3 then 3.49 
when [信封] = 4 then 3.49
when [信封] = 5 then 4.414 
when [信封] = 6 then 3.63 
when [信封] = 7 then 2.2085 
when [信封] = 8 then 4.57 
else 0 end)
-(case when [钉] is not null then [钉]*0.044 else 0 end)
where [烘干毛重] is not  null

  update groot2021 set airDryRoot = [样品袋+风干重]- 
(case 
when [信封] = 1 then 3.6 
when [信封] = 2 then 3.5 
when [信封] = 3 then 3.49 
when [信封] = 4 then 3.49
when [信封] = 5 then 4.414 
when [信封] = 6 then 3.63 
when [信封] = 7 then 2.2085 
when [信封] = 8 then 4.57 
else 0 end)
where [样品袋+风干重] is not  null

 select * from groot2021 where [根鲜重净] is not null
 --update groot2021 set freshRoot =  [根鲜重净] where [根鲜重净] is not null and freshRoot is null
  
  
  select * from groot2021 where [信封] = 1
  select * from groot2021 where freshroot < 0

  select * from groot2021 where ovendryroot < 0
 
   select * from groot2021  where [样品袋+根鲜重]=0

     --update groot2021 set [信封]=0 where [样品袋+根鲜重]=0
	 --update groot2021 set [信封]=0 where [信封] is null
UPDATE groot2021 SET ovenDryRoot0 =ovenDryRoot
select * from groot2021  WHERE ovenDryRoot < 0
UPDATE groot2021 SET ovenDryRoot =NULL WHERE ovenDryRoot < 0


  select * from AB
  

--alter table AB add ovenDrySampledAB decimal(18,3)


--update AB set ovenDrySampledAB = [样品烘干重毛] - 
(case 
when [信封] = '中' then 5.43 
when [信封] = '大' then 15.46
when [信封] = '小' then 3.50 
when [信封] = '小1' then 3.50
when [信封] = '小2' then 3.50 
when [信封] = '小3' then 3.50 
when [信封] = '小4' then 3.50 
when [信封] = '小5' then 4.41 
when [信封] = '小6' then 3.63 
when [信封] = '小7' then 2.2085 
when [信封] = '小8' then 4.57 
when [信封] = '档' then 31.66 
else 0 end)
-(case when [钉] is not null then [钉]*0.044 else 0 end)
where [样品烘干重毛] is not  null and [样品烘干重毛] > 0 



select * from genvironment2021
update genvironment2021 set [日期]=null
select * from environment1
update genvironment2021 set [日期]=b.[日期] from genvironment2021 a, environment1 b where a.plot=b.[样地编号]

select * from [sla-weight]

--alter table [sla-weight] add ovenDryLeaf decimal(18,3)
--update [sla-weight] set ovenDryLeaf = [叶烘干毛重] - 
(case 
when [信封] = '中' then 5.43 
when [信封] = '大' then 15.46
when [信封] = '小' then 3.50 
when [信封] = '小1' then 3.50
when [信封] = '小2' then 3.50 
when [信封] = '小3' then 3.50 
when [信封] = '小4' then 3.50 
when [信封] = '小5' then 4.41 
when [信封] = '小6' then 3.63 
when [信封] = '小7' then 2.2085 
when [信封] = '小8' then 4.57 
when [信封] = '档' then 31.66 
else 0 end)
-(case when [钉] is not null then [钉]*0.044 else 0 end)
where [叶烘干毛重] is not  null and [叶烘干毛重] > 0



select * from [g-SLA-area2021]

--begin

/*
CREATE TABLE #MyTempTable
(
   fileName nvarchar(255),
   area float
)
DROP TABLE #MyTempTable
insert into #MyTempTable (fileName, area) values (@fileNameBegin, @areaTotal)
*/

Declare @fileName nvarchar(255)
Declare @fileNameShow nvarchar(255)
Declare @fileNameBegin nvarchar(255)
Declare @area float
Declare @areaTotal float
declare @fieldName nvarchar(255)

Declare tempTable7 cursor  for
	select [文件名],[面积] from [g-SLA-area2021] order by [文件名]

open tempTable7

fetch next from tempTable7 into @fileName,@area

Begin
   while (@@FETCH_STATUS = 0)
	Begin
	  if CHARINDEX('(', @fileName)>0 
		  begin
			set @fileNameShow=SUBSTRING(@fileName, 0, 8)
			if (@fileNameShow = @fileNameBegin)
			begin
				set @areaTotal = @areaTotal + @area
			end
			else
			begin
				-- insert the prvious record 
				set @fieldName = SUBSTRING(@fileName, 0, 8)
				update [SLA-weight] set area= @areaTotal where [物种编号] =@fieldName
				set @fileNameBegin = @fileNameShow
				set @areaTotal = @area
			end
		  end
	  else
		  begin
			-- insert the prvious record 
			set @fieldName = SUBSTRING(@fileName, 0, 8)
			update [SLA-weight] set area= @areaTotal where [物种编号] =@fieldName
			set @fileNameBegin = @fileName
			set @areaTotal = @area
		  end
		fetch next from tempTable7 into @fileName,@area
	end
	set @fieldName = SUBSTRING(@fileName, 0, 8)
	update [SLA-weight] set area= @areaTotal where [物种编号] =@fieldName
	
end
close tempTable7


 alter table [SLA-weight] add area decimal(18,3)
  alter table [g-SLA-area2021] add [fileName] nvarchar(255)

  select * from [g-SLA-area2021]
  update [g-SLA-area2021] set fileName =  SUBSTRING('X199039-L-(2-1).jpg', 0, 8)

select charindex('(', 'X199039-L-(2-1).jpg')
select SUBSTRING('X199039-L-(2-1).jpg', 0, CHARINDEX('(', 'X199039-L-(2-1).jpg')-1)
select SUBSTRING('X199039-L-(2-1).jpg', 0, 8)

 select * from [SLA-weight]



 select * from gspecimen2021 where 野外鉴定 like '芦苇'


 select * from genvironment2021

 select plot, [调查地点], '新疆', [样地面积] ,[经度] ,[纬度],[海拔],[地形],[坡度],[坡位],[坡向],[群系类型],[群落起源],[水分状况]
      ,[干扰程度],[干扰类型],'北疆小组', '北疆小组',[日期],[灌木层高]/100,[灌木盖度],[灌木优势种],[草本层高]/100,[草本盖度],[草本优势种],[备注] 
	  from genvironment2021


select * from AB where speciesNo = 0
  select [plot],[splot],[speceis],'地上',[freshAB],[freshSampledAB],[ovenDrySampledAB],'北疆小组',[date]  from AB where speciesNo = 0    
  select [plot],[splot],[speceis],'地上',[freshAB],[freshSampledAB],[ovenDrySampledAB],'北疆小组',[date]  from AB where speciesNo != 0    
     
 
select a.[plot],a.[splot],'', a.[freshRoot],a.[ovenDryRoot],b.[freshRoot],b.[ovenDryRoot]
,c.[freshRoot],c.[ovenDryRoot],d.[freshRoot],d.[ovenDryRoot],e.[freshRoot],e.[ovenDryRoot]
,'北疆小组',aa.[日期]
from
( select  [plot],[splot],[freshRoot],[ovenDryRoot]  FROM [xinjiangPlot].[dbo].[groot2021] where layer = 'a') a
join 
( select  [plot],[splot],[freshRoot],[ovenDryRoot]  FROM [xinjiangPlot].[dbo].[groot2021] where layer = 'b') b
on a.[plot]=b.[plot] and a.[splot]=b.[splot]
join 
( select  [plot],[splot],[freshRoot],[ovenDryRoot]  FROM [xinjiangPlot].[dbo].[groot2021] where layer = 'c') c
on a.[plot]=c.[plot] and a.[splot]=c.[splot]
join 
( select  [plot],[splot],[freshRoot],[ovenDryRoot]  FROM [xinjiangPlot].[dbo].[groot2021] where layer = 'd') d
on a.[plot]=d.[plot] and a.[splot]=d.[splot]
join 
( select  [plot],[splot],[freshRoot],[ovenDryRoot]  FROM [xinjiangPlot].[dbo].[groot2021] where layer = 'e') e
on a.[plot]=e.[plot] and a.[splot]=e.[splot]
join genvironment2021 aa on a.[plot]=  aa.[plot]
      
--soil
select a.[plot],a.[splot], a.[freshSoil],a.[airDrySoil],a.stone, a.stoneML
,b.[freshSoil],b.[airDrySoil],b.stone, b.stoneML
,c.[freshSoil],c.[airDrySoil],c.stone, c.stoneML
,d.[freshSoil],d.[airDrySoil],d.stone, d.stoneML
,e.[freshSoil],e.[airDrySoil],e.stone, e.stoneML
,'北疆小组',aa.[日期]
from
( select  [plot],[splot],[freshSoil],[airDrySoil],(case when stoneOnsite is not null then stoneExsite else stoneExsite end) as stone, [砾石体积/ML] as stoneML   FROM [xinjiangPlot].[dbo].[gsoil2021] where layer = 'a') a
join 
( select  [plot],[splot],[freshSoil],[airDrySoil],(case when stoneOnsite is not null then stoneExsite else stoneExsite end) as stone, [砾石体积/ML] as stoneML  FROM [xinjiangPlot].[dbo].[gsoil2021] where layer = 'b') b
on a.[plot]=b.[plot] and a.[splot]=b.[splot]
join 
( select  [plot],[splot],[freshSoil],[airDrySoil],(case when stoneOnsite is not null then stoneExsite else stoneExsite end) as stone, [砾石体积/ML] as stoneML  FROM [xinjiangPlot].[dbo].[gsoil2021] where layer = 'c') c
on a.[plot]=c.[plot] and a.[splot]=c.[splot]
join 
( select  [plot],[splot],[freshSoil],[airDrySoil],(case when stoneOnsite is not null then stoneExsite else stoneExsite end) as stone , [砾石体积/ML] as stoneML FROM [xinjiangPlot].[dbo].[gsoil2021] where layer = 'd') d
on a.[plot]=d.[plot] and a.[splot]=d.[splot]
join 
( select  [plot],[splot],[freshSoil],[airDrySoil],(case when stoneOnsite is not null then stoneExsite else stoneExsite end) as stone, [砾石体积/ML] as stoneML  FROM [xinjiangPlot].[dbo].[gsoil2021] where layer = 'e') e
on a.[plot]=e.[plot] and a.[splot]=e.[splot]
join genvironment2021 aa on a.[plot]=  aa.[plot]  
      
select * from gsoil2021     
      
   

select * from gspecimen2021


select b.样地号,b.采集号, b.野外鉴定,a.ovenDryLeaf,a.叶鲜重, a.ovenDryLeaf*100/a.叶鲜重 as [干物质%], c.[面积]/10000 as 面积m2,c.[sla] as [SLAm2/g], a.叶厚度1,a.叶厚度2,a.叶厚度3, '北疆小组' as 调查人, b.[采集日期] as 调查日期, a.物种编号
into gsla2021
from [sla-weight] a, gspecimen2021 b, sla c where SUBSTRING(a.物种编号,1,7)=b.采集号 and a.物种编号=c.物种编号 

select * from  gsla2021
select top 1 * from sla
select top 1 * from [sla-weight]
select top 1 * from 	[g-SLA-area2021]

select avg(a.叶厚度1) from gsla2021 a  where SUBSTRING(a.物种编号,1,7)='x199179'

select aa.物种编号, avg(叶厚度) as 叶厚度, avg([SLAm2/g]) as [SLAm2/g]
from (
select 
SUBSTRING(a.物种编号,1,7) as 物种编号,[SLAm2/g],
case when a.叶厚度1 is null and a.叶厚度2 is null and a.叶厚度3 is null then null 
else 
 (isnull(a.叶厚度1,0)+isnull(a.叶厚度2,0)+isnull(a.叶厚度3,0))/((case when a.叶厚度1 is null then 0 else 1 end) + (case when a.叶厚度2 is null then 0 else 1 end) + (case when a.叶厚度3 is null then 0 else 1 end))
end
as 叶厚度
from gsla2021 a) aa
group by aa.物种编号


 select a.叶厚度1+a.叶厚度2,a.叶厚度1+a.叶厚度2 from gsla2021 a where SUBSTRING(a.物种编号,1,7)='X199038'

select SUBSTRING('X200019-1',1,7)

select * from environment order by plot
select* from environment order by altitudeGPS 

select* from arbor order by plot
select PLOT, count(species) NUMBER from arbor where plot like '%AET%' or plot like '%FY%' or plot like '%QH%' group by plot ORDER BY NUMBER


select * from environment where plot like '%DTS%' order by plot 
select * from arbor where plot like '%DTS%' order by plot
select * from shrubandgrass where plot like '%DTS%' order by plot
select * from environmentindex


select a.cnName,a.latinname,b.cnname,b.latinname from gSLA2021 a 
join gspecimenname2021 b on a.[采集号]=b.[标本号]

--update gSLA2021 set cnName=b.cnName, latinName=b.latinName from gSLA2021 a 
join gspecimenname2021 b on a.[采集号]=b.[标本号]

select * from gsla2021
select distinct(采集号) from gsla2021

select * from [z-gSLA2021]
select * from [z-gSLAarea2021]
select * from [z-gSLAweight2021]


select * from gspecimen2021 
select * from gABforname2021 where latinname is null
select * from gspecimenname2021
select * from gplot2021forname order by autoid
select * from gABforname2021 order by autoid
select distinct(cnname) from  gplot2021forname where latinname is null

select distinct(cnname) from gspecimenname2021 

select a.cnname,a.latinname from gplot2021forname a, gspecimenname2021 b where a.cnname=b.cnname
--update gplot2021forname set latinname=b.latinname from gplot2021forname a, gspecimenname2021 b where a.cnname=b.cnname

--update gABforname2021 set latinname=b.latinname from gABforname2021 a, gspecimenname2021 b where a.cnname=b.cnname


select * from plot

select * from soil2022


--update soil set splotno=left(sampleno, charindex('-',sampleno)-1),depth=RIGHT(sampleno, len(sampleno)-charindex('-',sampleno))
--select left(sampleno, charindex('-',sampleno)-1),RIGHT(sampleno, len(sampleno)-charindex('-',sampleno)) from soil


####计算土壤样品数量
select aa.plotno, a.acount,b.acount,c.acount,d.acount,e.acount from
(select distinct plotno from soil) aa left join
(
select  plotno,count(*) acount from soil 
where  depth='a' and weightfresh is not null
group by plotno
) a  on aa.plotno=a.plotno
left join
(
select  plotno,count(*) acount from soil 
where  depth='b' and weightfresh is not null
group by plotno
) b on aa.plotno=b.plotno
left join
(
select  plotno,count(*) acount from soil 
where  depth='c' and weightfresh is not null
group by plotno
) c on aa.plotno=c.plotno
left join
(
select  plotno,count(*) acount from soil 
where  depth='d' and weightfresh is not null
group by plotno
) d on aa.plotno=d.plotno
left join
(
select  plotno,count(*) acount from soil 
where  depth='e' and weightfresh is not null
group by plotno
) e on aa.plotno=e.plotno
order by aa.plotno



####计算优良牧草数量
select * from plot
select plotno,count(splotno) from plot group by plotno,

select  cnName, count(plotno) plotNoCount from
(
select distinct plotno, cnname from plot
) a group by cnName order by plotNoCount desc

select aa.cnname,bb.plotno,aa.plotNoCount from (
select top 80 cnName, count(plotno) plotNoCount from
(
	select distinct plotno, cnname from plot
	) a group by cnName order by plotNoCount desc
)aa join 
(
select distinct plotno, cnname from plot
) bb on aa.cnname=bb.cnName order by aa.plotNoCount desc

--
select top 90 cnName, plotno, count(plotno) over (partition by cnName) plotNoCount  from 
(
select distinct plotno, cnname from plot
) aa order by plotNoCount desc, plotno


---选样地的样品数量
select aaa.cnName, aaa.plotno, aaa.plotNoCount,bbb.splotnoCount
from 
(
	select aa.cnname,bb.plotno,aa.plotNoCount from (
		select top 90 cnName, count(plotno) plotNoCount from
		(
			select distinct plotno, cnname from plot
		) a group by cnName order by plotNoCount desc
	)aa join 
	(
		select distinct plotno, cnname from plot
	) bb on aa.cnname=bb.cnName 
) aaa join
(
	select plotno, cnName, count(*) splotnoCount from plot 
	where splotno in (1,3,5) 
	group by plotno, cnName
) bbb on aaa.cnname=bbb.cnname and aaa.plotno=bbb.plotno
order by aaa.plotNoCount desc, cnname

-----选植物出现的样地号
select aa.cnname,bb.plotno from (
		select top 90 cnName, count(plotno) plotNoCount from
		(
			select distinct plotno, cnname from plot
		) a group by cnName order by plotNoCount desc
	)aa join 
	(
		select distinct plotno, cnname from plot
	) bb on aa.cnname=bb.cnName 


---变横排，一个格子中
SELECT cnname,plotNoCount, STUFF((SELECT ','+plotno FROM
(
	select aa.cnname,bb.plotno from (
		select top 90 cnName, count(plotno) plotNoCount from
		(
			select distinct plotno, cnname from plot
		) a group by cnName order by plotNoCount desc
	)aa join 
	(
		select distinct plotno, cnname from plot
	) bb on aa.cnname=bb.cnName 
) twoT 
where cnname=twoA.cnname FOR XML PATH('')),1,1,'') As A 
from (
	select aa.cnname,bb.plotno,aa.plotNoCount from (
			select top 90 cnName, count(plotno) plotNoCount from
			(
				select distinct plotno, cnname from plot
			) a group by cnName order by plotNoCount desc
		)aa join 
		(
			select distinct plotno, cnname from plot
		) bb on aa.cnname=bb.cnName 
) twoA
group by cnname,plotNoCount order by plotNoCount desc

---------
select distinct plotno from
(
select aa.cnname,bb.plotno,aa.plotNoCount from (
		select top 31 cnName, count(plotno) plotNoCount from
		(
			select distinct plotno, cnname from plot
		) a group by cnName order by plotNoCount desc
	)aa join 
	(
		select distinct plotno, cnname from plot
	) bb on aa.cnname=bb.cnName 
) aaa

select distinct plotno from 
(
	select cnName from 
	(
		select cnName, plotNoCount, ROW_NUMBER() over (order by  plotNoCount desc) as plotNoCount1
		from
		(
			select cnName, count(plotno) plotNoCount from
			(
				select distinct plotno, cnname from plot
			) a group by cnName 
		) aa
	) aaa where plotNoCount1<32
) aaaa
join 
(
select distinct plotno, cnname from plot
) bbbb on aaaa.cnName=bbbb.cnName

select distinct plotno from 
(
	select cnName from 
	(
		select cnName, plotNoCount, ROW_NUMBER() over (order by  plotNoCount desc) as plotNoCount1
		from
		(
			select cnName, count(plotno) plotNoCount from
			(
				select distinct plotno, cnname from plot
			) a group by cnName 
		) aa
	) aaa where plotNoCount1> 31 and plotNoCount1<86
) aaaa
join 
(
select distinct plotno, cnname from plot
) bbbb on aaaa.cnName=bbbb.cnName

select * from environment





---------2022---------
---计算地上生物量
select * FROM AB order by autoid

select * from AB1 order by autoid


update ab set [袋数]=1 where [袋数] is null
update AB  set [样品鲜重] = null where [样品鲜重]=999
UPDATE AB SET [样品鲜重] = [总鲜重] where  [样品鲜重] is null
select * from AB where [样品鲜重] is not null
select * from ABBag
update ABBag set [新小信封] = null where [新小信封] =999
update ABBag set [新小信封干重] = null where [新小信封干重] =999

select * from (
select a.autoID,a.[样地编号],a.EnvFlag,b.[大信封] ,b.[中信封] ,b.[新小信封],
case when a.EnvFlag = '大' then isnull(b.[大信封] ,14.73)
when a.EnvFlag = '中' then b.[中信封] 
when a.EnvFlag = '小' then b.[小信封] 
when a.EnvFlag = '新小' then b.[新小信封] 
when a.EnvFlag = '档' then isnull(b.[档案袋] ,34.59) else 0  end as xinfeng
from AB a join ABBagNew b on a.[样地编号]=b.[样地编号] collate chinese_prc_ci_as
--where ltrim(rtrim(a.[信封规格])) like  '%大%'
where  a.EnvFlag is not null
) aa where xinfeng is null order by autoid

select * from ABbag
update ABbag set [中信封]=6.921 where [样地编号]='XJN060'

UPDATE AB SET [样品净鲜重] = ([样品鲜重] - xinfeng) 
from AB join (
select a.autoID,a.[样地编号],a.EnvFlag,b.[大信封] ,b.[中信封] ,b.[新小信封],
case when a.EnvFlag = '大' then isnull(b.[大信封] ,14.73)
when a.EnvFlag = '中' then b.[中信封] 
when a.EnvFlag = '小' then b.[小信封] 
when a.EnvFlag = '新小' then b.[新小信封] 
when a.EnvFlag = '档' then isnull(b.[档案袋] ,34.59) else 0  end as xinfeng
from AB a join ABBag b on a.[样地编号]=b.[样地编号] collate chinese_prc_ci_as
--where ltrim(rtrim(a.[信封规格])) like  '%大%'
where  a.EnvFlag is not null
) aa on AB.autoId=aa.autoID

UPDATE AB SET [样品净干重] = ([烘干重] - xinfeng1) 
from AB join (
select a.autoID,a.[样地编号],a.EnvFlag,b.[大信封] ,b.[中信封] ,b.[新小信封],
case when a.EnvFlag = '大' then isnull(b.[大信封] ,14.73)
when a.EnvFlag = '中' then b.[中信封] 
when a.EnvFlag = '小' then b.[小信封干重] 
when a.EnvFlag = '新小' then b.[新小信封干重] 
when a.EnvFlag = '档' then isnull(b.[档案袋] ,34.59) else 0  end as xinfeng1
from AB a join ABBag b on a.[样地编号]=b.[样地编号] collate chinese_prc_ci_as
--where ltrim(rtrim(a.[信封规格])) like  '%大%'
where  a.EnvFlag is not null
) aa on AB.autoId=aa.autoID

UPDATE AB SET [总净鲜重] = ([总鲜重] - xinfeng) / [取样量]
from AB join (
select a.autoID,a.[样地编号],a.EnvFlag,b.[大信封] ,b.[中信封] ,b.[新小信封],
case when a.EnvFlag = '大' then isnull(b.[大信封] ,14.73)
when a.EnvFlag = '中' then b.[中信封] 
when a.EnvFlag = '小' then b.[小信封] 
when a.EnvFlag = '新小' then b.[新小信封] 
when a.EnvFlag = '档' then isnull(b.[档案袋] ,34.59) else 0  end as xinfeng
from AB a join ABBag b on a.[样地编号]=b.[样地编号] collate chinese_prc_ci_as
--where ltrim(rtrim(a.[信封规格])) like  '%大%'
where  a.EnvFlag is not null
) aa on AB.autoId=aa.autoID
---

--计算根
select * from BB order by autoid
select * from soilBBbag

select * from BB  where [净风干重] < 0
update BB set modi=[净风干重], [净风干重]=0.1 where [净风干重] < 0

select * from BB where [净风干重] = 0.1

update BB set modi净烘干重=[净烘干重], [净烘干重]=0.07 where [净烘干重] < 0

update BB set [风干重(g)] = null where [风干重(g)]=999

select * from BB where autoID not in (
select BB.autoID from BB 
join soilBBbag a on BB.[样地编号]=a.[样地编号] )

--update BB set [样地编号]='XJN121' where [样地编号]='XIN121'

update BB set [净鲜重]=[总鲜重(g)]-[根袋鲜重]
from BB join soilBBbag a on BB.[样地编号]=a.[样地编号]
where BB.[样品号] not like '%根%'

update BB set [净鲜重]=[总鲜重(g)]-4.75
from BB join soilBBbag a on BB.[样地编号]=a.[样地编号]
where BB.[样品号] like '%根%'

update BB set [净风干重]=[风干重(g)]-[根袋鲜重]
from BB join soilBBbag a on BB.[样地编号]=a.[样地编号]
where BB.[样品号] not like '%根%'

update BB set [净风干重]=[风干重(g)]-4.75
from BB join soilBBbag a on BB.[样地编号]=a.[样地编号]
where BB.[样品号] like '%根%'

update BB set [净烘干重]=[烘干重(g)]-[根袋烘干重]
from BB join soilBBbag a on BB.[样地编号]=a.[样地编号]
where BB.[样品号] not like '%根%'

update BB set [净烘干重]=[烘干重(g)]-4.42
from BB join soilBBbag a on BB.[样地编号]=a.[样地编号]
where BB.[样品号] like '%根%'


--将根净风干重和净烘干重为0和负值的，替换为风干重0.1, 烘干重0.07
update




select * from soilBBbag

select * from BB join soilBBbag a on BB.[样地编号]=a.[样地编号]
where BB.[样品号] like '%根%'

select * from BB join soilBBbag a on BB.[样地编号]=a.[样地编号]
where BB.[样品号] not like '%根%'
select* from BB where [净鲜重] is null
select* from BB where [净鲜重] is not null
select* from BB where [净风干重] is null
select* from BB where [净风干重] is not null
---

---计算土壤
select * from soil order by autoid
select * from soilBBBag

update soil set [风干重] = null where [风干重]=999

update soil set [砾石净干重]=[砾石干重]-isnull(a.[砾石袋重量],0)
from soil join soilBBbag a on soil.[样地编号]=a.[样地编号]

update soil set [砾石净干重]=0 from soil where [砾石干重]=0

update soil set [净鲜重]=[总鲜重]-isnull(a.[土壤袋重量],0)-isnull([砾石净干重],0)-isnull(BB.[净鲜重],isnull(BB.[净风干重],0))
from soil join soilBBbag a on soil.[样地编号]=a.[样地编号]
join BB on soil.[样地编号]=BB.[样地编号] and soil.[样品号]=BB.[样品号]

update soil set [净风干重]=[风干重]-isnull([砾石净干重],0)-isnull(BB.[净风干重],isnull(BB.[净鲜重],0))
from soil join soilBBbag a on soil.[样地编号]=a.[样地编号]
join BB on soil.[样地编号]=BB.[样地编号] and soil.[样品号]=BB.[样品号]

update soil set [砾石净干重]=0.5 where [样地编号]='XJN111' and ([样品号]='3-a' or [样品号]='5-a')
select * from soil  where [样地编号]='XJN111'
select * from soil  where 砾石净干重 < 0

---

select * from [样地草本] order by autoid
select * from [样地草本] where latinName is null
select * from [样地草本] where cnname ='新疆薹草'
update [样地草本] set cnname ='新疆薹草' where cnname ='薹草'

select distinct (cnname) from [样地草本]
select distinct (latinname) from [样地草本]
select distinct (cnname) from [标本]


update [样地草本]  set latinName  = b.latinName 
from [样地草本] a join [标本] b on  a.cnName=b.cnName  collate chinese_prc_ci_as where a.latinname is null

select * from [样地草本] a join [标本] b on  a.cnName=b.cnName  collate chinese_prc_ci_as where a.latinname is null

update [样地草本] set [单位]='株' where [单位] is null 

select * from [标本] where cnName like '%猪毛菜%'
select distinct cnName from [样地草本] where latinName is null

update [样地草本] set cnName= b.cnNamecheck from [样地草本] a join [样地物种check] b on a.cnName=b.cnName collate chinese_prc_ci_as
where b.cnNamecheck is not null


select * 
from soil join soilBBbag a on soil.[样地编号]=a.[样地编号]

select * from [样地灌木]
delete [样地灌木] where autoid is null
update [样地灌木]  set latinName  = b.latinName from [样地灌木] a join [标本] b on a.[样地编号]=b.[样地号] collate chinese_prc_ci_as  and a.cnName=b.cnName  collate chinese_prc_ci_as


select * from environment
select * from [样地草本] order by autoid

select a.[调查日期] from [样地草本] a join environment b on a.[样地编号]=b.[样地编号] collate chinese_prc_ci_as

Update [样地草本] set [调查日期] = b.[调查日期] 
from [样地草本] a join environment b on a.[样地编号]=b.[样地编号] collate chinese_prc_ci_as

Update AB set [调查日期] = b.[调查日期] 
from AB a join environment b on a.[样地编号]=b.[样地编号] collate chinese_prc_ci_as

select * from AB order by autoid

select * from AB 
update AB set newCnName=[物种]
update AB set newCnName = replace(newCnName,' ','')
update AB set newCnName = replace(newCnName,'－','-')

update AB set newCnName = replace(newCnName,'-0','-')
update AB set newCnName = replace(newCnName,'-1','-')
update AB set newCnName = replace(newCnName,'-2','-')
update AB set newCnName = replace(newCnName,'-3','-')
update AB set newCnName = replace(newCnName,'-4','-')
update AB set newCnName = replace(newCnName,'-5','-')
update AB set newCnName = replace(newCnName,'-6','-')
update AB set newCnName = replace(newCnName,'-7','-')
update AB set newCnName = replace(newCnName,'-8','-')
update AB set newCnName = replace(newCnName,'-9','-')

update AB set newCnName = replace(newCnName,'0-','-')
update AB set newCnName = replace(newCnName,'1-','-')
update AB set newCnName = replace(newCnName,'2-','-')
update AB set newCnName = replace(newCnName,'3-','-')
update AB set newCnName = replace(newCnName,'4-','-')
update AB set newCnName = replace(newCnName,'5-','-')
update AB set newCnName = replace(newCnName,'6-','-')
update AB set newCnName = replace(newCnName,'7-','-')
update AB set newCnName = replace(newCnName,'8-','-')
update AB set newCnName = replace(newCnName,'9-','-')

update AB set newCnName = replace(newCnName,'-','')

update  AB  set speciesSeq = null
update  AB  set speciesSeq = left([物种], len([物种]) - len(newCnName))

select autoid, newCnName from AB where newCnName like '%[1-9]%'
select autoid, [物种], newCnName from AB where [物种] like '%与%'

select a.cnName from AB a 
join (
select distinct cnName, latinName from [样地草本] ) b on a.cnName=b.cnName collate chinese_prc_ci_as

update AB set latinName=b.latinName from AB a 
join (
select distinct cnName, latinName from [样地草本] ) b on a.cnName=b.cnName collate chinese_prc_ci_as

select distinct cnName from AB where latinName is null

update AB set cnName=cnName0

update AB set cnName=b.cnNamecheck from AB a join [样地物种check] b on a.cnName=b.cnName collate chinese_prc_ci_as
where b.cnNamecheck is not null

select * from soil
select * from soil2022



select * from environmentIndex
select * from environment
select * from plotDistribution
select * from arbor where plot in (select plot from environment where needle = 1)
select * from environment where needle = 1 order by plot


--草地植物两年的环境列不同，需整理
select * from environment
select * from plot
select plotno, count(distinct(cnname)) from plot group by plotno

select * from genvironment2021