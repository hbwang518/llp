select * from M_Plant where xjEndangeredFlag is not null order by id
select * from M_Plant
----update M_Plant set xjEndangeredFlag=1 where id=52

�����½���Σֲ��Ŀƺ�����
select count(distinct(cnFamily)) from (select * from M_Plant where xjEndangeredFlag is not null) h
select count(distinct(cnGenus)) from (select * from M_Plant where xjEndangeredFlag is not null) h

select * from M_Plant where endemismFlag is not null
select count(distinct(cnGenus)) from (select * from M_Plant where endemismFlag is not null) h