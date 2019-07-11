USE [dataNews]
GO

/****** Object:  Table [dbo].[RoleFunctions]    Script Date: 7/11/2019 09:40:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RoleFunctions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[CodeFunction] [nvarchar](250) NOT NULL,
	[NameFunction] [nvarchar](250) NOT NULL,
	[ActionAdd] [bit] NOT NULL,
	[ActionEdit] [bit] NOT NULL,
	[ActionDelete] [bit] NOT NULL,
	[ActionAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_RoleFunctions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


