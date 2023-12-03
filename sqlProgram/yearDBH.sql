SELECT plot, plotNo, altitudegps FROM ENVIRONMENTNEEDLE order by plot

---Arbor
---select a.* into temp from arborneedle a, environmentneedle b where a.plotNo = b.plotNo and b.sitecode=1 
---select a.* into temp from arborneedle a, environmentneedle b where a.plotNo = b.plotNo and b.sitecode=2 and a.plot like '%TC%'
---select a.* into temp from arborneedle a, environmentneedle b where a.plotNo = b.plotNo and b.countycode=6
---select a.* into temp from arborneedle a, environmentneedle b where a.plotNo = b.plotNo and b.sitecode=3
---select a.* into temp from arborneedle a, environmentneedle b where a.plotNo = b.plotNo and b.countycode=14

---shrub
select a.*  from shrubandgrassneedle a, environmentneedle b where a.plotNo = b.plotNo and b.countycode=6 and a.species = '—©¡Î‘∆…º'
select a.*  from shrubandgrassneedle a, environmentneedle b where a.plotNo = b.plotNo and b.countycode=6 and a.speciesflag=1 order by a.plot

select a.*  from shrubandgrassneedle a, environmentneedle b where a.plotNo = b.plotNo and b.siteCode=1 and a.species = 'Œ˜≤Æ¿˚—«¬‰“∂À…'
select a.*  from shrubandgrassneedle a, environmentneedle b where a.plotNo = b.plotNo and b.siteCode=1 and a.speciesflag=1 order by a.plot

select a.*  from shrubandgrassneedle a, environmentneedle b where a.plotNo = b.plotNo and b.siteCode=3 and a.species = '—©¡Î‘∆…º' order by a.plot
select a.*  from shrubandgrassneedle a, environmentneedle b where a.plotNo = b.plotNo and b.siteCode=3 and a.speciesflag=1 order by a.plot

select a.*  from shrubandgrassneedle a, environmentneedle b where a.plotNo = b.plotNo and b.countycode=14 and a.species = '—©¡Î‘∆…º' order by a.plot
select a.*  from shrubandgrassneedle a, environmentneedle b where a.plotNo = b.plotNo and b.countycode=14 and a.speciesflag=1 order by a.plot




select * from shrubandgrassneedle
select * from arbor

select * from environmentneedle

select * from temp

--test git
