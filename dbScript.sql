USE [master]
GO
/****** Object:  Database [Farm_Management]    Script Date: 22/03/2022 6:04:00 CH ******/
CREATE DATABASE [Farm_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farm_Management', FILENAME = N'E:\DBI\MSSQL12.MSSQLSERVER\MSSQL\DATA\Farm_Management.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Farm_Management_log', FILENAME = N'E:\DBI\MSSQL12.MSSQLSERVER\MSSQL\DATA\Farm_Management_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Farm_Management] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farm_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farm_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farm_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farm_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farm_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farm_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farm_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farm_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farm_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farm_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farm_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farm_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farm_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farm_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farm_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farm_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Farm_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farm_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farm_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farm_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farm_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farm_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farm_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farm_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Farm_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Farm_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farm_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farm_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farm_Management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Farm_Management] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Farm_Management]
GO
/****** Object:  Table [dbo].[Financial]    Script Date: 22/03/2022 6:04:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Financial](
	[FSID] [int] IDENTITY(1,1) NOT NULL,
	[IsRevenue] [bit] NOT NULL,
	[Date] [date] NOT NULL,
	[FID] [int] NOT NULL,
	[PriceID] [int] NOT NULL,
	[Quantily] [int] NOT NULL,
	[Decrepsion] [varchar](500) NULL,
 CONSTRAINT [PK_Financial] PRIMARY KEY CLUSTERED 
(
	[FSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Flocks]    Script Date: 22/03/2022 6:04:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flocks](
	[FID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](500) NOT NULL,
	[Purchase_date] [date] NOT NULL,
	[Sale_date] [date] NULL,
 CONSTRAINT [PK_Flocks] PRIMARY KEY CLUSTERED 
(
	[FID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Price]    Script Date: 22/03/2022 6:04:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Price] [int] NOT NULL,
	[Decrepsion] [nvarchar](500) NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 22/03/2022 6:04:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Product_name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Financial] ON 

INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (1, 0, CAST(N'2022-03-01' AS Date), 1, 1, 7000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (2, 0, CAST(N'2022-03-07' AS Date), 2, 2, 8000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (3, 0, CAST(N'2022-03-01' AS Date), 3, 1, 10000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (4, 0, CAST(N'2022-03-01' AS Date), 4, 1, 10000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (5, 0, CAST(N'2022-03-01' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (6, 0, CAST(N'2022-03-01' AS Date), 3, 17, 4, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (7, 0, CAST(N'2022-03-01' AS Date), 4, 16, 4, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (8, 1, CAST(N'2022-03-02' AS Date), 1, 3, 6000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (9, 1, CAST(N'2022-03-22' AS Date), 3, 3, 8500, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (10, 1, CAST(N'2022-03-22' AS Date), 4, 3, 8400, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (11, 0, CAST(N'2022-03-02' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (12, 0, CAST(N'2022-03-03' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (13, 0, CAST(N'2022-03-04' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (14, 0, CAST(N'2022-03-05' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (15, 0, CAST(N'2022-03-06' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (16, 0, CAST(N'2022-03-07' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (17, 0, CAST(N'2022-03-08' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (18, 0, CAST(N'2022-03-09' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (19, 0, CAST(N'2022-03-10' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (20, 0, CAST(N'2022-03-11' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (21, 0, CAST(N'2022-03-12' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (22, 0, CAST(N'2022-03-13' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (23, 0, CAST(N'2022-03-14' AS Date), 1, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (24, 0, CAST(N'2022-03-15' AS Date), 1, 18, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (25, 0, CAST(N'2022-03-16' AS Date), 1, 18, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (26, 0, CAST(N'2022-03-17' AS Date), 1, 18, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (27, 0, CAST(N'2022-03-18' AS Date), 1, 18, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (28, 0, CAST(N'2022-03-19' AS Date), 1, 18, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (29, 0, CAST(N'2022-03-07' AS Date), 2, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (30, 0, CAST(N'2022-03-08' AS Date), 2, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (31, 0, CAST(N'2022-03-09' AS Date), 2, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (32, 0, CAST(N'2022-03-10' AS Date), 2, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (33, 0, CAST(N'2022-03-11' AS Date), 2, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (34, 0, CAST(N'2022-03-12' AS Date), 2, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (35, 0, CAST(N'2022-03-13' AS Date), 2, 17, 3, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (36, 1, CAST(N'2022-03-03' AS Date), 1, 4, 5500, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (37, 1, CAST(N'2022-03-04' AS Date), 1, 5, 5500, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (38, 1, CAST(N'2022-03-05' AS Date), 1, 6, 5500, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (39, 1, CAST(N'2022-03-06' AS Date), 1, 7, 5000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (40, 1, CAST(N'2022-03-07' AS Date), 1, 7, 5300, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (41, 1, CAST(N'2022-03-08' AS Date), 1, 7, 5300, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (42, 1, CAST(N'2022-03-09' AS Date), 1, 8, 5500, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (43, 1, CAST(N'2022-03-10' AS Date), 1, 9, 5500, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (44, 1, CAST(N'2022-03-11' AS Date), 1, 10, 5600, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (45, 1, CAST(N'2022-03-12' AS Date), 1, 11, 5700, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (46, 1, CAST(N'2022-03-13' AS Date), 1, 11, 6000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (47, 1, CAST(N'2022-03-14' AS Date), 1, 11, 6000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (48, 1, CAST(N'2022-03-15' AS Date), 1, 12, 6000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (49, 1, CAST(N'2022-03-16' AS Date), 1, 12, 6000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (50, 1, CAST(N'2022-03-17' AS Date), 1, 14, 5900, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (51, 1, CAST(N'2022-03-18' AS Date), 1, 14, 6000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (52, 1, CAST(N'2022-03-19' AS Date), 1, 14, 6000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (53, 1, CAST(N'2022-03-20' AS Date), 1, 15, 6000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (55, 0, CAST(N'2022-03-10' AS Date), 1, 20, 1, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (56, 1, CAST(N'2022-03-20' AS Date), 1, 16, 7000, N'')
INSERT [dbo].[Financial] ([FSID], [IsRevenue], [Date], [FID], [PriceID], [Quantily], [Decrepsion]) VALUES (57, 0, CAST(N'2022-03-10' AS Date), 1, 20, 3, N'')
SET IDENTITY_INSERT [dbo].[Financial] OFF
SET IDENTITY_INSERT [dbo].[Flocks] ON 

INSERT [dbo].[Flocks] ([FID], [FName], [Purchase_date], [Sale_date]) VALUES (1, N'A1', CAST(N'2022-03-01' AS Date), CAST(N'2022-03-20' AS Date))
SET IDENTITY_INSERT [dbo].[Flocks] OFF
SET IDENTITY_INSERT [dbo].[Price] ON 

INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (1, 5, CAST(N'2022-03-01' AS Date), 5400, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (2, 5, CAST(N'2022-03-07' AS Date), 5600, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (3, 1, CAST(N'2022-03-01' AS Date), 430, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (4, 1, CAST(N'2022-03-03' AS Date), 410, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (5, 1, CAST(N'2022-03-04' AS Date), 450, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (6, 1, CAST(N'2022-03-05' AS Date), 460, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (7, 1, CAST(N'2022-03-06' AS Date), 470, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (8, 1, CAST(N'2022-03-09' AS Date), 500, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (9, 1, CAST(N'2022-03-10' AS Date), 530, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (10, 1, CAST(N'2022-03-11' AS Date), 550, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (11, 1, CAST(N'2022-03-12' AS Date), 570, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (12, 1, CAST(N'2022-03-15' AS Date), 600, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (13, 1, CAST(N'2022-03-17' AS Date), 580, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (14, 1, CAST(N'2022-03-17' AS Date), 590, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (15, 1, CAST(N'2022-03-20' AS Date), 600, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (16, 2, CAST(N'2022-03-21' AS Date), 15000, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (17, 3, CAST(N'2022-03-01' AS Date), 300000, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (18, 3, CAST(N'2022-03-15' AS Date), 330000, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (19, 4, CAST(N'2022-03-10' AS Date), 800000, N'')
INSERT [dbo].[Price] ([PriceID], [ProductID], [Date], [Price], [Decrepsion]) VALUES (20, 4, CAST(N'2022-03-18' AS Date), 1000000, N'')
SET IDENTITY_INSERT [dbo].[Price] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Product_name]) VALUES (1, N'Eggs')
INSERT [dbo].[Products] ([ProductID], [Product_name]) VALUES (2, N'Sell Cattle')
INSERT [dbo].[Products] ([ProductID], [Product_name]) VALUES (3, N'Fodder')
INSERT [dbo].[Products] ([ProductID], [Product_name]) VALUES (4, N'Medicine')
INSERT [dbo].[Products] ([ProductID], [Product_name]) VALUES (5, N'Purchase Breeds')
INSERT [dbo].[Products] ([ProductID], [Product_name]) VALUES (6, N'Other')
SET IDENTITY_INSERT [dbo].[Products] OFF
USE [master]
GO
ALTER DATABASE [Farm_Management] SET  READ_WRITE 
GO
