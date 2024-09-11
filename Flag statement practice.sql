/*Using Flag statement*/

with cte_customers as
(select customernumber, customername from customers),

cte_orders as
(select ordernumber, customernumber, orderdate from orders),

cte_orderdetails as
(select ordernumber, productcode, quantityOrdered from orderdetails),

cte_products as 
(select productcode, productname from products),

cte_main as
(Select
cte_customers.customername,
cte_orders.orderdate,
cte_products.productname,
cte_orderdetails.quantityOrdered

from cte_customers

inner join cte_orders
on cte_customers.customernumber = cte_orders.customernumber

inner join cte_orderdetails
on cte_orders.ordernumber = cte_orderdetails.ordernumber

inner join cte_products 
on cte_orderdetails.productcode = cte_products.productcode)

SELECT orderdate, sum(quantityordered) as total_order_per_day,
case when sum(quantityordered) > 500 
Then 1
Else 0
End as high_volumn_orders
from cte_main
Where orderdate Like '%2003%'
Group by orderdate;

