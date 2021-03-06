USE [TankControl]
GO
/****** Object:  Table [dbo].[History]    Script Date: 4/5/2013 9:53:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[el1] [float] NULL,
	[el2] [float] NULL,
	[el3] [float] NULL,
	[el4] [float] NULL,
	[el6] [float] NULL,
	[el7] [float] NULL,
	[duration_el1] [int] NULL,
	[duration_el2] [int] NULL,
	[duration_el3] [int] NULL,
	[duration_el4] [int] NULL,
	[duration_el5] [int] NULL,
	[duration_el6] [int] NULL,
	[duration_el7] [int] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 4/5/2013 9:53:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[el1] [float] NULL,
	[el2] [float] NULL,
	[el3] [float] NULL,
	[el4] [float] NULL,
	[el5] [float] NULL,
	[el6] [float] NULL,
	[el7] [float] NULL,
	[tol_el1] [float] NULL,
	[tol_el2] [float] NULL,
	[tol_el3] [float] NULL,
	[tol_el4] [float] NULL,
	[tol_el5] [float] NULL,
	[tol_el6] [float] NULL,
	[tol_el7] [float] NULL,
	[switch_el1] [float] NULL,
	[switch_el2] [float] NULL,
	[runtime] [int] NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SystemError]    Script Date: 4/5/2013 9:53:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemError](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[errorDesc] [varchar](100) NULL,
	[errorLocation] [varchar](50) NULL,
	[errorDate] [datetime] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/5/2013 9:53:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[auth_level] [int] NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Recipe] FOREIGN KEY([recipe_id])
REFERENCES [dbo].[Recipe] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Recipe]
GO
