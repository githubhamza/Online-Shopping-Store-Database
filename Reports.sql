USE Shopify
/*---------------------------------------REPORTS---------------------------------------------------------*/
--1
SELECT COUNT (custId) AS TOTAL_CUSTOMERS FROM Customer
--2
SELECT productName,productId,productDescr, productPrice FROM Product WHERE productPrice in (SELECT MAX (productPrice) FROM Product);
--3
SELECT productName,productId,productDescr, productPrice FROM Product WHERE productPrice in (SELECT MIN (productPrice) FROM Product);
--4
SELECT COUNT (productId) AS TOTAL_PRODUCT FROM Product
--5
SELECT orderId,custId,deliveryDate,deliveryStatus FROM Delivery WHERE deliveryStatus = 'delivered'
--6
SELECT orderId,custId,deliveryDate,deliveryStatus FROM Delivery WHERE deliveryStatus = 'not delivered'
--7
SELECT SUM (orderCost) AS TOTAL FROM Orders
--8
SELECT AVG (orderCost) AS AVERAGE FROM Orders
--9
SELECT MAX (orderCost) AS MAX_ORDER FROM Orders
--10
SELECT MIN (orderCost) AS MIN_ORDER FROM Orders
--11
SELECT COUNT (orderId) AS TOTAL_ORDERS FROM Orders
--12
SELECT orderId,orderDate,paymentMethod FROM Orders WHERE paymentMethod = 'Jazz Cash'
--13
SELECT orderId,orderDate,paymentMethod FROM Orders WHERE paymentMethod = 'Easy Paisa'
--14
SELECT orderId,orderDate,paymentMethod FROM Orders WHERE paymentMethod = 'Card'
--15
SELECT orderId,orderDate,paymentMethod FROM Orders WHERE paymentMethod = 'Cash on Delivery'