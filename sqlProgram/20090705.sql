select * from arborNeedle order by plot,species,autoid


select plot, Count(plot) from arborNeedle where heightEye is null and heightMeasured is null group by plot

select * from arborNeedle where heightEye is null and heightMeasured is null order by plot,species,autoid

--update arborNeedle set arborNeedle.height = sheet1.height from arborNeedle, sheet1  where arborNeedle.autoid= sheet1.autoID

select * from arborNeedle, sheet1  where arborNeedle.autoid= sheet1.autoID

select * from sheet1  

--update arborNeedle set height=heightMeasured where heightMeasured is not null

--update arborNeedle set height=heightEye where height is null and heightMeasured is null and heightEye is not null

select * from arborNeedle where breast is null
select * from arborNeedle where plot='TC16'

--delete arborNeedle where breast is null

select distinct(species) from arborNeedle

select a.autoid, a.species ,b.const*power(a.breast/3.14£¨ b.breast)*power(a.height, b.height) from arborNeedle a, volumeCal b where a.species = b.name

select a.autoid, a.species ,b.const*power(a.breast/3.14, b.breast)*power(a.height, b.height) from arborNeedle a, volumeCal b where a.species = b.name

--update arborNeedle set volume = b.const*power(a.breast/3.14, b.breast)*power(a.height, b.height) from arborNeedle a, volumeCal b where a.species = b.name

--update arborNeedle set BA = breast*breast/3.14/4/600 from arborNeedle 
--update arborNeedle set BA = breast*breast/3.14/4/1000 from arborNeedle where (plot='XTS1' OR plot='XTS2' OR plot='XTS3')
SELECT * from arborNeedle where (plot='XTS1' OR plot='XTS2' OR plot='XTS3')

select * from arborNeedle where volume is null

select a.* from arborNeedle a, environmentNeedle c where a.species like '%¬‰“∂À…%' and a.plot=c.plot and c.siteCode = 2 

--update arborNeedle set volume = 0.000054381398*power(a.breast/3.14, 1.8288952)*power(a.height, 1.0666428) from arborNeedle a, environmentNeedle c where a.volume is null and a.species like '%¬‰“∂À…%' and a.plot=c.plot and c.siteCode = 2 

select a.* from arborNeedle a, environmentNeedle c where a.species like '%¬‰“∂À…%' and a.plot=c.plot and c.siteCode = 1 

--update arborNeedle set volume = 0.000056427724*power(a.breast/3.14, 1.7572497)*power(a.height, 1.1057552) from arborNeedle a, environmentNeedle c where a.volume is null and a.species like '%¬‰“∂À…%' and a.plot=c.plot and c.siteCode = 1

--update arborNeedle set taperness=breast/3.14/height

select a.plot,b.plotArea , Count(a.species)*10000/b.plotArea from arborNeedle a, environmentNeedle b where a.plot= b.plot group by a.plot, b.plotArea order by a.plot

--select a.plot, Count(a.species) from arborNeedle a, environmentNeedle b where a.plot= b.plot group by a.plot



select plot, sum(BA) from arborneedle group by plot order by plot 
select b.sitecode, max(a.breast) from arborneedle a, environmentneedle b where a.plot = b.plot group by b.sitecode