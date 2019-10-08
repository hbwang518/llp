

select * from mclass
select * from NFCFXJ
select * from funcxj
select * from CCsun order by id

##publicationyear, kmeans
select publicationyear, count(id) from CCsun group by publicationyear order by publicationyear
select kmeans, count(id) from CCsun group by kmeans order by kmeans
select publicationyear, kmeans, count(id) from CCsun group by publicationyear, kmeans order by kmeans, publicationyear

##organization
select authoraffiliations1st, count(id) count from CCsun group by authoraffiliations1st order by count desc


##DocumentType&publicationType
select DocumentType, count(id) from CCsun group by DocumentType order by DocumentType
select PublicationType, count(id) from CCsun group by PublicationType order by PublicationType

select * from CCsun where publicationType = 's'

##times cites

select * from CCsun order by kmeans, timescited desc

select count (id) number, source from CCsun where kmeans = 1 group by source order by number desc
select count (id) number, source from CCsun where kmeans = 6 group by source order by number desc
select count (id) number, source from CCsun where kmeans = 12 group by source order by number desc
select count (id) number, source from CCsun where kmeans = 15 group by source order by number desc
select count (id) number, source from CCsun where kmeans = 22 group by source order by number desc
select count (id) number, source from CCsun where kmeans = 23 group by source order by number desc
select count (id) number, source from CCsun where kmeans = 26 group by source order by number desc
select count (id) number, source from CCsun where kmeans = 27 group by source order by number desc
select count (id) number, source from CCsun where kmeans = 28 group by source order by number desc


##source
select count (id) number, source from CCsun group by source order by number desc


B&R
select * from BRcountry
select region, count(*) from BRcountry group by region
select * from ccsun order by id
--update BRcountry set region=countryCHN where region is null

##match country##
select a.id, a.title, b.countryEN from CCsun a left join BRcountry b on a.title like CONCAT('%',b.countryEN,'%') order by b.countryEN

##count numbers in each country##
select count(distinct(a.id)), b.No, b.countryEN from CCsun a left join BRcountry b on a.title like CONCAT('%',b.countryEN,'%')
group by b.No, b.countryEN order by b.No

#count numbers in each region#
 select count(distinct(a.id)), b.region from CCsun a left join BRcountry b on a.title like CONCAT('%',b.countryEN,'%')
   group by b.region

#count numbers for each kmeans, i.e. classification#
 select a.kmeans, count(a.kmeans), b.region from CCsun a left join BRcountry b on a.title like CONCAT('%',b.countryEN,'%')
   group by b.region, a.kmeans

#see specific papers with title and kmeans# 
select a.id, a.title, a.kmeans, b.countryEN, b.region from CCsun a left join BRcountry b on a.title like CONCAT('%',b.countryEN,'%') where countryEN is not null order by a.kmeans, b.region
