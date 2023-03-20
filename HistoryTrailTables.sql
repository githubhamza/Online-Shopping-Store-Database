Use Shopify;
/*-------------------------------------------HISTORY TRAIL TABLE---------------------------------------------*/
 CREATE TABLE productHistory (
  productName Varchar(50),
  productId int,
  productPrice float,
  productDescr Varchar(255),
  productQty int,
  adminId int,
  logAction varchar(50),
  logTime smalldatetime
);
DROP TABLE productHistory;
SELECT * FROM productHistory;

CREATE TABLE deliveryHistory (
  custId int,
  deliveryDate Date,
  deliveryStatus varchar(255),
  orderId int,
  logAction varchar(50),
  logTime smalldatetime
);
DROP TABLE deliveryHistory;
SELECT * FROM deliveryHistory;

CREATE TABLE ordersHistory (
  orderId int,
  orderCost float,
  orderDate date,
  paymentMethod varchar(25),
  logAction varchar(50),
  logTime smalldatetime
);
DROP TABLE ordersHistory;
SELECT * FROM ordersHistory;