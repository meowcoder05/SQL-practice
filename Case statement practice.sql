SELECT 
    CASE
        WHEN creditlimit < 75000 THEN 'Less than $75k'
        WHEN creditlimit BETWEEN 75000 AND 100000 THEN 'From $75k - $100k'
        WHEN creditlimit BETWEEN 100000 AND 150000 THEN 'From $100k - $150k'
        WHEN creditlimit > 150000 THEN 'More than $150k'
        ELSE 'Other'
    END AS credit_limit_group,
    
    COUNT(DISTINCT customernumber) AS customer
FROM
    customers
GROUP BY credit_limit_group;


SELECT 
    CASE
        WHEN priceeach < 90.00 THEN 'Low price'
        WHEN priceeach BETWEEN 90.00 AND 150.00 THEN 'Medium price'
        WHEN priceeach > 150.00 THEN 'High price'
        ELSE 'Other'
    END AS product_price,
    productcode
FROM
    orderdetails;


SELECT 
    CASE
        WHEN priceeach < 90.00 THEN 'Low price'
        WHEN priceeach BETWEEN 90.00 AND 150.00 THEN 'Medium price'
        WHEN priceeach > 150.00 THEN 'High price'
        ELSE 'Other'
    END AS product_price,
    products.productname,
	orderdetails.productcode,
    orderdetails.priceeach
FROM
    orderdetails
    Inner join products
    on orderdetails.productcode = products.productcode
    
Order by orderdetails.priceeach desc;
    
    
  SELECT 
    T1.firstname, T1.lastname, T2.officecode
FROM
    employees T1
        INNER JOIN
    offices T2 ON T1.officecode = T2.officecode
WHERE
    T2.officecode = 5;
    
    
    
   with cte_employees as
   (select employeenumber, firstname, officecode from employees),
   
   cte_offices as
(select officecode, city from offices)

SELECT cte_employees.employeenumber,
cte_employees.firstname,
cte_offices.officecode,
cte_offices.city
from cte_employees

inner join cte_offices
on cte_employees.officecode = cte_offices.officecode

where cte_offices.officecode = 5;
s












