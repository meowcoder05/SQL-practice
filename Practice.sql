SELECT * FROM classicmodels.products;

SELECT * FROM classicmodels.productlines;

/* Tìm tổng giá trị của Classic Cars trong kho*/

SELECT 
productname,
    productline, sum(quantityinstock * buyprice) as total_value_classic_cars
FROM
    products
    Where productline = 'Classic Cars'
Group by productLine, productname

