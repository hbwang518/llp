select province, region, sampling, avg(c1),avg(c7),avg(c8),avg(c13),avg(c14),avg(c15) from chemi
group by province, region, sampling order by province, region, sampling

select province, region, avg(c1),avg(c7),avg(c8),avg(c13),avg(c14),avg(c15) from chemi
group by province, region order by province, region

select province, avg(c1),avg(c7),avg(c8),avg(c13),avg(c14),avg(c15) from chemi
group by province order by province

select plotNo from climate order by plotNo

select province, region, sampling, avg(c1),avg(c7),avg(c8),avg(c13),avg(c14),avg(c15) from chemi
group by province, region, sampling order by sampling

(
select * from chemi where sampling is null
--delete chemi where id=167
--update chemi set id=id-1 where id > 167
)

select * from elem
select * from chemi
select * from climate
--update elem set province = a.province from elem, chemi a where a.region= elem.region

select province, region, avg(c1),avg(c7),avg(c8),avg(c13),avg(c14),avg(c15) from chemi
group by province, region order by region
