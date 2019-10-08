select top 1000 * from popDem order by fid_popdem

DUMP TRANSACTION basicXJ WITH NO_LOG

select sum(popDensity * area),sum(area),lastRegion from popDen where altitude <=0 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 0 and altitude <=500 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 500 and altitude <=1000 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 1000 and altitude <=1500 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 1500 and altitude <=2000 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 2000 and altitude <=2500 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 2500 and altitude <=3000 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 3000 and altitude <=3500 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 3500 and altitude <=4000 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 4000 and altitude <=4500 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 4500 and altitude <=5000 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 5000 and altitude <=5500 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 5500 and altitude <=6000 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 6000 and altitude <=6500 group by lastRegion order by lastregion
select sum(popDensity * area),sum(area),lastRegion from popDen where altitude > 6500 and altitude < 7000 group by lastRegion order by lastregion

select sum(density*area) from popden

select * from popden

select lastregion, count(id) from regionstation group by lastregion




