USE [EcommerceShop]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 15/04/2024 9:21:14 SA ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] NOT NULL,
	[username] [nchar](20) NOT NULL,
	[status] [smallint] NOT NULL,
	[createTime] [datetime] NULL,
	[employeeId] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories_Needs]    Script Date: 15/04/2024 9:21:14 SA ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories_Promotions]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories_Promotions](
	[categoryId] [int] NOT NULL,
	[promotionId] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Categories_Promotions] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC,
	[promotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories_Suppliers]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories_Suppliers](
	[categoryId] [int] NOT NULL,
	[supplierId] [int] NOT NULL,
	[landedCost] [money] NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Categories_Suppliers] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC,
	[supplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15/04/2024 9:21:14 SA ******/
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
	[starts] [smallint] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CMND] [nchar](15) NULL,
	[name] [nvarchar](50) NOT NULL,
	[dateOfBirth] [date] NULL,
	[phone] [nchar](15) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[dateOfBirth] [date] NULL,
	[phone] [nchar](12) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] NOT NULL,
	[uri] [nvarchar](100) NOT NULL,
	[categorytId] [int] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[id] [int] NOT NULL,
	[taxCode] [nchar](20) NULL,
	[date] [datetime] NULL,
	[employeeId] [int] NULL,
	[customerId] [int] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Need]    Script Date: 15/04/2024 9:21:14 SA ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[cartId] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
	[quatity] [int] NOT NULL,
	[shipperId] [int] NULL,
	[invoiceId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC,
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[serialNumber] [nvarchar](20) NOT NULL,
	[categoryId] [int] NOT NULL,
	[warrantyId] [int] NULL,
	[invoiceId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[serialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[id] [nchar](20) NOT NULL,
	[dealPercent] [int] NOT NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[quatity] [int] NULL,
	[status] [nchar](20) NULL,
	[createBy] [int] NULL,
	[createTime] [datetime] NULL,
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 15/04/2024 9:21:14 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nchar](12) NULL,
	[address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [name]) VALUES (1, N'ACER')
INSERT [dbo].[Brand] ([id], [name]) VALUES (2, N'ASUS')
INSERT [dbo].[Brand] ([id], [name]) VALUES (3, N'HP')
INSERT [dbo].[Brand] ([id], [name]) VALUES (4, N'APPLE')
INSERT [dbo].[Brand] ([id], [name]) VALUES (5, N'DELL')
INSERT [dbo].[Brand] ([id], [name]) VALUES (6, N'GIGABYTE')
INSERT [dbo].[Brand] ([id], [name]) VALUES (7, N'LG')
INSERT [dbo].[Brand] ([id], [name]) VALUES (8, N'Lenovo')
INSERT [dbo].[Brand] ([id], [name]) VALUES (9, N'MSI')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [title], [CPU], [RAM], [HARDWARE], [CARD], [SCREEN], [OS], [hot], [price], [promotionPrice], [warrantyTime], [description], [brandId], [status], [starts]) VALUES (1, N'Laptop Asus Vivobook Go 15 E1504FA-NJ454W (AMD Ryzen 5-7520U) (Bạc)', N'AMD Ryzen 5 7520U', N'16GB Onboard LPDDR5 5500MHz', N'512GB SSD M.2 NVMe', N'Onboard AMD Radeon 610M', N'15.6" (1920 x 1080)', N'Windows 11 Home', 0, 14490000.0000, 12490000.0000, 12, NULL, 2, N'AVAILABLE', 5)
SET IDENTITY_INSERT [dbo].[Category] OFF
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
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Employee] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Employee]
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
ALTER TABLE [dbo].[Categories_Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Suppliers_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Categories_Suppliers] CHECK CONSTRAINT [FK_Categories_Suppliers_Category]
GO
ALTER TABLE [dbo].[Categories_Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Suppliers_Supplier] FOREIGN KEY([supplierId])
REFERENCES [dbo].[Supplier] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Categories_Suppliers] CHECK CONSTRAINT [FK_Categories_Suppliers_Supplier]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Brand] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brand] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Brand]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Category] FOREIGN KEY([categorytId])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Category]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Cart] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Cart]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Category]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Invoice] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[Invoice] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Invoice]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Invoice] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[Invoice] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Invoice]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [CK_Customer_Contact] CHECK  ((NOT ([email] IS NULL AND [phone] IS NULL)))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [CK_Customer_Contact]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_Contact] CHECK  ((NOT ([email] IS NULL AND [phone] IS NULL)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_Contact]
GO
USE [master]
GO
ALTER DATABASE [EcommerceShop] SET  READ_WRITE 
GO