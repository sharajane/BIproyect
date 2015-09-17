--SELECT * FROM FactSales;
--SELECT * FROM DimStores;
--SELECT * FROM DimDates;
--SELECT * FROM DimAuthors;
--SELECT * FROM FactTitlesAuthors;

SELECT 
	DS.StoreName
	, DS.StoreId
	, [OrderDate] = CONVERT(Varchar(50), [Date], 101)
	, [Total Qty by Store] = SUM(SalesQuantity)
FROM
DWPubsSales.dbo.DimStores AS DS
JOIN DWPubsSales.dbo.FactSales AS FS
ON
 DS.StoreKey = FS.StoreKey

 INNER JOIN DWPubsSales.dbo.DimDates AS DD
 ON
 FS.OrderDateKey = DD.DateKey

 GROUP BY 
 FS.SalesQuantity
	,DS.StoreId
	, DS.StoreName
	, DD.[Date]

 ORDER BY DS.StoreName