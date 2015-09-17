USE DWPubsSales
go

--Use fully qualified names(DWPubsSales.dbo.FactSales)
--Joining Table Data (JOIN, INNER JOIN)
--Creating Table Aliases with AS (DWPubsSales.dbo.FactSales AS FT)
--Reordering the Columns and Rows for better results (ORDER BY)
--Adding Columns Aliases for better results
--Removing Columns Not Needed for our query
--Formatting Results using SQL Functions ([OrderDate]=CONVERT(varchar(50), [Date], 101)
--Filtering Results (WHERE LIKE, Clause to filter the results)
--		WHERE [TitleId] LIKE 'PS%'
--		WHERE 
--		Using the IN Operator (WHERE [Date] IN ('09/13/1994', '05/29/1993')
--		WHERE [Date] BETWEEN '09/13/1994' AND '09/13/1994'
--Combining Multiple Operators in a WHERE statement
--		WHERE
--		[Date] BETWEEN '09/13/1994' AND '09/14/1994'
--		AND
--		[TitleId] LIKE 'PS%'
--Adding Variables to your Query
--Adding a Parameter Flag to Show All Data as Needed (@ShowAll)
--Adding Aggregate Values to Our Results


DECLARE
	@ShowAll nVarchar(4) = 'True'--'False' -- 'True'
	, @StartDate datetime = '09/13/1994'
	, @EndDate datetime = '09/14/1994'
	, @Prefix nVarchar(3)= 'PS%'
SELECT
	DP.PublisherName
	, [Title]=DT.TitleName
	, DT.TitleId
	--, [Internal Data Warehoouse Id] = FS.TitleKey
	--, OrderNumber
	--, OrderDateKey
	--, [OrderDate] = DD.[Date]
	, [OrderDate]=CONVERT(varchar(50), [Date], 101)
	--, StoreKey
	--, Date
	--, SalesQuantity
	--, PublisherKey
	, [Total for that Date by title] = SUM(SalesQuantity)

FROM DWPubsSales.dbo.FactSales AS FS -- Identifying the data (table, database. schema)
JOIN DWPubsSales.dbo.DimTitles AS DT
ON FS.TitleKey = DT.TitleKey

INNER JOIN DWPubsSales.dbo.DimDates AS DD
ON FS.OrderDateKey = DD.DateKey
INNER JOIN DWPubsSales.dbo.DimPublishers AS DP
ON DT.PublisherKey = DP.PublisherKey

WHERE
 @ShowAll = 'True'
OR
 [Date] BETWEEN @StartDate AND @EndDate
 AND
 [TitleId] LIKE @Prefix
 GROUP BY
	DP.PublisherName
	, DT.TitleName
	, DT.TitleId
	, [Date]
ORDER BY DP.PublisherName, [Title], [OrderDate]

--Basic Starter Query