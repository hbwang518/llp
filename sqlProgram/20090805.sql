
select a.*, b.MAT,b.MAP,b.ABT,b.WI, b.CI, b.Total_pe, b.Total_ae, c.a1,c.b1,c.a2,c.b2,c.h2 into allometryenvi from 
environmentneedle a, plotclimate_tang b, allometry c where a.plot=b.plot and a.plot = c.plot

select * from  environmentneedle order by plot
select * from arborneedle
select * from allometryenvi