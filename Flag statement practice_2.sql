with cte_customers as
(select customernumber, customername from customers),

cte_orders as
(select ordernumber, customernumber, orderdate from orders),

cte_orderdetails as
(select ordernumber, productcode, quantityOrdered from orderdetails),

cte_products as 
(select productcode, productname from products)

Select
cte_customers.customername,
cte_orders.orderdate,
cte_products.productname,
cte_orderdetails.quantityOrdered,

Case when cte_orderdetails.quantityOrdered >= 40 
Then 1
Else 0
End as order_over_40

from cte_customers

inner join cte_orders
on cte_customers.customernumber = cte_orders.customernumber

inner join cte_orderdetails
on cte_orders.ordernumber = cte_orderdetails.ordernumber

inner join cte_products 
on cte_orderdetails.productcode = cte_products.productcode


