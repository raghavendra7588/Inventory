USE [inventory]
GO
/****** Object:  Table [dbo].[Mst_App_Address]    Script Date: 14-10-2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mst_App_Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sellerId] [int] NULL,
	[vendorId] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[mobileNumber] [varchar](255) NULL,
	[houseNO] [varchar](255) NULL,
	[society] [varchar](255) NULL,
	[landmark] [varchar](255) NULL,
	[pincode] [int] NULL,
	[city] [varchar](255) NULL,
	[area] [varchar](255) NULL,
	[state] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mst_PurchaseOrderItem]    Script Date: 14-10-2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mst_PurchaseOrderItem](
	[PurchaseOrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[SellerId] [int] NULL,
	[ProductId] [int] NULL,
	[SubCategoryId] [int] NULL,
	[BrandId] [int] NULL,
	[BuyingPrice] [int] NULL,
	[FinalPrice] [int] NULL,
	[ReferenceId] [int] NULL,
	[Discount] [int] NULL,
	[Quantity] [varchar](255) NULL,
	[ProductVarientId] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[PurchaseQuantity] [int] NULL,
	[PurchaseOrderId] [int] NULL,
	[StockInCheck] [varchar](255) NULL DEFAULT ('false')
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mst_PurchaseProducts]    Script Date: 14-10-2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mst_PurchaseProducts](
	[PurchaseProductId] [int] IDENTITY(1,1) NOT NULL,
	[VendorCode] [varchar](255) NULL,
	[SellerId] [int] NULL,
	[OrderNo] [varchar](255) NULL,
	[OrderDate] [varchar](255) NULL,
	[DeliveryDate] [varchar](255) NULL,
	[AddressId] [int] NULL,
	[DeliveryType] [varchar](255) NULL,
	[PaymentType] [varchar](255) NULL,
	[DeliveryTime] [varchar](255) NULL,
	[CreatedAt] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Mst_App_InsertAddress]    Script Date: 14-10-2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mst_App_InsertAddress](
@sellerId int,
@vendorId varchar(255),
@name varchar(255),
@mobileNumber varchar(255),
@houseNo varchar(255),
@society varchar(255),
@landMark varchar(255),
@pinCode varchar(255),
@city varchar(255),
@area varchar(255),
@state varchar(255))
AS
BEGIN

	insert into Mst_App_Address(sellerId,vendorId,name,mobileNumber,houseNo,society,landMark,
	pinCode,city,area,state) 
	VALUES(@sellerId,@vendorId,@name,@mobileNumber,@houseNo,@society,@landMark,@pinCode,@city,@area,@state);

END
GO
/****** Object:  StoredProcedure [dbo].[Mst_App_updateAddressMaster]    Script Date: 14-10-2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mst_App_updateAddressMaster](
@id INT,
@sellerId int,
@vendorId varchar(255),
@name varchar(255),
@mobileNumber varchar(255),
@houseNo varchar(255),
@society varchar(255),
@landMark varchar(255),
@pinCode varchar(255),
@city varchar(255),
@area varchar(255),
@state varchar(255)
) AS
BEGIN
UPDATE Mst_App_Address
   SET
	sellerId=@sellerId,
	vendorId=@vendorId,
	name=@name,
	mobileNumber=@mobileNumber,
	houseNo=@houseNo,
	society=@society,
	landMark=@landMark,
	pinCode=@pinCode,
	city=@city,
	area=@area,
	state=@state
 WHERE id=@id;

END 
GO
/****** Object:  StoredProcedure [dbo].[Mst_insertPurchaseProduct]    Script Date: 14-10-2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mst_insertPurchaseProduct](
@VendorCode VARCHAR(255),
@SellerId int,
@OrderNo VARCHAR(255),
@OrderDate VARCHAR(255),
@DeliveryDate VARCHAR(255),
@AddressId int,
@DeliveryType varchar(255),
@PaymentType varchar(255),
@DeliveryTime varchar(255),
@id int output)
AS
BEGIN

	insert into Mst_PurchaseProducts(VendorCode,SellerId,OrderNo,OrderDate,DeliveryDate,AddressId,DeliveryType,PaymentType,
	DeliveryTime,CreatedAt) VALUES(@VendorCode,@SellerId,@OrderNo,@OrderDate,
	@DeliveryDate,@AddressId,@DeliveryType,@PaymentType,@DeliveryTime,GETDATE())
	SET @id=SCOPE_IDENTITY()
    RETURN  @id

END
GO
/****** Object:  StoredProcedure [dbo].[Mst_insertPurchaseProductItem]    Script Date: 14-10-2020 23:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mst_insertPurchaseProductItem](
@PurchaseProductId int,
@VendorCode VARCHAR(255),
@SellerId int,
@BrandId int,
@ProductId int,
@Discount int,
@FinalPrice int,
@MRP int,
@Quantity int,
@RequiredQuantity int,
@Unit VARCHAR(255),
@id int,
@name  VARCHAR(255))
AS
BEGIN

	insert into Mst_PurchaseProductsItem(PurchaseProductId,VendorCode,SellerId,BrandId,ProductId,
	Discount,FinalPrice,MRP,Quantity,RequiredQuantity,Unit,id,name) VALUES
	(@PurchaseProductId,@VendorCode,@SellerId,@BrandId,@ProductId,@Discount,@FinalPrice,@MRP,
	@Quantity,@RequiredQuantity,@Unit,@id,@name)
END
GO
