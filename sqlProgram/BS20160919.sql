select * from plantcounty where plant_id < 7000 order by plant_id 
select * from gridspecies
select * from namechange
select * from plantonlycounty
select * from m_plant
select * from medi.dbo.plantxj
select * from plantgridrange

select a.* FROM m_plant a, medi.dbo.plantxj b where a.cnName = b.cnName or a.latinName = b.latinName

//比较m_plant a和medi.dbo.plantxj数据,说明medi.dbo.plantxj的latinName有重复
select a.* FROM m_plant a, medi.dbo.plantxj b 
where (a.cnName = b.cnName or a.latinName = b.latinName) and a.del < 1
select a.* FROM m_plant a, medi.dbo.plantxj b 
where (a.cnName = b.cnName) and a.del < 1
select a.* FROM m_plant a, medi.dbo.plantxj b 
where (a.latinName = b.latinName) and a.del < 1


select a.* from m_plant a where id in (
	select a.id FROM m_plant a, medi.dbo.plantxj b 
	where /*a.cnName = b.cnName or*/ a.latinName = b.latinName
	group by a.id having count(*) > 1
)
order by latinname

select a.* from m_plant a where latinName in (
	select a.latinName FROM m_plant a
	group by a.latinName having count(*) > 1
)

select * FROM m_plant where latinName like 'Sium%'

select * FROM m_plant where culandwildflag=1 and del=0 and id<7000
select * from PlantGridRange order by plant_id;
select * from _phd_PlantGridRange  order by plant_id
select * from grid_gridscope
select * from  _PHD_Grid_GridScope
select * from plantGridExtremum order by plant_id, grid_id
select * from plantGridExtremum where grid_id = 11923
select * from plantlonlat order by plant_id
select * from _PHD_plantlonlat order by plant_id

select * from m_grid order by id
select * from regiongrid

select * from PlantGridRange where plant_id not in (
    select a.plant_id from PlantGridRange a, _PHD_PlantGridRange b 
    where a.plant_id=b.plant_id and a.LonMedian=b.lonMedian
) order by plant_id

select * from _PHD_PlantGridRange where plant_id not in (
    select b.plant_id from PlantGridRange a, _PHD_PlantGridRange b 
    where a.plant_id=b.plant_id and a.LonMedian=b.lonMedian
) order by plant_id

select * from altadd where lowaltitude is not null





##说明:

##表plantLonlat: GridCount列为物种的range area, 用于做频度分布图(原始数据及对数化后), 图1.

##表plantGridExtremum: 每个植物所占的栅格的编号, 及该栅格在整个地图中的位置.

##表PlantGridRange: 每个植物种的东西南北分布的最边界的栅格, 及计算出的东西和南北的分布幅度, 频度分布图3, 含原始及对数化后.

##表Grid_GridScope: GridSpeciesSkewness为栅格的物种偏度系数, 图2; 
                    GridCountMedian为栅格内有分布的所有物种的分布区面积的中值, 图5;
                    GridCountMin为栅格内有分布的所有物种的分布区面积的最小值, 图5;
                    GridHorizonRangeMedian, GridVerticalRangeMedian为栅格内有分布的所有物种的分布区幅度的中值, 
					
					
select top 100 * from plantlonlat order by plant_id
select top 100 * from plantGridExtremum order by plant_id
select top 100 * from PlantGridRange order by plant_id
select top 100 * from Grid_GridScope					

select * from grid02
select * from gridspecies01
select * from gridspecies02

					
## 为什么plantLonlat中所存的经纬度未保留小数

select a.id, avg(b.GridCount) meanGridCount, Count(*) plantCount
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.plant_id 
group by a.id
order by a.id

select top 10 a.id, a.plant_id, b.GridCount--, Count(*) plantCount
from plantCountyAltitudeValidResultDistinct a, PlantLonLat b
where a.plant_id=b.plant_id 
--group by a.id
order by a.id

select * from PlantLonLat
select * from PlantGridRange where HorizonRange=0 or VerticalRange=0

##
select * from countyreplacepiaotoli
select * from namechange

##
select * from plotplant order by id
select * from shrubandgrass
select * from xinjiangplot order by id
select * from plantbodysize order by id

select * from grasslandbiomass
select * from grasslandenvironment
select * from grasslandplantcorrect
select * from grasslandplantlist
select * from grasslandplot



##草本植物未收集到海拔的较少, 而木本植物多于一半未收集到海拔.
select * from plantxj where typecode <> 2 order by lowaltitude
select * from plantxj where typecode = 2 order by lowaltitude



select * from birdfuncdat
select * from m_animal
select * from animalCounty
select top 1 * from animalcountyaltituderesult
select top 1 * from animalcountyaltitudevalidresult


