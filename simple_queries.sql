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
