
INSERT INTO Categories (CategoryName) VALUES 
    ('Fruits'),
    ('Vegetables'),
    ('Dairy'),
    ('Meat'),
    ('Beverages'),
    ('Bakery'),
    ('Canned Goods'),
    ('Frozen Foods');

	select * from Categories;
	
INSERT INTO Products (ProductName, Description, CategoryID, Price, QuantityInStock) VALUES
    ('Pork', 'Fresh pork', 4, 9.99, 120),
    ('Grapes', 'Fresh green grapes', 1, 4.99, 100),
	('Pine Apple', 'Fresh pineapples', 1, 8.99, 120),
	('Cookies', 'Tasty yummy cookies', 6, 10.99, 150),
	('Chips', 'Crunchy chips', 6, 12.99, 100)

	
	
	
select * from products;


INSERT INTO Customers (FirstName, LastName, Address, Email, Phone) VALUES
   
    ('Priyanka', 'Mohan', '123 Main Street, New York, USA', 'pm20556@pace.edu', '883-323-7828'),
	('Rahul', 'Masila', '143 Hazlet Street, New York, USA', 'rm20056@pace.edu', '994-323-2028'),
    ('John', 'Pathew', '149 William Street, New York, USA', 'jp20096@pace.edu', '883-932-3221'),
	('Peter', 'Parker', '153 Lincoln Street, New Jersey, USA', 'pp92556@pace.edu', '932-434-5443'),
	('George', 'Drew', '177 Bethony Street, New Jersey, USA', 'gd20956@pace.edu', '434-323-5443'),
	('Sriya', 'Bhatia', '123 Main Street, New York, USA', 'sb20036@pace.edu', '399-434-8844'),
	('Lucifer', 'Chandler', '33 Main Street, New Jersey, USA', 'lc23356@pace.edu', '435-234-9983'),
 	('Rachel', 'Green', '99 Bay Street, New York, USA', 'rg21956@pace.edu', '883-303-0943')

 
 
 
 
 
 select * from customers;
 
 
INSERT INTO Employees (FirstName, LastName, Position, Salary, HireDate) VALUES
    
	('Priyanka', 'Mohan', 'Bakery Clerk', 55000, '2018-04-12'),
	('Rachel', 'Green', 'Cashier', 45000, '2018-09-23'),
	('Rahul', 'Masila', 'Store Manager', 75000, '2018-06-30'),
	('John', 'Pathew', 'Janitor', 20000, '2018-01-29'),
	('Peter', 'Parker', 'Stock Clerk', 65000, '2018-12-22'),
	('George', 'Drew', 'Meat/Seafood Clerk', 60000, '2019-09-28'),
	('Sriya', 'Bhatia', 'Department Manager', 65000, '2018-08-30'),
	('Lucifer', 'Chandler', 'Janitor', 20000, '2018-12-21')
	
	
	
 select * from Employees;
 INSERT INTO Suppliers(suppliername,contactname,address,email,phone)
 VALUES
 ('African Food Holdings', 'Solomon Ngatto','5B Circular Rd, Sierra Leone', 'ssngatto@gmail.com','+23232 807-613'),
 ('Fresh Afric Product', 'Choti Deol','Delhi', 'choti@gmail.com','+91 456-8897');
  select * from Suppliers;
 
 
-- Populate Orders table with dummy data for 10 records
INSERT INTO Orders (CustomerID, TotalAmount) 
VALUES 
   
	
	
	
   

-- Populate OrderDetails table with dummy data for 10 records
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) 
VALUES 
   
	(22, 24, 150, 1200.40),
	(23, 25, 195, 1400.00),
	(30, 26, 200, 1800.79),
	(45, 22, 250, 1400.29),
	(46, 16, 200, 1500.80),
	(47, 15, 340, 2000.00),
	(48, 12, 350, 1800.90),
	(49, 13, 245, 1700.80)
	
select *from products	
select * from OrderDetails;
select * from Orders;


INSERT INTO Orders (CustomerID, TotalAmount) 
VALUES 
    (14, 170.25),
    (15, 245.65),
	(16, 200.98),
	(17, 65.78),
	(18, 120.55),
	(19, 420.05),
	(20, 430.95),
	(21, 490.55)
	
select *from categories
select *from customers
select *from employees
select *from inventory
select *from orderdetails
select *from orders
select *from products
select *from suppliers
select *from transcationdetails
select *from transcations



















