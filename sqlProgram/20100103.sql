use SpeciesRichnessXinJiang
--选择County是空的植物
select * from m_plant where id in (select plant_id from distinctPlantCounty where county_code is null)



select distinct id, plant_id, county_code from plantCountyAltitudeValidResult
 

select top 1 * from plantCountyAltitudeValidResult


select * from Grid_GridScope where GridCountMedian > 2 order by Grid_id

select top 350 sum(gridCount) from plantLonLat order by gridCount

select GridCount, Plant_Id from plantLonLat order by gridCount desc