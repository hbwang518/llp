select * from temperature
select * from precipitation

--update temperature set A1951 = null where A1951 < 0.1 and A1951 > -0.1
--update temperature set A1952 = null where A1952 < 0.1 and A1952 > -0.1
--update temperature set A1953 = null where A1953 < 0.1 and A1953 > -0.1

--update precipitation set A1951 = null where A1951 < 0.1 and A1951 > -0.1
--update precipitation set A1952 = null where A1952 < 0.1 and A1952 > -0.1
--update precipitation set A1953 = null where A1953 < 0.1 and A1953 > -0.1

--SELECT * FROM pre_region a, tem_region b where a.id = b.id and a.old = b.old and a.new = b.new

select * from regionStation where lastregion = 4 or lastregion = 2

select avg(A1951),avg(A1952),avg(A1953),avg(A1954),avg(A1955),avg(A1956),avg(A1957),avg(A1958),avg(A1959),avg(A1960),avg(A1961),avg(A1962),avg(A1963),avg(A1964),avg(A1965),avg(A1966),avg(A1967),avg(A1968),avg(A1969),avg(A1970),avg(A1971),avg(A1972),avg(A1973),avg(A1974),avg(A1975),avg(A1976),avg(A1977),avg(A1978),avg(A1979),avg(A1980),avg(A1981),avg(A1982),avg(A1983),avg(A1984),avg(A1985),avg(A1986),avg(A1987),avg(A1988),avg(A1989),avg(A1990),avg(A1991),avg(A1992),avg(A1993),avg(A1994),avg(A1995),avg(A1996),avg(A1997),avg(A1998),avg(A1999),avg(A2000),avg(A2001),avg(A2002),avg(A2003),avg(A2004),avg(A2005),avg(A2006) from temperature a , regionStation b where a.Code = b.Id and b.lastregion = 1 or b.lastregion = 2
select avg(A1951),avg(A1952),avg(A1953),avg(A1954),avg(A1955),avg(A1956),avg(A1957),avg(A1958),avg(A1959),avg(A1960),avg(A1961),avg(A1962),avg(A1963),avg(A1964),avg(A1965),avg(A1966),avg(A1967),avg(A1968),avg(A1969),avg(A1970),avg(A1971),avg(A1972),avg(A1973),avg(A1974),avg(A1975),avg(A1976),avg(A1977),avg(A1978),avg(A1979),avg(A1980),avg(A1981),avg(A1982),avg(A1983),avg(A1984),avg(A1985),avg(A1986),avg(A1987),avg(A1988),avg(A1989),avg(A1990),avg(A1991),avg(A1992),avg(A1993),avg(A1994),avg(A1995),avg(A1996),avg(A1997),avg(A1998),avg(A1999),avg(A2000),avg(A2001),avg(A2002),avg(A2003),avg(A2004),avg(A2005),avg(A2006) from precipitation a , regionStation b where a.Code = b.Id and b.lastregion = 1 or b.lastregion = 2

select avg(A1951),avg(A1952),avg(A1953),avg(A1954),avg(A1955),avg(A1956),avg(A1957),avg(A1958),avg(A1959),avg(A1960),avg(A1961),avg(A1962),avg(A1963),avg(A1964),avg(A1965),avg(A1966),avg(A1967),avg(A1968),avg(A1969),avg(A1970),avg(A1971),avg(A1972),avg(A1973),avg(A1974),avg(A1975),avg(A1976),avg(A1977),avg(A1978),avg(A1979),avg(A1980),avg(A1981),avg(A1982),avg(A1983),avg(A1984),avg(A1985),avg(A1986),avg(A1987),avg(A1988),avg(A1989),avg(A1990),avg(A1991),avg(A1992),avg(A1993),avg(A1994),avg(A1995),avg(A1996),avg(A1997),avg(A1998),avg(A1999),avg(A2000),avg(A2001),avg(A2002),avg(A2003),avg(A2004),avg(A2005),avg(A2006) from temperature a , regionStation b where a.Code = b.Id and b.new = 'Jungar Basin' 
select avg(A1951),avg(A1952),avg(A1953),avg(A1954),avg(A1955),avg(A1956),avg(A1957),avg(A1958),avg(A1959),avg(A1960),avg(A1961),avg(A1962),avg(A1963),avg(A1964),avg(A1965),avg(A1966),avg(A1967),avg(A1968),avg(A1969),avg(A1970),avg(A1971),avg(A1972),avg(A1973),avg(A1974),avg(A1975),avg(A1976),avg(A1977),avg(A1978),avg(A1979),avg(A1980),avg(A1981),avg(A1982),avg(A1983),avg(A1984),avg(A1985),avg(A1986),avg(A1987),avg(A1988),avg(A1989),avg(A1990),avg(A1991),avg(A1992),avg(A1993),avg(A1994),avg(A1995),avg(A1996),avg(A1997),avg(A1998),avg(A1999),avg(A2000),avg(A2001),avg(A2002),avg(A2003),avg(A2004),avg(A2005),avg(A2006) from precipitation a , regionStation b where a.Code = b.Id and b.new = 'Jungar Basin' 

select * from regiongrid

update m_grid set m_grid.lastregion = b.region from m_grid a, regiongrid b where a.id =b.grid_id

--update plantDumb set newregionR =0 where newregion =1 or newregion =4
--update plantDumb set newregionR =1 where newregion =2 or newregion =3 or newregion =5 or newregion =6

--update plantDumb set regionR =0 where region =5 or region =4
--update plantDumb set regionR =1 where region =2 or region =3 or region =6 or region =1
select * from plantdumb where regionR is null

--update plantDumb set geomorR = 1 where geomor = 11 or geomor =16 or geomor =17
--update plantDumb set geomorR = 0 where geomor = 15





