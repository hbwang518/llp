
--select * into arborNeedle from arbor where plot in (select plot from environmentNeedle)

select * from arbor where plot not in (select plot from environmentNeedle)

--select * into environmentNeedle from environment where notNeedle is null and siteCode <> 5

select *  from environment where notNeedle is null and siteCode <> 5

select * from shrubAndGrass where plot not in (select plot from environmentNeedle)

--select * into shrubAndGrassNeedle from shrubAndGrass where plot in (select plot from environmentNeedle)

EXEC sp_password NULL, '', 'Sa'