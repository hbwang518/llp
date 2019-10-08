
select * from environment where plot like 'TC%' order by altitudeGPS
select * from shrubAndGrass where plot like 'TC%' and species not in (select species from shrubAndGrass where plot like 'TC%' and plot != 'TC17')
select * from shrubAndGrass where species = '膜边獐牙菜'
select * from shrubAndGrass where species = '多裂委陵菜'
select * from shrubAndGrass where species = '二裂委陵菜'

select * from environmentindex

##给保护区数据
select * from environment where plot like 'TC%' order by plot
select * from shrubAndGrass where plot like 'TC%' order by plot
##select * from shrubAndGrass where plot like 'TC%' and speciesFlag = 1 order by plot
##select * from shrubAndGrass where plot like 'TC%' and speciesFlag = 2 order by plot
select * from arbor where plot like 'TC%' order by plot