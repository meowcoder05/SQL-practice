/*Subquery with cte syntax */
with cte_payments as
(Select customernumber, paymentdate, amount from payments),

cte_customers as
(Select customernumber, customername from customers),

cte_orders as
(Select customernumber, status from orders)

SELECT 
    cte_customers.customername,
    cte_payments.customernumber,
    cte_payments.paymentdate,
    cte_payments.amount,
    cte_orders.status

from cte_payments

inner join cte_customers
on cte_payments.customernumber = cte_customers.customernumber

inner join cte_orders
on cte_customers.customernumber = cte_orders.customernumber
where cte_orders.status = 'Cancelled'
AND cte_payments.amount between 100000.00 and 130000.00


