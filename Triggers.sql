USE Shopify
/*-------------------------------------------TRIGGER---------------------------------------------*/
 CREATE TRIGGER deleteProduct_trigger ON Product
 INSTEAD OF DELETE
 AS
	declare @nameProduct Varchar(50);
	declare @idProduct int;
	declare @priceProduct float;
	declare @descrProduct Varchar(255);
	declare @qtyProduct int;
	declare @idAdmin int;

	select @nameProduct = d.productName from deleted d;
	select @idProduct = d.productId from deleted d;
	select @priceProduct = d.productPrice from deleted d;
	select @descrProduct = d.productDescr from deleted d;
	select @qtyProduct = d.productQty from deleted d;
	select @idAdmin = d.adminId from deleted d;

	BEGIN 
		if(@qtyProduct > 0)
		begin 
			RAISERROR('The product cannot be deleted because the quantity is more than 0',16,1);
			ROLLBACK;
        end
		else
		begin
			DELETE FROM Product where productId = @idProduct
			COMMIT
			insert into productHistory (productName ,productId, productPrice, productDescr, productQty, adminId, logAction, logTime)
			values(@nameProduct, @idProduct, @priceProduct, @descrProduct, @qtyProduct, @idAdmin,'Deleted',getdate());
			PRINT 'Record Deleted'

		end
	END
GO

 CREATE TRIGGER insertProduct_trigger ON Product
 AFTER INSERT
 AS
	declare @nameProduct Varchar(50);
	declare @idProduct int;
	declare @priceProduct float;
	declare @descrProduct Varchar(255);
	declare @qtyProduct int;
	declare @idAdmin int;

	select @nameProduct = i.productName from inserted i;
	select @idProduct = i.productId from inserted i;
	select @priceProduct = i.productPrice from inserted i;
	select @descrProduct = i.productDescr from inserted i;
	select @qtyProduct = i.productQty from inserted i;
	select @idAdmin = i.adminId from inserted i;

	insert into productHistory (productName ,productId, productPrice, productDescr, productQty, adminId, logAction, logTime)
	values(@nameProduct, @idProduct, @priceProduct, @descrProduct, @qtyProduct, @idAdmin,'inserted',getdate());
	PRINT 'Record Inserted'
GO

 CREATE TRIGGER updateProduct_trigger ON Product
 AFTER UPDATE
 AS
	declare @nameProduct Varchar(50);
	declare @idProduct int;
	declare @priceProduct float;
	declare @descrProduct Varchar(255);
	declare @qtyProduct int;
	declare @idAdmin int;

	select @nameProduct = i.productName from inserted i;
	select @idProduct = i.productId from inserted i;
	select @priceProduct = i.productPrice from inserted i;
	select @descrProduct = i.productDescr from inserted i;
	select @qtyProduct = i.productQty from inserted i;
	select @idAdmin = i.adminId from inserted i;


	insert into productHistory (productName ,productId, productPrice, productDescr, productQty, adminId, logAction, logTime)
	values(@nameProduct, @idProduct, @priceProduct, @descrProduct, @qtyProduct, @idAdmin,'Updated',getdate());
	PRINT 'Record Updated'
GO

SELECT * FROM productHistory;
SELECT * FROM Product;

/*-------------------------------------trigger for transactional------------------------------------------*/
 CREATE TRIGGER deleteDelivery_trigger ON Delivery
 INSTEAD OF DELETE
 AS
	declare @idCust int;
	declare @dateDelivery date;
	declare @statusDelivery varchar(255);
	declare @idOrder int;

	select @idCust = d.custId from deleted d;
	select @dateDelivery = d.deliveryDate from deleted d;
	select @statusDelivery = d.deliveryStatus from deleted d;
	select @idOrder = d.orderId from deleted d;

	BEGIN 
		if(@statusDelivery = 'not delivered')
		begin 
			RAISERROR('Cant be deleted because the order is not delivered yet',16,1);
			ROLLBACK;
        end
		else
		begin
			DELETE FROM Delivery where orderId = @idOrder
			COMMIT
			insert into deliveryHistory (custId ,deliveryDate, deliveryStatus,orderId, logAction, logTime)
			values(@idCust, @dateDelivery, @statusDelivery, @idOrder,'Deleted', getdate());
			PRINT 'Record Deleted'

		end
	END
GO

 CREATE TRIGGER insertDelivery_trigger ON Delivery
 AFTER INSERT
 AS
	declare @idCust int;
	declare @dateDelivery date;
	declare @statusDelivery varchar(255);
	declare @idOrder int;

	select @idCust = i.custId from inserted i;
	select @dateDelivery = i.deliveryDate from inserted i;
	select @statusDelivery = i.deliveryStatus from inserted i;
	select @idOrder = i.orderId from inserted i;

	insert into deliveryHistory (custId ,deliveryDate, deliveryStatus,orderId, logAction, logTime)
	values(@idCust, @dateDelivery, @statusDelivery, @idOrder,'Inserted', getdate());
	PRINT 'Record Inserted'
GO

 CREATE TRIGGER updateDelivery_trigger ON Delivery
 AFTER UPDATE
 AS
	declare @idCust int;
	declare @dateDelivery date;
	declare @statusDelivery varchar(255);
	declare @idOrder int;

	select @idCust = i.custId from inserted i;
	select @dateDelivery = i.deliveryDate from inserted i;
	select @statusDelivery = i.deliveryStatus from inserted i;
	select @idOrder = i.orderId from inserted i;

	insert into deliveryHistory (custId ,deliveryDate, deliveryStatus,orderId, logAction, logTime)
	values(@idCust, @dateDelivery, @statusDelivery, @idOrder,'Updated', getdate());
	PRINT 'Record Updated'
GO

SELECT * FROM deliveryHistory;
SELECT * FROM Delivery;

 CREATE TRIGGER deleteOrders_trigger ON Orders
 AFTER DELETE
 AS
	declare @idOrder int;
	declare @costOrder float;
	declare @dateOrder date;
	declare @methodPayment varchar(255);

	select @idOrder = d.orderId from deleted d;
	select @costOrder = d.orderCost from deleted d;
	select @dateOrder = d.orderDate from deleted d;
	select @methodPayment = d.paymentMethod from deleted d;

	insert into ordersHistory (orderId, orderCost, orderDate, paymentMethod, logAction, logTime)
	values(@idOrder, @costOrder, @dateOrder, @methodPayment,'Deleted', getdate());
	PRINT 'Record Deleted'
GO

 CREATE TRIGGER insertOrders_trigger ON Orders
 AFTER INSERT
 AS
	declare @idOrder int;
	declare @costOrder float;
	declare @dateOrder date;
	declare @methodPayment varchar(255);

	select @idOrder = i.orderId from inserted i;
	select @costOrder = i.orderCost from inserted i;
	select @dateOrder = i.orderDate from inserted i;
	select @methodPayment = i.paymentMethod from inserted i;

	insert into ordersHistory (orderId ,orderCost, orderDate, paymentMethod, logAction, logTime)
	values(@idOrder, @costOrder, @dateOrder, @methodPayment, 'Inserted', getdate());
	PRINT 'Record Inserted'
GO

 CREATE TRIGGER updateOrders_trigger ON Orders
 AFTER UPDATE
 AS
	declare @idOrder int;
	declare @costOrder float;
	declare @dateOrder date;
	declare @methodPayment varchar(255);

	select @idOrder = i.orderId from inserted i;
	select @costOrder = i.orderCost from inserted i;
	select @dateOrder = i.orderDate from inserted i;
	select @methodPayment = i.paymentMethod from inserted i;
	 
	insert into ordersHistory (orderId ,orderCost, orderDate, paymentMethod, logAction, logTime)
	values(@idOrder, @costOrder, @dateOrder, @methodPayment, 'Updated', getdate());
	PRINT 'Record Updated'
GO

SELECT * FROM ordersHistory;
SELECT * FROM Orders;
