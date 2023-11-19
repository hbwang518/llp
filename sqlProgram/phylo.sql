select * from m_plant
select * from sheet2
select b.cnName2 from m_plant a join Sheet2 b on a.id=b.id

alter table m_plant add  latinGenus2   nvarchar(255) NULL
alter table m_plant add  cnGenus2   nvarchar(255) NULL
alter table m_plant add  species2   nvarchar(255) NULL
alter table m_plant add  cnOrder2   nvarchar(255) NULL
alter table m_plant add  latinOrder2   nvarchar(255) NULL
alter table m_plant add  latinClass2   nvarchar(255) NULL
alter table m_plant add  cnClass2   nvarchar(255) NULL

update m_plant set cnName2=b.cnName2,
latinName2=b.latinName2,
latinGenus2=b.latinGenus2,
cnGenus2=b.cnGenus2,
species2=b.species2,
cnOrder2=b.cnOrder2,
latinOrder2=b.latinOrder2,
latinClass2=b.latinClass2,
cnClass2=b.cnClass2
from m_plant a join Sheet2 b on a.id=b.id

update m_plant set cnName2 = null where cnName2='NA'
update m_plant set latinName2 = null where latinName2='NA'
update m_plant set latinGenus2 = null where latinGenus2='NA'
update m_plant set cnGenus2 = null where cnGenus2='NA'
update m_plant set species2 = null where species2='NA'
update m_plant set cnOrder2 = null where cnOrder2='NA'
update m_plant set latinOrder2 = null where latinOrder2='NA'
update m_plant set cnClass2 = null where cnClass2='NA'