-- Q7
SELECT dbo.Objectt.Title,COUNT(dbo.Objectt.FingerPrintID) AS CNT 
FROM Objectt 
GROUP BY dbo.Objectt.Title 
HAVING COUNT(dbo.Objectt.FingerPrintID) = 
(SELECT MAX(CNT) 
FROM 
(SELECT COUNT(*) AS CNT 
FROM Objectt
GROUP BY Title) AS T) 

GO
-- Q9
SELECT dbo.Objectt.Title, (CAST (COUNT(dbo.Objectt.ObjectID) AS FLOAT)/ CAST ((SELECT Count(dbo.Objectt.ObjectID)  From dbo.Objectt) AS FLOAT))*100 AS Average
FROM dbo.Objectt
GROUP BY dbo.Objectt.Title

GO

--Q14
--CREATE PROCEDURE KobjectTypesWithLessRegs @UserKinput INTEGER
--AS 

--SELECT TOP (@UserKinput) dbo.ObjectType.Title, COUNT(dbo.Objectt.ObjectID)
SELECT dbo.ObjectType.Title, COUNT(dbo.Objectt.ObjectID) AS Amount
FROM dbo.ObjectType
LEFT JOIN dbo.Objectt
ON ObjectType.Title = Objectt.Title
GROUP BY dbo.ObjectType.Title
ORDER BY COUNT(dbo.Objectt.ObjectID)

--GO

--Q16
--x1,y1 0,5
--x2,y2 10,0
SELECT SUM(dbo.Fingerprint.NoOfObjects) AS NumberOfObjects
FROM dbo.Fingerprint
INNER JOIN Objectt
ON Fingerprint.FingerPrintID = dbo.Objectt.FingerPrintID
WHERE ((dbo.Fingerprint.x >= 0 AND dbo.Fingerprint.x <= 10 AND dbo.Fingerprint.y <= 5 AND dbo.Fingerprint.y >= 0)
OR
(dbo.Fingerprint.x <= 0 AND dbo.Fingerprint.x >= 10 AND dbo.Fingerprint.y >= 5 AND dbo.Fingerprint.y <= 0))
AND
Objectt.Title = 'Lacinia Mattis Integer PC'

--Q17
SELECT MIN(dbo.POI.x) AS X1,MIN(dbo.POI.y) AS Y1 ,MAX(dbo.POI.x) AS X2,MAX(dbo.POI.y) AS Y2
FROM dbo.POI
WHERE dbo.POI.BuildingCode = 7

--Q18
SELECT P.NameOfPOI,P.x,P.y,P.FloorNumber
FROM dbo.POI P
WHERE SQRT( POWER((P.x-3),2) + POWER((P.y-1),2) + POWER((P.FloorNumber*3-8*3),2)) =
(
SELECT MIN(SQRT( POWER((A.x-3),2) + POWER((A.y-1),2) + POWER((A.FloorNumber*3-8*3),2)))
FROM dbo.POI A
)

--Q19
SELECT SQRT( POWER((A.x-3),2) + POWER((A.y-1),2) + POWER((A.FloorNumber*3-8*3),2)) AS Distances
FROM dbo.POI A
ORDER BY SQRT( POWER((A.x-3),2) + POWER((A.y-1),2) + POWER((A.FloorNumber*3-8*3),2)) ASC

--Q20

SELECT Mins.A, AllData.B FROM
(

SELECT Sub.A, MIN(Distance) AS MinDistance FROM
(
	SELECT DISTINCT A.NameOfPOI AS A, B.NameOfPOI AS B, MIN(SQRT( POWER((A.x-B.x),2) + POWER((A.y-B.y),2))) AS Distance
	FROM dbo.POI A, dbo.POI B
	WHERE A.NameOfPOI != B.NameOfPOI AND A.FloorNumber = 8 AND B.FloorNumber = 8 
	GROUP BY A.NameOfPOI, B.NameOfPOI, SQRT( POWER((A.x-B.x),2) + POWER((A.y-B.y),2))
	HAVING SQRT( POWER((A.x-B.x),2) + POWER((A.y-B.y),2)) = MIN(SQRT( POWER((A.x-B.x),2) + POWER((A.y-B.y),2)))
) AS [Sub]

GROUP BY A

) AS [Mins]
INNER JOIN 
(
	SELECT DISTINCT A.NameOfPOI AS A, B.NameOfPOI AS B, MIN(SQRT( POWER((A.x-B.x),2) + POWER((A.y-B.y),2))) AS Distance
	FROM dbo.POI A, dbo.POI B
	WHERE A.NameOfPOI != B.NameOfPOI AND A.FloorNumber = 8 AND B.FloorNumber = 8 
	GROUP BY A.NameOfPOI, B.NameOfPOI, SQRT( POWER((A.x-B.x),2) + POWER((A.y-B.y),2))
	HAVING SQRT( POWER((A.x-B.x),2) + POWER((A.y-B.y),2)) = MIN(SQRT( POWER((A.x-B.x),2) + POWER((A.y-B.y),2)))
) [AllData]
ON AllData.A = Mins.A AND AllData.Distance = Mins.MinDistance;

--Q21

IF OBJECT_ID(N'tempdb..#TempTable') IS NOT NULL
BEGIN
DROP TABLE #TempTable
END
GO

(
select  t1.FingerPrintID as FingerPrintIDt1,t1.FloorNumber as FloorNumbert1, t1.NoOfObjects as NoOfObjectst1,
t2.FingerPrintID as FingerPrintIDt2,t2.FloorNumber as FloorNumbert2, t2.NoOfObjects as NoOfObjectst2,
(t1.NoOfObjects+t2.NoOfObjects) as unionObj
INTO #TempTable
from dbo.Fingerprint t1, dbo.Fingerprint t2
WHERE t1.FingerPrintID != t2.FingerPrintID AND SQRT( POWER((t1.x-t2.x),2) + POWER((t1.y-t2.y),2))<=7 AND t1.FloorNumber = 1 AND t2.FloorNumber = 1 AND t2.FingerPrintID != 1
)

IF OBJECT_ID(N'tempdb..#cteins') IS NOT NULL
BEGIN
DROP TABLE #cteins
END
GO

create table #cteins
(
Finger1 int,
Finger2 int,
ObjSum int,
lvl int
)

select #TempTable.FingerPrintIDt1,#TempTable.FingerPrintIDt2
from #TempTable;

with routeF AS(

select #TempTable.FingerPrintIDt1,#TempTable.FingerPrintIDt2,#TempTable.unionObj,1 as lvl
from #TempTable  where #TempTable.FingerPrintIDt1 = 1

union ALL

select R.FingerPrintIDt1,R.FingerPrintIDt2,(F.unionObj+R.NoOfObjectst2), F.lvl +1
from #TempTable R
join routeF F
ON F.FingerPrintIDt2 = R.FingerPrintIDt1 
WHERE R.FingerPrintIDt1 NOT in (SELECT F.FingerPrintIDt1 FROM routeF) 
--F.FingerPrintIDt1 != R.FingerPrintIDt1 AND F.FingerPrintIDt1 != R.FingerPrintIDt2

)
select *
from routeF;

select *
from #cteins



