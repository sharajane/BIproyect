--USE DWPubsSales
--go

--CREATE TABLE [dbo].[DimStores] (
--[StoresKey] int NOT NULL PRIMARY KEY Identity,
--[StoreId] nchar(4) NOT NULL,
--[StoreName] nvarchar(50) NOT NULL)
--GO

--CREATE TABLE [dbo].[DimPublishers] (
--[PublisherKey] int NOT NULL PRIMARY KEY Identity,
--[PublisherId] nchar(4) NOT NULL,
--[PublihserName] nvarchar(50) NOT NULL)
--GO

--CREATE TABLE [dbo].[DimAuthors] (
--[AuthorKey] int NOT NULL PRIMARY KEY Identity,
--[AuthorId] nchar(11) NOT NULL,
--[AuthorName] nvarchar(100) NOT NULL,
--[AuthorState] nchar(2) NOT NULL)

--GO

--CREATE TABLE [dbo].[DimTitles] (
--[TitleKey] int NOT NULL PRIMARY KEY Identity,
--[TitleId] nchar(6) NOT NULL,
--[TitleName] nvarchar(100) NOT NULL,
--[TitleType] nvarchar(50) NOT NULL,
--[PublisherKey] int NOT NULL,
--[TitlePrice] decimal(18,4) NOT NULL,
--[PublishedDateKey] int NOT NULL)
--GO



---- Create the Fact Tables
--CREATE TABLE [dbo].[FactTitlesAuthors] (
--[TitleKey] int NOT NULL,
--[AuthorKey] int NOT NULL,
--[AuthorOrder] int NOT NULL,
--CONSTRAINT [PK_FactTitlesAuthors] PRIMARY KEY CLUSTERED
--	([TitleKey] ASC, [AuthorKey] ASC )
--)
--GO

--CREATE TABLE [dbo].[FactSales] (
--[OrderNumber] nvarchar(50) NOT NULL,
--[OrderDateKey] int NOT NULL,
--[TitleKey] int NOT NULL,
--[StoreKey] int NOT NULL,
--[SalesQuantity] int NOT NULL
--	CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED
--		([OrderNumber] ASC,[OrderDateKey] ASC, [TitleKey] ASC, [StoreKey] ASC )
--)




