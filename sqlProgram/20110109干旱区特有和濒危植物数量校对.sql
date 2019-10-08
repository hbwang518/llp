select * from M_Plant where xjEndangeredFlag is not null order by id
select * from M_Plant
----update M_Plant set xjEndangeredFlag=1 where id=52

计算新疆濒危植物的科和属数
select count(distinct(cnFamily)) from (select * from M_Plant where xjEndangeredFlag is not null) h
select count(distinct(cnGenus)) from (select * from M_Plant where xjEndangeredFlag is not null) h

select * from M_Plant where endemismFlag is not null
select count(distinct(cnGenus)) from (select * from M_Plant where endemismFlag is not null) h