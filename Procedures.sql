Use Shopify;
/*-------------------------------------------PROCEDURES---------------------------------------------*/
CREATE PROC getProductDataFromId
@productId int
as
begin
   Select productName, productId, productPrice, productDescr, productQty FROM Product WHERE productID = @productId
END

CREATE PROC getCustomerDataFromId
@custId int
as
begin
   Select custName, custId, custEmail, custPass,custPhone, custGender, custAddress 
   FROM Customer WHERE custId = @custId
END

CREATE PROC getCartDataFromId
@cartId int
as
begin
   Select cartId, productId, boughtQty 
   FROM Cart WHERE cartId = @cartId
END

CREATE PROC getOrderDataFromId
@orderId int
as
begin
   Select orderId, orderCost, orderDate, paymentMethod  
   FROM Orders WHERE orderId = @orderId
END

CREATE PROC getDeliveryDataFromId
@custId int
as
begin
   Select custId, deliveryDate, deliveryStatus, orderId
   FROM Delivery WHERE custId = @custId
END

create procedure insert_Customer
@custName varchar(25),
@custId int,
@custEmail Varchar(50),
@custPass Varchar(20),
@custPhone Varchar(20),
@custGender Varchar(15),
@custAddress Varchar(50)
as
begin
	insert into Customer(custName, custId, custEmail, custPass, custPhone, custGender, custAddress)
				values (@custName, @custId, @custEmail, @custPass, @custPhone, @custGender, @custAddress)
END

CREATE PROCEDURE Product_record 
@productName Varchar(50),
@productId int,
@productPrice float,
@productDescr Varchar(255),
@productQty int,
@adminId int,
@StatementType Varchar(20)
AS 
   Begin 
          IF @StatementType = 'Insert'
		  Begin
		       Insert Into Product(productName, productId, productPrice, productDescr, productQty, adminId)
               values (@productName, @productId, @productPrice, @productDescr, @productQty, @adminId)
           end
		   IF @StatementType = 'Update'
		   Begin   
			   update Product 
			   set    productPrice = @productPrice,
			          productQty = @productQty
		       where  productId = @productId
          end
		  ELSE IF @StatementType = 'Delete'
		  Begin
			   Delete from Product
			   where productId=@productId
          end
 end

 CREATE PROCEDURE Order_record
@cartId int,
@productId int,
@orderId int,
@orderCost float,
@orderDate Date,
@paymentMethod Varchar(255),
@StatementType Varchar(20)
AS 
   Begin 		  	
          IF @StatementType = 'Insert'
		  Begin
			   Insert Into Orders2(orderId_2,cartId,productId)
               values (@orderId, @cartId, @productId)
		       Insert Into Orders(orderId, orderCost, orderDate, paymentMethod)
               values (@orderId, @orderCost, @orderDate, @paymentMethod)
          end
		  IF @StatementType = 'Update'
		  Begin   
			  update Orders 
			  set    orderCost = @ordercost,
			         paymentMethod = @paymentMethod
		      where  orderId = @orderId
          end
		  ELSE IF @StatementType = 'Delete'
		  Begin
			   Delete from Orders2
			   where orderId_2=@orderId
			   Delete from Orders
			   where orderId=@orderId
          end
 end

CREATE PROCEDURE Delivery_record 
@custId int,
@deliveryDate Date,
@deliveryStatus varchar(255),
@orderId int,
@StatementType Varchar(20)
AS 
   Begin 
          IF @StatementType = 'Insert'
		  Begin
		       Insert Into Delivery(custId, deliveryDate, deliveryStatus, orderId)
               values (@custId, @deliveryDate, @deliveryStatus, @orderId)
           end
		   IF @StatementType = 'Update'
		   Begin   
			   update Delivery 
			   set    deliveryDate = @deliveryDate,
			          deliveryStatus = @deliveryStatus
		       where  orderId = @orderId
          end
		  ELSE IF @StatementType = 'Delete'
		  Begin
			   Delete from Delivery
			   where orderId=@orderId
          end
 end
