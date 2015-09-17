Create View vEtlFactSalesData
as
	SELECT
	 [OrderNumber]=ord_num
      ,[OrderDateKey]=dateKey
      ,[TitleKey]=DimTitles.TitleKey
      ,[StoreKey]=DimStores.StoreKey
      ,[SalesQuantity]=qty
  FROM pubs.dbo.sales
  JOIN DWPubsSales.dbo.DimDates
  ON   pubs.dbo.sales.ord_date=DWPubsSales.dbo.DimDates.date
  JOIN DWPubsSales.dbo.DimTitles
  ON   pubs.dbo.sales.Title_id=DWPubsSales.dbo.DimTitles.TitleId
  JOIN DWPubsSales.dbo.DimStores
  ON   pubs.dbo.sales.Stor_id=DWPubsSales.dbo.DimStores.StoreId