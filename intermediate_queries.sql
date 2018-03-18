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
