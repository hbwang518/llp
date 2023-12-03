##backup m_plant 
##select * into m_plant20191008 from m_plant    ----m_plant20191008: 4092 species the latest

##update m_plant, set cnname, latinname
select * from m_plant where id < 7000 order by id
select * from listPOWOs

select distinct(del) from m_plant 
select distinct(latinname) from m_plant 
select * from m_plant order by id
select * from m_plant where del = 0 order by id
select * from m_plant where id <> minid and id < 7000 order by id
select * from m_plant where del<>0 order by id

select * from m_plant where del=0 and id < 7000 order by id
select * from m_plant where id = minid order by id
select * from m_plant where del=0 and id <> minid order by id

select * from m_plant order by del

select * from m_plant where id <> minid or del<> 0
select * from m_plant where id = minid and id < 7000 order by id
select * from m_plant where id = minid and id < 7000 order by id

--del=0 与id=minid一样
select * from m_plant where del=0 and id < 7000 and (culandwildflag =1 or culandwildflag=3) order by id
select * from m_plant where id = minid and id < 7000 and (culandwildflag =2) order by id
select * from m_plant where id < 7000 and (culandwildflag =1 or culandwildflag=3) order by id

select id, cnname, latinname, cnfamilyOri cnfamily, latinfamilyori latinfamily, speciesflag, menclass, yearflag, typeflag, habitate, lowAltitude, highAltitude, RA, extentWE, extentNS from m_plant where id = minid and id < 7000 and (culandwildflag =1 or culandwildflag=3) order by id



select * from m_plant order by culandwildflag desc, id

select a.id, a.latinName, b.latinName from m_plant a, listPOWOs b where a.id=b.id and a.latinName<>b.latinName
select a.id, a.cnName, b.cnName from m_plant a, listPOWOs b where a.id=b.id and a.cnName<>b.cnName

--update m_plant set cnName=b.cnName, latinName=b.latinName from m_plant a, listPOWOs b where a.id=b.id


## 更新minid
--update m_plant set minid=b.minid from m_plant a, 
(select min(id) minid, latinName from m_plant group by latinName) b
where a.latinname =b.latinname

select id, minid, cnname, latinname, lowaltitude, highaltitude from m_plant where id <> minid   --322名字更新前    --318名字更新后
select id, minid, cnname, latinname, lowaltitude, highaltitude,lowaltitudeORI, highaltitudeORI, heightminF,RA from m_plant where minid in 
(select minid from m_plant group by minid having count(*) > 1 ) order by minid    ---553    --546名字更新后


##更新重复名字植物为删除
select * from m_plant where del<>0   
select * from m_plant where id=minid and del<>0
--update m_plant set del=2 where id<>minid
select * from m_plant where del<>0 

--更新海拔和株高：仅更新del=0物种，del<>0物种未更新
-- 4092  --546 --3532 --4078
update m_plant set lowAltitude=null  -4092
select id, lowAltitudeori from m_plant where id in (select minid from m_plant group by minid having count(*) = 1)  --3532

--update m_plant set lowAltitude = lowAltitudeOri where id in (select minid from m_plant group by minid having count(*) = 1)  --3532


select a.id, a.lowAltitude, b.lowAltitudeOri from m_plant a,
(select minid, min(lowAltitudeOri) as lowAltitudeOri from m_plant where lowAltitudeOri > -4000 and lowAltitude is null and id < 7000  group by minid) b
where a.id=b.minid and a.del=0 and lowAltitude is null --133

update m_plant set lowAltitude=b.lowAltitudeOri from m_plant a,
(select minid, min(lowAltitudeOri) as lowAltitudeOri from m_plant where lowAltitudeOri > -4000 and lowAltitude is null and id < 7000  group by minid) b
where a.id=b.minid and a.del=0 and lowAltitude is null --133

--4092-3532-133-
select a.id, a.minid, a.lowAltitude, b.lowAltitudeOri from m_plant a,
(select minid, min(lowAltitudeOri) as lowAltitudeOri from m_plant where lowAltitudeOri < -4000 and lowAltitude is null and id < 7000  group by minid) b
where a.id=b.minid  and a.lowAltitude is null


select * from m_plant where lowAltitude is null and del=0 and id < 7000 and lowAltitudeOri < -10000

update m_plant set lowAltitude=-10050 where lowAltitude is null and del=0 and id < 7000 and lowAltitudeOri < -10000

--highAltitude
update m_plant set highAltitude=null  -4092
select id, highAltitude from m_plant where id in (select minid from m_plant group by minid having count(*) = 1)  --3532
--update m_plant set highAltitude = highAltitudeOri where id in (select minid from m_plant group by minid having count(*) = 1)  --3532

select a.id, a.highAltitude, b.highAltitudeOri from m_plant a,
(select minid, max(highAltitudeOri) as highAltitudeOri from m_plant where highAltitudeOri > -4000 and highAltitude is null and id < 7000  group by minid) b
where a.id=b.minid and a.del=0 and highAltitude is null --186

update m_plant set highAltitude =b.highAltitudeOri from m_plant a,
(select minid, max(highAltitudeOri) as highAltitudeOri from m_plant where highAltitudeOri > -4000 and highAltitude is null and id < 7000  group by minid) b
where a.id=b.minid and a.del=0 and highAltitude is null --186

--4092-3532-133-
select a.id, a.minid, a.highAltitude, b.highAltitudeOri from m_plant a,
(select minid, min(highAltitudeOri) as highAltitudeOri from m_plant where highAltitudeOri < -4000 and lowAltitude is null and id < 7000  group by minid) b
where a.id=b.minid  and a.highAltitude is null


select * from m_plant where highAltitude is null and del=0 and id < 7000 and highAltitudeOri < -9000

update m_plant set highAltitude =-9950 where highAltitude is null and del=0 and id < 7000 and highAltitudeOri < -9000  -42

select * from m_plant where highAltitude is not null

select * from m_plant where highAltitude <> highAltitudeOri
select * from m_plant where lowAltitude is null and del =0

select id, minid, highAltitude, highAltitudeOri from m_plant where minid in (select minid from m_plant where highAltitude <> highAltitudeOri)
order by minid,id

select id, minid, lowAltitude, lowAltitudeOri from m_plant where minid in (select minid from m_plant where lowAltitude <> lowAltitudeOri)
order by minid,id
--heightMaxF
select id, minid, heightmaxF, heightmaxFOri from m_plant

update m_plant set heightmaxF =null  -4092
select id, heightmaxF from m_plant where id in (select minid from m_plant group by minid having count(*) = 1)  --3532
--update m_plant set heightmaxF = heightmaxFOri where id in (select minid from m_plant group by minid having count(*) = 1)  --3532

select a.id, a.heightmaxF, b.heightmaxFOri from m_plant a,
(select minid, max(heightmaxFOri) as heightmaxFOri from m_plant where heightmaxF is null and id < 7000  group by minid having max(heightmaxFOri) is not null ) b
where a.id=b.minid and a.del=0 and heightmaxF is null --201

update m_plant set heightmaxF =b.heightmaxFOri from m_plant a,
(select minid, max(heightmaxFOri) as heightmaxFOri from m_plant where heightmaxF is null and id < 7000  group by minid having max(heightmaxFOri) is not null) b
where a.id=b.minid and a.del=0 and heightmaxF is null--201


select * from m_plant where heightmaxF is null and del=0 and heightmaxF is not null

select id, minid, heightmaxF, heightmaxFOri from m_plant where minid in (select minid from m_plant where heightmaxF <> heightmaxFOri)
order by minid,id

--heightMeanF
select id, minid, heightmeanF, heightMeanFOri from m_plant

update m_plant set heightMeanF =null  --4092
select id, heightMeanF from m_plant where id in (select minid from m_plant group by minid having count(*) = 1)  --3532
--update m_plant set heightMeanF = heightMeanFOri where id in (select minid from m_plant group by minid having count(*) = 1)  --3532

select a.id, a.heightMeanF, b.heightMeanFOri from m_plant a,
(select minid, max(heightMeanFOri) as heightMeanFOri from m_plant where heightMeanF is null and id < 7000  group by minid having max(heightMeanFOri) is not null ) b
where a.id=b.minid and a.del=0 and heightMeanF is null --205

update m_plant set heightMeanF =b.heightMeanFOri from m_plant a,
(select minid, max(heightMeanFOri) as heightMeanFOri from m_plant where heightMeanF is null and id < 7000  group by minid having max(heightMeanFOri) is not null) b
where a.id=b.minid and a.del=0 and heightMeanF is null--205


select * from m_plant where heightMeanF is null and del=0 and heightMeanF is not null

select id, minid, heightMeanF, heightMeanFOri from m_plant where minid in (select minid from m_plant where heightMeanF <> heightMeanFOri)
order by minid,id

--heightMinF
select id, minid, heightminF, heightminFOri from m_plant

--update m_plant set heightminF =null  --4092
select id, heightminF from m_plant where id in (select minid from m_plant group by minid having count(*) = 1)  --3532
--update m_plant set heightminF = heightminFOri where id in (select minid from m_plant group by minid having count(*) = 1)  --3532

select a.id, a.heightminF, b.heightminFOri from m_plant a,
(select minid, min(heightminFOri) as heightminFOri from m_plant where heightminF is null and id < 7000  group by minid having min(heightminFOri) is not null ) b
where a.id=b.minid and a.del=0 and heightminF is null --200

update m_plant set heightminF =b.heightminFOri from m_plant a,
(select minid, min(heightminFOri) as heightminFOri from m_plant where heightminF is null and id < 7000  group by minid having min(heightminFOri) is not null) b
where a.id=b.minid and a.del=0 and heightminF is null--200


select * from m_plant where heightminF is null and del=0 and heightminF is not null

select id, minid, heightminF, heightminFOri from m_plant where minid in (select minid from m_plant where heightminF <> heightminFOri)
order by minid,id


select * from m_plant where del = 0 and id<7000 and (culAndWildFlag = 1 or culAndWildFlag = 3)

select * from m_grid
select * from gridrszhang

select aa.id from
(select a.id from m_grid a left join gridrszhang b on a.id=b.gridid) aa
group by id
having count(*)>1

select a.*, b.* from m_grid a left join gridrszhang b on a.id=b.gridid order by a.id

select * from allType
select * from m_plant
select * from m_plant where del=0 and (culandwildflag = 1 or culandwildflag = 3) and id<7000  --3352
select * from m_plant where del=0 and (culandwildflag = 1) and id<7000  --3295 √ 陆生
select * from m_plant where del=0 and culandwildflag = 3 and id<7000  --57 水生

select * from mMGrid
select * from plantbsxj_grid  --this table is only for the environmental variables
select top 100 * from plantCountyAltitudeValidResultDistinct
lat	lon	lastregion	MB	Alt	AltRange	SoilPH	vegetType	MAT	GST	MTCM	MTWM	ABT	WI	CI	MAP	GSP	PET	AET	WD	Im	aridity	temp.sea	precip.sea	dhi_cum_ym	evi_ym	ndvi_ym

#陆生, 非栽培
select a.id, Convert(decimal(18,2),avg(c.lat)) lat, Convert(decimal(18,2),avg(c.lon)) lon, Convert(decimal(18,0),avg(c.alt)) alt, 
	Convert(decimal(18,0),avg(c.AltRange)) AltRange, Convert(decimal(18,1),avg(c.SoilPH)) SoilPH, Convert(decimal(18,1),avg(c.MAT)) MAT,
	Convert(decimal(18,1),avg(c.GST)) GST, Convert(decimal(18,1),avg(c.MTCM)) MTCM, Convert(decimal(18,1),avg(c.MTWM)) MTWM, 
	Convert(decimal(18,1),avg(c.ABT)) ABT, Convert(decimal(18,1),avg(c.WI)) WI, Convert(decimal(18,0),avg(c.CI)) CI, 
	Convert(decimal(18,0),avg(c.MAP)) MAP, Convert(decimal(18,0),avg(c.GSP)) GSP, Convert(decimal(18,0),avg(c.PET)) PET, 
	Convert(decimal(18,0),avg(c.AET)) AET, Convert(decimal(18,0),avg(c.WD)) WD, Convert(decimal(18,1),avg(c.Im)) Im, 
	Convert(decimal(18,0),avg(c.aridity)) aridity, Convert(decimal(18,2),avg(c.temp_sea)) temp_sea, Convert(decimal(18,2),avg(c.precip_sea)) precip_sea, 
	Convert(decimal(18,4),avg(c.dhi_cum_ym)) dhi_cum_ym, Convert(decimal(18,4),avg(c.evi_ym)) evi_ym, Convert(decimal(18,4),avg(c.ndvi_ym)) ndvi_ym
	from m_plant a 
    left join plantCountyAltitudeValidResultDistinct b on a.id=b.plant_id
    left join plantbsxj_grid c on b.id=c.id
    where a.del=0 and a.culandwildflag = 1 and a.id<7000
	group by a.id
    order by a.id

#水生, all null; also cultivated, all null

select a.id, Convert(decimal(18,2),avg(c.lat)) lat, Convert(decimal(18,2),avg(c.lon)) lon, Convert(decimal(18,0),avg(c.alt)) alt, 
	Convert(decimal(18,0),avg(c.AltRange)) AltRange, Convert(decimal(18,1),avg(c.SoilPH)) SoilPH, Convert(decimal(18,1),avg(c.MAT)) MAT,
	Convert(decimal(18,1),avg(c.GST)) GST, Convert(decimal(18,1),avg(c.MTCM)) MTCM, Convert(decimal(18,1),avg(c.MTWM)) MTWM, 
	Convert(decimal(18,1),avg(c.ABT)) ABT, Convert(decimal(18,1),avg(c.WI)) WI, Convert(decimal(18,0),avg(c.CI)) CI, 
	Convert(decimal(18,0),avg(c.MAP)) MAP, Convert(decimal(18,0),avg(c.GSP)) GSP, Convert(decimal(18,0),avg(c.PET)) PET, 
	Convert(decimal(18,0),avg(c.AET)) AET, Convert(decimal(18,0),avg(c.WD)) WD, Convert(decimal(18,1),avg(c.Im)) Im, 
	Convert(decimal(18,0),avg(c.aridity)) aridity, Convert(decimal(18,2),avg(c.temp_sea)) temp_sea, Convert(decimal(18,2),avg(c.precip_sea)) precip_sea, 
	Convert(decimal(18,4),avg(c.dhi_cum_ym)) dhi_cum_ym, Convert(decimal(18,4),avg(c.evi_ym)) evi_ym, Convert(decimal(18,4),avg(c.ndvi_ym)) ndvi_ym
	from m_plant a 
    left join plantCountyAltitudeValidResultDistinct b on a.id=b.plant_id
    left join plantbsxj_grid c on b.id=c.id
    where a.del=0 and a.culandwildflag = 3 and a.id<7000
	group by a.id
    order by a.id

#animal
select * from m_animal where del=0
select top 100 * from AnimalCountyAltitudeValidResult
select a.id, Convert(decimal(18,2),avg(c.lat)) lat, Convert(decimal(18,2),avg(c.lon)) lon, Convert(decimal(18,0),avg(c.alt)) alt, 
	Convert(decimal(18,0),avg(c.AltRange)) AltRange, Convert(decimal(18,1),avg(c.SoilPH)) SoilPH, Convert(decimal(18,1),avg(c.MAT)) MAT,
	Convert(decimal(18,1),avg(c.GST)) GST, Convert(decimal(18,1),avg(c.MTCM)) MTCM, Convert(decimal(18,1),avg(c.MTWM)) MTWM, 
	Convert(decimal(18,1),avg(c.ABT)) ABT, Convert(decimal(18,1),avg(c.WI)) WI, Convert(decimal(18,0),avg(c.CI)) CI, 
	Convert(decimal(18,0),avg(c.MAP)) MAP, Convert(decimal(18,0),avg(c.GSP)) GSP, Convert(decimal(18,0),avg(c.PET)) PET, 
	Convert(decimal(18,0),avg(c.AET)) AET, Convert(decimal(18,0),avg(c.WD)) WD, Convert(decimal(18,1),avg(c.Im)) Im, 
	Convert(decimal(18,0),avg(c.aridity)) aridity, Convert(decimal(18,2),avg(c.temp_sea)) temp_sea, Convert(decimal(18,2),avg(c.precip_sea)) precip_sea, 
	Convert(decimal(18,4),avg(c.dhi_cum_ym)) dhi_cum_ym, Convert(decimal(18,4),avg(c.evi_ym)) evi_ym, Convert(decimal(18,4),avg(c.ndvi_ym)) ndvi_ym
	from m_animal a 
    left join AnimalCountyAltitudeValidResult b on a.id=b.animal_id
    left join plantbsxj_grid c on b.id=c.id
    where a.del=0
	group by a.id
    order by a.id


select * from m_plant a, listPOWOs b where (a.endangeredFlag is not null or a.xjendangeredFlag is not null or a.endemismFlag is not null) and a.id in (
select id from m_plantTianshan) and a.id=b.id

select * from listPOWOS

select * from m_plant a, listPOWOs b where (a.endangeredFlag is not null or a.xjendangeredFlag is not null or a.endemismFlag is not null) and a.id=b.id and a.del =0 order by a.id


select distinct(del) from m_plant 


**songfeng
select * from woodyxjSF
select * from distinctplantCounty
select * from m_county

select * from distinctplantCounty a, m_county b where a.plant_id in (select id from woodyxjSF) and a.county_code= b.code order by a.plant_id

select * from plantCountyAltitudeValidResultDistinct a where a.plant_id in (select id from woodyxjSF) order by a.plant_id





select * from plantxjworlddistribution
select * from plantbodysize
select * from animalbs
select * from m_plant
select * from m_animal
select * from plantbsxj_grid
select * from plantgridrange
select * from woodyxjsf



select * from alltype

select * from a2

SELECT
     name, object_id, create_date, modify_date
FROM
     sys.tables
	 order by modify_date


SELECT * FROM plantbsxj_grid

select * from plantbodysize
select * from alltype

select * from m_plant where del = 0 and (culandwildflag =1 or  culandwildflag =3) and typecode = 1

select * from m_plant where del = 0 and (heightmeanF is not null or heightmaxF is not null or heightminF is not null)

select * from m_plant where del = 0 and heightmeanF is not null and typecode = 2



select * from plantCountyAltitudeValidResultDistinct
      
      select * from m_plant
      select * from listpowos 
	  select * from m_plant a, listpowos b where a.id=b.id order by a.id
  
  