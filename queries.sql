-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.productname, c.categoryname
from Product as p
join category as c
    on p.categoryid = c.id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select
    o.id AS 'Order ID', 
    s.companyname AS 'Shipper'
from [Order] as o
JOIN Shipper AS s
    ON o.ShipVia = s.id
where o.orderdate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select ordDet.quantity, prod.productname
from OrderDetail as ordDet
join Product as prod
    on ordDet.productId = prod.id
where ordDet.orderid = 10251
order by prod.ProductName asc;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.Id, c.CompanyName, e.lastname as 'Employee lastname'
from [Order] as o
join Customer as c
    on c.id = o.CustomerId
join Employee as e
    on o.EmployeeId = e.Id;
