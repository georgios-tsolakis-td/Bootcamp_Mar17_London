--Nodes data for Gephi
SELECT model as Id
FROM bootcamp.denorm
WHERE depdelay::float < -15 
AND model in (SELECT model FROM bootcamp.planes GROUP BY 1 HAVING COUNT(*) > 25)
UNION
SELECT origin
FROM bootcamp.denorm
WHERE depdelay::float < -15 
AND model in (SELECT model FROM bootcamp.planes GROUP BY 1 HAVING COUNT(*) > 25)

--Edges data for Gephi
SELECT origin as Source, model as Target, COUNT(*) as Weight
FROM bootcamp.denorm
WHERE depdelay::float < -15 
AND model in (SELECT model FROM bootcamp.planes GROUP BY 1 HAVING COUNT(*) > 25)
GROUP BY 1,2) a

--Export data to CSV files and import into the Gephi tool
--Choose "Yifan Hu Proportional" Layout and Black background in the theme presets


