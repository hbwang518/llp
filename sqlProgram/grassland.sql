select * from grasslandList where cnName not in (select cnName from m_plant)

select * from m_plant where cnName in (select cnName from grasslandList)


----±È½Ïm_plantºÍgrasslandlist Ö²ÎïµÄÀ­¶¡Ãû
select a.cnname,a.latinname,b.* from m_plant a, grasslandlist b where a.cnName =b.cnname


select * from m_plant where latinfamily ='Compositae' and cnname like '%°¢¶ûÌ©%'
select * from m_plant where latinfamily ='Labiatae' and latinGenus = 'Lagochilus' and cnname like '%°¢¶ûÌ©%'
select * from m_plant where latinfamily ='Compositae' and latinGenus like '%Aster%' 
select * from m_plant where latinfamily ='Cyperaceae' 
select * from m_plant where latinfamily ='Gentianaceae' 
select * from m_plant where latingenus like '%Trifolium%' 
select * from m_plant where latingenus like '%Carex%' 
select * from m_plant where latingenus like '%Angelica%' or cnname like '%°×ÜÆ%'
select * from m_plant where latingenus like '%Agropyron%' 
select * from m_plant where latingenus like '%Seriphidium%' 
select * from m_plant where latingenus like '%Lappula%' 
select * from m_plant where latingenus like '%Orostachys%' 
select * from m_plant where latingenus like '%Cerastium%' 
select * from m_plant where latingenus like '%Cirsium%' 
select * from m_plant where latingenus like '%Artemisia%' 
select * from m_plant where latingenus like '%Corispermum%' 
select * from m_plant where latingenus like '%Heracleum%' 
select * from m_plant where latingenus like '%Hedysarum%' 
select * from m_plant where latingenus like '%Agropyron%' 

select * from m_plant where latingenus like '%Erigeron%' 
select * from m_plant where latingenus like '%Stipa%' 
select * from m_plant where latingenus like '%Lomatogonium%' 
select * from m_plant where latingenus like '%Silene%' 
select * from m_plant where latingenus like '%Stellera%' or cnname like '%ÀÇ¶¾%'
select * from m_plant where latingenus like '%Pleurospermum%' 
select * from m_plant where latingenus like '%Festuca%' 
select * from m_plant where latingenus like '%Oxytropis%' 
select * from m_plant where latingenus like '%Galium%' 
select * from m_plant where latingenus like '%Taraxacum%' 
select * from m_plant where latingenus like '%Pedicularis%' 


select * from m_plant where latingenus like '%Rumex%' 
select * from m_plant where latingenus like '%Plantago%' 
select * from m_plant where latingenus like '%Achillea%' 
select * from m_plant where latingenus like '%Kochia%' 
select * from m_plant where latingenus like '%Saxifraga%'
select * from m_plant where latinname like '%relaxa%' 
select * from m_plant where latingenus like '%poa%' and cnfamily='ºÌ±¾¿Æ'
select * from m_plant where latingenus like '%Festuca%' 
select * from m_plant where latingenus like '%Koeleria%' 
select * from m_plant where latingenus like '%Spiraea%' 
select * from m_plant where latingenus like '%Stipa%' 


select * from m_plant where latingenus like '%Adenophora%' 
select * from m_plant where latingenus like '%Carex%' 
select * from m_plant where latingenus like '%Kobresia%' 
select * from m_plant where latingenus like '%Hierochloe%' 
select * from m_plant where latingenus like '%Salvia%'
select * from m_plant where latinname like '%Fragaria%' 
select * from m_plant where latingenus like '%Vicia%' 
select * from m_plant where latingenus like '%Senecio%' 
select * from m_plant where latingenus like '%Carex%' 
select * from m_plant where latingenus like '%Ulmus%' 
select * from m_plant where latingenus like '%Viola%' 

select * from m_plant where latingenus like '%Iris%' 





-------------------------------------------

select * from grasslandPlantCorrect where correctCnName is not null

select * from grasslandPlot

--update b set b.species = a.correctCnName from grasslandPlot b, grasslandPlantCorrect a
--where b.species = a.cnName and correctCnName is not null

--select b.species, a.correctcnName from grasslandPlot b, grasslandPlantCorrect a
--where b.species = a.cnName and  correctCnName is not null

--update b set b.cnName = a.correctCnName from grasslandPlantList b, grasslandPlantCorrect a
--where b.cnName = a.cnName and correctCnName is not null

--select b.cnName, a.correctcnName from grasslandPlantList b, grasslandPlantCorrect a
--where b.cnName = a.cnName and  correctCnName is not null

--update m_plant set cnName= '¿íÒ¶ÀßÖù»¨' where id=2084

--select * from m_plant where id=2084

--update m_plant set latinName= 'Orostachys Spinosa (DC.) Fisch.' where id=1106

--select * from m_plant where id=1106


--------------------------------------
