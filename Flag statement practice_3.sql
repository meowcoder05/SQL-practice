with cte_orders as
(select customernumber, ordernumber, comments from orders),

cte_orderdetails as
(select ordernumber, productcode from orderdetails),

cte_products as 
(select productcode, productname from products),

cte_customers as 
(select customername, customernumber from customers)

Select cte_products.productname,
cte_customers.customername,
cte_orders.customernumber, 
cte_orders.comments,

Case when upper(cte_orders.comments) like '%Negotiate%'
Then 1
Else 0
End as negotiated_request

from cte_orders
inner join cte_orderdetails 
on cte_orders.ordernumber = cte_orderdetails.ordernumber

inner join cte_products
on cte_orderdetails.productcode = cte_products.productcode

inner join cte_customers
on cte_orders.customernumber = cte_customers.customernumber
where
UPPER(cte_orders.comments) LIKE '%NEGOTIATE%';








cte_orderdetails as
(select ordernumber, productcode from orderdetails),

cte_products as
(select productcode, productname from products),

cte_main as ( 
Select 
cte_orders.customernumber,
cte_orders.comments,
cte_orderdetails.productcode,
cte_products.productname,

Case when cte_orders.comments LIKE '%Negotiate%'
Then 1
Else 0 
end as negotiated_request

From cte_orders

inner join cte_orderdetails
on cte_orders.ordernumber = cte_orderdetails.ordernumber

inner join cte_products
on cte_orderdetails.productcode = cte_products.productcode
)
Select productname, 
count(negotiated_request) as total_negotiated_request

from cte_main 
Group by productname
Order by total_negotiated_request desc;

max(negotiated_request) as high_negotiated_request,
min(negotiated_request) as low_negotiated_request