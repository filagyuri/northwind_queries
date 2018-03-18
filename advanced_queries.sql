-- Return customers who have made at least one order with a toal of $10,000 in the year of 1997.

SELECT customers.customerid, customers.companyname, orders.orderid, ROUND(sum(order_details.unitprice * order_details.quantity)::numeric, 2) as totalorder
FROM customers
JOIN orders ON orders.customerid = customers.customerid
JOIN order_details ON order_details.orderid = orders.orderid
WHERE orders.orderdate BETWEEN '1/1/1997' and '01/01/1998'
GROUP BY customers.customerid, customers.companyname, orders.orderid
HAVING sum(order_details.unitprice * order_details.quantity) > 10000;


-- Return customers who have made orders whose total is greater $15,000
SELECT customers.customerid, customers.companyname, orders.orderid, ROUND(sum(order_details.unitprice * order_details.quantity)::numeric, 2) as totalorder
FROM customers
JOIN orders ON orders.customerid = customers.customerid
JOIN order_details ON order_details.orderid = orders.orderid
GROUP BY customers.customerid, customers.companyname, orders.orderid
HAVING sum(order_details.unitprice * order_details.quantity) > 15000;

--Return high value customers with discount


--Month end orders
-- Show all orders made on the last day fo the month, ordered by employeeid and orderid


--Orders with many line items
--Show the 10 orders with the most line items, in order of total line items
SELECT orders.orderid, count(order_details.productid) as totalorderdetails
FROM orders
JOIN order_details ON order_details.orderid = orders.orderid
GROUP BY orders.orderid
ORDER BY totalorderdetails DESC
LIMIT 10;

--Orders - random assortment
--Show a random set of 2% of the orders
SELECT orders.orderid
FROM orders
ORDER BY RANDOM()
LIMIT 17;
