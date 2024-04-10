/*INVENTORY MANAGEMENT*/
--Retrieve current inventory levels using a view:
CREATE OR REPLACE VIEW current_inventory AS
SELECT productname, quantityonhand
FROM products 
JOIN inventory ON products.productID = inventory.productID;

SELECT * FROM current_inventory;

--Identify products with low stock levels using a Function
CREATE OR REPLACE FUNCTION GetLowStockProducts(threshold_quantity INT)
RETURNS TABLE (
    ProductID INT,
    ProductName VARCHAR(100),
    QuantityInStock INT
)
AS $$
BEGIN
    RETURN QUERY
    SELECT p.ProductID, p.ProductName, p.QuantityInStock
    FROM Products p
    WHERE p.QuantityInStock < threshold_quantity;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM GetLowStockProducts(25);

--A VIEW TO CALCULATE INVENTORY ALERT
CREATE OR REPLACE VIEW InventoryAlerts AS
SELECT 
    ProductID,
    ProductName,
    QuantityInStock,
    
    CASE 
        WHEN QuantityInStock <= '60' THEN 'Low Stock'
        ELSE 'Sufficient Stock'
    END AS StockStatus
FROM 
    Products;

SELECT  * FROM InventoryAlerts;

--Calculate total inventory value using an aggregate function:

SELECT SUM(products.price * inventory.quantityonhand) AS total_inventory_value
FROM products
JOIN inventory ON products.productID = inventory.productID;

--This procedure adds a new product to the database.
CREATE OR REPLACE PROCEDURE AddNewOrder(
    customer_id INT,
	order_date DATE,
    total_amount NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Orders (CustomerID,orderdate, TotalAmount) VALUES (customer_id, order_date, total_amount);
END;
$$;
--Calling the Procedure
call AddNewOrder(1,'2024-04-05',20.23);

SELECT * FROM Orders;


/* 2. Sales Analysis:
SQL Queries:
Total sales revenue for a specific period using a scalar subquery:*/
SELECT 
  (SELECT SUM(totalAmount)
   FROM orders
   WHERE orderDate BETWEEN '2024-01-01' AND '2024-03-30') AS total_revenue;

--this function computes the total sales amount for a given product ID 
CREATE OR REPLACE FUNCTION GetProductTotalSales(product_id INT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (SELECT SUM(Quantity * UnitPrice)
			FROM OrderDetails WHERE ProductID = product_id);
END;
$$;

SELECT GetProductTotalSales(57);

--Top selling products using the GROUP BY and ORDER BY clauses & JOINS:

SELECT products.productID, products.productname, SUM(orderDetails.quantity) AS total_quantity_sold
FROM products
JOIN orderDetails ON products.productID = orderDetails.productID
GROUP BY products.productID, products.productname
ORDER BY total_quantity_sold DESC
LIMIT 10;

--Sales trend over time (Monthly) using the DATE_TRUNC function and GROUP BY clause:
SELECT DATE_TRUNC('month', orders.orderDate) AS month, SUM(orders.totalAmount) AS monthly_revenue
FROM orders
GROUP BY month
ORDER BY month;

--3. Customer Segmentation:

--Query customers based on purchase frequency using the GROUP BY and ORDER BY clauses:
SELECT orders.customerID COUNT(*) AS purchase_count
FROM orders
GROUP BY orders.customerID
ORDER BY purchase_count DESC; 

-- Sales Trends and Customer Purchase Pattern using the BETWEEN,AND, JOINS, GROUP BY, ORDER & ALIAS for easy reading
SELECT orders.OrderID, orders.OrderDate, customers.FirstName AS CustomerFirstName,customers.LastName AS CustomerLastName,
    SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS TotalOrderAmount
FROM Orders 
	JOIN Customers ON orders.CustomerID = customers.CustomerID
	JOIN OrderDetails ON orders.OrderID = OrderDetails.OrderID
WHERE orders.OrderDate BETWEEN '2023-01-01' AND '2024-03-31'
GROUP BY orders.OrderID, orders.OrderDate, customers.FirstName, customers.LastName
ORDER BY orders.OrderDate;
	
--Segment customers based on average purchase amount using the GROUP BY and ORDER BY clauses:
SELECT customerID, AVG(totalAmount) AS avg_purchase_amount
FROM orders
GROUP BY customerID
ORDER BY avg_purchase_amount DESC;

--4. Supply Chain Optimization:
/* A query to tell us the average delivery time of products by suppliers*/
SELECT suppliername, AVG(transactions.transactionDate - orders.orderDate) AS average_delivery_time
FROM suppliers
	JOIN products ON suppliers.supplierID = suppliers.supplierID
	JOIN orderDetails ON products.productID = orderDetails.productID
	JOIN orders ON orderDetails.orderID = orders.orderID
	JOIN transactions ON orders.orderID = orders.orderID
GROUP BY suppliers.supplierID;

-- CREATING INDEXES TO OPTMIZE SEARCH  IN THE DATABASE FOR MOSTLY SERACH ITEMS (Products, Customers, ordrr date)
CREATE INDEX product_index ON Products(ProductName);

CREATE INDEX idx_order_date ON Orders(OrderDate);

CREATE INDEX order_product_index ON OrderDetails(ProductID);

CREATE INDEX customer_index ON Customers(CustomerID);



