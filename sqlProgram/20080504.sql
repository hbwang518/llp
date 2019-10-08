--delete regiongrid where grid_id in (select distinct(a.grid_id) from regiongrid a, m_climate b where a.grid_id not in (select id from m_climate))  

select distinct(a.grid_id) from regiongrid a, m_climate b where a.grid_id not in (select id from m_climate)
select * from regiongrid

select count(grid_id) > 1 from regiongrid group by grid_id

select a.region, b.* from regiongrid a, m_climate b where a.grid_id = b.id
select a.region, avg(b.Alt), avg(b.mat), avg(b.map) from regiongrid a, m_climate b where a.grid_id = b.id group by region order by region

select distinct(grid_id) from regiongrid


select sum(area) a, id g from veg where veget >1 and veget <176 group by id order by id
select sum(area) b, id from veg where veget >175 and veget <265 group by id order by id
select sum(area) c, id from veg where veget >264 and veget <343 group by id order by id
select sum(area) d, id from veg where veget >342 and veget <547 group by id order by id
select sum(area) e, id from veg where veget >546 and veget <573 group by id order by id
select sum(area) f, id from veg where veget =573 group by id order by id


select count(id),new from regionstation group by new





