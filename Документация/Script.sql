USE [master]
GO
/****** Object:  Database [ParksDB]    Script Date: 03.04.2024 16:02:59 ******/
CREATE DATABASE [ParksDB]
 GO
ALTER DATABASE [ParksDB] SET QUERY_STORE = OFF
GO
USE [ParksDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03.04.2024 16:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 03.04.2024 16:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Info] [nvarchar](1000) NULL,
	[Address] [nvarchar](1000) NULL,
	[Phone] [nvarchar](50) NULL,
	[Site] [nvarchar](50) NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Rate] [float] NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[WorkTimeId] [int] NOT NULL,
 CONSTRAINT [PK_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 03.04.2024 16:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceOrganization]    Script Date: 03.04.2024 16:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOrganization](
	[ServiceOrganizationId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[OrganizationId] [int] NOT NULL,
 CONSTRAINT [PK_ServicePharmacy] PRIMARY KEY CLUSTERED 
(
	[ServiceOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 03.04.2024 16:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkTime]    Script Date: 03.04.2024 16:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NULL,
 CONSTRAINT [PK_WorkTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Title]) VALUES (1, N'Парки развлечений')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (2, N'Мемориальные парки')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (3, N'Современный многофункциональный')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (4, N'Центральные')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (5, N'Природный-городской')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (1, N'Родник Живой Источник СК Маяк Зеленодольск', N'"Красивое место: сосновый лес и свежий воздух"', N'ул. Рогачева, 31, Зеленодольск, Респ. Татарстан, 422544', N'-', N'-', 55.855926000998473, 48.4760755589821, 5, N'2017-07-08.jpg', 5, 1)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (3, N'Парк "Родина" ', N'Очень красиво и чисто', N'ул. Гагарина, 4, Зеленодольск, Респ. Татарстан, 422550', N'-', N'-', 55.84576382866036, 48.490918059521647, 5, N'Screenshot_2.jpg', 4, 1)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (4, N'Парк Авангард', N'Очень хороший парк, много скамеек, ровные дорожки, озера, освещение, лежаки, детские площадки разные, шикарно.', N'Зеленодольск, Респ. Татарстан, 422550', N'+7‒965‒609‒48‒02', N'нет', 55.847668606993622, 48.509638076225741, 5, N'2020-08-22.jpg', 4, 1)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (7, N'Вечный Огонь', N'Достопримечательность в Зеленодольске', N'Зеленодольск, Респ. Татарстан, 422550', N'-', N'-', 55.845329423309394, 48.500394101872566, 5, N'IMG_20200601_095957.jpg', 2, 1)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (8, N'Березовая роща', N'​Хорошее зона отдыха с детьми. Много интересного. Качели батут горки', N'​пр. Строителей, Зеленодольск, Респ. Татарстан, 422545', N'+7 (84371) 5‒96‒76', N'https://rkmck-zel.ru/', 55.865669125501654, 48.567160206461367, 5, N'Screenshot_1.jpg', 5, 1)
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Title]) VALUES (1, N'Место для выгула собак')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (2, N'Расчет по картам')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (3, N'С фото')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (4, N'Круглосуточный')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (5, N'Доступно для инвалидов')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (6, N'Прокат')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (7, N'Велодорожка')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (8, N'Зона workout')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (9, N'Скамейки')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (10, N'Аттракционы')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (11, N'Туалет')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (12, N'Комната матери и ребёнка')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (13, N'Пост полиции')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceOrganization] ON 

INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (96, 3, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (97, 5, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (98, 9, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (99, 13, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (100, 1, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (101, 4, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (102, 5, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (103, 6, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (104, 7, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (105, 8, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (106, 1, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (107, 2, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (108, 3, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (109, 4, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (110, 5, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (111, 6, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (112, 7, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (113, 8, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (114, 9, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (115, 10, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (116, 11, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (117, 12, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (118, 13, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (119, 4, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (120, 5, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (121, 8, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (122, 10, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (123, 2, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (124, 3, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (125, 4, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (126, 5, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (127, 6, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (128, 8, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (129, 9, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (130, 10, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (131, 11, 4)
SET IDENTITY_INSERT [dbo].[ServiceOrganization] OFF
GO
INSERT [dbo].[User] ([Username], [Password]) VALUES (N'admin', N'2')
INSERT [dbo].[User] ([Username], [Password]) VALUES (N'user', N'1')
GO
SET IDENTITY_INSERT [dbo].[WorkTime] ON 

INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (1, N'Круглосуточно')
INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (2, N'8:00 - 21:00')
INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (3, N'9:00 - 22:00')
INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (4, N'7:00 - 24:00')
SET IDENTITY_INSERT [dbo].[WorkTime] OFF
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Pharmacy_Category]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_WorkTime] FOREIGN KEY([WorkTimeId])
REFERENCES [dbo].[WorkTime] ([Id])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Pharmacy_WorkTime]
GO
ALTER TABLE [dbo].[ServiceOrganization]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOrganization_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([Id])
GO
ALTER TABLE [dbo].[ServiceOrganization] CHECK CONSTRAINT [FK_ServiceOrganization_Organization]
GO
ALTER TABLE [dbo].[ServiceOrganization]  WITH CHECK ADD  CONSTRAINT [FK_ServicePharmacy_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[ServiceOrganization] CHECK CONSTRAINT [FK_ServicePharmacy_Service]
GO
USE [master]
GO
ALTER DATABASE [ParksDB] SET  READ_WRITE 
GO
