USE [Quiz]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/22/2024 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblNetworkInfos]    Script Date: 3/22/2024 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblNetworkInfos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MAC_Address] [nvarchar](max) NOT NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_TblNetworkInfos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblTests]    Script Date: 3/22/2024 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Option1] [nvarchar](max) NOT NULL,
	[Option2] [nvarchar](max) NOT NULL,
	[Option3] [nvarchar](max) NOT NULL,
	[Option4] [nvarchar](max) NOT NULL,
	[CurrectOption] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TblTests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUsers]    Script Date: 3/22/2024 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Number] [nvarchar](max) NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
 CONSTRAINT [PK_TblUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUserTests]    Script Date: 3/22/2024 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUserTests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Test_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[SelectedOption] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TblUserTests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240321101045_initial', N'6.0.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240322053521_macaddress', N'6.0.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240322074416_userselectedfield', N'6.0.28')
GO
SET IDENTITY_INSERT [dbo].[TblNetworkInfos] ON 

INSERT [dbo].[TblNetworkInfos] ([ID], [MAC_Address], [User_ID]) VALUES (1, N'SSID: 24418C7DAA32', 1)
INSERT [dbo].[TblNetworkInfos] ([ID], [MAC_Address], [User_ID]) VALUES (2, N'SSID: 24418C7DAA32', 2)
SET IDENTITY_INSERT [dbo].[TblNetworkInfos] OFF
GO
SET IDENTITY_INSERT [dbo].[TblTests] ON 

INSERT [dbo].[TblTests] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [CurrectOption], [Image]) VALUES (3, N'Identity The Image', N'Aries', N'Virgo', N'Leo', N'Taurus', N'Aries', N'/image/Aries-Zodiac-symbol-1.webp')
INSERT [dbo].[TblTests] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [CurrectOption], [Image]) VALUES (4, N'Identity The Image', N'Scorpio', N'Leo', N'Pisces', N'Taurus', N'Taurus', N'/image/Taurus-Zodiac-symbol-2.webp')
INSERT [dbo].[TblTests] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [CurrectOption], [Image]) VALUES (5, N'Identity The Image', N'Aquarius', N'Libra', N'Gemini', N'Aries', N'Gemini', N'/image/Gemini-Zodiac-symbol-3.webp')
INSERT [dbo].[TblTests] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [CurrectOption], [Image]) VALUES (6, N'Identity The Image', N'Cancer', N'Virgo', N'Sagittarius', N'Taurus', N'Cancer', N'/image/Cancer-Zodiac-symbol-4.webp')
INSERT [dbo].[TblTests] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [CurrectOption], [Image]) VALUES (7, N'Identity The Image', N'Leo', N'Capricorn', N'Aries', N'Gemini', N'Leo', N'/image/Leo-Zodiac-symbol-5.webp')
INSERT [dbo].[TblTests] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [CurrectOption], [Image]) VALUES (8, N'Identity The Image', N'Virgo', N'Cancer', N'Libra', N'Scorpio', N'Virgo', N'/image/Virgo-Zodiac-symbol-6.webp')
INSERT [dbo].[TblTests] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [CurrectOption], [Image]) VALUES (9, N'Identity The Image', N'Aries', N'Libra', N'Leo', N'Sagittarius', N'Libra', N'/image/Libra-Zodiac-symbol-7.webp')
INSERT [dbo].[TblTests] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [CurrectOption], [Image]) VALUES (10, N'Identity The Image', N'Scorpio', N'Pisces', N'Taurus', N'Scorpio', N'Scorpio', N'/image/Scorpio-Zodiac-symbol-8.webp')
INSERT [dbo].[TblTests] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [CurrectOption], [Image]) VALUES (11, N'Identity The Image', N'Capricorn', N'Cancer', N'Sagittarius', N'Aquarius', N'Sagittarius', N'/image/Sagittarius-Zodiac-symbol-9.webp')
INSERT [dbo].[TblTests] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [CurrectOption], [Image]) VALUES (12, N'Identity The Image', N'Taurus', N'Leo', N'Capricorn', N'Aries', N'Capricorn', N'/image/Capricorn-Zodiac-symbol-10.webp')
SET IDENTITY_INSERT [dbo].[TblTests] OFF
GO
SET IDENTITY_INSERT [dbo].[TblUsers] ON 

INSERT [dbo].[TblUsers] ([ID], [UserName], [FirstName], [LastName], [Number], [Wins], [Losses]) VALUES (1, N'mts@gmail.com', N'Muhammad', N'Tariq', N'2345', 3, 7)
INSERT [dbo].[TblUsers] ([ID], [UserName], [FirstName], [LastName], [Number], [Wins], [Losses]) VALUES (2, N'mts1@gmail.com', N'one', N'test', N'1234567', 2, 8)
SET IDENTITY_INSERT [dbo].[TblUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[TblUserTests] ON 

INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (164, 3, 1, N'Virgo')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (165, 4, 1, N'Pisces')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (166, 5, 1, N'Aquarius')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (167, 6, 1, N'Sagittarius')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (168, 7, 1, N'Capricorn')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (169, 8, 1, N'Scorpio')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (170, 9, 1, N'Libra')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (171, 10, 1, N'Scorpio')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (172, 11, 1, N'Sagittarius')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (173, 12, 1, N'Leo')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (174, 3, 2, N'Aries')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (175, 4, 2, N'Pisces')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (176, 5, 2, N'Libra')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (177, 6, 2, N'Sagittarius')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (178, 7, 2, N'Gemini')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (179, 8, 2, N'Virgo')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (180, 9, 2, N'Leo')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (181, 10, 2, N'Pisces')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (182, 11, 2, N'Aquarius')
INSERT [dbo].[TblUserTests] ([ID], [Test_ID], [User_ID], [SelectedOption]) VALUES (183, 12, 2, N'Leo')
SET IDENTITY_INSERT [dbo].[TblUserTests] OFF
GO
ALTER TABLE [dbo].[TblUserTests] ADD  DEFAULT (N'') FOR [SelectedOption]
GO
ALTER TABLE [dbo].[TblNetworkInfos]  WITH CHECK ADD  CONSTRAINT [FK_TblNetworkInfos_TblUsers_User_ID] FOREIGN KEY([User_ID])
REFERENCES [dbo].[TblUsers] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblNetworkInfos] CHECK CONSTRAINT [FK_TblNetworkInfos_TblUsers_User_ID]
GO
ALTER TABLE [dbo].[TblUserTests]  WITH CHECK ADD  CONSTRAINT [FK_TblUserTests_TblTests_Test_ID] FOREIGN KEY([Test_ID])
REFERENCES [dbo].[TblTests] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblUserTests] CHECK CONSTRAINT [FK_TblUserTests_TblTests_Test_ID]
GO
ALTER TABLE [dbo].[TblUserTests]  WITH CHECK ADD  CONSTRAINT [FK_TblUserTests_TblUsers_User_ID] FOREIGN KEY([User_ID])
REFERENCES [dbo].[TblUsers] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblUserTests] CHECK CONSTRAINT [FK_TblUserTests_TblUsers_User_ID]
GO
