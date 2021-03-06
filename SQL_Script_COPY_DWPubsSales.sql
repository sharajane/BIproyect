USE [master]
GO
/****** Object:  Database [DWPubsSales]    Script Date: 01/09/2015 12:26:04 ******/
CREATE DATABASE [DWPubsSales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DWPubsSales', FILENAME = N'C:\_BISolutions\PublicationsIndustries\DWPubsSales.mdf' , SIZE = 10240KB , MAXSIZE = 1048576KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'DWPubsSales_LOG', FILENAME = N'C:\_BISolutions\PublicationsIndustries\DWPubsSales_LOG.mdf' , SIZE = 11264KB , MAXSIZE = 1048576KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [DWPubsSales] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWPubsSales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWPubsSales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DWPubsSales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DWPubsSales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DWPubsSales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DWPubsSales] SET ARITHABORT OFF 
GO
ALTER DATABASE [DWPubsSales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DWPubsSales] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DWPubsSales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DWPubsSales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DWPubsSales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DWPubsSales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DWPubsSales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DWPubsSales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DWPubsSales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DWPubsSales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DWPubsSales] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DWPubsSales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DWPubsSales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DWPubsSales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DWPubsSales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DWPubsSales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DWPubsSales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DWPubsSales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DWPubsSales] SET RECOVERY BULK_LOGGED 
GO
ALTER DATABASE [DWPubsSales] SET  MULTI_USER 
GO
ALTER DATABASE [DWPubsSales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DWPubsSales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DWPubsSales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DWPubsSales] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DWPubsSales', N'ON'
GO
USE [DWPubsSales]
GO
/****** Object:  Table [dbo].[DimAuthors]    Script Date: 01/09/2015 12:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAuthors](
	[AuthorKey] [int] IDENTITY(1,1) NOT NULL,
	[AuthorId] [nchar](11) NOT NULL,
	[AuthorName] [nvarchar](100) NOT NULL,
	[AuthorState] [nchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimDates]    Script Date: 01/09/2015 12:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDates](
	[DateKey] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[DateName] [nvarchar](50) NULL,
	[Month] [int] NOT NULL,
	[MonthName] [nvarchar](50) NOT NULL,
	[Quarter] [int] NOT NULL,
	[QuarterName] [nvarchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[YearName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimPublishers]    Script Date: 01/09/2015 12:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPublishers](
	[PublisherKey] [int] IDENTITY(1,1) NOT NULL,
	[PublisherId] [nchar](4) NOT NULL,
	[PublihserName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PublisherKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimStores]    Script Date: 01/09/2015 12:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStores](
	[StoreKey] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [nchar](4) NOT NULL,
	[StoreName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimTitles]    Script Date: 01/09/2015 12:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTitles](
	[TitleKey] [int] IDENTITY(1,1) NOT NULL,
	[TitleId] [nchar](6) NOT NULL,
	[TitleName] [nvarchar](100) NOT NULL,
	[TitleType] [nvarchar](50) NOT NULL,
	[PublisherKey] [int] NOT NULL,
	[TitlePrice] [decimal](18, 4) NOT NULL,
	[PublishedDateKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TitleKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 01/09/2015 12:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[OrderNumber] [nvarchar](50) NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[TitleKey] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[SalesQuantity] [int] NOT NULL,
 CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC,
	[OrderDateKey] ASC,
	[TitleKey] ASC,
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactTitlesAuthors]    Script Date: 01/09/2015 12:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTitlesAuthors](
	[TitleKey] [int] NOT NULL,
	[AuthorKey] [int] NOT NULL,
	[AuthorOrder] [int] NOT NULL,
 CONSTRAINT [PK_FactTitlesAuthors] PRIMARY KEY CLUSTERED 
(
	[TitleKey] ASC,
	[AuthorKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DimTitles]  WITH CHECK ADD  CONSTRAINT [FK_DimTitles_DimPublishers] FOREIGN KEY([PublisherKey])
REFERENCES [dbo].[DimPublishers] ([PublisherKey])
GO
ALTER TABLE [dbo].[DimTitles] CHECK CONSTRAINT [FK_DimTitles_DimPublishers]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimStores] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStores] ([StoreKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimStores]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimTitles] FOREIGN KEY([TitleKey])
REFERENCES [dbo].[DimTitles] ([TitleKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimTitles]
GO
ALTER TABLE [dbo].[FactTitlesAuthors]  WITH CHECK ADD  CONSTRAINT [FK_FactTitlesAuthors_DimAuthors] FOREIGN KEY([AuthorKey])
REFERENCES [dbo].[DimAuthors] ([AuthorKey])
GO
ALTER TABLE [dbo].[FactTitlesAuthors] CHECK CONSTRAINT [FK_FactTitlesAuthors_DimAuthors]
GO
ALTER TABLE [dbo].[FactTitlesAuthors]  WITH CHECK ADD  CONSTRAINT [FK_FactTitlesAuthors_DimTitles] FOREIGN KEY([TitleKey])
REFERENCES [dbo].[DimTitles] ([TitleKey])
GO
ALTER TABLE [dbo].[FactTitlesAuthors] CHECK CONSTRAINT [FK_FactTitlesAuthors_DimTitles]
GO
USE [master]
GO
ALTER DATABASE [DWPubsSales] SET  READ_WRITE 
GO
