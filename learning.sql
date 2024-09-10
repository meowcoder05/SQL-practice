select productname, quantityOrdered, quantityInStock
from products T1
left join orderdetails T2
on T1.productCode = T2.productCode;

SELECT distinct firstName, quantityOrdered, amount, paymentDate
FROM customers T1
INNER JOIN orders T2
ON T1.customerNumber = T2.customerNumber
inner join orderdetails T3
on t2.ordernumber = t3.ordernumber
inner join products t4
on t3.productcode = t4.productcode
inner join payments T5
on T1.customerNumber = T5.customerNumber
inner join employees T6
on T1.salesRepEmployeeNumber = T6.employeeNumber
where quantityOrdered = 6;

/*Question 1*/
select T1.customerName, T1.contactFirstName, T1.contactlastname, T2.orderdate, t2.status
from customers T1
inner join orders T2
on T1.customerNumber = T2.customerNumber;

/*Question 2*/
select T1.customerName, T1.contactFirstName, T1.contactLastName, T2.orderdate, T2.ordernumber
from customers T1
left join orders T2
on T1.customerNumber = T2.customerNumber
where orderDate is null;

select 'customer' as type,
contactfirstname as firstname,
contactlastname as lastname,
city 
from customers
union
select 'employee' as type,
firstname, lastname,
'Unknown' as city
from employees;

/*Union & Union all syntax practice*/
select customernumber,
customerName,
' ' as status
from customers
union all
select customernumber,
' ' as customername,
status 
from orders;

select ordernumber, sum(quantityordered) as total_orders
from orderdetails
group by ordernumber;

SELECT 
    productcode, SUM(quantityinstock) AS total_quantity_in_stock
FROM
    products
GROUP BY productCode
ORDER BY productCode;

SELECT 
    customername,
    ROUND(SUM(creditlimit), 0) AS total_credit_limit
FROM
    customers
GROUP BY customername
HAVING total_credit_limit > 60000
ORDER BY total_credit_limit;

select productcode, count(distinct ordernumber) as order_by_productcode,
from orderdetails
group by productcode;

SELECT 
    paymentdate,
    MAX(ROUND(amount, 0)) AS highest,
    MIN(ROUND(amount, 0)) AS lowest
FROM
    payments
GROUP BY paymentdate;

select paymentdate, avg(amount) as average_payment
from payments
group by paymentdate;

select avg(amount) as average_payment
from payments;

select ordernumber, sum(distinct quantityordered) as amount_orders
from orderdetails 
group by ordernumber

SELECT 
    T1.customername,
    T1.customername,
    T2.customernumber,
    T3.ordernumber,
    SUM(DISTINCT T3.quantityordered) AS total_amount_orders
FROM
    customers T1
        INNER JOIN
    orders T2 ON T1.customernumber = T2.customernumber
        INNER JOIN
    orderdetails T3 ON T2.ordernumber = T3.ordernumber
GROUP BY T1.customername , T2.customernumber , T3.ordernumber
ORDER BY total_amount_orders DESC;

SELECT 
    T1.customername,
    T2.customernumber,
    MIN(T2.paymentDate) AS first_order_date,
    MAX(T2.paymentDate) AS lastest_order_date
FROM
    customers T1
        INNER JOIN
    payments T2 ON T1.customerNumber = T2.customerNumber
GROUP BY T1.customername , T2.customernumber;


select productname, sum(quantityinstock * buyprice) as total_value_of_stock
from products
group by productname;


SELECT 
    T4.customername,
    T5.creditLimit,
    T6.employeeNumber,
    T6.firstName,
    T6.email,
    SUM(ROUND(total_value_per_ordernumber, 1)) AS total_value_per_cus
FROM
    (SELECT 
        T1.customername,
            T2.customernumber,
            T3.ordernumber,
            SUM(T3.quantityordered * priceeach) AS total_value_per_ordernumber
    FROM
        customers T1
    INNER JOIN orders T2 ON T1.customernumber = T2.customernumber
    INNER JOIN orderdetails T3 ON T2.ordernumber = T3.ordernumber
    GROUP BY T1.customername , T2.customernumber , T3.ordernumber) AS T4
        INNER JOIN
    customers T5 ON T4.customername = T5.customerName
        INNER JOIN
    employees T6 ON T5.salesRepEmployeeNumber = T6.employeeNumber
GROUP BY T4.customername , T5.creditLimit, T6.employeeNumber, T6.firstName,
    T6.email
HAVING total_value_per_cus > 40000.00
ORDER BY total_value_per_cus DESC
LIMIT 5;


with cte_orders as
(select customernumber, ordernumber, status from orders),
cte_customers as
(select customername, customerNumber from customers)

select 
cte_customers.customername,
cte_orders.ordernumber,
cte_orders.status
from cte_orders

inner join cte_customers
on cte_orders.customernumber = cte_customers.customerNumber
where status = 'Cancelled';

SELECT * FROM customers
Where contactLastName <> 'Young';

SELECT customerName, contactLastName, contactFirstName, phone, city, country 
From customers
Where contactFirstName = 'Julie' and country = 'USA';

SELECT customerName, contactLastName, contactFirstName, phone, city, country, creditLimit
From customers
Where country = 'Norway'
or country = 'Sweden';

select * from customers
Where (country = 'USA' 
or country = 'UK')
and contactLastName = 'Brown';

select salesrepemployeenumber, contactFirstName, country from customers
Where salesrepemployeenumber <> 'Null';

select * from employees;

Select email from employees
where jobTitle = 'Sales Rep';

select *, upper(firstname), upper(lastname) as uppername
from employees;

select * from employees
where lower(email) in 
('jfirrelli@classicmodelcars.com',
'ykato@classicmodelcars.com',
'abow@classicmodelcars.com')
and upper(jobTitle) in
('SALES REP');

select distinct country
from customers;

select *
from customers
where upper(city) LIKE '%NEW%';


select * from customers 
where phone LIKE '%55%';

select * from offices
order by officeCode asc;

select * from orders t1
inner join customers t2;

select distinct customerNumber
from orders


select lastname, firstname, jobtitle, customername 
from employees T1
left join customers T2
on t1.employeenumber = t2.salesrepemployeenumber
where customername is null
and upper(jobtitle) = 'SALES REP'


