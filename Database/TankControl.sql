USE [TankControl]
GO
/****** Object:  Table [dbo].[History]    Script Date: 7/6/2013 9:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_id] [int] NOT NULL,
	[recipe_name] [varchar](50) NULL,
	[date_start] [datetime] NOT NULL,
	[date_complete] [datetime] NOT NULL,
	[el1] [float] NOT NULL,
	[el2] [float] NOT NULL,
	[el3] [float] NOT NULL,
	[el4] [float] NOT NULL,
	[el5] [float] NOT NULL,
	[el6] [float] NOT NULL,
	[el7] [float] NOT NULL,
	[total] [float] NOT NULL,
	[duration_el1] [int] NOT NULL,
	[duration_el2] [int] NOT NULL,
	[duration_el3] [int] NOT NULL,
	[duration_el4] [int] NOT NULL,
	[duration_el5] [int] NOT NULL,
	[duration_el6] [int] NOT NULL,
	[duration_el7] [int] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 7/6/2013 9:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recipe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[el1] [float] NOT NULL,
	[el2] [float] NOT NULL,
	[el3] [float] NOT NULL,
	[el4] [float] NOT NULL,
	[el5] [float] NOT NULL,
	[el6] [float] NOT NULL,
	[el7] [float] NOT NULL,
	[tol_el1] [float] NOT NULL,
	[tol_el2] [float] NOT NULL,
	[tol_el3] [float] NOT NULL,
	[tol_el4] [float] NOT NULL,
	[tol_el5] [float] NOT NULL,
	[tol_el6] [float] NOT NULL,
	[tol_el7] [float] NOT NULL,
	[switch_el1] [float] NOT NULL,
	[switch_el2] [float] NOT NULL,
	[runtime] [int] NOT NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemError]    Script Date: 7/6/2013 9:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemError](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[errorLevel] [int] NULL,
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
/****** Object:  Table [dbo].[User]    Script Date: 7/6/2013 9:59:05 AM ******/
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
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([id], [recipe_id], [recipe_name], [date_start], [date_complete], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [total], [duration_el1], [duration_el2], [duration_el3], [duration_el4], [duration_el5], [duration_el6], [duration_el7]) VALUES (113, 4, N'Test4', CAST(0x0000A1ED017CF777 AS DateTime), CAST(0x0000A1ED017D0A0D AS DateTime), 0, 2, 2, 2, 2, 2, 0, 10, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[History] ([id], [recipe_id], [recipe_name], [date_start], [date_complete], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [total], [duration_el1], [duration_el2], [duration_el3], [duration_el4], [duration_el5], [duration_el6], [duration_el7]) VALUES (114, 5, N'Test5', CAST(0x0000A1ED017E5041 AS DateTime), CAST(0x0000A1ED017E62CA AS DateTime), 0, 5, 0, 2, 2, 3, 0, 12, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[History] ([id], [recipe_id], [recipe_name], [date_start], [date_complete], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [total], [duration_el1], [duration_el2], [duration_el3], [duration_el4], [duration_el5], [duration_el6], [duration_el7]) VALUES (115, 8, N'Testhistory', CAST(0x0000A1ED017E9970 AS DateTime), CAST(0x0000A1ED017EA811 AS DateTime), 0, 4, 3, 0, 2, 1, 0, 10, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[History] OFF
SET IDENTITY_INSERT [dbo].[Recipe] ON 

INSERT [dbo].[Recipe] ([id], [name], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [tol_el1], [tol_el2], [tol_el3], [tol_el4], [tol_el5], [tol_el6], [tol_el7], [switch_el1], [switch_el2], [runtime]) VALUES (1, N'Test1', 5, 5, 3, 3, 3, 3, 3, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.8, 0.8, 10)
INSERT [dbo].[Recipe] ([id], [name], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [tol_el1], [tol_el2], [tol_el3], [tol_el4], [tol_el5], [tol_el6], [tol_el7], [switch_el1], [switch_el2], [runtime]) VALUES (2, N'Test2', 0, 6, 3, 3, 3, 3, 3, 0.05, 0.05, 0.05, 0.05, 0.05, 0.06, 0.07, 0.8, 0.8, 5)
INSERT [dbo].[Recipe] ([id], [name], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [tol_el1], [tol_el2], [tol_el3], [tol_el4], [tol_el5], [tol_el6], [tol_el7], [switch_el1], [switch_el2], [runtime]) VALUES (3, N'Test3', 5, 3, 3, 3, 3, 3, 0, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.8, 0.8, 5)
INSERT [dbo].[Recipe] ([id], [name], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [tol_el1], [tol_el2], [tol_el3], [tol_el4], [tol_el5], [tol_el6], [tol_el7], [switch_el1], [switch_el2], [runtime]) VALUES (4, N'Test4', 0, 2, 2, 2, 2, 2, 0, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.8, 0.8, 5)
INSERT [dbo].[Recipe] ([id], [name], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [tol_el1], [tol_el2], [tol_el3], [tol_el4], [tol_el5], [tol_el6], [tol_el7], [switch_el1], [switch_el2], [runtime]) VALUES (5, N'Test5', 0, 5, 0, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 3)
INSERT [dbo].[Recipe] ([id], [name], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [tol_el1], [tol_el2], [tol_el3], [tol_el4], [tol_el5], [tol_el6], [tol_el7], [switch_el1], [switch_el2], [runtime]) VALUES (6, N'Test6', 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0)
INSERT [dbo].[Recipe] ([id], [name], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [tol_el1], [tol_el2], [tol_el3], [tol_el4], [tol_el5], [tol_el6], [tol_el7], [switch_el1], [switch_el2], [runtime]) VALUES (7, N'Test7', 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0)
INSERT [dbo].[Recipe] ([id], [name], [el1], [el2], [el3], [el4], [el5], [el6], [el7], [tol_el1], [tol_el2], [tol_el3], [tol_el4], [tol_el5], [tol_el6], [tol_el7], [switch_el1], [switch_el2], [runtime]) VALUES (8, N'Testhistory', 0, 4, 3, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 2)
SET IDENTITY_INSERT [dbo].[Recipe] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [auth_level], [username], [password]) VALUES (1, N'Admin', 1, N'admin', N'bJOamDzVgAgP/u8AjkNskg==')
INSERT [dbo].[User] ([id], [name], [auth_level], [username], [password]) VALUES (2, N'Adiwena', 2, N'adi', N'a3Vk8S5r9ls8PNA8JJRnCw==')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Recipe] FOREIGN KEY([recipe_id])
REFERENCES [dbo].[Recipe] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Recipe]
GO
