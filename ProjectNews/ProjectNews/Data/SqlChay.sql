USE [master]
GO
/****** Object:  Database [dataNews]    Script Date: 5/20/2019 12:15:47 AM ******/
CREATE DATABASE [dataNews] ON  PRIMARY 
( NAME = N'dataNews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dataNews.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dataNews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dataNews_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dataNews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dataNews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dataNews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dataNews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dataNews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dataNews] SET ARITHABORT OFF 
GO
ALTER DATABASE [dataNews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dataNews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dataNews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dataNews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dataNews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dataNews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dataNews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dataNews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dataNews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dataNews] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dataNews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dataNews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dataNews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dataNews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dataNews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dataNews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dataNews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dataNews] SET RECOVERY FULL 
GO
ALTER DATABASE [dataNews] SET  MULTI_USER 
GO
ALTER DATABASE [dataNews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dataNews] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dataNews', N'ON'
GO
USE [dataNews]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/20/2019 12:15:47 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[BirthDay] [datetime] NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfigSystem]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigSystem](
	[configId] [int] IDENTITY(1,1) NOT NULL,
	[configKey] [nvarchar](50) NOT NULL,
	[configValue] [nvarchar](max) NULL,
	[isTrash] [bit] NOT NULL,
 CONSTRAINT [PK_ConfigSystem] PRIMARY KEY CLUSTERED 
(
	[configId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[contactId] [int] IDENTITY(1,1) NOT NULL,
	[contactFullName] [nvarchar](250) NOT NULL,
	[contactEmail] [nvarchar](250) NOT NULL,
	[contactTitle] [nvarchar](250) NOT NULL,
	[contactBody] [nvarchar](max) NULL,
	[isTrash] [bit] NOT NULL,
	[ipAddress] [nvarchar](50) NULL,
	[createTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[contactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contents]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contents](
	[contentId] [bigint] IDENTITY(1,1) NOT NULL,
	[contentName] [nvarchar](250) NOT NULL,
	[contentAlias] [nvarchar](250) NOT NULL,
	[contentDescription] [nvarchar](500) NULL,
	[contentBody] [nvarchar](max) NULL,
	[contentThumbnail] [nvarchar](250) NULL,
	[contentParentId] [bigint] NULL,
	[contentKey] [nvarchar](50) NULL,
	[contentCreateTime] [datetime] NOT NULL,
	[contentUpdateTime] [datetime] NULL,
	[contentCreateUser] [nvarchar](50) NULL,
	[contentUpdateUser] [nvarchar](50) NULL,
	[contentMetaTitle] [nvarchar](250) NULL,
	[contentMetaKeywords] [nvarchar](250) NULL,
	[contentMetaDescription] [nvarchar](250) NULL,
	[contentLanguageId] [int] NOT NULL,
	[contentView] [int] NOT NULL,
	[isSort] [int] NOT NULL,
	[isTrash] [bit] NOT NULL,
	[isNew] [bit] NULL,
	[authorize] [nvarchar](250) NULL,
 CONSTRAINT [PK_Contents] PRIMARY KEY CLUSTERED 
(
	[contentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogSystems]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogSystems](
	[logId] [bigint] IDENTITY(1,1) NOT NULL,
	[userAction] [nvarchar](50) NOT NULL,
	[createTime] [datetime] NOT NULL,
	[ipAddress] [nvarchar](50) NOT NULL,
	[action] [nvarchar](500) NULL,
	[browser] [nvarchar](250) NULL,
 CONSTRAINT [PK_LogSystems] PRIMARY KEY CLUSTERED 
(
	[logId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[menuId] [int] IDENTITY(1,1) NOT NULL,
	[menuName] [nvarchar](250) NULL,
	[menuLink] [nvarchar](250) NULL,
	[menuParentId] [int] NULL,
	[isSort] [int] NOT NULL,
	[isTrash] [bit] NULL,
	[languageId] [int] NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[menuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitor]    Script Date: 5/20/2019 12:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[visitTime] [datetime] NOT NULL,
	[visitIp] [nvarchar](50) NULL,
	[visitBrowser] [nvarchar](255) NULL,
	[visitPage] [nvarchar](255) NULL,
 CONSTRAINT [PK_Visitor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201905171557135_InitialCreate', N'ProjectNews.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D0FB0FF20E86937705ABE6406B34677024FDB9D18195F30ED09F66DC096D86DED489422511E1B41BE2C0FF9A4FD852DEA2E5E24AA5B7D7110207093C553C56215592C15E77F7FFE35FEF1D9F78C271CC56E4026E6C9E8D83430B103C725AB8999D0E577EFCC1F7FF8C737E32BC77F367E2DE8CE181D8C24F1C47CA4343CB7ACD87EC43E8A47BE6B47411C2CE9C80E7C0B3981757A7CFC6FEBE4C4C200610296618C3F2684BA3E4E7FC0CF69406C1CD20479378183BD386F879E798A6ADC221FC721B2F1C4BC8F82FF629BDEE2AFF128A3368D0BCF4520C91C7B4BD3408404145190F3FC538CE7340AC86A1E4203F21E5E420C744BE4C53897FFBC22D79DCAF1299B8A550D2CA0EC24A681DF13F0E42CD78DC50F5F4BC366A93BD0DE156899BEB059A71A9C98D70E4E9B3E061E288067783EF522463C316F4A161771788BE9A81838CA206711C07D0DA22FA33AE291A13DEEA8B4A5D3D131FBEFC898261E4D223C2138A111F28E8CFB64E1B9F62FF8E521F882C9E4EC64B13C7BF7E62D72CEDE7E8FCFDED4670A7305BA46033481A9843802D9F0B29CBF6958CD71163FB01C561B9369056C09DCC2346ED0F3074C56F4111CE6F49D69CCDC67EC142DB9717D222E78110CA251023F6F13CF430B0F97FD562B4FF6FF16AEA76FDE0EC2F5163DB9AB74E939FEE03811F8D547ECA5BDF1A31B66EED558EFCF39D92C0A7CF6BB695F59EFE7799044369B4CA0247940D10AD3A67463AB325E2D936650C39B75817AF8A6CD2415CD5B4ACA26B48E27142C76ED0D85BCDBE5AB6D711761088B979A16D3489BC18987D5881B0DB650D154A673A26B3A04A6F477DE096740DEB11BC29F5A9CDB19BD7723FA78895E0A469788E207D7EF2FF1958F5C6F80CD5B830BC44D4B37F271B92EEF037015447ACB7C8FE218F62EE767143F6E5DD3736C2711B8D49C223FDC3AB7FBC780E0DBC45F304FDD1DAFC196E6E16B3043360DA22BC2466D8CF721B0BF0409BD220EB3F04FD4160D5E136010712E6C1BC7F10C8C193BD300AE0505E035A167A7BDE1D896BAEFE069EA21D797474FDCE6FFB920AD22283985104529C86491549BA81F82954BF4442D48D5A266149DA2E6647D4565607A92E6946A4153824E3933AAC162D37485860F4E53D8C38F4E370B37547B414D8D73D821F14F98E008B631E71E518A2352AD80CEBEB18FF0265D3EC674EB6753CAE957E42543B35ACB1BD24D60786F48610FDF1B5231A1F9C9755854A271652B88015E8B5E7E1BECF6394EB25DBB43639ABB66BE9B3D40E52E17711CD86EEA0592645D9E6A69CA0F319CD19D77C966C3E76E606260E82E3BF2A005E666F24675472EB18729362EEC2C993945B18D1C518D3021A78760C5892A11ACCAE13485FB56E009968E233608B14B500C9EEA122ABA854B6C37445EA796B8919A47189B7BC983EFB9C421268C61A7267498CB53364C80920FB7285D1A1A5B358B6B374445D4AA5AF3AE10B65A772193B2139BEC889D157699C76F5B31CC768DEDC038DB55A2238032FDB80F03CDEF2ABA06C05F5C0ECD40B91B93C240F3906A2706DAD4D81E0CB4A9925767A0D9155577FDB9FBEAA19967F3A2BCFB63BD555D7BB0CD863E0ECC34B3D813C650188123D13C2F17AC133F53C9E50CE4CCEF67711EEAF226C2C0E79836533655BC2B8D43AD7610DE88DA002B43EB00CD3F5C0A408243F510AEC8E5B54A9747113D608BBC5B2B6CBEF773B0351B10B1EB1F706B84EACFBCBC716ADD3ECA9995D62018B9D665A1862331087EF36A4E5C4329AABCACA8189D58B84F345C9B58BE182D0AEA885C154A2A2633B8960AD3ECD6922C20EB13926DA4252E7C5268A998CCE05ACA6DB45B4992A0A04758B0918A9A47F840CE56643ACAD3A6EC1B5B595D57DE30B6140560E31B14862E59D50AC2F216639E55834DBF9BF72F93F2330CCB8E25D552A5B425271A446885B95E600D92CEDC28A69788A20562799EA9E30B64D2B355B1FD172CEBC7A7B888C5395050B3BFCBF4195F6ED0386BC56024C798C10C7D16D1A46974C9FACB871BAC400F79289264EEA78197F8441D60A94767DFEFEAE3B31611616C71F20B0194A02D21CC6DAA5E6B6144A7186891CAF865FD855243A8D45D449F7585AB2252354A91A0AAA3A892567B5B385520D36BB1F818B1FF5A75226CC7AFAA529A3A46D5AA8F54D5CAD491AA567DA4BC58A60E9337F5C4A8D55B0860B53E7DD466494C1DB3D9A38FC8D5BDD421B9AE1E52D6AB5B1A42D63BD6C25368544EA1CF41AC67A9A38BBDFAC892CA963AB4A47B0D6C89CC7C9F3EAAA4F8A50E2CE9D6C7AE2A61F88DFD804F53E56D6AEDE334BB706F769E2A30B6B34B0F731CD7EA0AEA40B5E69E5879E5800096B71FA435296F9D6B5B539667D9CC9A1418EA9DA7F145BEB9F1B49611A8311B9FD91B9B7B5B99811AAF9FCD6ED532844B274F52722F2F9FDC25739C5FF8BA9F220937C08CC4340A35C2C1FE1253EC8F18C168FE9B37F55CCCB6F182E006117789639A959698A7C727A7DC6BA6C3795964C5B1E3492ECCAAE745CD35DB419518794291FD8822B1666383D73715A8900EBF260E7E9E98BFA7A3CED3CC0AFB2B6D3E32AEE34FC4FD2D818E8728C1C61F620DEA30AF1134DEBF9482FEF12A1E96E8ABFCFA3F9FB3A147C65D04EE746E1C738A5E67F99BCF4D7A49930DDD409AB51FA1BC5E6FE35F7814C0FFF4D1F3BFEA68EBBCE27020D4A71BBFE290CE95F3E1F51F6D2C5C3AC8838D8D14277D94B111A2E4E1C5507883A850F5B0621D2CE5A30A99FDE94C56FEC8621DD1940F2C5CD21F8C7F5EA1BF391623F7783A4AAE71BBD828533D7796A76F54ABBAEF1353A862DFC8D1C54AF51E708356A36F1638BDB22AEFC10E744911F760D8FBB4FBAD576E1F4AB1767595D86F8DF62ECBB25B3EBDFDADAAB10FA07E50520FB5FF9AEB5DDB9A2A2F7DE085ABFD2AAB0FCCD8F2637EFFF5D3BB363655DAFAC08DAD5795F481D9DABECECF3D5B9AF611BAF79A67B17C4BF17D4996DBEEAA69CE3E04C0F57F118011641165F614555E44D75600DCC1B02251335557EFF18C05C711F80A14ED6CFBCD353FF05B279BD3B4B355D4BCB6F1CEF7FF56DE394D3B6F4525E93EAAB1A5B59CB20AF98E7DACADD0EC35555F3766D251ECDF15B3B6160BBCA662EB4194D2F01EC537EFD7535B3D884A86749D1EB5D4E2E76B383B6BFFDE269CDFB1BBAA20D8BFBE49B0DD38354B9A6BB20C8AC39B93A820E13234379822078ED48B88BA4B6453E86609E8F42D7D9AD4639F4116D8B92677090D130A53C6FEC26B24BC5810D0C63F2D186FCA3CBE0BD9AF78882980982E4BDCDF91F789EB39A5DC33494E4801C1A28B3CDDCBD692B2B4EFEAA544BA0D882650AEBE32287AC07EE801587C47E6E809AF231B98DF07BC42F64B95015481742F4453EDE34B17AD22E4C73946351E7E820D3BFEF30FFF079213CD6276560000, N'6.2.0-61023')
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [BirthDay], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'124c72a7-b945-432d-a928-4df182676fba', NULL, CAST(N'2019-05-19T08:51:17.543' AS DateTime), N'admin@gmail.com', 0, N'AG6E0sz9aJiNFr5jzM5rb0EgvWn5XDHm0rSeh0g5QXdQ2VVq6BxVm3bHAB7un16nIA==', N'1242d10b-b521-435a-be79-0478253f399d', NULL, 0, 0, NULL, 1, 0, N'admin@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [BirthDay], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'422b2631-98c3-4903-bcc3-eb70b43ce2f2', NULL, CAST(N'2019-05-17T23:02:09.540' AS DateTime), N'xuanla87@gmail.com', 0, N'AOetuI6MdvOOb++XMggSRxb+Tn+yJ3QzghSQOQeut9VBBE6O9wrJv95EvBNaG4Fb+Q==', N'20d62755-8b67-49ad-975f-4a788ca93a4a', NULL, 0, 0, NULL, 1, 0, N'xuanla87@gmail.com')
SET IDENTITY_INSERT [dbo].[ConfigSystem] ON 

INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (1, N'DanhMucChinh', N'1', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (2, N'SiteBanner', N'/ckfinder/userfiles/images/banner.jpg', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (3, N'SiteContact', NULL, 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (4, N'SiteDescription', NULL, 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (5, N'SiteEmail', NULL, 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (6, N'SiteFooterInfo', N'<p>TRƯỜNG ĐẠI HỌC THỂ DỤC THỂ THAO BẮC NINH</p>

<p>Địa chỉ: Đường Nguyễn Văn Cừ, Phường Trang Hạ</p>
', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (7, N'SiteKeywords', NULL, 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (8, N'SiteTitle', NULL, 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (1002, N'BoxMedia', N'2', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (1003, N'BoxPhongSuAnh', N'2', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (1004, N'BoxSachVaHocLieu', N'2', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (1005, N'BoxTinTucChung', N'2', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (1006, N'BoxTinTucNganh', N'2', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (1007, N'BoxLienKet', N'10031', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (1008, N'BoxSlider', N'10034', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (1009, N'BoxBanner', N'10036', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (1010, N'SiteAbout', N'<p>Trưởng ban bi&ecirc;n t&acirc;p:&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; PGS.TS. Nguyễn Văn Ph&uacute;c</p>
', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (2008, N'DanhMucPhai', N'1', 0)
INSERT [dbo].[ConfigSystem] ([configId], [configKey], [configValue], [isTrash]) VALUES (2009, N'BoxBannerRight', N'10036', 0)
SET IDENTITY_INSERT [dbo].[ConfigSystem] OFF
SET IDENTITY_INSERT [dbo].[Contents] ON 

INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (2, N'Tin tức - sự kiện', N'tin-tuc-su-kien-0', NULL, NULL, NULL, NULL, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:05:11.550' AS DateTime), CAST(N'2019-05-19T09:05:11.550' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (3, N'Thông tin tuyển sinh', N'thong-tin-tuyen-sinh-3', NULL, NULL, NULL, NULL, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:24:49.153' AS DateTime), CAST(N'2019-05-19T09:24:49.153' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (4, N'Đào tạo ngắn hạn', N'dao-tao-ngan-han-4', NULL, NULL, NULL, 3, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:27:03.670' AS DateTime), CAST(N'2019-05-19T09:27:03.670' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (5, N'Đào tạo phổng thông', N'dao-tao-phong-thong-5', NULL, NULL, NULL, 3, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:27:17.823' AS DateTime), CAST(N'2019-05-19T09:27:17.823' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (6, N'Đại học', N'dai-hoc-6', NULL, NULL, NULL, 3, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:27:33.940' AS DateTime), CAST(N'2019-05-19T09:27:33.940' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (7, N'Vừa học vừa làm', N'vua-hoc-vua-lam-7', NULL, NULL, NULL, 3, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:27:55.213' AS DateTime), CAST(N'2019-05-19T09:27:55.213' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (8, N'Sau đại học', N'sau-dai-hoc-8', NULL, NULL, NULL, 3, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:28:05.153' AS DateTime), CAST(N'2019-05-19T09:28:05.153' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (9, N'Thông báo chung', N'thong-bao-chung-9', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:28:35.310' AS DateTime), CAST(N'2019-05-19T09:28:35.310' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10, N'Ngành giáo dục thể chất', N'nganh-giao-duc-the-chat-10', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:28:54.750' AS DateTime), CAST(N'2019-05-19T09:28:54.750' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (11, N'Ngành huyến luyện thể thao', N'nganh-huyen-luyen-the-thao-11', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:29:10.130' AS DateTime), CAST(N'2019-05-19T09:29:10.130' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (12, N'Ngành Y sinh học Thể dục thể thao', N'nganh-y-sinh-hoc-the-duc-the-thao-12', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:29:25.980' AS DateTime), CAST(N'2019-05-19T09:29:25.980' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (13, N'Ngành Quản lý Thể dục thể thao', N'nganh-quan-ly-the-duc-the-thao-13', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:29:33.697' AS DateTime), CAST(N'2019-05-19T09:29:33.697' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (14, N'Chuyên ngành Bóng bàn', N'chuyen-nganh-bong-ban-14', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:29:41.333' AS DateTime), CAST(N'2019-05-19T09:29:41.333' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (15, N'Chuyên ngành Bóng chuyền', N'chuyen-nganh-bong-chuyen-15', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:29:47.533' AS DateTime), CAST(N'2019-05-19T09:29:47.533' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (16, N'Chuyên ngành Bóng đá, đá cầu', N'chuyen-nganh-bong-da-da-cau-16', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:29:53.933' AS DateTime), CAST(N'2019-05-19T09:29:53.933' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (17, N'Chuyên ngành Bóng ném', N'chuyen-nganh-bong-nem-17', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:30:02.320' AS DateTime), CAST(N'2019-05-19T09:30:02.320' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (18, N'Chuyên ngành Bóng rổ', N'chuyen-nganh-bong-ro-18', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:30:18.187' AS DateTime), CAST(N'2019-05-19T09:30:18.187' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (19, N'Chuyên ngành Bắn súng - Bắn cung', N'chuyen-nganh-ban-sung-ban-cung-19', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:30:30.357' AS DateTime), CAST(N'2019-05-19T09:30:30.357' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (20, N'Chuyên ngành Cầu lông', N'chuyen-nganh-cau-long-20', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:30:37.983' AS DateTime), CAST(N'2019-05-19T09:30:37.983' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (21, N'Chuyên ngành Cờ', N'chuyen-nganh-co-21', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:30:44.317' AS DateTime), CAST(N'2019-05-19T09:30:44.317' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (22, N'Chuyên ngành Cử tạ', N'chuyen-nganh-cu-ta-22', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:30:50.660' AS DateTime), CAST(N'2019-05-19T09:30:50.660' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (23, N'Chuyên ngành Đấu kiếm', N'chuyen-nganh-dau-kiem-23', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:30:57.000' AS DateTime), CAST(N'2019-05-19T09:30:57.000' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (24, N'Chuyên ngành Golf', N'chuyen-nganh-golf-24', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:31:03.053' AS DateTime), CAST(N'2019-05-19T09:31:03.053' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (25, N'Chuyên ngành Quần vợt', N'chuyen-nganh-quan-vot-25', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:31:09.770' AS DateTime), CAST(N'2019-05-19T09:31:09.770' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (26, N'Chuyên ngành Thể dục', N'chuyen-nganh-the-duc-26', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:31:16.760' AS DateTime), CAST(N'2019-05-19T09:31:16.760' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (27, N'Chuyên ngành Thể thao dưới nước', N'chuyen-nganh-the-thao-duoi-nuoc-27', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:31:23.590' AS DateTime), CAST(N'2019-05-19T09:31:23.590' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (28, N'Chuyên ngành Vật - Judo', N'chuyen-nganh-vat-judo-28', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:31:33.950' AS DateTime), CAST(N'2019-05-19T09:31:33.950' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (29, N'Chuyên ngành Võ - Quyền Anh', N'chuyen-nganh-vo-quyen-anh-29', NULL, NULL, NULL, 6, N'CHUYENMUCTINTUC     ', CAST(N'2019-05-19T09:31:45.100' AS DateTime), CAST(N'2019-05-19T09:31:45.100' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (30, N'Phòng Hành chính, Tổng hợp', N'phong-hanh-chinh-tong-hop-30', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:25:28.057' AS DateTime), CAST(N'2019-05-19T10:25:28.057' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (31, N'Phòng Đào tạo, Quản lý Khoa học và Hợp tác quốc tế', N'phong-dao-tao-quan-ly-khoa-hoc-va-hop-tac-quoc-te-31', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:25:39.013' AS DateTime), CAST(N'2019-05-19T10:25:39.013' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (32, N'Phòng Khảo thí và đảm bảo chất lượng giáo dục', N'phong-khao-thi-va-dam-bao-chat-luong-giao-duc-32', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:25:47.953' AS DateTime), CAST(N'2019-05-19T10:25:47.953' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (33, N'Phòng Công tác học sinh, sinh viên', N'phong-cong-tac-hoc-sinh-sinh-vien-33', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:25:56.067' AS DateTime), CAST(N'2019-05-19T10:25:56.067' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (34, N'Khoa Giáo dục thể chất', N'khoa-giao-duc-the-chat-34', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:26:06.543' AS DateTime), CAST(N'2019-05-19T10:26:06.543' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 4, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (35, N'Khoa Huấn luyện thể thao', N'khoa-huan-luyen-the-thao-35', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:26:15.237' AS DateTime), CAST(N'2019-05-19T10:26:15.237' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 5, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (36, N'Khoa Y sinh học Thể dục thể thao', N'khoa-y-sinh-hoc-the-duc-the-thao-36', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:26:25.313' AS DateTime), CAST(N'2019-05-19T10:26:25.313' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (37, N'Khoa Quản lý Thể dục thể thao', N'khoa-quan-ly-the-duc-the-thao-37', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:26:34.720' AS DateTime), CAST(N'2019-05-19T10:26:34.720' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (38, N'Khoa Kiến thức và kỹ năng cơ sở ngành', N'khoa-kien-thuc-va-ky-nang-co-so-nganh-38', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:26:42.127' AS DateTime), CAST(N'2019-05-19T10:26:42.127' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (39, N'Khoa Kiến thức cơ bản', N'khoa-kien-thuc-co-ban-39', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:26:48.710' AS DateTime), CAST(N'2019-05-19T10:26:48.710' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (40, N'Viện Khoa học và Công nghệ Thể dục thể thao', N'vien-khoa-hoc-va-cong-nghe-the-duc-the-thao-40', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:26:54.753' AS DateTime), CAST(N'2019-05-19T10:26:54.753' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (41, N'Trường Phổ thông năng khiếu Thể dục thể thao Olympic', N'truong-pho-thong-nang-khieu-the-duc-the-thao-olympic-41', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:27:01.537' AS DateTime), CAST(N'2019-05-19T10:27:01.537' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (42, N'Tạp chí Khoa học Đào tạo và Huấn luyện thể thao', N'tap-chi-khoa-hoc-dao-tao-va-huan-luyen-the-thao-42', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:27:08.093' AS DateTime), CAST(N'2019-05-19T10:27:08.093' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (43, N'Trung tâm Thông tin, Thư viện', N'trung-tam-thong-tin-thu-vien-43', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:27:14.423' AS DateTime), CAST(N'2019-05-19T10:27:14.423' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (44, N'Trung tâm Đào tạo vận động viên', N'trung-tam-dao-tao-van-dong-vien-44', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:27:20.810' AS DateTime), CAST(N'2019-05-19T10:27:20.810' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (45, N'Trung tâm Giáo dục quốc phòng và An ninh', N'trung-tam-giao-duc-quoc-phong-va-an-ninh-45', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:27:26.667' AS DateTime), CAST(N'2019-05-19T10:27:26.667' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (46, N'Trung tâm Ngoại ngữ, Tin học', N'trung-tam-ngoai-ngu-tin-hoc-46', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:27:33.143' AS DateTime), CAST(N'2019-05-19T10:27:33.143' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (47, N'Bộ môn Bóng chuyền', N'bo-mon-bong-chuyen-47', NULL, NULL, NULL, 34, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:41:58.763' AS DateTime), CAST(N'2019-05-19T10:41:58.763' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (48, N'Bộ môn Cờ', N'bo-mon-co-48', NULL, NULL, NULL, 34, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:43:39.773' AS DateTime), CAST(N'2019-05-19T10:43:39.773' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (49, N'Bộ môn Golf', N'bo-mon-golf-49', NULL, NULL, NULL, NULL, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:43:50.807' AS DateTime), CAST(N'2019-05-19T10:43:50.807' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 6, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (50, N'Bộ môn Golf', N'bo-mon-golf-50', NULL, NULL, NULL, 34, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:44:15.977' AS DateTime), CAST(N'2019-05-19T10:44:15.977' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (51, N'Bộ môn Bóng rổ', N'bo-mon-bong-ro-51', NULL, NULL, NULL, 34, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:44:22.667' AS DateTime), CAST(N'2019-05-19T10:44:22.667' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (52, N'Bộ môn Bóng đá, đá cầu', N'bo-mon-bong-da-da-cau-52', NULL, NULL, NULL, 34, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:44:28.167' AS DateTime), CAST(N'2019-05-19T10:44:28.167' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (53, N'Bộ môn Bóng ném', N'bo-mon-bong-nem-53', NULL, NULL, NULL, 34, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:44:40.287' AS DateTime), CAST(N'2019-05-19T10:44:40.287' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (54, N'Lịch công tác chung', N'lich-cong-tac-chung-54', NULL, NULL, NULL, 34, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:44:54.677' AS DateTime), CAST(N'2019-05-19T10:44:54.677' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (55, N'Lịch công tác chung', N'lich-cong-tac-chung-55', NULL, NULL, NULL, 35, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:45:09.333' AS DateTime), CAST(N'2019-05-19T10:45:09.333' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (56, N'Bộ môn Cầu lông', N'bo-mon-cau-long-56', NULL, NULL, NULL, 35, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:45:15.293' AS DateTime), CAST(N'2019-05-19T10:45:15.293' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (57, N'Bộ môn Bóng bàn', N'bo-mon-bong-ban-57', NULL, NULL, NULL, 35, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:45:23.283' AS DateTime), CAST(N'2019-05-19T10:45:23.283' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (58, N'Bộ môn Vật - Judo', N'bo-mon-vat-judo-58', NULL, NULL, NULL, 35, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:45:33.773' AS DateTime), CAST(N'2019-05-19T10:45:33.773' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (59, N'Bộ môn Võ - Quyền Anh', N'bo-mon-vo-quyen-anh-59', NULL, NULL, NULL, 35, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:45:42.500' AS DateTime), CAST(N'2019-05-19T10:45:42.500' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (60, N'Bộ môn Đấu kiếm', N'bo-mon-dau-kiem-60', NULL, NULL, NULL, 35, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:45:48.173' AS DateTime), CAST(N'2019-05-19T10:45:48.173' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (61, N'Bộ môn Quần vợt', N'bo-mon-quan-vot-61', NULL, NULL, NULL, 35, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:45:53.520' AS DateTime), CAST(N'2019-05-19T10:45:53.520' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (62, N'Bộ môn Bắn súng - Bắn cung', N'bo-mon-ban-sung-ban-cung-62', NULL, NULL, NULL, 35, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:46:02.560' AS DateTime), CAST(N'2019-05-19T10:46:02.560' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (63, N'Lịch công tác chung', N'lich-cong-tac-chung-63', NULL, NULL, NULL, 36, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:46:15.497' AS DateTime), CAST(N'2019-05-19T10:46:15.497' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (64, N'Bộ môn Hồi phục TDTT & Sức khỏe', N'bo-mon-hoi-phuc-tdtt-suc-khoe-64', NULL, NULL, NULL, 36, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:46:21.383' AS DateTime), CAST(N'2019-05-19T10:46:21.383' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (65, N'Bộ môn Y học TDTT', N'bo-mon-y-hoc-tdtt-65', NULL, NULL, NULL, 36, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:46:26.817' AS DateTime), CAST(N'2019-05-19T10:46:26.817' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (66, N'Bộ môn Khoa học sinh học', N'bo-mon-khoa-hoc-sinh-hoc-66', NULL, NULL, NULL, 36, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:46:32.643' AS DateTime), CAST(N'2019-05-19T10:46:32.643' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (67, N'Bộ môn Quản lý TDTT', N'bo-mon-quan-ly-tdtt-67', NULL, NULL, NULL, 37, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:47:01.160' AS DateTime), CAST(N'2019-05-19T10:47:01.160' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (68, N'Bộ môn Kinh tế TDTT', N'bo-mon-kinh-te-tdtt-68', NULL, NULL, NULL, 37, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:47:06.837' AS DateTime), CAST(N'2019-05-19T10:47:06.837' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (69, N'Bộ môn Xã hội học, truyền thông TDTT', N'bo-mon-xa-hoi-hoc-truyen-thong-tdtt-69', NULL, NULL, NULL, 37, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:47:12.987' AS DateTime), CAST(N'2019-05-19T10:47:12.987' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (70, N'Lịch công tác chung', N'lich-cong-tac-chung-70', NULL, NULL, NULL, 38, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:47:26.840' AS DateTime), CAST(N'2019-05-19T10:47:26.840' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (71, N'Bộ môn Điền kinh', N'bo-mon-dien-kinh-71', NULL, NULL, NULL, 38, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:47:32.243' AS DateTime), CAST(N'2019-05-19T10:47:32.243' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (72, N'Bộ môn Cử tạ', N'bo-mon-cu-ta-72', NULL, NULL, NULL, 38, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:47:37.990' AS DateTime), CAST(N'2019-05-19T10:47:37.990' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (73, N'Bộ môn Thể dục', N'bo-mon-the-duc-73', NULL, NULL, NULL, 38, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:47:44.870' AS DateTime), CAST(N'2019-05-19T10:47:44.870' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (74, N'Bộ môn Thể thao dưới nước', N'bo-mon-the-thao-duoi-nuoc-74', NULL, NULL, NULL, 38, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:47:50.163' AS DateTime), CAST(N'2019-05-19T10:47:50.163' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (75, N'Bộ môn Lý luận và Phương pháp TDTT', N'bo-mon-ly-luan-va-phuong-phap-tdtt-75', NULL, NULL, NULL, 38, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:47:56.453' AS DateTime), CAST(N'2019-05-19T10:47:56.453' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (76, N'Lịch công tác chung', N'lich-cong-tac-chung-76', NULL, NULL, NULL, 39, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:48:06.037' AS DateTime), CAST(N'2019-05-19T10:48:06.037' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (77, N'Bộ môn Lý luận chính trị', N'bo-mon-ly-luan-chinh-tri-77', NULL, NULL, NULL, 39, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:48:11.953' AS DateTime), CAST(N'2019-05-19T10:48:11.953' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (78, N'Bộ môn Ngoại ngữ', N'bo-mon-ngoai-ngu-78', NULL, NULL, NULL, 39, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:48:17.750' AS DateTime), CAST(N'2019-05-19T10:48:17.750' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (79, N'Bộ môn Toán tin', N'bo-mon-toan-tin-79', NULL, NULL, NULL, 39, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:48:23.247' AS DateTime), CAST(N'2019-05-19T10:48:23.247' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (80, N'Bộ môn Tâm lý, Giáo dục TDTT', N'bo-mon-tam-ly-giao-duc-tdtt-80', NULL, NULL, NULL, 39, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:48:30.107' AS DateTime), CAST(N'2019-05-19T10:48:30.107' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (81, N'Lịch công tác chung', N'lich-cong-tac-chung-81', NULL, NULL, NULL, 37, N'DONVIPHONGKHOA', CAST(N'2019-05-19T10:50:31.930' AS DateTime), CAST(N'2019-05-19T10:50:31.930' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (82, N'Đào tạo phổ thông', N'dao-tao-pho-thong-82', NULL, NULL, NULL, NULL, N'CHUYENMUCDAOTAO', CAST(N'2019-05-19T11:23:54.693' AS DateTime), CAST(N'2019-05-19T11:23:54.693' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (83, N'Đào tạo đại học', N'dao-tao-dai-hoc-83', NULL, NULL, NULL, NULL, N'CHUYENMUCDAOTAO', CAST(N'2019-05-19T11:24:06.830' AS DateTime), CAST(N'2019-05-19T11:24:06.830' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (84, N'Đào tạo thạc sĩ', N'dao-tao-thac-si-84', NULL, NULL, NULL, NULL, N'CHUYENMUCDAOTAO', CAST(N'2019-05-19T11:24:14.807' AS DateTime), CAST(N'2019-05-19T11:24:14.807' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (85, N'Đào tạo tiến sĩ', N'dao-tao-tien-si-85', NULL, NULL, NULL, NULL, N'CHUYENMUCDAOTAO', CAST(N'2019-05-19T11:24:22.533' AS DateTime), CAST(N'2019-05-19T11:24:22.533' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (86, N'Đào tạo ngắn hạn', N'dao-tao-ngan-han-86', NULL, NULL, NULL, NULL, N'CHUYENMUCDAOTAO', CAST(N'2019-05-19T11:24:30.117' AS DateTime), CAST(N'2019-05-19T11:24:30.117' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (87, N'Liên kết đào tạo', N'lien-ket-dao-tao-87', NULL, NULL, NULL, NULL, N'CHUYENMUCDAOTAO', CAST(N'2019-05-19T11:24:36.710' AS DateTime), CAST(N'2019-05-19T11:24:36.710' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (88, N'Đào tạo Vận động viên', N'dao-tao-van-dong-vien-88', NULL, NULL, NULL, NULL, N'CHUYENMUCDAOTAO', CAST(N'2019-05-19T11:24:42.880' AS DateTime), CAST(N'2019-05-19T11:24:42.880' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (89, N'KHOA HỌC & CÔNG NGHỆ', N'khoa-hoc-cong-nghe-89', NULL, NULL, NULL, NULL, N'CHUYENMUCTINTUC', CAST(N'2019-05-19T11:24:53.947' AS DateTime), CAST(N'2019-05-19T11:24:53.947' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10030, N'Phóng sự ảnh', N'phong-su-anh-10030', NULL, NULL, NULL, NULL, N'CHUYENMUCTINTUC', CAST(N'2019-05-19T16:48:33.227' AS DateTime), CAST(N'2019-05-19T16:48:33.227' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10031, N'Liên kết', N'lien-ket-10031', NULL, NULL, NULL, NULL, N'BANNER', CAST(N'2019-05-19T17:42:47.940' AS DateTime), CAST(N'2019-05-19T17:42:47.940' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10032, N'Trang thể dục thể thao việt nam', N'trang-the-duc-the-thao-viet-nam-10032', NULL, NULL, N'/ckfinder/userfiles/images/bannerquanlydaotao.jpg', 10031, N'BANNER', CAST(N'2019-05-19T17:43:17.560' AS DateTime), CAST(N'2019-05-19T17:43:17.560' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10033, N'Bộ văn hóa thể thao và du lịch', N'bo-van-hoa-the-thao-va-du-lich-10033', NULL, NULL, N'/ckfinder/userfiles/images/bannerquanlydaotao.jpg', 10031, N'BANNER', CAST(N'2019-05-19T17:43:57.087' AS DateTime), CAST(N'2019-05-19T17:43:57.087' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10034, N'Slider Chính', N'slider-chinh-10034', NULL, NULL, NULL, NULL, N'BANNER', CAST(N'2019-05-19T20:38:42.867' AS DateTime), CAST(N'2019-05-19T20:38:42.867' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10035, N'Ảnh trường', N'anh-truong-10035', NULL, NULL, N'/ckfinder/userfiles/images/banner2.jpg', 10034, N'BANNER', CAST(N'2019-05-19T20:42:19.900' AS DateTime), CAST(N'2019-05-19T20:42:19.900' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10036, N'Banner 1', N'banner-1-10036', NULL, NULL, NULL, NULL, N'BANNER', CAST(N'2019-05-19T21:10:16.183' AS DateTime), CAST(N'2019-05-19T21:10:16.183' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10037, N'Thông tin tuyển sinh', N'thong-tin-tuyen-sinh-10037', NULL, NULL, N'/ckfinder/userfiles/images/bannertuyensing.jpg', 10036, N'BANNER', CAST(N'2019-05-19T21:10:36.737' AS DateTime), CAST(N'2019-05-19T21:10:36.737' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10038, N'Quản lý đào tạo', N'quan-ly-dao-tao-10038', NULL, NULL, N'/ckfinder/userfiles/images/bannerquanlydaotao.jpg', 10036, N'BANNER', CAST(N'2019-05-19T21:15:55.540' AS DateTime), CAST(N'2019-05-19T21:15:55.540' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 5, 2, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10039, N'Thười khóa biểu', N'thuoi-khoa-bieu-10039', NULL, NULL, N'/ckfinder/userfiles/images/bannerquanlydaotao.jpg', 10036, N'BANNER', CAST(N'2019-05-19T21:20:50.757' AS DateTime), CAST(N'2019-05-19T21:20:50.757' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10040, N'Khai mạc Huấn luyện tự vệ năm 2019', N'khai-mac-huan-luyen-tu-ve-nam-2019-10040', NULL, N'<p style="text-align:start"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="background-color:white"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">S&aacute;ng 16/0</span></span></span></span><span style="font-size:12pt"><span style="background-color:white"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">5</span></span></span></span><span style="font-size:12pt"><span style="background-color:white"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">/201</span></span></span></span><span style="font-size:12pt"><span style="background-color:white"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">9</span></span></span></span><span style="font-size:12pt"><span style="background-color:white"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;tại Hội trường A, Trường Đại học TDTT Bắc Ninh đ&atilde; tổ chức khai mạc&nbsp; Huấn luyện tự vệ&nbsp; năm 201</span></span></span></span><span style="font-size:12pt"><span style="background-color:white"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">9</span></span></span></span><span style="font-size:12pt"><span style="background-color:white"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">.</span></span></span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif">Tham dự buổi Lễ khai mạc c&oacute; Thiếu t&aacute;&nbsp;&nbsp;Nguyễn Văn Vinh -&nbsp;&nbsp;Phụ tr&aacute;ch Huấn luyện tự vệ Ban chỉ huy Qu&acirc;n sự Thị x&atilde; Từ Sơn; ThS. Nguyễn Anh Tuấn - Ph&oacute; B&iacute; thư Đảng ủy, Ph&oacute; Hiệu trưởng Trường Cao đẳng C&ocirc;ng nghiệp Hưng Y&ecirc;n cơ sở 2.</span></span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="background-color:white"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Về ph&iacute;a Nh&agrave; trường c&oacute; PGS.TS Đỗ Hữu Trường &ndash; Ph&oacute; hiệu trưởng, Ch&iacute;nh trị vi&ecirc;n Ban CHQS Trường Đại học TDTT Bắc Ninh v&agrave; 30&nbsp;&nbsp;chiến sĩ Tự vệ của Trường Đại học TDTT Bắc Ninh v&agrave;&nbsp;</span></span></span></span><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif">Trường Cao đẳng C&ocirc;ng nghiệp Hưng Y&ecirc;n cơ sở 2&nbsp;<span style="color:black">tham gia Huấn luyện tại Cụm số 03.</span></span></span></span></span></span></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<div style="text-align:center"><span style="font-size:8pt"><span style="font-family:verdana"><img src="http://www.upes1.edu.vn/DesktopModules/Followmesoft.Newspaper/ResourceDownload.aspx?ResourceID=11727" style="border:none" /></span></span></div>

<div style="text-align:center"><span style="font-size:8pt"><span style="font-family:verdana"><span style="font-size:x-small"><span style="font-family:arial"><span style="color:blue">PGS.TS Đỗ Hữu Trường ph&aacute;t biểu tại Lễ khai mạc</span></span></span></span></span></div>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="background-color:white"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">PGS.TS Đỗ Hữu Trường &ndash; Ph&oacute; hiệu trưởng, Ch&iacute;nh trị vi&ecirc;n Ban CHQS Trường Đại học TDTT Bắc Ninh ph&aacute;t biểu tại buổi Lễ: &ldquo;Để x&acirc;y dựng lực lượng d&acirc;n qu&acirc;n tự vệ vững mạnh, rộng khắp đ&aacute;p ứng y&ecirc;u cầu, nhiệm vụ x&acirc;y dựng v&agrave; bảo vệ tổ quốc trong t&igrave;nh h&igrave;nh mới, t&ocirc;i đề nghị c&aacute;c đồng ch&iacute; cần tập trung thực hiện tốt một số nhiệm vụ sau đ&acirc;y:</span></span></span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><u><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Một l&agrave;</span></span></span></u><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">:&nbsp; Tiếp tục tuy&ecirc;n truyền s&acirc;u rộng trong c&aacute;c tầng lớp c&aacute;n bộ c&ocirc;ng chức, vi&ecirc;n chức, c&ocirc;ng nh&acirc;n vi&ecirc;n trong to&agrave;n trường về c&ocirc;ng t&aacute;c quốc ph&ograve;ng, qu&acirc;n sự địa phương; đặc biệt l&agrave; tuy&ecirc;n truyền Luật D&acirc;n qu&acirc;n tự vệ, c&aacute;c nghị định, th&ocirc;ng tư v&agrave; chỉ thị, nghị quyết của Đảng v&agrave; Nh&agrave; nước, Ch&iacute;nh phủ, Bộ Quốc ph&ograve;ng...</span></span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><u><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Hai l&agrave;</span></span></span></u><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">: Tăng cường sự l&atilde;nh đạo của c&aacute;c cấp ủy Đảng v&agrave; sự quản l&yacute; điều h&agrave;nh của Ban chỉ huy qu&acirc;n sự Nh&agrave; trường đối với lực lượng d&acirc;n qu&acirc;n tự vệ. Thực hiện tốt nhiệm vụ quốc ph&ograve;ng, qu&acirc;n sự địa phương trong năm 2019.</span></span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><u><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Ba l&agrave;:</span></span></span></u><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;L&agrave;m tốt c&ocirc;ng t&aacute;c x&acirc;y dựng lực lượng d&acirc;n qu&acirc;n tự vệ theo phương ch&acirc;m &ldquo;Vững mạnh, rộng khắp&rdquo;. Tổ chức bi&ecirc;n chế lực lượng d&acirc;n qu&acirc;n tự vệ c&oacute; số lượng, trang bị ph&ugrave; hợp với đặc điểm, t&igrave;nh h&igrave;nh của Nh&agrave; trường. Coi trọng c&ocirc;ng t&aacute;c gi&aacute;o dục tư tưởng, n&acirc;ng cao chất lượng huấn luyện vi&ecirc;n.</span></span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><u><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Bốn l&agrave;:&nbsp;</span></span></span></u><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Tổ chức duy tr&igrave; huấn luyện chặt chẽ, đảm bảo an to&agrave;n tuyệt đối trước trong v&agrave; sau khi huấn luyện. Duy tr&igrave; nghi&ecirc;m t&uacute;c về mặt thời gian, Kế hoạch, tiến tr&igrave;nh huấn luyện đ&atilde; được ph&ecirc; duyệt.</span></span></span></span></span></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<div>&nbsp;</div>

<div style="text-align:center"><span style="font-size:8pt"><span style="font-family:verdana"><img src="http://www.upes1.edu.vn/DesktopModules/Followmesoft.Newspaper/ResourceDownload.aspx?ResourceID=11728" style="border:none" /></span></span></div>

<div style="text-align:center"><span style="font-size:8pt"><span style="font-family:verdana"><span style="font-size:x-small"><span style="font-family:arial"><span style="color:blue">PGS.TS. Đỗ Hữu Trường, ThS. Nguyễn Anh Tuấn chụp ảnh lưu niệm với c&aacute;c chiễn sỹ Huấn luyện tự vệ của hai cơ quan</span></span></span></span></span></div>

<p><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="background-color:white"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Lớp Huấn luyện chiến sĩ tự vệ cụm III năm 2019 diễn ra trong 07 ng&agrave;y, từ ng&agrave;y 16/05-23/05 với c&aacute;c nội dung học tập như: Ph&ograve;ng chống chiến lược diễn biến h&ograve;a b&igrave;nh của c&aacute;c thế lực th&ugrave; địch chống ph&aacute; c&aacute;ch mạng Việt Nam; T&igrave;nh h&igrave;nh kinh tế ch&iacute;nh trị, văn h&oacute;a x&atilde; hội quốc ph&ograve;ng an ninh của địa phương, Nội dung; D&acirc;n qu&acirc;n tự vệ l&agrave;m c&ocirc;ng t&aacute;c vận động quần ch&uacute;ng, tham gia x&acirc;y dựng cơ sở ch&iacute;nh trị ở địa phương; Nội dung cơ bản của ph&aacute;p luật về D&acirc;n qu&acirc;n tự vệ; C&aacute;ch sử dụng s&uacute;ng, quy tắc bắn s&uacute;ng v&agrave; huấn luyện bắn s&uacute;ng trường K63; Động t&aacute;c đi đều, đứng lại, đổi ch&acirc;n trong khi đi; N&eacute;m lựu đạn xa đ&uacute;ng hướng; Tay kh&ocirc;ng đ&aacute;nh giặc; Một số loại vũ kh&iacute; tự tạo; quan điểm của Đảng v&agrave; Nh&agrave; nước x&acirc;y dựng nh&agrave; nước trong t&igrave;nh h&igrave;nh mới....</span></span></span></span></span></span></span></span></p>
', N'/ckfinder/userfiles/images/kich%20no1.jpg', 2, N'TINTUC', CAST(N'2019-05-01T00:00:00.000' AS DateTime), CAST(N'2019-05-19T22:31:11.407' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 1, 0, 0, 1, NULL)
GO
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10041, N'Giải "Cầu lông công nhân viên chức lao động năm 2019" của liên đoàn lao động Thị xã Từ Sơn', N'giai-cau-long-cong-nhan-vien-chuc-lao-dong-nam-2019-cua-lien-doan-lao-dong-thi-xa-tu-son-10041', NULL, N'<p style="margin-left:-1px; margin-right:-1px; text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Trong kh&ocirc;ng kh&iacute; cả nước đang ra sức thi đua lập th&agrave;nh t&iacute;ch ch&agrave;o mừng th&aacute;ng c&ocirc;ng nh&acirc;n v&agrave; kỷ niệm 90 năm ng&agrave;y th&agrave;nh lập C&ocirc;ng đo&agrave;n Việt Nam. Tại Nh&agrave; tập Cầu L&ocirc;ng, Trường Đại học TDTT Bắc Ninh đ&atilde; diễn ra giải &ldquo;Cầu l&ocirc;ng c&ocirc;ng nh&acirc;n vi&ecirc;n chức lao động năm 2019&rdquo; của li&ecirc;n đo&agrave;n lao động Thị x&atilde; Từ Sơn.</span></span></span></span></span></span></p>

<p style="margin-left:-1px; margin-right:-1px; text-align:justify">&nbsp;</p>

<div><span style="font-size:8pt"><span style="font-family:verdana"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><img src="http://www.upes1.edu.vn/DesktopModules/Followmesoft.Newspaper/ResourceDownload.aspx?ResourceID=11721" style="border:none" /></span></span></span></span><span style="font-size:8pt"><span style="font-family:verdana"><span style="font-size:12pt"><span style="font-size:x-small"><span style="font-family:arial"><span style="color:blue">&Ocirc;ng Nguyễn Văn To&aacute;n - Ph&oacute; b&iacute; thư thường trực thị ủy Từ Sơn trao cờ lưu niệm cho c&aacute;c đội&nbsp; tham gia giải đấu</span></span></span></span></span></span></div>

<p>&nbsp;</p>

<p style="margin-left:-1px; margin-right:-1px; text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff">&nbsp;</span></span></span></span></p>

<p style="margin-left:-1px; margin-right:-1px; text-align:justify">&nbsp;</p>

<p style="margin-left:-1px; margin-right:-1px; text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:#333333">Tham dự giải &ldquo;Cầu l&ocirc;ng c&ocirc;ng nh&acirc;n vi&ecirc;n chức lao động năm 2019&rdquo; lần n&agrave;y c&oacute; 43 đo&agrave;n với gần 120 vận động vi&ecirc;n đến từ c&aacute;c c&ocirc;ng đo&agrave;n cơ sở. C&aacute;c tay vợt sẽ tranh t&agrave;i ở 10 nội dung với c&aacute;c nh&oacute;m tuổi từ dưới 30 đến tr&ecirc;n 55 tuổi.</span></span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:#333333">Sau một ng&agrave;y thi đấu đầy kịch t&iacute;nh, những trận tranh t&agrave;i, c&aacute;c vận động vi&ecirc;n đ&atilde; cống hiến nhiều pha cầu đẹp mắt, pha cầu kỹ thuật, tinh tế, gay cấn tạo n&ecirc;n những trận đấu hấp dẫn, chất lượng v&agrave; lu&ocirc;n l&ocirc;i cuốn người xem đến tham gia cổ vũ nhiệt t&igrave;nh.</span></span></span></span></span></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<div><span style="font-size:8pt"><span style="font-family:verdana"><img src="http://www.upes1.edu.vn/DesktopModules/Followmesoft.Newspaper/ResourceDownload.aspx?ResourceID=11723" style="border:none" /></span></span><span style="font-size:8pt"><span style="font-family:verdana"><span style="font-size:x-small"><span style="font-family:arial"><span style="color:blue">Vận động vi&ecirc;n Nh&agrave; trường gi&agrave;nh giải nhất nội dung đ&ocirc;i nam nữ 31 tuổi đến 40 tuổi</span></span></span></span></span></div>

<p>&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:#333333">Với sự chuẩn bị chu đ&aacute;o, kỹ lưỡng tr&ecirc;n tinh thần đầu tư luyện tập nghi&ecirc;m t&uacute;c của 14 c&aacute;n bộ Nh&agrave; trường tham gia thi đấu ở 7 nội dung l&agrave;: Đ&ocirc;i nam nữ dưới 30 tuổi, Đ&ocirc;i nam dưới 30 tuổi; đ&ocirc;i nam nữ 31 tuổi đến 40 tuối;&nbsp;&nbsp;đ&ocirc;i nữ 31 tuổi đến 40 tuổi; đ&ocirc;i nam 41 tuổi đến 50 tuổi; đ&ocirc;i nữ 41 tuổi đến 50 tuổi; đ&ocirc;i nam tuổi 51 trở n&ecirc;n. Với kết quả đạt được Đ&ocirc;i nam dưới 30 tuổi giải nhất; đ&ocirc;i nam nữ 31 tuổi đến 40 tuối đạt giải nhất; đ&ocirc;i nữ 31 tuổi đến 40 tuổi đạt giải nhất; Đ&ocirc;i nam nữ dưới 30 tuổi giải nh&igrave;; đ&ocirc;i nam 41 tuổi đến 50 tuổi đạt giải nh&igrave;</span></span></span></span></span></span></span></p>

<p>&nbsp;</p>
', N'/ckfinder/userfiles/images/kich%20no1.jpg', 2, N'TINTUC', CAST(N'2019-05-02T00:00:00.000' AS DateTime), CAST(N'2019-05-19T22:43:34.077' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 39, 0, 0, 1, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10042, N'Nghiên cứu sinh Bùi Trọng Phương bảo vệ thanh công luận án tiến sĩ cấp Trường', N'nghien-cuu-sinh-bui-trong-phuong-bao-ve-thanh-cong-luan-an-tien-si-cap-truong-10042', NULL, N'<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Ng&agrave;y&nbsp;</span></span></span><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">10</span></span></span><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">/</span></span></span><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">05</span></span></span><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">/201</span></span></span><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">9</span></span></span><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">,&nbsp;Trường Đại học Thể dục thể thao Bắc Ninh tổ chức bảo vệ luận &aacute;n tiến sĩ cấp&nbsp;</span></span></span><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Trường</span></span></span><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;cho nghi&ecirc;n cứu sinh (NCS) B&ugrave;i Trọng Phương về đề t&agrave;i:&nbsp;</span></span></span><em><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">&ldquo;</span></span></span></em><strong><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Nghi&ecirc;n cứu nội dung trong phương ph&aacute;p tập luyện theo trạm nhằm ph&aacute;t triển sức mạnh cho sinh vi&ecirc;n nam Học viện An ninh Nh&acirc;n d&acirc;n trong m&ocirc;n v&otilde; thuật c&ocirc;ng an nh&acirc;n d&acirc;n</span></span></span></strong><em><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">&rdquo;&nbsp;</span></span></span></em><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">chuy&ecirc;n ng&agrave;nh Gi&aacute;o dục học&nbsp;&nbsp;m&atilde; số&nbsp;&nbsp;9140101</span></span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Đến dự buổi bảo vệ Luận &aacute;n của NCS&nbsp;B&ugrave;i Trọng Phương&nbsp; c&oacute;: PGS.TS. Trần Đức Dũng - C&aacute;n bộ hướng dẫn 1;&nbsp; TS. Ng&ocirc; &Iacute;ch Qu&acirc;n &ndash; C&aacute;n bộ hướng dẫn&nbsp;</span></span></span><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2; PGS.TS. Đỗ Hữu Trường &ndash; Ph&oacute; hiệu trưởng Trường Đại học TDTT Bắc Ninh; TS. Trương Anh Tuấn &ndash; Nguy&ecirc;n ph&oacute; Hiệu trưởng Trường Đại học TDTT Bắc Ninh c&ugrave;ng c&aacute;c nh&agrave; khoa học<span style="color:black">, c&aacute;c tiến sỹ đang c&ocirc;ng t&aacute;c tại trường,&nbsp;&nbsp;gia đ&igrave;nh v&agrave; bạn b&egrave; NCS&nbsp;B&ugrave;i Trọng Phương.</span></span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hội đồng chấm Luận &aacute;n cho NCS&nbsp;B&ugrave;i Trọng Phương&nbsp; gồm 7 th&agrave;nh vi&ecirc;n: GS.TS. Nguyễn Đại Dương - Chủ tịch Hội đồng; PGS.TS. Đặng Văn Dũng &ndash; Uỷ vi&ecirc;n thư k&yacute;; GS.TS. L&ecirc; Q&uacute;y Phượng &ndash; Phản biện 1; PGS.TS. Trần Tuấn Hiếu &ndash; Phản biện 2; TS. Nguyễn Ho&agrave;ng Thụ &ndash; Phản biện 3; PGS.TS. Nguyễn Thanh T&ugrave;ng&nbsp;&nbsp;&ndash; Uỷ vi&ecirc;n; TS. Phan Quốc Chiến &ndash; Uỷ vi&ecirc;n.</span></span></span></span></span></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<div><span style="font-size:8pt"><span style="font-family:verdana"><img src="http://www.upes1.edu.vn/DesktopModules/Followmesoft.Newspaper/ResourceDownload.aspx?ResourceID=11718" style="border:none" /></span></span><span style="font-size:8pt"><span style="font-family:verdana"><span style="font-family:arial"><span style="color:blue"><span style="font-size:x-small">To&agrave;n cảnh buổi chấm luận &aacute;n</span></span></span></span></span></div>

<p>&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Luận &aacute;n đ&atilde; x&aacute;c định r&otilde; 15 test đặc trưng thuộc 4 nh&oacute;m yếu tố sức mạnh th&agrave;nh phần v&agrave; ti&ecirc;u chuẩn đ&aacute;nh gi&aacute; sức mạnh&nbsp;cho sinh vi&ecirc;n nam Học viện An ninh nh&acirc;n d&acirc;n trong m&ocirc;n v&otilde; thuật C&ocirc;ng an nh&acirc;n d&acirc;n. Căn cứ v&agrave;o c&aacute;c test v&agrave; ti&ecirc;u chuẩn đ&oacute;, t&aacute;c giả c&oacute; thể đ&aacute;nh gi&aacute; được tr&igrave;nh độ sức mạnh của sinh vi&ecirc;n nam Học viện An ninh nh&acirc;n d&acirc;n trong m&ocirc;n v&otilde; thuật C&ocirc;ng an nh&acirc;n d&acirc;n.&nbsp;Qua nghi&ecirc;n cứu thực trạng trong c&ocirc;ng t&aacute;c giảng dạy m&ocirc;n v&otilde; thuật C&ocirc;ng an nh&acirc;n d&acirc;n ở Học viện An ninh nh&acirc;n d&acirc;n cho thấy mặc d&ugrave; đ&atilde; c&oacute; quan t&acirc;m tới việc ph&aacute;t triển sức mạnh, nhưng thời gian d&agrave;nh cho n&oacute; c&ograve;n chưa nhiều, chủ yếu tập trung v&agrave;o giảng dạy kỹ thuật cơ bản. Thiếu c&aacute;c b&agrave;i tập chuy&ecirc;n m&ocirc;n, đặc th&ugrave; để ph&aacute;t triển sức mạnh, số lượng b&agrave;i tập ph&acirc;n bố kh&ocirc;ng đều. Mặt bằng chung,&nbsp;tr&igrave;nh độ sức mạnh của sinh vi&ecirc;n nam Học vi&ecirc;n An ninh nh&acirc;n d&acirc;n trong m&ocirc;n v&otilde; thuật C&ocirc;ng an nh&acirc;n d&acirc;n ph&aacute;t triển chưa cao. Kết quả học tập m&ocirc;n v&otilde; thuật C&ocirc;ng an nh&acirc;n d&acirc;n của sinh vi&ecirc;n nam Học viện An ninh nh&acirc;n d&acirc;n c&ograve;n thấp,&nbsp;chưa đạt chỉ ti&ecirc;u đề ra.</span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Luận &aacute;n cũng đ&atilde; tiến h&agrave;nh ứng dụng v&agrave; đ&aacute;nh gi&aacute; hiệu quả của nội dung trong phương ph&aacute;p tập luyện theo trạm lựa chọn được nhằm ph&aacute;t triển sức mạnh cho sinh vi&ecirc;n nam Học viện An ninh nh&acirc;n d&acirc;n trong giảng dạy m&ocirc;n v&otilde; thuật C&ocirc;ng an nh&acirc;n d&acirc;n. Kết quả c&aacute;c chỉ số đo được sau thực nghiệm đều tăng l&ecirc;n so với trước thực nghiệm. Kết quả n&agrave;y đ&atilde; khẳng định t&iacute;nh đ&uacute;ng đắn của c&aacute;c nội dung trong phương ph&aacute;p tập luyện theo trạm đ&atilde; được lựa chọn.&nbsp;&nbsp;</span></span></span></span></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<p>&nbsp;</p>

<div><span style="font-size:8pt"><span style="font-family:verdana"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><img src="http://www.upes1.edu.vn/DesktopModules/Followmesoft.Newspaper/ResourceDownload.aspx?ResourceID=11719" style="border:none" /></span></span></span></span><span style="font-size:8pt"><span style="font-family:verdana"><span style="font-size:12pt"><span style="font-family:arial"><span style="color:blue"><span style="font-size:x-small">NCS B&ugrave;i Trọng Phương tặng hoa tri &acirc;n Hội đồng</span></span></span></span></span></span></div>

<p>&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff"><span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;Từ những kết quả nghi&ecirc;n cứu đ&atilde; đạt được của Luận &aacute;n, c&oacute; thể thấy rằng đề t&agrave;i Luận &aacute;n Tiến sĩ của NCS.&nbsp;B&ugrave;i Trọng Phương&nbsp; tuy c&ograve;n c&oacute; những khiếm khuyết. Nhưng kết quả nghi&ecirc;n cứu đạt được của Luận &aacute;n mang t&iacute;nh cấp thiết, c&oacute; &yacute; nghĩa thực tiễn. C&aacute;c thiếu s&oacute;t của Luận &aacute;n sẽ chỉnh sửa, bổ sung. Nội dung v&agrave; h&igrave;nh thức của Luận &aacute;n đ&atilde; đảm bảo theo đ&uacute;ng y&ecirc;u cầu của một Luận &aacute;n Tiến sĩ Khoa học gi&aacute;o dục chuy&ecirc;n ng&agrave;nh gi&aacute;o dục học.</span></span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13.3333px"><span style="color:#000000"><span style="font-family:Tahoma"><span style="background-color:#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:12pt"><span style="color:black"><span style="font-family:&quot;Times New Roman&quot;,serif">Hội đồng c&oacute; 07/07 (100%) th&agrave;nh vi&ecirc;n c&oacute; mặt&nbsp; nhất tr&iacute; đề nghị Hiệu trưởng Trường Đại học TDTT Bắc Ninh cấp bằng tiến sĩ cho NCS B&ugrave;i Trọng sau khi đ&atilde; ho&agrave;n thiện luận &aacute;n theo kết luận của Hội đồng</span></span></span></span></span></span></span></p>
', N'/ckfinder/userfiles/images/kich%20no1.jpg', 2, N'TINTUC', CAST(N'2019-05-03T00:00:00.000' AS DateTime), CAST(N'2019-05-19T21:55:05.593' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[Contents] ([contentId], [contentName], [contentAlias], [contentDescription], [contentBody], [contentThumbnail], [contentParentId], [contentKey], [contentCreateTime], [contentUpdateTime], [contentCreateUser], [contentUpdateUser], [contentMetaTitle], [contentMetaKeywords], [contentMetaDescription], [contentLanguageId], [contentView], [isSort], [isTrash], [isNew], [authorize]) VALUES (10043, N'Sinh viên tốt nghiệp ngành Giáo dục thể chất Trường Đại học TDTT Bắc Ninh và được cấp bằng cử nhân Giáo dục thể chất thì được xác định là "có bằng tốt nghiệp đại học sư phạm"', N'sinh-vien-tot-nghiep-nganh-giao-duc-the-chat-truong-dai-hoc-tdtt-bac-ninh-va-duoc-cap-bang-cu-nhan-giao-duc-the-chat-thi-duoc-xac-dinh-la-co-bang-tot-nghiep-dai-hoc-su-pham-10043', NULL, N'<p><img src="http://www.upes1.edu.vn/DesktopModules/Followmesoft.Newspaper/ResourceDownload.aspx?ResourceID=11712" /></p>
', N'/ckfinder/userfiles/images/kich%20no1.jpg', 2, N'TINTUC', CAST(N'2019-05-04T00:00:00.000' AS DateTime), CAST(N'2019-05-19T21:57:06.193' AS DateTime), N'admin@gmail.com', N'admin@gmail.com', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contents] OFF
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([menuId], [menuName], [menuLink], [menuParentId], [isSort], [isTrash], [languageId]) VALUES (1, N'Danh mục chính', NULL, NULL, 0, 0, 1)
INSERT [dbo].[Menus] ([menuId], [menuName], [menuLink], [menuParentId], [isSort], [isTrash], [languageId]) VALUES (2, N'Giới thiệu', NULL, 1, 0, 0, 1)
INSERT [dbo].[Menus] ([menuId], [menuName], [menuLink], [menuParentId], [isSort], [isTrash], [languageId]) VALUES (3, N'Đào tạo', NULL, 1, 2, 0, 1)
INSERT [dbo].[Menus] ([menuId], [menuName], [menuLink], [menuParentId], [isSort], [isTrash], [languageId]) VALUES (4, N'Khoa học công nghệ', NULL, 1, 3, 0, 1)
INSERT [dbo].[Menus] ([menuId], [menuName], [menuLink], [menuParentId], [isSort], [isTrash], [languageId]) VALUES (5, N'Hợp tác & phát triển', NULL, 1, 4, 0, 1)
INSERT [dbo].[Menus] ([menuId], [menuName], [menuLink], [menuParentId], [isSort], [isTrash], [languageId]) VALUES (6, N'Học sinh - sinh viên - VĐV', NULL, 1, 5, 0, 1)
INSERT [dbo].[Menus] ([menuId], [menuName], [menuLink], [menuParentId], [isSort], [isTrash], [languageId]) VALUES (7, N'Cán bộ', NULL, 1, 6, 0, 1)
INSERT [dbo].[Menus] ([menuId], [menuName], [menuLink], [menuParentId], [isSort], [isTrash], [languageId]) VALUES (8, N'Quy trình ISO', NULL, 1, 7, 0, 1)
INSERT [dbo].[Menus] ([menuId], [menuName], [menuLink], [menuParentId], [isSort], [isTrash], [languageId]) VALUES (9, N'Lịch công tác', NULL, 1, 8, 0, 1)
INSERT [dbo].[Menus] ([menuId], [menuName], [menuLink], [menuParentId], [isSort], [isTrash], [languageId]) VALUES (1002, N'Tổng quan', NULL, 2, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[Visitor] ON 

INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1, CAST(N'2019-05-19T23:00:34.560' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (2, CAST(N'2019-05-19T23:03:28.537' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/Admin/CaiDatHeThong')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (3, CAST(N'2019-05-19T23:06:21.697' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1002, CAST(N'2019-05-19T23:15:12.127' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1003, CAST(N'2019-05-19T23:21:47.907' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/Admin/TinTuc')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1004, CAST(N'2019-05-19T23:21:49.213' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/Admin')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1005, CAST(N'2019-05-19T23:22:34.277' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/Admin')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1006, CAST(N'2019-05-19T23:27:32.143' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/Admin')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1007, CAST(N'2019-05-19T23:29:32.247' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/Admin')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1008, CAST(N'2019-05-19T23:31:36.723' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/Account/Login?ReturnUrl=%2FAdmin')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1009, CAST(N'2019-05-19T23:33:11.520' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/Account/Register')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1010, CAST(N'2019-05-19T23:36:28.313' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/giai-cau-long-cong-nhan-vien-chuc-lao-dong-nam-2019-cua-lien-doan-lao-dong-thi-xa-tu-son-10041')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1011, CAST(N'2019-05-19T23:38:37.787' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/giai-cau-long-cong-nhan-vien-chuc-lao-dong-nam-2019-cua-lien-doan-lao-dong-thi-xa-tu-son-10041')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1012, CAST(N'2019-05-19T23:48:30.897' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/Admin/DanhMuc/ThemMoi')
INSERT [dbo].[Visitor] ([id], [visitTime], [visitIp], [visitBrowser], [visitPage]) VALUES (1013, CAST(N'2019-05-19T23:48:32.140' AS DateTime), N'::1', N'Chrome74/Chrome/74.0/3.0/WinNT', N'http://localhost:25047/')
SET IDENTITY_INSERT [dbo].[Visitor] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/20/2019 12:15:47 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 5/20/2019 12:15:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 5/20/2019 12:15:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 5/20/2019 12:15:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 5/20/2019 12:15:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/20/2019 12:15:47 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [dataNews] SET  READ_WRITE 
GO
