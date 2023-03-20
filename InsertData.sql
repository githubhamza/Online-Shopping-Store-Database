Use Shopify;
/*-------------------------------------------INSERTION---------------------------------------------*/
BULK INSERT Customer
FROM 'C:\Users\Hamza\Desktop\Project\ONLINE SHOPPING STORE\Online-Shopping-Store-Database\Table Data\Customer.csv'
with (
    FIRSTROW=2,
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n');

BULK INSERT Product
FROM 'C:\Users\Hamza\Desktop\Project\ONLINE SHOPPING STORE\Online-Shopping-Store-Database\Table Data\Product.csv'
with (
    FIRSTROW=2,
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n');

BULK INSERT Cart
FROM 'C:\Users\Hamza\Desktop\Project\ONLINE SHOPPING STORE\Online-Shopping-Store-Database\Table Data\Cart.csv'
with (
    FIRSTROW=2,
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n');

BULK INSERT Orders2
FROM 'C:\Users\Hamza\Desktop\Project\ONLINE SHOPPING STORE\Online-Shopping-Store-Database\Table Data\MOCK_DATA.csv'
with (
    FIRSTROW=2,
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n');


BULK INSERT Orders
FROM 'C:\Users\Hamza\Desktop\Project\ONLINE SHOPPING STORE\Online-Shopping-Store-Database\Table Data\Orders.csv'
with (
    FIRSTROW=2,
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n');

BULK INSERT Delivery
FROM 'C:\Users\Hamza\Desktop\Project\ONLINE SHOPPING STORE\Online-Shopping-Store-Database\Table Data\Delivery.csv'
with (
    FIRSTROW=2,
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n');

INSERT INTO Admin values('Michael Clark', 1, 'micark@shopify.com', '0sdfsd', '326-856-956');