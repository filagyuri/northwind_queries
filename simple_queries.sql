--List all the shippers
SELECT * FROM shippers;

--List category name and description from categories;
SELECT categoryname, description FROM categories;

--List first name, last name, and hire date for employees whose title is sales representative
SELECT firstname, lastname, hiredate FROM employees WHERE title='Sales Representative';

--“Now we’d like to see the same columns as above, but only for those employees that both have the title of Sales Representative, and also are in the United States.”
SELECT firstname, lastname, hiredate FROM employees WHERE title='Sales Represantative' AND country='USA';

--List orderid and date placed by employee number 5
SELECT orderid, orderdate FROM orders WHERE employeeid=5;

--List the SupplierID, ContactName, and ContactTitle for those Suppliers whose ContactTitle is not Marketing Manager
SELECT supplierid, contactname, contacttitle FROM suppliers WHERE contacttitle !='Marketing Manager';

--List the product id and product name the products with queso in the name
SELECT productid, productname FROM products WHERE productname LIKE 'Queso%';

--Write a query that shows the OrderId, CustomerID, and Ship Country for the orders where the ShipCountry is either France Or Belgium
SELECT orderid, customerid, shipcountry FROM orders WHERE shipcountry='France' OR shipcountry='Belgium';

--Write a query that shows the OrderId, CustomerID, and Ship Country for the orders where the ShipCountry is in South America
SELECT orderid, customerid, shipcountry FROM orders WHERE shipcountry in ('Brazil', 'Mexico', 'Argentina', 'Venezuela');

--Write a query that returns employees in order of their age
SELECT firstname, lastname, title, birthdate FROM employees ORDER BY birthdate;

--Write a query that returns first name, last name, and a new colmn of full name for each employee
SELECT firstname, lastname, CONCAT(firstname, ' ', lastname) AS fullname FROM employees;

--Write a query that returns orderid, productid, unitprice, quantity and new column totalprice for orderdetails sorted by orderid and productid
SELECT orderid, productid, unitprice, quantity, (unitprice * quantity) AS totalprice FROM order_details ORDER BY orderid ASC, productid;

--What is the total number of customers?
SELECT COUNT(customerid) FROM customers;

--When was the first order?
SELECT MIN(orderdate) FROM orders;

--Show a list of countries where Northwind company has customers
SELECT DISTINCT country from customers;

--Show a list of all the different values in the Customers table for ContactTitles. Also include a count for each ContactTitle
SELECT DISTINCT contacttitle, COUNT(contacttitle) as totalcontacttitle FROM customers GROUP BY contacttitle ORDER BY totalcontacttitle DESC;


--Show the productid, productname, for each product, and the company name of the associated Supplier, sorting by the productid
SELECT products.productid, products.productname, suppliers.companyname
FROM products
JOIN suppliers
ON products.supplierid = suppliers.supplierid
ORDER BY products.productid;

--Show a list of orders that were made, including the Shipper that was used. Show only the OrderID, OrderDate (date only), and CompanyName of the Shipper and sort by OrderID. Select only orders with ORDER ID < 10300

SELECT orders.orderid, orders.orderdate, shippers.companyname
FROM orders
JOIN shippers
ON orders.shipvia = shippers.shipperid
WHERE orders.orderid < 10300
ORDER BY orders.orderid;
