USE [SOF3021_J5Shop]
GO
INSERT [dbo].[accounts] ([username], [activated], [admin], [email], [first_name], [image], [last_name], [password]) VALUES (N'admin', 1, 1, N'admin@gmail.com', N'admin', N'1.webp', N'nguyen', N'123456')
GO
INSERT [dbo].[accounts] ([username], [activated], [admin], [email], [first_name], [image], [last_name], [password]) VALUES (N'hungphan123', 1, 0, N'hungphan123@gmail.com', N'Hùng ', N'2.webp', N'Phan', N'abc123')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'CT001', N'Smartphone')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'CT002', N'Smartwatch')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'CT003', N'Laptop')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'CT004', N'Headphone')
GO
INSERT [dbo].[products] ([id], [available], [create_date], [image], [name], [price], [category_id]) VALUES (1, 1, CAST(N'2024-01-23' AS Date), N'1.webp', N'Iphone 15 Pro Max', 1000, N'CT001')
GO
INSERT [dbo].[products] ([id], [available], [create_date], [image], [name], [price], [category_id]) VALUES (2, 1, CAST(N'2024-01-23' AS Date), N'2.webp', N'Samsung Galaxy A14', 500, N'CT001')
GO
INSERT [dbo].[products] ([id], [available], [create_date], [image], [name], [price], [category_id]) VALUES (3, 1, CAST(N'2024-01-23' AS Date), N'3.webp', N'Xiaomi Mi 13', 650, N'CT001')
GO
INSERT [dbo].[products] ([id], [available], [create_date], [image], [name], [price], [category_id]) VALUES (4, 0, CAST(N'2024-01-23' AS Date), N'4.webp', N'OPPO A38', 500, N'CT001')
GO
INSERT [dbo].[products] ([id], [available], [create_date], [image], [name], [price], [category_id]) VALUES (5, 1, CAST(N'2024-01-23' AS Date), N'5.webp', N'Vivo', 350, N'CT001')
GO
INSERT [dbo].[products] ([id], [available], [create_date], [image], [name], [price], [category_id]) VALUES (6, 1, CAST(N'2024-01-23' AS Date), N'6.webp', N'Realme', 200, N'CT001')
GO
INSERT [dbo].[products] ([id], [available], [create_date], [image], [name], [price], [category_id]) VALUES (7, 1, CAST(N'2024-01-23' AS Date), N'7.webp', N'OPPO A58', 400, N'CT001')
GO
INSERT [dbo].[products] ([id], [available], [create_date], [image], [name], [price], [category_id]) VALUES (8, 1, CAST(N'2024-01-23' AS Date), N'8.webp', N'Iphone 14', 800, N'CT001')
GO
INSERT [dbo].[products] ([id], [available], [create_date], [image], [name], [price], [category_id]) VALUES (9, 1, CAST(N'2024-01-23' AS Date), N'9.webp', N'Laptop HP', 650, N'CT003')
GO
INSERT [dbo].[products] ([id], [available], [create_date], [image], [name], [price], [category_id]) VALUES (10, 1, CAST(N'2024-01-23' AS Date), N'17.webp', N'Apple Watch Series 8', 750, N'CT002')
GO
