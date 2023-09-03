select * from Employees;

with employees_anchor as
(
	select employeeid, lastname, firstname, reportsto, 0 as level
	from employees
	where reportsto is null
	union all
	select r.employeeid, r.lastname, r.firstname, r.reportsto, a.level + 1
	from employees_anchor a
	, employees r
	where r.reportsto = a.employeeid
) select level, employeeid, lastname, firstname, reportsto from employees_anchor

select ReportsTo, * from Employees where ReportsTo is null
select * from Employees;

with Anchor_Member as
(
	-- Anchor Member
	select EmployeeID, LastName, FirstName, ReportsTo, 0 as LEVEL
	from Employees
	where ReportsTo is null
	-- Union All
	UNION ALL
	-- Recursive Member
	select R.EmployeeID, R.LastName, R.FirstName, R.ReportsTo, A.LEVEL + 1
	from Anchor_Member A, Employees R
	where A.EmployeeID = R.ReportsTo
) 
SELECT LEVEL
	 , CONCAT(REPLICATE(' ', LEVEL * 2), EmployeeID) AS EMPLOYEEID
	 , LastName
	 , FirstName
	 , ReportsTo 
FROM Anchor_Member



select * from [Order Details]
select * from Customers
select * from Region
select * from Territories
select * from Employees
select * from EmployeeTerritories

select * from Categories
select * from Products

select * 
from Employees A
	left outer join region B on A.Region = B.RegionID

select * from Orders
select * from Customers
select * from [Order Details]

select A.CustomerID, count(distinct C.productId)
from Customers A
	join Orders B ON A.CustomerID = B.CustomerID
	join [Order Details] C ON B.OrderID = C.OrderID
group by A.CustomerID
order by A.CustomerID

select * from Orders where CustomerID = 'ALFKI'


select *
from [Orders] A
	join [Order Details] B On A.OrderID = B.OrderID 
where A.CustomerID = 'ALFKI'

select * from products
where QuantityPerUnit like '% \- %' escape '\'
