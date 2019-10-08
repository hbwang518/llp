use speciesRichnessXinJIang

select * from cover02

select a.id, a.ADcode99 into Grid02 from cover02 a,
(
select id, max(area) area from cover02
group by id
) z

where a.id=z.id and a.area=z.area

select distinct id from cover02

select * from dem02

update dem02 set county = b.ADcode99 from dem02 a, Grid02 b where a.Id=b.Id

select * from Grid02 where id not in (select id from dem02)

select * from dem02



