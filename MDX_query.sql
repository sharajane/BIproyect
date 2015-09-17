SELECT
{[Measures].[SalesQuantity]} On Columns, -- Axis 0
{[DimTitles].[Title].[Is Anger the Enemiy?]} On Rows -- Axis 1
FROM [DWPubsSalesVer1]
Where ( [DimStores].[Store].[Eric the ReadBooks] );