use AdventureWorksLT2019

-- count, max, min, avg
select avg(p.ProductID) from SalesLT.Product as p

select * from SalesLT.ProductCategory as l
	left join SalesLT.Product as r on l.ProductCategoryID = r.ProductCategoryID

select * from SalesLT.Product as l
	full join SalesLT.ProductCategory as r on l.ProductCategoryID = r.ProductCategoryID

use ALevel
 
select * from Course
select c.*
	from Course as c order by c.[name] desc

select * from Student

select * from Student_Course

-- insert Course values (6, 'DevOps', 'Dev Ops for beginner', 20)

select * from Student
select * from Student_Course
select * from Course

select * from Student
select * from Student_Course
select s_c.*, '-', s.* from Student as s
	cross join Student_Course as s_c
	
select c.*, '-' , s_c.*, '-', s.* from Course as c
	full join Student_Course as s_c on c.courseId = s_c.courseId
	full join Student as s on s_c.studentId = s.studentId

select * from Student as s left join Student_Course as s_c on s_c.studentId = s.studentId

select * from Student as s left join Student_Course as s_c on s_c.studentId = s.studentId
		where s_c.studentId is null

select * from Student as s full join Student_Course as s_c on s_c.studentId = s.studentId