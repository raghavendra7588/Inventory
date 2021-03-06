USE [inventory]
GO
/****** Object:  Table [dbo].[Mst_Address]    Script Date: 19-09-2020 01:49:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mst_Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sellerId] [int] NULL,
	[billing_address] [varchar](255) NULL,
	[billing_city] [varchar](255) NULL,
	[billing_pinCode] [varchar](255) NULL,
	[billing_country] [varchar](255) NULL,
	[billing_state] [varchar](255) NULL,
	[billing_phone] [varchar](255) NULL,
	[billing_email] [varchar](255) NULL,
	[shipping_address] [varchar](255) NULL,
	[shipping_city] [varchar](255) NULL,
	[shipping_pinCode] [varchar](255) NULL,
	[shipping_country] [varchar](255) NULL,
	[shipping_state] [varchar](255) NULL,
	[shipping_phone] [varchar](255) NULL,
	[shipping_email] [varchar](255) NULL,
	[sellerName] [varchar](255) NULL,
	[billingName] [varchar](255) NULL,
	[shippingName] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
