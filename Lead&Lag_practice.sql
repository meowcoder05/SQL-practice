Select * from orderdetails;

with cte_main as
(Select ordernumber, productcode, quantityordered,
LEAD(quantityordered) OVER (PARTITION BY productcode ORDER BY ordernumber) AS next_month_orders
from orderdetails)
select *, next_month_orders - quantityordered as next_month_prediction
from cte_main;

with cte_main as
(Select ordernumber, productcode, quantityordered,
Lag(quantityordered) OVER (PARTITION BY productcode ORDER BY ordernumber) AS previous_month_orders
from orderdetails)
select *, previous_month_orders - quantityordered as previous_month_report
from cte_main;