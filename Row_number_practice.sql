SELECT * FROM offices;
  SELECT * FROM employees;
    SELECT * FROM orders;
  SELECT * FROM customers;
  SELECT * FROM orderdetails;



with cte_main as
(SELECT T1.customernumber, T1.salesRepEmployeeNumber,
T2.ordernumber, T2.orderdate,
ROW_NUMBER() OVER (PARTITION BY T1.salesRepEmployeeNumber ORDER BY T2.orderdate) as row_id
from customers T1
inner join orders T2
on T1.customerNumber = T2.customerNumber)
select cte_main.salesrepemployeenumber, cte_main.ordernumber, cte_main.orderdate,cte_main.row_id
from cte_main
where row_id = 2




  
  with cte_main as
  (
SELECT customername,
country,
creditlimit,
  ROW_NUMBER() OVER (PARTITION BY country ORDER BY creditlimit asc) as row_id
  from customers 
  )
  select * from cte_main
  where row_id = 1
  and upper(country) like '%SP%';
  
  
WITH cte_main AS (
  SELECT distinct
    T1.customername,
    T1.salesRepEmployeeNumber,
    T2.customernumber,
    T3.quantityordered,
    ROW_NUMBER() OVER (PARTITION BY T1.customername ORDER BY T3.quantityordered DESC) AS row_id
  FROM customers T1
  INNER JOIN orders T2 ON T1.customernumber = T2.customerNumber
  INNER JOIN orderdetails T3 ON T2.ordernumber = T3.orderNumber
)
SELECT row_id,
  customername,
  salesRepEmployeeNumber,
 customernumber,
  quantityordered
FROM cte_main
WHERE row_id = 1
Order by quantityordered desc;

