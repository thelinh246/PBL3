USE [master]
GO
/****** Object:  Database [ShopLapDB]    Script Date: 24/03/2023 11:57:22 SA ******/
CREATE DATABASE [ShopLapDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopLapDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopLapDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopLapDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopLapDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopLapDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopLapDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopLapDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopLapDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopLapDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopLapDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopLapDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopLapDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopLapDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopLapDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopLapDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopLapDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopLapDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopLapDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopLapDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopLapDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopLapDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopLapDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopLapDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopLapDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopLapDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopLapDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopLapDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ShopLapDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopLapDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopLapDB] SET  MULTI_USER 
GO
ALTER DATABASE [ShopLapDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopLapDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopLapDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopLapDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopLapDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopLapDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopLapDB] SET QUERY_STORE = OFF
GO
USE [ShopLapDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[ParentId] [int] NULL,
	[Orders] [int] NULL,
	[MetaDesc] [nvarchar](max) NOT NULL,
	[MetaKey] [nvarchar](max) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Categorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configs]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Configs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdateAt] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Links]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[TypeLink] [nvarchar](max) NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Links] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[ParentId] [int] NULL,
	[Order] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdateAt] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Qty] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ReceiverAddress] [nvarchar](max) NULL,
	[ReceiverPhone] [nvarchar](max) NULL,
	[ReceiverEmail] [nvarchar](max) NULL,
	[ReceiverName] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] NOT NULL,
	[TopId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](50) NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Img] [nvarchar](50) NULL,
	[PostType] [nvarchar](max) NOT NULL,
	[MetaKey] [nvarchar](max) NOT NULL,
	[MetaDesc] [nvarchar](max) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Slug] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[MetaKey] [nvarchar](max) NULL,
	[MetaDesc] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Number] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PriceSale] [decimal](18, 2) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateAt] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[Img] [nvarchar](max) NULL,
	[Order] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdateAt] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliders]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[Img] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Order] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdateAt] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Suppliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[ParentId] [int] NULL,
	[Orders] [int] NULL,
	[MetaKey] [nvarchar](max) NOT NULL,
	[MetaDesc] [nvarchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24/03/2023 11:57:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Roles] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdateAt] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ShopLapDB] SET  READ_WRITE 
GO
