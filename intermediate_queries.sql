-- The total number of products in each category, sorted by the total number of products in descending order.
SELECT categories.categoryname, COUNT(products.productid) as TotalProducts
FROM products
JOIN categories
ON products.categoryid = categories.categoryid
GROUP BY categories.categoryname
ORDER BY TotalProducts DESC;

--Show the total number of Customers per country and city
SELECT customers.country, customers.city, COUNT(customers.city) AS TotalCustomer
FROM customers
GROUP BY customers.country, customers.city
ORDER BY TotalCustomer DESC;


--Reorder Products where Units in Stock is less that reorder level

SELECT products.productid, products.productname, products.unitsinstock, products.reorderlevel
FROM products
WHERE products.unitsinstock < products.reorderlevel
ORDER BY products.productid ASC;

--Reorder products where unitsinstock plus unitsonorder are less than or equal to reorder level and the discontinued flag is false (0)

SELECT products.productid, products.productname, products.unitsinstock, products.unitsonorder, products.reorderlevel, products.discontinued
FROM products
WHERE (products.unitsinstock + products.unitsonorder) <= products.reorderlevel AND products.discontinued = 0
ORDER BY products.productid ASC;

--Return a list of all customers sorted by region alphabetically, with customers sorted by id in each region and customers with no region at the end
SELECT customers.customerid, customers.companyname, customers.region,
  CASE
  WHEN customers.region is null then 1
  ELSE 0
  END
FROM customers
ORDER BY customers.region, customers.customerid;

--Return the top three contries with the highest average freight overall, in descending order by average freight from the orders table

SELECT orders.shipcountry, AVG(orders.freight) as freight
FROM orders
GROUP BY orders.shipcountry
ORDER BY freight DESC
LIMIT 3;

--Return the top ten contries with the highest average freight overall, in descending order by average freight from the orders table on orders that took place in 1996

SELECT orders.shipcountry, AVG(orders.freight) as freight
FROM orders
WHERE orders.orderdate BETWEEN '1/1/1996' and '01/01/1997'
GROUP BY orders.shipcountry
ORDER BY freight DESC
LIMIT 10;

-- -- Return the top three ship countries with the highest average freigh charges using the last 12 months of order data
--
-- SELECT orders.shipcountry, AVG(orders.freight) as freight, MAX(orders.orderdate) as latest
-- FROM orders
-- HAVING orders.orderdate > latest - interval '1 year'
-- GROUP BY orders.shipcountry
-- ORDER BY freight DESC
-- LIMIT 3;

-- Return an inventory list with employeeid, lastname, orderid, productname and quantity

SELECT orders.employeeid, employees.lastname, orders.orderid, products.productname, order_details.quantity
FROM orders
JOIN employees ON orders.employeeid = employees.employeeid
JOIN order_details ON orders.orderid = order_details.orderid
JOIN products ON order_details.productid = products.productid
ORDER BY orders.orderid, products.productid;
