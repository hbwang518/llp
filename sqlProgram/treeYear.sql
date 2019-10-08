select * from arbor where plotNo like '200709%' and treeNo = '6-9'

select * from arbor where plotNo = '20070731-2'and treeNo = '2-6'

select * from environment order by plotNo

--update arbor set treeYear = b.treeYear from arbor a, ArborYearChang b where a.plotNo = b.plotNo and a.treeNo =b.treeNo 
--update arborneedle set treeYear = b.treeYear from arborneedle a, ArborYearChang b where a.plotNo = b.plotNo and a.treeNo =b.treeNo 

select a.plotNo, a.treeNo, a.treeYear from arbor a, ArborYearChang b where a.plotNo = b.plotNo and a.treeNo =b.treeNo 

select * from arbor where treeYear is not null

select b.plotNo,b.treeNo, b.treeyear from ArborYearChang a, arbor b where a.plotNo = b.plotNo and a.treeNo =b.treeNo and b.treeyear is null and a.treeyear is not null

select * from ArborYearChang where treeyear is not null

select * from ArborYearChang where treeYear is not null and plotNo is not null and treeNo is not null 

select b.plotNo,b.treeNo, b.treeyear 
from ArborYearChang a, arbor b 
where a.plotNo = b.plotNo and a.treeNo =b.treeNo and a.treeyear is not null and a.plotNo is not null and a.treeNo is not null 

select * from Arbor where treeYear is not null



select b.plotNo,b.treeNo, b.treeyear 
from ArborYearChang a, arbor b 
where a.plotNo = b.plotNo and a.treeNo =b.treeNo and a.treeyear is not null and a.plotNo is not null and a.treeNo is not null 


select a.* from ArborYearChang a where a.autoid not in 
(select a.autoid 
from ArborYearChang a, arbor b 
where a.plotNo = b.plotNo and a.treeNo =b.treeNo and a.treeyear is not null and a.plotNo is not null and a.treeNo is not null 
) and  a.treeyear is not null and a.plotNo is not null and a.treeNo is not null 


select * from arborneedle where treeYear is not null

将年龄数据导出
select * into temp1 from arbor where treeYear is not null

select *  from arbor where treeYear is not null