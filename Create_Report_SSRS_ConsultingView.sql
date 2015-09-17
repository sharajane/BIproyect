DECLARE
	@ShowAll nVarchar(4) = 'True'
	, @StartDate datetime = '09/13/1994'
	, @EndDate datetime = '09/14/1994'
	, @PreFix nVarchar(3) = 'PS%'
	, @AverageQty int

	SELECT @AverageQty = AVG(SalesQuantity) FROM DWPubsSales.dbo.FactSales

SELECT
PublisherName
, [Title]
, [TitleId]
, [OrderDate]
, [Total for that Day by Title]
, [Average Qty in the FactSales Table] = @AverageQty
, [KPI on AverageQty] = CASE
	WHEN [Total for that Day by Title]
		between (@AverageQty -5) and (@AverageQty +5) THEN 0
	WHEN [Total for that Day by Title] < (@AverageQty -5) THEN  -1
	WHEN [Total for that Day by Title] > (@AverageQty +5) THEN  1	
	END

FROM vQuantitiesByTitleAndDate

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