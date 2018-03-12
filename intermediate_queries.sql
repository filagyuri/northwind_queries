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
