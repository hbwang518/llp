#########������������
##��ϸ��������detailSpecies=1,�ᵽ����detailSpecies=2,����listQin20150428,����mediInfo�����,���������ͳ��.
#��֤��������������Ƿ�ͳһ
select * from mediInfo where id not in (
select id from mediInfo where latinName in (
select latinName from listqin20150428) and cnName in (select cnName from listqin20150428))
and (detailSpecies =1 or detailSpecies=2)

select * from mediInfo where detailSpecies=1 and (cnName in 
(select cnName from listqin20150428 where detailSpecies=1)
or latinName in (select latinName from listqin20150428 where detailSpecies=1))

select * from mediInfo where detailSpecies=2 and (cnName in 
(select cnName from listqin20150428 where detailSpecies=2)
or latinName in (select latinName from listqin20150428 where detailSpecies=2))

select * from mediInfo where id not in (
select id from mediInfo where detailSpecies=1 and 
cnName in (select cnName from listqin20150428 where detailSpecies = 1)
) and detailSpecies=1

select * from mediInfo where id not in (
select id from mediInfo where detailSpecies=1 and 
latinName in (select latinName from listqin20150428 where detailSpecies = 1)
) and detailSpecies=1


##ȫ������������ϸ������
select count(distinct(cnName)) species,
count(distinct(cnFamily)) Family,
count(distinct(cnGenus)) Genus 
from listqin20150428 
where detailSpecies = 1 or detailSpecies = 2

select count(distinct(cnName)) species,
count(distinct(cnFamily)) Family,
count(distinct(cnGenus)) Genus 
from listqin20150428 
where detailSpecies = 1 


##���ձ�Σ����,ͳ�ƿ�������
select endanStatus, count(distinct(cnName)) species,
count(distinct(cnGenus)) Genus,
count(distinct(cnFamily)) Family
from mediInfo 
where detailSpecies = 1 
group by endanStatus


##����������
#ÿ����������������
select ecoType2, count(distinct(cnName)) species,
count(distinct(cnGenus)) Genus,
count(distinct(cnFamily)) Family
from mediInfo 
where detailSpecies = 1 
group by ecoType2

#���ձ�Σ�����������ͳ��,���ǹ����
select endanStatus, ecoType2, count(ecotype2) 
from mediInfo where detailSpecies = 1 
group by endanStatus, ecoType2


##�����Ƿ�����
#��������,�������кͷ�����
select '����', count(distinct(cnName))cnName, 
count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where detailSpecies = 1 and endem = 1;
select '������', count(distinct(cnName))cnName, 
count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily  
from mediInfo where detailSpecies = 1 and endem = 0;

#���ձ�Σ��������м�������������
select endanStatus, endem, count(endem) from mediInfo 
where detailSpecies = 1 group by endanStatus, endem

#�������������ձ�Σ����
select endanStatus, count(distinct(cnName)) species,
count(distinct(cnGenus)) Genus,
count(distinct(cnFamily)) Family
from mediInfo 
where detailSpecies = 1 and endem=1
group by endanStatus 


##��������
#ÿ��������������
select habitat, count(habitat) from mediInfo 
where detailSpecies = 1 group by habitat

#���ձ�Σ����ͳ��ÿ��������������
select endanStatus, habitat, count(habitat) from mediInfo 
where detailSpecies = 1 group by endanStatus, habitat


######ҩ����ص�����
####ҩζ
##��ͬҩζ���ֿ�������
select '��', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and flavour like '%��%';
select '��', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and flavour like '%��%';
select '��', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and flavour like '%��%';
select '��', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and flavour like '%��%';
select '��', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and flavour like '%��%';

##��ͬ��Σ�ȼ�ҩζ��������  #number of species = flavor
select endanstatus, count(flavour) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where flavour like '%��%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(flavour) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where flavour like '%��%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(flavour) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where flavour like '%��%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(flavour) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where flavour like '%��%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(flavour) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where flavour like '%��%' and detailSpecies = 1 group by endanstatus

####ҩ��
##��ͬҩ�����ֿ�������
select distinct(property) from mediInfo   ##ȷ���ļ���ҩ��##
select '��', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and property like '%��%';
select '��', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and property like '%��%';
select 'ƽ', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and property like '%ƽ%';
select '��', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and property like '%��%';
select '��', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and property like '%��%';

##��ͬ��Σ�ȼ�ҩ�Ե�������
select endanstatus, count(property) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where property like '%��%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(property) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where property like '%��%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(property) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where property like '%ƽ%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(property) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where property like '%��%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(property) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where property like '%��%' and detailSpecies = 1 group by endanstatus


####��ͬҩ�ò�λ���ֿ�������
##��ͬҩ�ò�λ���ֿ�������
select distinct(mediPart) from mediInfo   ##ȷ���ļ���ҩ�ò�λ##
select '11', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%11%';
select '12', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%12%';
select '13', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%13%';
select '14', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%14%';
select '15', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%15%';
select '16', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%16%';
select '17', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%17%';
select '19', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and mediPart like '%19%';

##��ͬ��Σ�ȼ�ҩ�ò�λ��������
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%11%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%12%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%13%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%14%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%15%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%16%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%17%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(mediPart) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where mediPart like '%19%' and detailSpecies = 1 group by endanstatus


####��ͬ��Ч���ֿ�������
##��ͬ��Ч���ֿ�������
select distinct(func) from mediInfo   ##ȷ���ļ���ҩ�ò�λ##
select '1', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%1%';
select '2', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%2%';
select '3', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%3%';
select '4', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%4%';
select '5', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%5%';
select '6', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%6%';
select '7', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%7%';
select '8', count(distinct(cnName))cnName, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily
from mediInfo where detailSpecies = 1 and func like '%8%';

##��ͬ��Σ�ȼ���Ч��������
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%1%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%2%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%3%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%4%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%5%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%6%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%7%' and detailSpecies = 1 group by endanstatus
select endanstatus, count(func) species, count(distinct(cnGenus)) cnGenus, count(distinct(cnFamily)) cnFamily 
from mediInfo where func like '%8%' and detailSpecies = 1 group by endanstatus


#########ֲ��԰���ͳ��
#####ֲ��԰���ݼ�����garden��,����gardenCas��gardenMedi����ϲ�������,���п�Ժ��ֲ��԰��ҩ��ֲ��԰.
#####gardenCas����������������,����gardenMedi�������˺�Ƥ����ϸ��������.
####ÿ��ֲ��԰������
select cnGarden, count(*) species from garden 
where latinName in (select latinName from mediInfo where detailSpecies = 1)
or cnName in (select cnName from mediInfo where detailSpecies = 1)
group by cnGarden order by species desc

or,����һ��д��:

select cnGarden, count(*) species from garden a, mediInfo b
where (a.latinName=b.latinName or a.cnName=b.cnName) and detailSpecies = 1
group by a.cnGarden order by species desc


##��ͬ��Σ�ȼ�ֲ��԰������
select a.cnGarden, b.endanStatus, count(a.cnName) species 
from garden a, mediInfo b 
where (a.latinName=b.latinName or a.cnName=b.cnName) and detailSpecies = 1
group by a.cnGarden, b.endanStatus
order by cnGarden


##ÿ��������ֲ��԰���������




#####��Σ�������ͳ��





#####�ֲ����ͳ��
##�õ��ܵķֲ������
select * from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName order by a.autoId

##�õ���ϸ�������ֽ����
##To get the result of only species of detail 
select * from distribution a,county2007 b, mediInfo c where a.county = b.county and a.province=b.province and a.cnName = c.cnName 
and a.cnName in (select distinct(cnName) from distribution where (descr is null or descr = '���') and cnName in (select cnName from listqin20150428 where detailSpecies=1))
order by a.autoId


######�õ�ʡ�������ж��ٸ�����
#province species#
select province, count(distinct(b.cnName)) Species, count(distinct(b.cnGenus)) Genus, count(distinct(b.cnFamily)) Family 
from distribution a, mediInfo b
where (a.descr is null or a.descr like '%���%') and a.cnName=b.cnName and b.detailSpecies=1
group by a.province order by a.province

##�õ�ʡ�ľ�γ��  ???
select * from 
(select province, count(distinct(b.cnName)) Species, count(distinct(b.cnGenus)) Genus, count(distinct(b.cnFamily)) Family 
from distribution a, mediInfo b
where (a.descr is null or a.descr like '%���%') and a.cnName=b.cnName and b.detailSpecies=1
group by a.province
) d, county2007 e
where d.province = e.province


##�õ������ڶ��ٸ�ʡ�����طֲ�##
select a.cnName, a.latinName, count(distinct(a.province)) provinceCount 
from distribution a, listqin20150428 b 
where a.cnName=b.cnName and b.detailSpecies = 1 and (descr is null or descr like '%���%')
group by a.cnName, a.latinName order by provinceCount

select a.cnName, a.latinName, count(distinct(a.countyCode)) countyCount 
from distribution a , listqin20150428 b 
where a.cnName=b.cnName and b.detailSpecies = 1 and (descr is null or descr like '%���%')
group by a.cnName, a.latinName order by countyCount



