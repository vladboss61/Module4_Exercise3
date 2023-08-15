-- ================================================================================================================================
use [Application]


select p.ProductId as id, p.[Name] as shortName from dbo.Product as p

select * from dbo.AdditionalProductInfo
select * from dbo.Company

select * from dbo.Product
select * from dbo.AdditionalProductInfo

select * from dbo.Product as p inner join dbo.AdditionalProductInfo as api on p.ProductId = api.AdditionalProductInfoId

-- ================================================================================================================================
use ALevel
--
--insert into Student values(6, 'Vlad_outlook', 'vlad2000@outlook.microsoft')


select * from Course c
	inner join Student_Course sc on c.courseId = sc.courseId
	inner join Student s on sc.studentId = s.studentId

select distinct * from Course

select [name], email from Student
select [name] from Student

select distinct [name] from Student

select * from Student as s where s.studentId = 4
select * from Student as s where s.studentId = 3 or s.studentId = 4 or s.studentId = 5

select * from Student as s where s.studentId not in (3, 4, 5)
select * from Student as s where s.studentId in (3, 4, 5)

select * from Student as s where s.[name] != 'Vlad' -- <>

select * from Student as s where s.[name] = 'Vlad' or (s.[name] = 'Vlad_2' and s.email like 'vlad%') and s.studentId in (1, 3)
-- ==

select * from Student as s where s.studentId not in (3, 4)

-- = | != == <>
select * from Student as s where s.[name] = 'Vlad'
select * from Student as s where s.[name] = 'Vlad' and s.studentId > 2

select * from Student as s where s.email like 'vlad2%'
select * from Student as s where s.email like 'vlad123%'
select * from Student as s where s.email like '%.com'
select * from Student as s where s.email like '%.microsoft'
select * from Student as s where s.email like '%234%'


select * from Student
select LEN(s.[name]) as lenghtOfName from Student as s
select CONCAT(s.[name], '---', s.[email]) as specialNameEmailColumn from Student as s

--aggregate functions

select MAX(s.studentId) from Student as s
select MIN(s.email) from Student as s

select * from Student 
select COUNT(s.studentId) from Student as s where s.email like '%.com'


select top 1 * from Student  as s where s.email like '%234%' order by s.[studentId] asc

select * from Student
select [name], s.[email], COUNT(*) from Student as s group by s.[name], s.[email] 

select [name], COUNT(*) from Student as s where s.email like '%.com' group by s.[name] order by s.[name] desc

select [name], COUNT(*) from Student as s
	where s.email like '%.com'
	group by s.[name] having s.[name] like 'vlad%'
	order by s.[name] desc

select top 2 [name] from Student

select * from Student
select * from Student_Course

-- ================================================================================================================================

use AdventureWorksLT2019

-- Отримаю всі продукти котрі не продані
select * from SalesLT.Product as p where p.SellEndDate is not null
select * from SalesLT.Product as p where p.SellEndDate is null

select COUNT(*) from SalesLT.Product

select COUNT(*) from SalesLT.Product as p where SellStartDate between '2002-06-01 00:00:00.000' and '2005-07-01 00:00:00.000' --inclusive alsways
select COUNT(*) from SalesLT.Product as p where p.SellStartDate >= '2002-06-01 00:00:00.000' and  p.SellStartDate <= '2005-07-01 00:00:00.000' --inclusive alsways

select * from SalesLT.Product as p where SellStartDate not between '2002-06-01 00:00:00.000' and '2005-07-01 00:00:00.000'  

select AVG(p.ListPrice) from SalesLT.Product as p
select SUM(p.ListPrice) from SalesLT.Product as p

--select Color, ListPrice
--into  #TempColorPrice --Это временная таблица 
--from SalesLT.Product

--select * from  #TempColorPrice
 
select * from SalesLT.ProductCategory

select * from SalesLT.Product as p where p.ProductCategoryID is null


select * from SalesLT.Product as p inner join SalesLT.ProductCategory as pc on p.ProductCategoryID = pc.ProductCategoryID

select * from SalesLT.Product as p left join SalesLT.ProductCategory as pc on p.ProductCategoryID = pc.ProductCategoryID 

select * from SalesLT.Product as p left join SalesLT.ProductCategory as pc on p.ProductCategoryID = pc.ProductCategoryID 
	where p.ProductCategoryID is null

select COUNT(*) from SalesLT.Product as p inner join SalesLT.ProductCategory as pc on p.ProductCategoryID = pc.ProductCategoryID

select COUNT(*) from SalesLT.Product as p left join SalesLT.ProductCategory as pc on p.ProductCategoryID = pc.ProductCategoryID 

select COUNT(*) from SalesLT.Product as p left join SalesLT.ProductCategory as pc on p.ProductCategoryID = pc.ProductCategoryID 
	where p.ProductCategoryID is null

select * from SalesLT.Product as p left join SalesLT.ProductCategory as pc on p.ProductCategoryID = pc.ProductCategoryID 
	where p.ProductCategoryID is null

select * from SalesLT.ProductCategory as pc right join SalesLT.Product as p on p.ProductCategoryID = pc.ProductCategoryID
	where p.ProductCategoryID is null

select * from SalesLT.Product as p full join SalesLT.ProductCategory as pc on p.ProductCategoryID = pc.ProductCategoryID where 
	p.ProductCategoryID is null and pc.ProductCategoryID is null

select COUNT(*) from SalesLT.Product as p cross join SalesLT.ProductCategory

--The Same
select count(*) from SalesLT.Product, SalesLT.ProductCategory

--update SalesLT.Product set ProductCategoryID = null where SalesLT.Product.ProductID = 707

--Transaction
select @@TRANCOUNT as OpenTrans

use [ALevel]

begin transaction

select @@TRANCOUNT as OpenTrans

begin try
	update Student set name = 'Vlad_outlook_updated' where studentId = 6
	select * from Student
	insert into Student values(9, 'Vlad_outlook_new', 'vlad2000@outlook.microsoft')
	commit transaction
end try
begin catch
	rollback transaction
end catch

select * from Student