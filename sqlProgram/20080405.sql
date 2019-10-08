select count(*) from respt where alt <=1000
select count(*) from respt where alt > 1000 and alt <=1500
select count(*) from respt where alt > 1500 and alt <=2000
select count(*) from respt where alt > 2000 and alt <=3000
select count(*) from respt where alt > 3000 and alt <=4000
select count(*) from respt where alt > 4000 


--update landuse set classUnion = 1 where class > 10 and class < 20
--update landuse set classUnion = 2 where class > 20 and class < 30
--update landuse set classUnion = 3 where class > 30 and class < 40
--update landuse set classUnion = 3 where class > 40 and class < 50
--update landuse set classUnion = 5 where class > 50 and class < 60
--update landuse set classUnion = 6 where class > 60 and class < 70


--create index idIndex on landuse (id)
--update travelSpot set region = a.id , type = a.type from travelSpot, travel a where travelSpot.id= a.travelSpot
select count(*) from travelSpot where alt <=1000
select count(*) from travelSpot where alt > 1000 and alt <=1500
select count(*) from travelSpot where alt > 1500 and alt <=2000
select count(*) from travelSpot where alt > 2000 and alt <=3000
select count(*) from travelSpot where alt > 3000 and alt <=4000
select count(*) from travelSpot where alt > 4000 

--update landuse set classunion = class where classunion is null

select * from landuse where classunion = id

select * from landuse where classunion >100

--update landuse set classunion = 0 where classunion >100

select * from landuse where classunion >6

select FID_Clip from landuse group by fid_clip having count(FID_Clip)>1

--UPDATE landuse set id = id-1