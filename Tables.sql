CREATE DATABASE Shopify
USE Shopify

DROP DATABASE Shopify

/*-------------------------------------------CREATE TABLES---------------------------------------------*/
CREATE TABLE Customer (
  custName varchar(25),
  custId int,
  custEmail Varchar(50),
  custPass Varchar(20),
  custPhone Varchar(20),
  custGender Varchar(15),
  custAddress Varchar(50),
  PRIMARY KEY (custId)
);
DROP TABLE Customer;
SELECT * FROM Customer; 


CREATE TABLE Admin (
  adminName Varchar(25),
  adminId int,
  adminEmail Varchar(50),
  adminPass Varchar(20),
  adminPhone Varchar(20),
  PRIMARY KEY (adminId)
);
DROP TABLE Admin;
SELECT * FROM Admin;

CREATE TABLE Product (
  productName Varchar(50),
  productId int,
  productPrice float,
  productDescr Varchar(255),
  productQty int,
  adminId int,
  PRIMARY KEY (productId),
  FOREIGN KEY (adminId) REFERENCES Admin(adminId)
);
DROP TABLE Product;
SELECT * FROM Product;

CREATE TABLE Cart (
  cartId int,
  productId int,
  boughtQty int,
  PRIMARY KEY(cartId,productId),
  FOREIGN KEY (productId) REFERENCES Product,
  FOREIGN KEY (cartId) REFERENCES Customer(custId)
);
DROP TABLE Cart;
SELECT * FROM Cart;

CREATE TABLE Orders2 (
  orderId_2 int,
  cartId int,
  productId int,
  PRIMARY KEY (orderId_2),
  FOREIGN KEY (cartId, productId) REFERENCES Cart(cartId, productId)
);
DROP TABLE Orders2;
SELECT * FROM Orders2;

CREATE TABLE Orders (
  orderId int,
  orderCost float,
  orderDate Date,
  paymentMethod Varchar(255),
  PRIMARY KEY(orderId),
  FOREIGN KEY (orderId) REFERENCES Orders2(orderId_2)
);
DROP TABLE Orders;
SELECT * FROM Orders;

CREATE TABLE Delivery (
  orderId int,
  custId int,
  deliveryDate Date,
  deliveryStatus varchar(255),
  Foreign key (orderId) REFERENCES Orders(orderId),
  Foreign key (custId) REFERENCES Customer(custId)
);
DROP TABLE Delivery
SELECT * FROM Delivery;