#ԭ����txt�ļ������˵�sql
#20090602

select distinct m_plant.cnName from m_plant, AreaToCounty, plantOnlyCounty, m_area
where m_plant.ID=plantOnlyCounty.Plant_id and PlantOnlyCounty.county = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and m_area.area='����ɽ' and m_plant.id not in 
(
    select distinct m_plant.id from m_plant, AreaToCounty, plantOnlyCounty, m_area
where m_plant.ID=plantOnlyCounty.Plant_id and PlantOnlyCounty.county = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and plantOnlyCounty.county not in (select AreaToCounty.County_Code from AreaToCounty, m_area where areaToCounty.area_id=m_area.id and m_area.area='����ɽ')
)

select distinct m_plant.cnName from m_plant, AreaToCounty, plantOnlyCounty, m_area
where m_plant.ID=plantOnlyCounty.Plant_id and PlantOnlyCounty.county = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and m_area.area='����ɽ' and m_plant.id not in 
(
    select distinct m_plant.id from m_plant, AreaToCounty, plantOnlyCounty, m_area
where m_plant.ID=plantOnlyCounty.Plant_id and PlantOnlyCounty.county = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and plantOnlyCounty.county not in (select AreaToCounty.County_Code from AreaToCounty, m_area where areaToCounty.area_id=m_area.id and m_area.area='����ɽ')
)


select distinct m_animal.cnName from m_animal, AreaToCounty, animalCounty, m_area
where m_animal.ID>1000 and m_animal.ID=animalCounty.animal_id and animalCounty.distribution = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and m_area.area='��ɽ' and m_animal.id not in 
(
    select distinct m_animal.id from m_animal, AreaToCounty, animalCounty, m_area
where m_animal.ID=animalCounty.animal_id and animalCounty.distribution = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and animalCounty.distribution not in (select AreaToCounty.County_Code from AreaToCounty, m_area where areaToCounty.area_id=m_area.id and m_area.area='��ɽ')
)


select distinct m_animal.cnName from m_animal, AreaToCounty, animalCounty, m_area
where m_animal.ID>1000 and m_animal.ID=animalCounty.animal_id and animalCounty.distribution = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and m_area.area='����̩ɽ' and m_animal.id not in 
(
    select distinct m_animal.id from m_animal, AreaToCounty, animalCounty, m_area
where m_animal.ID=animalCounty.animal_id and animalCounty.distribution = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and animalCounty.distribution not in (select AreaToCounty.County_Code from AreaToCounty, m_area where areaToCounty.area_id=m_area.id and m_area.area='����̩ɽ')
)


select distinct m_animal.cnName from m_animal, AreaToCounty, animalCounty, m_area
where m_animal.ID<1000 and m_animal.ID=animalCounty.animal_id and animalCounty.distribution = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and m_area.area='��ɽ' and m_animal.id not in 
(
    select distinct m_animal.id from m_animal, AreaToCounty, animalCounty, m_area
where m_animal.ID=animalCounty.animal_id and animalCounty.distribution = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and animalCounty.distribution not in (select AreaToCounty.County_Code from AreaToCounty, m_area where areaToCounty.area_id=m_area.id and m_area.area='��ɽ')
)


select distinct m_animal.cnName from m_animal, AreaToCounty, animalCounty, m_area
where m_animal.ID<1000 and m_animal.ID=animalCounty.animal_id and animalCounty.distribution = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and m_area.area='����̩ɽ' and m_animal.id not in 
(
    select distinct m_animal.id from m_animal, AreaToCounty, animalCounty, m_area
where m_animal.ID=animalCounty.animal_id and animalCounty.distribution = areaToCounty.County_Code and areaToCounty.area_id=m_area.id
and animalCounty.distribution not in (select AreaToCounty.County_Code from AreaToCounty, m_area where areaToCounty.area_id=m_area.id and m_area.area='����̩ɽ')
)



select * from m_plant where cnname = '��Ҷ��'
select * from m_plant where cnname = 'ϲ��������é'
select * from m_plant where cnname = '����ˮ��֦'
select * from m_plant where cnname = '�����ճ�Ե��'
select * from m_plant where cnname = '��Ҷ����'
select * from m_plant where cnname = '��״������'
select * from m_plant where cnname = '������'
select * from m_plant where cnname = '����'
select * from m_plant where cnname = '����������ɼ'
select * from m_plant where cnname = '����������ɼ'
select * from m_plant where cnname = '�������Ǻ���'
select * from m_plant where cnname = '�½���κ'
select * from m_plant where cnname like '%��ĸ'
select * from m_plant where cnname like '%����'
select * from m_plant where cnname = '�½�Ұƻ��'
select * from m_plant where cnname = 'ӣ����'
select * from m_plant where cnname = 'ŷ�޳���'
select * from m_plant where cnfamily = '����' and xjendangeredflag = 1
select * from m_plant where cnfamily = '��޼��' and xjendangeredflag = 1
select * from m_plant where cnfamily = '���˿�' and xjendangeredflag = 1
select * from m_plant where xjendangeredflag = 1
select * from m_plant where cnname = '��ɽ��'
select * from m_plant where cnname = '��ɽ���ϲ�'
select * from m_plant where cnname = '������'
select * from m_plant where cnname like '%����%'
select * from m_plant where cnfamily = '޼��'
select * from m_plant where cnfamily = '�տ�'
select * from m_plant where cnfamily = '����'
select * from m_plant where cnfamily = '�̱���'



select * from m_animal where cnname = '��������'
select * from m_animal where cnname = '�ɼ�'
select * from m_animal where cnname = 'С����ľ��'
select * from m_animal where cnname = '�Ҹ���ȸ'
select * from m_animal where cnname = '�������'
select * from m_animal where cnname = '�����a'
select * from m_animal where cnname = '����'
select * from m_animal where cnname = '�ظ���ݺ'
select * from m_animal where endangeredflag=1
select * from m_animal where id<1000
select * from m_animal where cnname = '��β���^'
select * from m_animal where cnname = '��β黼�'
select * from m_animal where cnname = '������'
select * from m_animal where cnname = '�����^'
select * from m_animal where cnname = 'ȸӥ'

select * from m_animal where cnfamily = 'è��'
select * from m_animal where cnfamily = '�ÿ�'
select * from m_animal where cnfamily = '����'



#20090518
select * from arbor where originalarea is not null
select count(distinct(plotNo)) from environment
select distinct plot from arbor order by plot
select a.plotNo,a.plot,b.id from xinjiangPlot.dbo.environment a,M_grid b where a.longitude>b.lon and a.longitude<b.lon+0.1 and a.latitude>b.lat and a.latitude<b.lat+0.1



select distinct(plot) from shrubandgrass order by plot
select count(distinct(species)) from shrubandgrass where plot like 'QH%' 
select count(distinct(species)) from shrubandgrass where plot like 'AET%' 
select count(distinct(species)) from shrubandgrass where plot like 'FY%' 
select count(distinct(species)) from shrubandgrass where plot like 'XDG%' 
select count(distinct(species)) from shrubandgrass where plot like 'AKT%' 
select count(distinct(species)) from shrubandgrass where plot like 'YC%' 
select count(distinct(species)) from shrubandgrass where plot like 'DTS%' 
select count(distinct(species)) from shrubandgrass where plot like 'XTS%' 
select count(distinct(species)) from shrubandgrass where plot like 'TC%' 
select count(distinct(species)) from shrubandgrass where plot like 'WS%' 
select count(distinct(species)) from shrubandgrass where plot like 'DLC%' 
select count(distinct(species)) from shrubandgrass where plot like 'GL%' 
select count(distinct(species)) from shrubandgrass where plot like 'HC%' 
select count(distinct(species)) from shrubandgrass where plot like 'XY%' 

����ʦ------
select * from M_area where area like '��ɽ%'
select * from m_plant where culandwildflag =3
select * from nurbayAltitude
select * from multiAltitude

select * from plantcounty where distribution in 

(
	select distinct county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%') 
	union 
	select id from M_area where area like '��ɽ%'
)
	select distinct county_code from areatocounty where area_id in (select id from M_area where area = '��ɽ') 
        select distinct county_code from areatocounty where area_id in (select id from M_area where area = '����ɽ') and area_id in (select id from M_area where area = '��ɽ') 

select distinct(plant_id) from plantcounty where distribution in (select county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%'))

select distinct(plant_id) from plantcounty where distribution in (select id from M_area where area like '��ɽ%')

and plant_id not in (select distinct(plant_id) from plantcounty where distribution in (select county_code from areatocounty where area_id in (select id from M_area where area like '��ɽ%')))


select * from plantcounty order by plant_id

select * from m_county

select distinct plant_id, cnName, county 
into plantOnlyCount
from
(
    select plant_id, cnName, distribution as county from plantcounty where distribution in (select code from m_county)
    union
    select a.plant_id as plant_id, a.cnName as cnName, b.county_code as county from plantcounty a, areaToCounty b  where a.distribution not in (select code from m_county) and a.distribution = b.area_id 
) z

select * from areatocounty

select * from nurbayAltitude where plant_id in 
(
select plant_id from plantOnlyCount where county in (select county_code from areatocounty where area_id = 52 or area_id = 2)
)

select *  into szh from plantOnlyCounty where county in (select county_code from areatocounty where area_id = 52 or area_id = 2)
 
select a.* from szh a, m_plant b where a.plant_id=b.id and (b.culandwildflag =1 or b.culandwildflag =3)


����ʦ-----



select * from M_plant where endemismflag = 1 and typecode =3
select * from M_plant where endemismflag = 1 and typecode =1
select * from M_plant where endemismflag = 1 and typecode =2
select * from M_plant where endemismflag = 1 and typecode =2 and yearcode=3 
select * from M_plant where endemismflag = 1 order by cnname
select * from M_plant where halophilousflag = 1
select count(cnname) a, cnfamily from M_plant where halophilousflag = 1 group by cnfamily order by a
select count(distinct(cngenus)) a, cnfamily from M_plant where halophilousflag = 1 group by cnfamily order by a



select * from m_plant where cnname like '%��κ'
select * from m_animal where id >1000 and endangeredflag =1
select * from m_animal where id <1000 and endangeredflag =1
select * from M_plant where culandwildflag = 1 or culandwildflag=3
select * from M_plant where culandwildflag=3
select count(distinct(cnfamily)) from M_plant where culandwildflag=3
select count(distinct(cngenus)) from M_plant where culandwildflag=3





#�������ͳ��

#total new
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 
select count(distinct(cnGenusOri)) from m_plant where id<7000 and culandwildflag<>2 
select count(distinct(cnFamilyOri)) from m_plant where id<7000 and culandwildflag<>2


--men
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3
--year
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3

---type
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4)
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4)
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4)

---habitate
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=1 
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=3 
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=2 
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=1 
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=3
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=2 
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=1 
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=3 
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=2 

---total
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2


--------xjDan
--men
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and xjEndangeredflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and xjEndangeredflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and xjEndangeredflag=1
--year
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1 and xjEndangeredflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2 and xjEndangeredflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3 and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1 and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2 and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3 and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1 and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2 and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3 and xjEndangeredflag=1

---type
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3 and xjEndangeredflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1 and xjEndangeredflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4) and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3 and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1 and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4) and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3 and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1 and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4) and xjEndangeredflag=1

---habitate
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=1  and xjEndangeredflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=3  and xjEndangeredflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=2  and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=1  and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=3 and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=2  and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=1  and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=3  and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=2  and xjEndangeredflag=1

---total
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and xjEndangeredflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and xjEndangeredflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and xjEndangeredflag=1

select cnname from m_plant where id<7000 and culandwildflag=2 and xjEndangeredflag=1



--------endemism
--men
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and endemismflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and endemismflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and endemismflag=1
--year
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1 and endemismflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2 and endemismflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3 and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1 and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2 and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3 and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1 and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2 and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3 and endemismflag=1

---type
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3 and endemismflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1 and endemismflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4) and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3 and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1 and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4) and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3 and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1 and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4) and endemismflag=1

---habitate
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=1  and endemismflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=3  and endemismflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=2  and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=1  and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=3 and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=2  and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=1  and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=3  and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=2  and endemismflag=1

---total
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and endemismflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and endemismflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and endemismflag=1

select cnname from m_plant where id<7000 and culandwildflag=2 and endemismflag=1

--------ephemeral
--men
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and ephemeralflag is not null
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and ephemeralflag is not null
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and ephemeralflag is not null

select count(distinct(cngenus)) from m_plant where id<7000 and mencode=3 and ephemeralflag is not null
--year
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1 and ephemeralflag is not null
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2 and ephemeralflag is not null
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3 and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1 and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2 and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3 and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=1 and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=2 and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and yearcode=3 and ephemeralflag is not null

---type
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3 and ephemeralflag is not null
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1 and ephemeralflag is not null
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4) and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3 and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1 and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4) and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and typecode=3 and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and typecode=1 and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and (typecode=2 or typecode=4) and ephemeralflag is not null

---habitate
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=1  and ephemeralflag is not null
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=3  and ephemeralflag is not null
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=2  and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=1  and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=3 and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=2  and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=1  and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=3  and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=2  and ephemeralflag is not null

---total
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and ephemeralflag is not null
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and ephemeralflag is not null
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and ephemeralflag is not null

select cnname from m_plant where id<7000 and culandwildflag=2 and ephemeralflag is not null


--------halophilous
--men
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and halophilousflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and halophilousflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=1 and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=2 and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag<>2 and mencode=3 and halophilousflag=1

select cnname from m_plant where id<7000 and mencode=3 and halophilousflag=1 and culandwildflag=2 ---Ұţ�ݿ���Ϊ����

--year
select count(distinct(cnname)) from m_plant where id<7000  and yearcode=1 and halophilousflag=1
select count(distinct(cnname)) from m_plant where id<7000  and yearcode=2 and halophilousflag=1
select count(distinct(cnname)) from m_plant where id<7000  and yearcode=3 and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and yearcode=1 and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000  and yearcode=2 and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000  and yearcode=3 and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000  and yearcode=1 and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000  and yearcode=2 and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000  and yearcode=3 and halophilousflag=1

---type
select count(distinct(cnname)) from m_plant where id<7000  and typecode=3 and halophilousflag=1
select count(distinct(cnname)) from m_plant where id<7000 and typecode=1 and halophilousflag=1
select count(distinct(cnname)) from m_plant where id<7000 and (typecode=2 or typecode=4) and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and typecode=3 and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and typecode=1 and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and (typecode=2 or typecode=4) and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and typecode=3 and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and typecode=1 and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and (typecode=2 or typecode=4) and halophilousflag=1

select cnname from m_plant where id<7000 and culandwildflag<>2 and typecode=3 and halophilousflag=1

---habitate
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=1  and halophilousflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=3  and halophilousflag=1
select count(distinct(cnname)) from m_plant where id<7000 and culandwildflag=2  and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=1  and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=3 and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000 and culandwildflag=2  and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=1  and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=3  and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and culandwildflag=2  and halophilousflag=1

---total
select count(distinct(cnname)) from m_plant where id<7000  and halophilousflag=1
select count(distinct(cngenus)) from m_plant where id<7000  and halophilousflag=1
select count(distinct(cnfamily)) from m_plant where id<7000 and halophilousflag=1

----animal
select * from m_animal
select count(distinct(cnname)) from m_animal where id<1000 
select count(distinct(cnfamily)) from m_animal where id<1000 
select count(distinct(cnorder)) from m_animal where id<1000
select count(distinct(cnname)) from m_animal where id<1000  and endangeredflag=1
select count(distinct(cnfamily)) from m_animal where id<1000 and endangeredflag=1
select count(distinct(cnorder)) from m_animal where id<1000 and endangeredflag=1

select count(distinct(cnname)) from m_animal where id>1000 
select count(distinct(cnfamily)) from m_animal where id>1000 
select count(distinct(cnorder)) from m_animal where id>1000
select count(distinct(cnname)) from m_animal where id>1000  and endangeredflag=1
select count(distinct(cnfamily)) from m_animal where id>1000 and endangeredflag=1
select count(distinct(cnorder)) from m_animal where id>1000 and endangeredflag=1
