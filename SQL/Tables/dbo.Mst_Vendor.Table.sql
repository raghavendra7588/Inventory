USE [inventory]
GO
/****** Object:  Table [dbo].[Mst_Vendor]    Script Date: 19-09-2020 01:49:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mst_Vendor](
	[vendorId] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[underLedger] [varchar](255) NULL,
	[contactPerson] [varchar](255) NULL,
	[printName] [varchar](255) NULL,
	[category] [varchar](255) NULL,
	[subCategory] [varchar](255) NULL,
	[brand] [varchar](255) NULL,
	[fileUpload] [varchar](255) NULL,
	[gst] [varchar](255) NULL,
	[gstCategory] [varchar](255) NULL,
	[pan] [varchar](255) NULL,
	[registrationDate] [varchar](255) NULL,
	[distance] [varchar](255) NULL,
	[cin] [varchar](255) NULL,
	[priceCategory] [varchar](255) NULL,
	[agentBroker] [varchar](255) NULL,
	[transporter] [varchar](255) NULL,
	[creditLimit] [varchar](255) NULL,
	[ifscCode] [varchar](255) NULL,
	[accountNumber] [varchar](255) NULL,
	[bankName] [varchar](255) NULL,
	[branch] [varchar](255) NULL,
	[sellerId] [varchar](50) NULL,
	[address] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[pinCode] [varchar](255) NULL,
	[state] [varchar](255) NULL,
	[country] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[accountName] [varchar](255) NULL,
	[accountType] [varchar](255) NULL,
	[creditLimitDays] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
