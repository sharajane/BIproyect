USE DWPubsSales
GO


DECLARE
	@ShowAll nVarchar(4) = 'True'
	, @StartDate datetime = '09/13/1994'
	, @EndDate datetime = '09/14/1994'
	, @PreFix nVarchar(3) = 'PS%'
	, @AverageQty int

	SELECT @AverageQty = AVG(SalesQuantity) FROM DWPubsSales.dbo.FactSales

SELECT
DP.PublisherName
, [Title] = DT.Titlename
, [TitleId] = DT.TitleId
, [OrderDate] = CONVERT(varchar(50), [Date], 101)
, [Total for that Day by Title] = SUM(SalesQuantity)
, [Average Qty in the FactSales Table] = @AverageQty
, [KPI on AverageQty] = CASE
WHEN Sum(SalesQuantity)
	between (@AverageQty -5) and (@AverageQty +5) THEN 0
WHEN SUM(SalesQuantity) < (@AverageQty -5) THEN  -1
WHEN SUM(SalesQuantity) > (@AverageQty +5) THEN  1	
END

FROM DWPubsSales.dbo.FactSales AS FS
JOIN DWPubsSales.dbo.DimDates AS DD
ON
FS.OrderDateKey = DD.DateKey
INNER JOIN DWPubsSales.dbo.DimTitles AS DT
ON
DT.TitleKey = FS.TitleKey
INNER JOIN DWPubsSales.dbo.DimPublishers AS DP
ON
DP.PublisherKey = DT.PublisherKey

WHERE 
 @ShowAll = 'True'
 OR
 [Date] BETWEEN @StartDate AND @EndDate
 AND
 [TitleId] like @PreFix
 GROUP BY
 DP.PublisherName
 , DT.TitleName
 , DT.TitleId
 , CONVERT(varchar(50), [Date], 101)
 ORDER BY 
 DP.PublisherName, [Title], [OrderDate]
