select * from veget where gridCode in
(

select gridCode from 
(
select a.* from veget a, 
(select max(area) area, gridcode from veget group by gridcode) b

where a.gridcode = b.gridcode and a.area = b.area
) w group by gridcode having count(auto_id) > 1
) order by gridCode

select distinct(gridcode) from veget

select * from veget group by gridcode

update m_grid set veget = w.veget from m_grid,
(
select a.* from veget a, 
(select max(area) area, gridcode from veget group by gridcode) b

where a.gridcode = b.gridcode and a.area = b.area
) w where m_grid.id = w.gridCode

select * from m_grid where id not in (select gridCode from veget)


update m_grid set vegettype=1 where veget >1 and veget <176
update m_grid set vegettype=2 where veget >175 and veget <265
update m_grid set vegettype=3 where veget >264 and veget <343
update m_grid set vegettype=4 where veget >342 and veget <547
update m_grid set vegettype=5 where veget >546 and veget <573
update m_grid set vegettype=0 where veget =573

