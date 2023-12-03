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

--woody ��������Ұ����
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
update gsoil2021 set freshSoil= [��Ʒ��+��������] - 18.9
update gsoil2021 set airdrySoil= [��Ʒ��+��������] - 18.9
update gsoil2021 set aftersieveSoil= [ɸ����Ʒ��+��������] - 18.9

update gsoil2021 set stoneOnsite = [��ʯ����(ë��Ұ��)]- 
(case 
when [�ŷ�] = 1 then 4.045 
when [�ŷ�] = 2 then 3.5 
when [�ŷ�] = 3 then 3.49 
when [�ŷ�] = 4 then 3.49
when [�ŷ�] = 5 then 4.414 
when [�ŷ�] = 6 then 3.63 
when [�ŷ�] = 7 then 2.2085 
when [�ŷ�] = 8 then 4.57 
else 0 end)
where [��ʯ����(ë��Ұ��)] is not  null and [��ʯ����(ë��Ұ��)] > 0 

--update gsoil2021 set stoneOnsite=null
update gsoil2021 set stoneExsite = [��ʯ����(ë�����)] - 
(case 
when [�ŷ�] = 1 then 4.045 
when [�ŷ�] = 2 then 3.5 
when [�ŷ�] = 3 then 3.49 
when [�ŷ�] = 4 then 3.49
when [�ŷ�] = 5 then 4.414 
when [�ŷ�] = 6 then 3.63 
when [�ŷ�] = 7 then 2.2085 
when [�ŷ�] = 8 then 4.57 
else 0 end)
where [��ʯ����(ë�����)]  is not  null and [��ʯ����(ë�����)]  > 0 

update gsoil2021 set stoneExsite = [��ʯ������(���)] where [��ʯ������(���)] is not null and stoneExsite is null


select * from gsoil2021 where [��ʯ������(Ұ��)] is not null or [��ʯ������(���)] is not null



select * from gsoil2021 where freshSoil  is null

--update gsoil2021 set [�ŷ�] = FLOOR([�ŷ�])
select [�ŷ�], FLOOR([�ŷ�]) from gsoil2021

select * from gsoil2021 where [ɸ����Ʒ��+��������]  is not null
select * from gsoil2021 where aftersieveSoil  is not null

select * from gsoil2021 where freshSoil  is  null
select *  from gsoil2021 where airdrySoil  is  null
select *  from gsoil2021 where [ɸ����Ʒ��+��������]  is  null
select *  from gsoil2021 where [ɸ����Ʒ��+��������]  is not null
select *  from gsoil2021 where [��ʯ����(ë��Ұ��)]  is  null or [��ʯ����(ë��Ұ��)]=0
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
	[��Ʒ��+��������] [decimal](18, 3) NULL,
	[freshSoil] [decimal](18, 3) NULL,
	[��Ʒ��+��������] [decimal](18, 3) NULL,
	[airdrySoil] [decimal](18, 3) NULL,
	[ɸ����Ʒ��+��������] [decimal](18, 3) NULL,
	[aftersieveSoil] [decimal](18, 3) NULL,
	[��ʯ����(ë��Ұ��)] [decimal](18, 3) NULL,
	[stoneOnsite] [decimal](18, 3) NULL,
	[��ʯ����(ë�����)] [decimal](18, 3) NULL,
	[stoneExsite] [decimal](18, 3) NULL,
	[�ŷ�] [nvarchar](50) NULL,
	[��ʯ������(Ұ��)] [decimal](18, 3) NULL,
	[��ʯ������(���)] [decimal](18, 3) NULL,
	[��ʯ���/ML] [decimal](18, 1) NULL,
	[��ע] [nvarchar](255) NULL,
	[��ע2] [nvarchar](255) NULL
) ON [PRIMARY]
GO

--delete gsoil2021

insert into gsoil2021 (plot
      ,splot
      ,layer
      ,[��Ʒ��+��������]
      ,[��Ʒ��+��������]
      ,[ɸ����Ʒ��+��������]
      ,[��ʯ����(ë��Ұ��)]
      ,[��ʯ����(ë�����)]
      ,[�ŷ�]
      ,[��ʯ������(Ұ��)]
      ,[��ʯ������(���)]
      ,[��ʯ���/ML]
      ,[��ע]
      ,[��ע2])

SELECT  [���ر��] as plot
      ,[�������] as splot
      ,[���] as layer
      ,[��Ʒ��+��������]
      ,[��Ʒ��+��������]
      ,[ɸ����Ʒ��+��������]
      ,[��ʯ����(ë��Ұ��)]
      ,[��ʯ����(ë�����)]
      ,[�ŷ�]
      ,[��ʯ������(Ұ��)]
      ,[��ʯ������(���)]
      ,[��ʯ���/ML]
      ,[��ע]
      ,[��ע2]
  FROM [xinjiangPlot].[dbo].[Sheet3$]




  ----------
  select * from groot2021

 -- alter table groot2021 add freshRoot decimal(18,3)
  --alter table groot2021 add airDryRoot decimal(18,3)
  --alter table groot2021 add ovenDryRoot decimal(18,3)
  alter table groot2021 add ovenDryRoot0 decimal(18,3)
  update groot2021 set freshRoot = [��Ʒ��+������]- 
(case 
when [�ŷ�] = 1 then 3.6 
when [�ŷ�] = 2 then 3.5 
when [�ŷ�] = 3 then 3.49 
when [�ŷ�] = 4 then 3.49
when [�ŷ�] = 5 then 4.414 
when [�ŷ�] = 6 then 3.63 
when [�ŷ�] = 7 then 2.2085 
when [�ŷ�] = 8 then 4.57 
else 0 end)
where [��Ʒ��+������] is not  null

  update groot2021 set ovenDryRoot = [���ë��]- 
(case 
when [�ŷ�] = 1 then 3.6 
when [�ŷ�] = 2 then 3.5 
when [�ŷ�] = 3 then 3.49 
when [�ŷ�] = 4 then 3.49
when [�ŷ�] = 5 then 4.414 
when [�ŷ�] = 6 then 3.63 
when [�ŷ�] = 7 then 2.2085 
when [�ŷ�] = 8 then 4.57 
else 0 end)
-(case when [��] is not null then [��]*0.044 else 0 end)
where [���ë��] is not  null

  update groot2021 set airDryRoot = [��Ʒ��+�����]- 
(case 
when [�ŷ�] = 1 then 3.6 
when [�ŷ�] = 2 then 3.5 
when [�ŷ�] = 3 then 3.49 
when [�ŷ�] = 4 then 3.49
when [�ŷ�] = 5 then 4.414 
when [�ŷ�] = 6 then 3.63 
when [�ŷ�] = 7 then 2.2085 
when [�ŷ�] = 8 then 4.57 
else 0 end)
where [��Ʒ��+�����] is not  null

 select * from groot2021 where [�����ؾ�] is not null
 --update groot2021 set freshRoot =  [�����ؾ�] where [�����ؾ�] is not null and freshRoot is null
  
  
  select * from groot2021 where [�ŷ�] = 1
  select * from groot2021 where freshroot < 0

  select * from groot2021 where ovendryroot < 0
 
   select * from groot2021  where [��Ʒ��+������]=0

     --update groot2021 set [�ŷ�]=0 where [��Ʒ��+������]=0
	 --update groot2021 set [�ŷ�]=0 where [�ŷ�] is null
UPDATE groot2021 SET ovenDryRoot0 =ovenDryRoot
select * from groot2021  WHERE ovenDryRoot < 0
UPDATE groot2021 SET ovenDryRoot =NULL WHERE ovenDryRoot < 0


  select * from AB
  

--alter table AB add ovenDrySampledAB decimal(18,3)


--update AB set ovenDrySampledAB = [��Ʒ�����ë] - 
(case 
when [�ŷ�] = '��' then 5.43 
when [�ŷ�] = '��' then 15.46
when [�ŷ�] = 'С' then 3.50 
when [�ŷ�] = 'С1' then 3.50
when [�ŷ�] = 'С2' then 3.50 
when [�ŷ�] = 'С3' then 3.50 
when [�ŷ�] = 'С4' then 3.50 
when [�ŷ�] = 'С5' then 4.41 
when [�ŷ�] = 'С6' then 3.63 
when [�ŷ�] = 'С7' then 2.2085 
when [�ŷ�] = 'С8' then 4.57 
when [�ŷ�] = '��' then 31.66 
else 0 end)
-(case when [��] is not null then [��]*0.044 else 0 end)
where [��Ʒ�����ë] is not  null and [��Ʒ�����ë] > 0 



select * from genvironment2021
update genvironment2021 set [����]=null
select * from environment1
update genvironment2021 set [����]=b.[����] from genvironment2021 a, environment1 b where a.plot=b.[���ر��]

select * from [sla-weight]

--alter table [sla-weight] add ovenDryLeaf decimal(18,3)
--update [sla-weight] set ovenDryLeaf = [Ҷ���ë��] - 
(case 
when [�ŷ�] = '��' then 5.43 
when [�ŷ�] = '��' then 15.46
when [�ŷ�] = 'С' then 3.50 
when [�ŷ�] = 'С1' then 3.50
when [�ŷ�] = 'С2' then 3.50 
when [�ŷ�] = 'С3' then 3.50 
when [�ŷ�] = 'С4' then 3.50 
when [�ŷ�] = 'С5' then 4.41 
when [�ŷ�] = 'С6' then 3.63 
when [�ŷ�] = 'С7' then 2.2085 
when [�ŷ�] = 'С8' then 4.57 
when [�ŷ�] = '��' then 31.66 
else 0 end)
-(case when [��] is not null then [��]*0.044 else 0 end)
where [Ҷ���ë��] is not  null and [Ҷ���ë��] > 0



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
	select [�ļ���],[���] from [g-SLA-area2021] order by [�ļ���]

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
				update [SLA-weight] set area= @areaTotal where [���ֱ��] =@fieldName
				set @fileNameBegin = @fileNameShow
				set @areaTotal = @area
			end
		  end
	  else
		  begin
			-- insert the prvious record 
			set @fieldName = SUBSTRING(@fileName, 0, 8)
			update [SLA-weight] set area= @areaTotal where [���ֱ��] =@fieldName
			set @fileNameBegin = @fileName
			set @areaTotal = @area
		  end
		fetch next from tempTable7 into @fileName,@area
	end
	set @fieldName = SUBSTRING(@fileName, 0, 8)
	update [SLA-weight] set area= @areaTotal where [���ֱ��] =@fieldName
	
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



 select * from gspecimen2021 where Ұ����� like '«έ'


 select * from genvironment2021

 select plot, [����ص�], '�½�', [�������] ,[����] ,[γ��],[����],[����],[�¶�],[��λ],[����],[Ⱥϵ����],[Ⱥ����Դ],[ˮ��״��]
      ,[���ų̶�],[��������],'����С��', '����С��',[����],[��ľ���]/100,[��ľ�Ƕ�],[��ľ������],[�ݱ����]/100,[�ݱ��Ƕ�],[�ݱ�������],[��ע] 
	  from genvironment2021


select * from AB where speciesNo = 0
  select [plot],[splot],[speceis],'����',[freshAB],[freshSampledAB],[ovenDrySampledAB],'����С��',[date]  from AB where speciesNo = 0    
  select [plot],[splot],[speceis],'����',[freshAB],[freshSampledAB],[ovenDrySampledAB],'����С��',[date]  from AB where speciesNo != 0    
     
 
select a.[plot],a.[splot],'', a.[freshRoot],a.[ovenDryRoot],b.[freshRoot],b.[ovenDryRoot]
,c.[freshRoot],c.[ovenDryRoot],d.[freshRoot],d.[ovenDryRoot],e.[freshRoot],e.[ovenDryRoot]
,'����С��',aa.[����]
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
,'����С��',aa.[����]
from
( select  [plot],[splot],[freshSoil],[airDrySoil],(case when stoneOnsite is not null then stoneExsite else stoneExsite end) as stone, [��ʯ���/ML] as stoneML   FROM [xinjiangPlot].[dbo].[gsoil2021] where layer = 'a') a
join 
( select  [plot],[splot],[freshSoil],[airDrySoil],(case when stoneOnsite is not null then stoneExsite else stoneExsite end) as stone, [��ʯ���/ML] as stoneML  FROM [xinjiangPlot].[dbo].[gsoil2021] where layer = 'b') b
on a.[plot]=b.[plot] and a.[splot]=b.[splot]
join 
( select  [plot],[splot],[freshSoil],[airDrySoil],(case when stoneOnsite is not null then stoneExsite else stoneExsite end) as stone, [��ʯ���/ML] as stoneML  FROM [xinjiangPlot].[dbo].[gsoil2021] where layer = 'c') c
on a.[plot]=c.[plot] and a.[splot]=c.[splot]
join 
( select  [plot],[splot],[freshSoil],[airDrySoil],(case when stoneOnsite is not null then stoneExsite else stoneExsite end) as stone , [��ʯ���/ML] as stoneML FROM [xinjiangPlot].[dbo].[gsoil2021] where layer = 'd') d
on a.[plot]=d.[plot] and a.[splot]=d.[splot]
join 
( select  [plot],[splot],[freshSoil],[airDrySoil],(case when stoneOnsite is not null then stoneExsite else stoneExsite end) as stone, [��ʯ���/ML] as stoneML  FROM [xinjiangPlot].[dbo].[gsoil2021] where layer = 'e') e
on a.[plot]=e.[plot] and a.[splot]=e.[splot]
join genvironment2021 aa on a.[plot]=  aa.[plot]  
      
select * from gsoil2021     
      
   

select * from gspecimen2021


select b.���غ�,b.�ɼ���, b.Ұ�����,a.ovenDryLeaf,a.Ҷ����, a.ovenDryLeaf*100/a.Ҷ���� as [������%], c.[���]/10000 as ���m2,c.[sla] as [SLAm2/g], a.Ҷ���1,a.Ҷ���2,a.Ҷ���3, '����С��' as ������, b.[�ɼ�����] as ��������, a.���ֱ��
into gsla2021
from [sla-weight] a, gspecimen2021 b, sla c where SUBSTRING(a.���ֱ��,1,7)=b.�ɼ��� and a.���ֱ��=c.���ֱ�� 

select * from  gsla2021
select top 1 * from sla
select top 1 * from [sla-weight]
select top 1 * from 	[g-SLA-area2021]

select avg(a.Ҷ���1) from gsla2021 a  where SUBSTRING(a.���ֱ��,1,7)='x199179'

select aa.���ֱ��, avg(Ҷ���) as Ҷ���, avg([SLAm2/g]) as [SLAm2/g]
from (
select 
SUBSTRING(a.���ֱ��,1,7) as ���ֱ��,[SLAm2/g],
case when a.Ҷ���1 is null and a.Ҷ���2 is null and a.Ҷ���3 is null then null 
else 
 (isnull(a.Ҷ���1,0)+isnull(a.Ҷ���2,0)+isnull(a.Ҷ���3,0))/((case when a.Ҷ���1 is null then 0 else 1 end) + (case when a.Ҷ���2 is null then 0 else 1 end) + (case when a.Ҷ���3 is null then 0 else 1 end))
end
as Ҷ���
from gsla2021 a) aa
group by aa.���ֱ��


 select a.Ҷ���1+a.Ҷ���2,a.Ҷ���1+a.Ҷ���2 from gsla2021 a where SUBSTRING(a.���ֱ��,1,7)='X199038'

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
join gspecimenname2021 b on a.[�ɼ���]=b.[�걾��]

--update gSLA2021 set cnName=b.cnName, latinName=b.latinName from gSLA2021 a 
join gspecimenname2021 b on a.[�ɼ���]=b.[�걾��]

select * from gsla2021
select distinct(�ɼ���) from gsla2021

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


####����������Ʒ����
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



####����������������
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


---ѡ���ص���Ʒ����
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

-----ѡֲ����ֵ����غ�
select aa.cnname,bb.plotno from (
		select top 90 cnName, count(plotno) plotNoCount from
		(
			select distinct plotno, cnname from plot
		) a group by cnName order by plotNoCount desc
	)aa join 
	(
		select distinct plotno, cnname from plot
	) bb on aa.cnname=bb.cnName 


---����ţ�һ��������
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
---�������������
select * FROM AB order by autoid

select * from AB1 order by autoid


update ab set [����]=1 where [����] is null
update AB  set [��Ʒ����] = null where [��Ʒ����]=999
UPDATE AB SET [��Ʒ����] = [������] where  [��Ʒ����] is null
select * from AB where [��Ʒ����] is not null
select * from ABBag
update ABBag set [��С�ŷ�] = null where [��С�ŷ�] =999
update ABBag set [��С�ŷ����] = null where [��С�ŷ����] =999

select * from (
select a.autoID,a.[���ر��],a.EnvFlag,b.[���ŷ�] ,b.[���ŷ�] ,b.[��С�ŷ�],
case when a.EnvFlag = '��' then isnull(b.[���ŷ�] ,14.73)
when a.EnvFlag = '��' then b.[���ŷ�] 
when a.EnvFlag = 'С' then b.[С�ŷ�] 
when a.EnvFlag = '��С' then b.[��С�ŷ�] 
when a.EnvFlag = '��' then isnull(b.[������] ,34.59) else 0  end as xinfeng
from AB a join ABBagNew b on a.[���ر��]=b.[���ر��] collate chinese_prc_ci_as
--where ltrim(rtrim(a.[�ŷ���])) like  '%��%'
where  a.EnvFlag is not null
) aa where xinfeng is null order by autoid

select * from ABbag
update ABbag set [���ŷ�]=6.921 where [���ر��]='XJN060'

UPDATE AB SET [��Ʒ������] = ([��Ʒ����] - xinfeng) 
from AB join (
select a.autoID,a.[���ر��],a.EnvFlag,b.[���ŷ�] ,b.[���ŷ�] ,b.[��С�ŷ�],
case when a.EnvFlag = '��' then isnull(b.[���ŷ�] ,14.73)
when a.EnvFlag = '��' then b.[���ŷ�] 
when a.EnvFlag = 'С' then b.[С�ŷ�] 
when a.EnvFlag = '��С' then b.[��С�ŷ�] 
when a.EnvFlag = '��' then isnull(b.[������] ,34.59) else 0  end as xinfeng
from AB a join ABBag b on a.[���ر��]=b.[���ر��] collate chinese_prc_ci_as
--where ltrim(rtrim(a.[�ŷ���])) like  '%��%'
where  a.EnvFlag is not null
) aa on AB.autoId=aa.autoID

UPDATE AB SET [��Ʒ������] = ([�����] - xinfeng1) 
from AB join (
select a.autoID,a.[���ر��],a.EnvFlag,b.[���ŷ�] ,b.[���ŷ�] ,b.[��С�ŷ�],
case when a.EnvFlag = '��' then isnull(b.[���ŷ�] ,14.73)
when a.EnvFlag = '��' then b.[���ŷ�] 
when a.EnvFlag = 'С' then b.[С�ŷ����] 
when a.EnvFlag = '��С' then b.[��С�ŷ����] 
when a.EnvFlag = '��' then isnull(b.[������] ,34.59) else 0  end as xinfeng1
from AB a join ABBag b on a.[���ر��]=b.[���ر��] collate chinese_prc_ci_as
--where ltrim(rtrim(a.[�ŷ���])) like  '%��%'
where  a.EnvFlag is not null
) aa on AB.autoId=aa.autoID

UPDATE AB SET [�ܾ�����] = ([������] - xinfeng) / [ȡ����]
from AB join (
select a.autoID,a.[���ر��],a.EnvFlag,b.[���ŷ�] ,b.[���ŷ�] ,b.[��С�ŷ�],
case when a.EnvFlag = '��' then isnull(b.[���ŷ�] ,14.73)
when a.EnvFlag = '��' then b.[���ŷ�] 
when a.EnvFlag = 'С' then b.[С�ŷ�] 
when a.EnvFlag = '��С' then b.[��С�ŷ�] 
when a.EnvFlag = '��' then isnull(b.[������] ,34.59) else 0  end as xinfeng
from AB a join ABBag b on a.[���ر��]=b.[���ر��] collate chinese_prc_ci_as
--where ltrim(rtrim(a.[�ŷ���])) like  '%��%'
where  a.EnvFlag is not null
) aa on AB.autoId=aa.autoID
---

--�����
select * from BB order by autoid
select * from soilBBbag

select * from BB  where [�������] < 0
update BB set modi=[�������], [�������]=0.1 where [�������] < 0

select * from BB where [�������] = 0.1

update BB set modi�������=[�������], [�������]=0.07 where [�������] < 0

update BB set [�����(g)] = null where [�����(g)]=999

select * from BB where autoID not in (
select BB.autoID from BB 
join soilBBbag a on BB.[���ر��]=a.[���ر��] )

--update BB set [���ر��]='XJN121' where [���ر��]='XIN121'

update BB set [������]=[������(g)]-[��������]
from BB join soilBBbag a on BB.[���ر��]=a.[���ر��]
where BB.[��Ʒ��] not like '%��%'

update BB set [������]=[������(g)]-4.75
from BB join soilBBbag a on BB.[���ر��]=a.[���ر��]
where BB.[��Ʒ��] like '%��%'

update BB set [�������]=[�����(g)]-[��������]
from BB join soilBBbag a on BB.[���ر��]=a.[���ر��]
where BB.[��Ʒ��] not like '%��%'

update BB set [�������]=[�����(g)]-4.75
from BB join soilBBbag a on BB.[���ر��]=a.[���ر��]
where BB.[��Ʒ��] like '%��%'

update BB set [�������]=[�����(g)]-[���������]
from BB join soilBBbag a on BB.[���ر��]=a.[���ر��]
where BB.[��Ʒ��] not like '%��%'

update BB set [�������]=[�����(g)]-4.42
from BB join soilBBbag a on BB.[���ر��]=a.[���ر��]
where BB.[��Ʒ��] like '%��%'


--����������غ;������Ϊ0�͸�ֵ�ģ��滻Ϊ�����0.1, �����0.07
update




select * from soilBBbag

select * from BB join soilBBbag a on BB.[���ر��]=a.[���ر��]
where BB.[��Ʒ��] like '%��%'

select * from BB join soilBBbag a on BB.[���ر��]=a.[���ر��]
where BB.[��Ʒ��] not like '%��%'
select* from BB where [������] is null
select* from BB where [������] is not null
select* from BB where [�������] is null
select* from BB where [�������] is not null
---

---��������
select * from soil order by autoid
select * from soilBBBag

update soil set [�����] = null where [�����]=999

update soil set [��ʯ������]=[��ʯ����]-isnull(a.[��ʯ������],0)
from soil join soilBBbag a on soil.[���ر��]=a.[���ر��]

update soil set [��ʯ������]=0 from soil where [��ʯ����]=0

update soil set [������]=[������]-isnull(a.[����������],0)-isnull([��ʯ������],0)-isnull(BB.[������],isnull(BB.[�������],0))
from soil join soilBBbag a on soil.[���ر��]=a.[���ر��]
join BB on soil.[���ر��]=BB.[���ر��] and soil.[��Ʒ��]=BB.[��Ʒ��]

update soil set [�������]=[�����]-isnull([��ʯ������],0)-isnull(BB.[�������],isnull(BB.[������],0))
from soil join soilBBbag a on soil.[���ر��]=a.[���ر��]
join BB on soil.[���ر��]=BB.[���ر��] and soil.[��Ʒ��]=BB.[��Ʒ��]

update soil set [��ʯ������]=0.5 where [���ر��]='XJN111' and ([��Ʒ��]='3-a' or [��Ʒ��]='5-a')
select * from soil  where [���ر��]='XJN111'
select * from soil  where ��ʯ������ < 0

---

select * from [���زݱ�] order by autoid
select * from [���زݱ�] where latinName is null
select * from [���زݱ�] where cnname ='�½�޷��'
update [���زݱ�] set cnname ='�½�޷��' where cnname ='޷��'

select distinct (cnname) from [���زݱ�]
select distinct (latinname) from [���زݱ�]
select distinct (cnname) from [�걾]


update [���زݱ�]  set latinName  = b.latinName 
from [���زݱ�] a join [�걾] b on  a.cnName=b.cnName  collate chinese_prc_ci_as where a.latinname is null

select * from [���زݱ�] a join [�걾] b on  a.cnName=b.cnName  collate chinese_prc_ci_as where a.latinname is null

update [���زݱ�] set [��λ]='��' where [��λ] is null 

select * from [�걾] where cnName like '%��ë��%'
select distinct cnName from [���زݱ�] where latinName is null

update [���زݱ�] set cnName= b.cnNamecheck from [���زݱ�] a join [��������check] b on a.cnName=b.cnName collate chinese_prc_ci_as
where b.cnNamecheck is not null


select * 
from soil join soilBBbag a on soil.[���ر��]=a.[���ر��]

select * from [���ع�ľ]
delete [���ع�ľ] where autoid is null
update [���ع�ľ]  set latinName  = b.latinName from [���ع�ľ] a join [�걾] b on a.[���ر��]=b.[���غ�] collate chinese_prc_ci_as  and a.cnName=b.cnName  collate chinese_prc_ci_as


select * from environment
select * from [���زݱ�] order by autoid

select a.[��������] from [���زݱ�] a join environment b on a.[���ر��]=b.[���ر��] collate chinese_prc_ci_as

Update [���زݱ�] set [��������] = b.[��������] 
from [���زݱ�] a join environment b on a.[���ر��]=b.[���ر��] collate chinese_prc_ci_as

Update AB set [��������] = b.[��������] 
from AB a join environment b on a.[���ر��]=b.[���ر��] collate chinese_prc_ci_as

select * from AB order by autoid

select * from AB 
update AB set newCnName=[����]
update AB set newCnName = replace(newCnName,' ','')
update AB set newCnName = replace(newCnName,'��','-')

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
update  AB  set speciesSeq = left([����], len([����]) - len(newCnName))

select autoid, newCnName from AB where newCnName like '%[1-9]%'
select autoid, [����], newCnName from AB where [����] like '%��%'

select a.cnName from AB a 
join (
select distinct cnName, latinName from [���زݱ�] ) b on a.cnName=b.cnName collate chinese_prc_ci_as

update AB set latinName=b.latinName from AB a 
join (
select distinct cnName, latinName from [���زݱ�] ) b on a.cnName=b.cnName collate chinese_prc_ci_as

select distinct cnName from AB where latinName is null

update AB set cnName=cnName0

update AB set cnName=b.cnNamecheck from AB a join [��������check] b on a.cnName=b.cnName collate chinese_prc_ci_as
where b.cnNamecheck is not null

select * from soil
select * from soil2022



select * from environmentIndex
select * from environment
select * from plotDistribution
select * from arbor where plot in (select plot from environment where needle = 1)
select * from environment where needle = 1 order by plot


--�ݵ�ֲ������Ļ����в�ͬ��������
select * from environment
select * from plot
select plotno, count(distinct(cnname)) from plot group by plotno

select * from genvironment2021