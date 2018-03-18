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

--Orders - accidental double entry
--Show all the OrderIds with line items that have a quantity of 60 or more, order by order id
SELECT order_details.orderid
FROM order_details
WHERE order_details.quantity >= 60
GROUP BY order_details.orderid, order_details.quantity
HAVING count(order_details.orderid) >1;


-- Orders - accidental double-entry, derived table
SELECT order_details.orderid, order_details.productid, order_details.unitprice, order_details.quantity, order_details.discount
FROM order_details
JOIN
  (SELECT order_details.orderid
  FROM order_details
  WHERE order_details.quantity >= 60
  GROUP BY order_details.orderid, order_details.quantity
  HAVING Count(*) > 1) PotentialProblemOrders
  ON PotentialProblemOrders.orderid = order_details.orderid
ORDER BY order_details.orderid, order_details.productid;


--Late Orders
--Return orders that are late
SELECT orders.orderid, orders.orderdate, orders.requireddate, orders.shippeddate
FROM orders
WHERE orders.shippeddate >= orders.requireddate;

--Late Orders
--Return the sales people that have the most orders arriving late
SELECT orders.employeeid, employees.lastname, sum(case when orders.shippeddate >= orders.requireddate then 1 else 0 end) as lateorders
FROM orders
JOIN employees ON employees.employeeid = orders.employeeid
GROUP BY orders.employeeid, employees.lastname
ORDER BY lateorders DESC;

--Late orders vs total orders
-- compare the number of orders arriving late for each sales person agains the total number of orders per sales person

SELECT orders.employeeid, employees.lastname, count(*) as allorders, sum(case when orders.shippeddate >= orders.requireddate then 1 else 0 end) as lateorders
FROM orders
JOIN employees ON employees.employeeid = orders.employeeid
GROUP BY orders.employeeid, employees.lastname
ORDER BY employeeid;
