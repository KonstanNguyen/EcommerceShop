﻿USE [EcommerceShop]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[createTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories_Needs]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories_Needs](
	[categoryId] [int] NOT NULL,
	[needId] [int] NOT NULL,
 CONSTRAINT [PK_Categories_Needs] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC,
	[needId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories_Promotions]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories_Promotions](
	[categoryId] [int] NOT NULL,
	[promotionId] [int] NOT NULL,
 CONSTRAINT [PK_Categories_Promotions] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC,
	[promotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[CPU] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NOT NULL,
	[HARDWARE] [nvarchar](50) NOT NULL,
	[CARD] [nvarchar](50) NOT NULL,
	[SCREEN] [nvarchar](50) NOT NULL,
	[OS] [nvarchar](50) NOT NULL,
	[hot] [bit] NULL,
	[price] [money] NOT NULL,
	[promotionPrice] [money] NULL,
	[warrantyTime] [smallint] NULL,
	[description] [nvarchar](100) NULL,
	[brandId] [int] NOT NULL,
	[status] [nvarchar](20) NULL,
	[starts] [float] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](100) NOT NULL,
	[category_Id] [int] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[id] [nchar](10) NOT NULL,
	[taxCode] [nchar](20) NULL,
	[date] [datetime] NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nchar](10) NULL,
	[address] [nvarchar](100) NOT NULL,
	[total_amount] [money] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Need]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Need](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Need] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[invoiceId] [nchar](10) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dealPercent] [int] NOT NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[quantity] [int] NULL,
	[status] [bit] NULL,
	[createTime] [datetime] NULL,
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/06/2024 11:17:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CMND] [nchar](15) NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nchar](15) NULL,
	[address] [nvarchar](100) NULL,
	[dateOfBirth] [date] NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [name]) VALUES (1, N'ACER')
INSERT [dbo].[Brand] ([id], [name]) VALUES (4, N'APPLE')
INSERT [dbo].[Brand] ([id], [name]) VALUES (2, N'ASUS')
INSERT [dbo].[Brand] ([id], [name]) VALUES (5, N'DELL')
INSERT [dbo].[Brand] ([id], [name]) VALUES (6, N'GIGABYTE')
INSERT [dbo].[Brand] ([id], [name]) VALUES (3, N'HP')
INSERT [dbo].[Brand] ([id], [name]) VALUES (8, N'Lenovo')
INSERT [dbo].[Brand] ([id], [name]) VALUES (7, N'LG')
INSERT [dbo].[Brand] ([id], [name]) VALUES (9, N'MSI')
INSERT [dbo].[Brand] ([id], [name]) VALUES (16, N'SAMSUNG')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (17, 1, 1, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (18, 1, 1, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (19, 1, 0, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (20, 2, 1, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (21, 2, 0, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (28, 4, 1, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (29, 4, 0, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (30, 5, 1, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (31, 5, 1, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (38, 5, 1, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([id], [userId], [status], [createTime]) VALUES (39, 5, 0, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[Categories_Needs] ([categoryId], [needId]) VALUES (1, 1)
INSERT [dbo].[Categories_Needs] ([categoryId], [needId]) VALUES (1, 2)
INSERT [dbo].[Categories_Needs] ([categoryId], [needId]) VALUES (1, 4)
INSERT [dbo].[Categories_Needs] ([categoryId], [needId]) VALUES (1, 5)
GO
INSERT [dbo].[Categories_Promotions] ([categoryId], [promotionId]) VALUES (1, 1)
INSERT [dbo].[Categories_Promotions] ([categoryId], [promotionId]) VALUES (1, 4)
INSERT [dbo].[Categories_Promotions] ([categoryId], [promotionId]) VALUES (3, 2)
INSERT [dbo].[Categories_Promotions] ([categoryId], [promotionId]) VALUES (3, 5)
INSERT [dbo].[Categories_Promotions] ([categoryId], [promotionId]) VALUES (4, 3)
INSERT [dbo].[Categories_Promotions] ([categoryId], [promotionId]) VALUES (24, 4)
INSERT [dbo].[Categories_Promotions] ([categoryId], [promotionId]) VALUES (26, 1)
INSERT [dbo].[Categories_Promotions] ([categoryId], [promotionId]) VALUES (26, 5)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (1, N'Laptop Asus Vivobook Go 15 E1504FA-NJ454W (AMD Ryzen 5-7520U) (Bạc)', N'AMD Ryzen 5 7520U', N'16GB Onboard LPDDR5 5500MHz', N'512GB ', N'Onboard', N'15.6"', N'Windows', 1, 23500000.0000, 23000000.0000, 10, N'Đã đổi', 8, N'AVAILABLE', 2)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (3, N'Laptop Lenovo Ideapad 5 - 15IAL7 -82SF006LVN (i5-1235U) (Xanh)', N'Intel Core i5-1235U', N'8GB Onboard GDDR4 3200MHz', N'512GB SSD M.2 NVMe', N'Onboard Intel UHD Graphics', N'15.6" IPS (1920 x 1080)', N'Windows 11 Home', 0, 19490000.0000, 13690000.0000, 36, N'Tốt', 8, N'AVAILABLE', 4)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (4, N'Laptop HP 15-fd0235TU - 9Q970PA (i5-1334U) (Bạc)', N'Intel Core i5-1334U', N'2 x 8GB DDR4 3200MHz', N'512GB SSD M.2 NVMe', N'Onboard Intel UHD Graphics', N'15.6" IPS (1920 x 1080)', N'Windows 11 Home', 0, 19590000.0000, 16790000.0000, 12, NULL, 3, N'AVAILABLE', 5)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (5, N'Laptop Asus Vivobook S15', N'AMD Ryzen', N'16GB', N'612Gb', N'Onboard', N'16.5''''', N'Windows 11', 1, 11000000.0000, 10000000.0000, 11, N'Mô tả 2', 2, N'DELETED', 5)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (6, N'Laptop MSI GF63 Thin 11UC (i7-11800H/RAM 8GB/RTX 3050/512GB SSD/ Windows 10)', N'Intel Core i7-11800H', N'1 x 8GB DDR4 3200MHz', N'512GB SSD M.2 NVMe', N'RTX 3050 4GB GDDR6 / Intel UHD Graphics', N'15.6" IPS (1920 x 1080),144Hz', N'Windows 10 Home 64-bit', 1, 20490000.0000, 18990000.0000, 12, NULL, 9, N'DELETED', 5)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (16, N'Laptop Lenovo Ideapad 5 - 15IAL7 -82SF006LVN (i5-1235U) (Đỏ)', N'Intel Core i5-1235U', N'16GB', N'512GB SSD M.2 NVMe', N'NVIDIA GTX 1650', N'15.6" IPS (1920 x 1080)', N'MacOS', 1, 11260000.0000, 11250000.0000, 12, N'Đẹp', 8, N'AVAILABLE', 1)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (24, N'Laptop HP 14 ep0126TU i3 N305/8GB/256GB/Win11 (8U233PA)', N'AMD Ryzen 5 7520U', N'16GB Onboard LPDDR5 5500MHz', N'512GB SSD', N'Onboard Intel UHD Graphics', N'15.6" (1920 x 1080)', N'MacOS', 1, 25000000.0000, 24000000.0000, 12, N'Bền và đẹp', 3, N'AVAILABLE', 1)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (25, N'Laptop Acer Gaming Aspire 5 A515 58GM 51LB i5', N'Intel Core i5-1235U', N'16GB', N'512GB SSD M.2 NVMe', N'Onboard Intel UHD Graphics', N'15.6'''' Retina', N'MacOS', 1, 15600000.0000, 15000000.0000, 12, N'  ', 1, N'AVAILABLE', 4)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (26, N'Laptop MSI Gaming GF63 Thin 12UC i7', N'Intel Core i5-1235U', N'16GB', N'512GB SSD M.2 NVMe', N'Onboard Intel UHD Graphics', N'15.6'''' Retina', N'Windows 11 Home', 0, 20000000.0000, 19900000.0000, 12, N'Bền', 9, N'AVAILABLE', 5)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (39, N'Laptop Acer Gaming Nitro 5 Tiger AN515 58 769J i7', N'Intel Core i5-1235U', N'16GB Onboard LPDDR5 5500MHz', N'512GB', N'Onboard AMD Radeon 610M', N'15.6" (1920 x 1080)', N'Windows', 1, 27600000.0000, 27000000.0000, 6, N'Hiệu năng tốt', 1, N'AVAILABLE', 5)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (40, N'Laptop Asus Vivobook Go 15', N'AMD Ryzen 5 7520U', N'16GB Onboard LPDDR5 5500MHz', N'512GB SSD M.2 NVMe', N'Onboard AMD Radeon 610M', N'15.6" (1920 x 1080)', N'Windows', 0, 12500000.0000, 11500000.0000, 12, N'Chơi game mượt', 2, N'AVAILABLE', 5)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (41, N'Laptop Asus TUF Gaming F15 FX507ZC4 i5', N'Intel Core i5-1334U', N'16GB', N'512GB ', N'NVIDIA GTX 1650', N'14.6" IPS (1920 x 1080)', N'Windows 11 Home', 0, 16530000.0000, 16500000.0000, 12, N'Mạnh', 1, N'AVAILABLE', 4)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (42, N'Laptop Lenovo Ideapad Gaming 3 15ACH6 R5 5500H', N'AMD Ryzen 5 7520U', N'16GB Onboard LPDDR5 5500MHz', N'512GB SSD', N'Onboard Intel UHD Graphics', N'15.6" IPS (1920 x 1080)', N'MacOS', 1, 16000000.0000, 15800000.0000, 12, N'Không', 8, N'AVAILABLE', 5)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (43, N'Laptop HP Gaming VICTUS 15 fa1139TX i5', N'Intel Core i5-1334U', N'16GB', N'512GB', N'Onboard AMD Radeon 610M', N'15.6" IPS (1920 x 1080)', N'MacOS', 1, 42000000.0000, 38900000.0000, 12, N'Không', 1, N'AVAILABLE', 5)
INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (44, N'Laptop Acer Gaming Aspire 5 A515 58GM', N'Intel Core i5-1235U', N'16GB Onboard LPDDR5 5500MHz', N'512GB', N'NVIDIA GTX 1650', N'15.6'''' Retina', N'Windows 10', 0, 16360000.0000, 16160000.0000, 12, N'Hiệu năng cao', 1, N'AVAILABLE', 4)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (2, N'./assets/img/product01.png', 1)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (3, N'./assets/img/product03.png', 3)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (4, N'./assets/img/product10.jpg', 4)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (5, N'./assets/img/product04.png', 5)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (6, N'./assets/img/product08.png', 6)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (13, N'./assets/img/product02.png', 1)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (14, N'./assets/img/product08.png', 16)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (19, N'./assets/img/product01.png', 24)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (20, N'./assets/img/product11.jpg', 25)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (21, N'./assets/img/product01.png', 26)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (29, N'./assets/img/product08.png', 39)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (30, N'./assets/img/product11.jpg', 40)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (31, N'./assets/img/product06.png', 41)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (32, N'./assets/img/product01.png', 41)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (33, N'./assets/img/product04.png', 41)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (34, N'./assets/img/product03.png', 41)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (35, N'./assets/img/product03.png', 42)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (36, N'./assets/img/product01.png', 43)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (37, N'./assets/img/laptop-acer-13.jpg', 44)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (38, N'./assets/img/product10.jpg', 3)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (39, N'./assets/img/product08.jpg', 4)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (40, N'./assets/img/product10.jpg', 5)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (41, N'./assets/img/product10.jpg', 6)
INSERT [dbo].[Image] ([id], [url], [category_Id]) VALUES (47, N'./assets/img/product10.jpg', 16)
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
INSERT [dbo].[Invoice] ([id], [taxCode], [date], [name], [email], [phone], [address], [total_amount]) VALUES (N'2906      ', N'                    ', CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'nguyen', N'nmhhuong3@gmail.com', N'0123456789', N'quna 1', 43930000.0000)
INSERT [dbo].[Invoice] ([id], [taxCode], [date], [name], [email], [phone], [address], [total_amount]) VALUES (N'3524      ', N'                    ', CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'Vu Thuy', N'asdasda@gmail.com', N'          ', N'', 53580000.0000)
INSERT [dbo].[Invoice] ([id], [taxCode], [date], [name], [email], [phone], [address], [total_amount]) VALUES (N'3868      ', N'                    ', CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'Vu Thuy', N'asdasda@gmail.com', N'          ', N'', 50480000.0000)
INSERT [dbo].[Invoice] ([id], [taxCode], [date], [name], [email], [phone], [address], [total_amount]) VALUES (N'568       ', N'                    ', CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'Vu Thuy', N'thanhthuy201020022003@gmail.com', N'          ', N'quan 1', 60000000.0000)
INSERT [dbo].[Invoice] ([id], [taxCode], [date], [name], [email], [phone], [address], [total_amount]) VALUES (N'7539      ', N'                    ', CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'my', N'nmhhuong@gmail.com', N'036315465 ', N'Quận 9', 70660000.0000)
INSERT [dbo].[Invoice] ([id], [taxCode], [date], [name], [email], [phone], [address], [total_amount]) VALUES (N'9315      ', N'                    ', CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'nguyen', N'nmhhuong3@gmail.com', N'0123456789', N'asldfjasld', 74060000.0000)
INSERT [dbo].[Invoice] ([id], [taxCode], [date], [name], [email], [phone], [address], [total_amount]) VALUES (N'980       ', N'                    ', CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'Tan', N'atlat2308@gmail.com', N'0336771943', N'quan 1', 93640000.0000)
GO
SET IDENTITY_INSERT [dbo].[Need] ON 

INSERT [dbo].[Need] ([id], [name]) VALUES (1, N'Doanh nghiệp')
INSERT [dbo].[Need] ([id], [name]) VALUES (2, N'Doanh nhân')
INSERT [dbo].[Need] ([id], [name]) VALUES (3, N'Gaming')
INSERT [dbo].[Need] ([id], [name]) VALUES (4, N'Học sinh - Sinh viên')
INSERT [dbo].[Need] ([id], [name]) VALUES (5, N'Văn phòng')
INSERT [dbo].[Need] ([id], [name]) VALUES (6, N'Đồ họa - Kỹ thuật')
SET IDENTITY_INSERT [dbo].[Need] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (7, 17, 5, 1, N'9315      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (8, 17, 4, 3, N'9315      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (9, 17, 3, 1, N'9315      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (10, 18, 16, 1, N'2906      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (11, 18, 6, 1, N'2906      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (12, 18, 3, 1, N'2906      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (13, 20, 6, 3, N'7539      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (15, 20, 3, 1, N'7539      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (16, 21, 5, 1, NULL)
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (17, 21, 4, 1, NULL)
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (18, 21, 39, 1, NULL)
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (19, 28, 6, 1, N'980       ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (20, 28, 3, 3, N'980       ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (21, 28, 4, 2, N'980       ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (22, 30, 5, 2, N'3868      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (23, 30, 4, 1, N'3868      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (24, 30, 3, 1, N'3868      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (25, 31, 5, 3, N'568       ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (26, 38, 5, 1, N'3524      ')
INSERT [dbo].[Orders] ([id], [cart_id], [category_id], [quantity], [invoiceId]) VALUES (27, 38, 4, 1, N'3524      ')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotion] ON 

INSERT [dbo].[Promotion] ([id], [dealPercent], [startTime], [endTime], [quantity], [status], [createTime]) VALUES (1, 30, CAST(N'2024-05-30T00:00:00.000' AS DateTime), CAST(N'2024-06-20T00:00:00.000' AS DateTime), 0, 0, CAST(N'2024-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [dealPercent], [startTime], [endTime], [quantity], [status], [createTime]) VALUES (2, 20, CAST(N'2024-06-10T00:00:00.000' AS DateTime), CAST(N'2024-06-12T00:00:00.000' AS DateTime), 0, 0, CAST(N'2024-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [dealPercent], [startTime], [endTime], [quantity], [status], [createTime]) VALUES (3, 15, CAST(N'2024-06-15T00:00:00.000' AS DateTime), CAST(N'2024-07-12T00:00:00.000' AS DateTime), 0, 1, CAST(N'2024-06-09T01:11:28.080' AS DateTime))
INSERT [dbo].[Promotion] ([id], [dealPercent], [startTime], [endTime], [quantity], [status], [createTime]) VALUES (4, 30, CAST(N'2024-05-30T00:00:00.000' AS DateTime), CAST(N'2024-06-20T00:00:00.000' AS DateTime), 0, 0, CAST(N'2024-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([id], [dealPercent], [startTime], [endTime], [quantity], [status], [createTime]) VALUES (5, 30, CAST(N'2024-05-30T00:00:00.000' AS DateTime), CAST(N'2024-06-20T00:00:00.000' AS DateTime), 0, 0, CAST(N'2024-06-09T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [CMND], [name], [email], [phone], [address], [dateOfBirth], [username], [password]) VALUES (1, N'12348562835    ', N'nguyen', N'ntn@gmail.com', N'0123456789     ', N'asldfjasld', CAST(N'2003-04-23' AS Date), N'nguyen              ', N'$argon2i$v=19$m=65536,t=2,p=1$GHYU0w1FIezSNAQ1ROcXIg$ZS6QSeDAb40X6rQ4Ttj4k4J+7cijGkHWvmAejqmwI0c')
INSERT [dbo].[Users] ([id], [CMND], [name], [email], [phone], [address], [dateOfBirth], [username], [password]) VALUES (2, N'312321312312   ', N'my', N'nmhhuong@gmail.com', N'036315465      ', N'Quận 9', CAST(N'2003-10-18' AS Date), N'mie', N'$argon2i$v=19$m=65536,t=2,p=1$GHYU0w1FIezSNAQ1ROcXIg$ZS6QSeDAb40X6rQ4Ttj4k4J+7cijGkHWvmAejqmwI0c')
INSERT [dbo].[Users] ([id], [CMND], [name], [email], [phone], [address], [dateOfBirth], [username], [password]) VALUES (3, NULL, N'nguyen', N'ntn@gmail.com', NULL, NULL, NULL, N'nguyen1', N'$argon2i$v=19$m=65536,t=2,p=1$GHYU0w1FIezSNAQ1ROcXIg$ZS6QSeDAb40X6rQ4Ttj4k4J+7cijGkHWvmAejqmwI0c')
INSERT [dbo].[Users] ([id], [CMND], [name], [email], [phone], [address], [dateOfBirth], [username], [password]) VALUES (4, NULL, N'Tan', N'atlat2308@gmail.com', NULL, NULL, NULL, N'atlat', N'$argon2i$v=19$m=65536,t=2,p=1$qkVBbYcV5L+EKTWAPvnEMA$86kqI6XapT+46ajX2vUvjd8wdwFCarGFvgNhZl6r2BE')
INSERT [dbo].[Users] ([id], [CMND], [name], [email], [phone], [address], [dateOfBirth], [username], [password]) VALUES (5, NULL, N'Vu Thuy', N'thanhthuy201020022003@gmail.com', N'0763219626     ', N'HCM', NULL, N'thuy', N'$argon2i$v=19$m=65536,t=2,p=1$Q5XIvnBJ23oCZv8cxTCFDA$7AR92EsDOlSSkNiMlSxduadmAG6xkXPPTcuEJSeLYdE')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_BrandName]    Script Date: 10/06/2024 11:17:17 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_BrandName] ON [dbo].[Brand]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Title]    Script Date: 10/06/2024 11:17:17 pm ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UK_Title] UNIQUE NONCLUSTERED 
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_createTime]  DEFAULT (getdate()) FOR [createTime]
GO
ALTER TABLE [dbo].[Promotion] ADD  CONSTRAINT [DF_Promotion_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[Promotion] ADD  CONSTRAINT [DF_Promotion_createTime]  DEFAULT (getdate()) FOR [createTime]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Categories_Needs]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Needs_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Categories_Needs] CHECK CONSTRAINT [FK_Categories_Needs_Category]
GO
ALTER TABLE [dbo].[Categories_Needs]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Needs_Need] FOREIGN KEY([needId])
REFERENCES [dbo].[Need] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Categories_Needs] CHECK CONSTRAINT [FK_Categories_Needs_Need]
GO
ALTER TABLE [dbo].[Categories_Promotions]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Promotions_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Categories_Promotions] CHECK CONSTRAINT [FK_Categories_Promotions_Category]
GO
ALTER TABLE [dbo].[Categories_Promotions]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Promotions_Promotion] FOREIGN KEY([promotionId])
REFERENCES [dbo].[Promotion] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Categories_Promotions] CHECK CONSTRAINT [FK_Categories_Promotions_Promotion]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Brand] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brand] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Brand]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Category] FOREIGN KEY([category_Id])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Category]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Cart]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Category]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Invoice] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[Invoice] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Invoice]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [CK_Invoice_Contact] CHECK  ((NOT ([email] IS NULL AND [phone] IS NULL)))
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [CK_Invoice_Contact]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_User] CHECK  ((NOT ([email] IS NULL AND [phone] IS NULL)))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Promotion', @level2type=N'COLUMN',@level2name=N'id'
GO
USE [master]
GO
ALTER DATABASE [EcommerceShop] SET  READ_WRITE 
GO
