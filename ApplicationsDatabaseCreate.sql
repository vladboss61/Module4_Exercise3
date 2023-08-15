if DB_ID('Application') is not null 
begin
   print 'Application exists'
end
else
begin
    create database [Application]
end

go
use [Application]

create table Product (
   ProductId     int,
   [Name]        nvarchar(2500) not null,
   [CompanyId]   int not null,
   constraint PK_Product primary key (ProductId)
)

create table Company (
   CompanyId     int,
   [Name] nvarchar(2500) not null,
   [Description] nvarchar(max) not null,
   constraint PK_Company primary key (CompanyId)
)

create table AdditionalProductInfo (
    AdditionalProductInfoId int unique not null,
	[Type] nvarchar(1000) not null,
	[CreationTime] datetime
)

go

-- Add AdditionalProductInfo - Product foreign key one to on
alter table [AdditionalProductInfo]
add constraint FK_AdditionalProductInfo_AdditionalProductInfoId_Ref_Product foreign key (AdditionalProductInfoId) 
    references Product([ProductId]);

go
-- Add Product - Company foreign key one to many
alter table Product
   add constraint FK_Product_CompanyId_Ref_Company_CompanyId foreign key (CompanyId)
      references Company (CompanyId)
go

---- Remove Product Constraint - Company foreign key one to many
--alter table Product
--   drop constraint FK_Product_CompanyId_Ref_Company_CompanyId
--go

insert into dbo.Company values (1, 'Apple', 'The biggest USA company.')
insert into dbo.Company values (2, 'Audi', 'Perfect car company.')

select * from dbo.Company

go
insert into dbo.[Product] values (1, 'Audi 4 Sline', 2)
insert into dbo.[Product] values (2, 'Audi 5', 2)
insert into dbo.[Product] values (3, 'IPhone X', 1)
insert into dbo.[Product] values (4, 'IPhone 11', 1)

go
insert into dbo.[AdditionalProductInfo] values (1, 'Phone', GETDATE())
insert into dbo.[AdditionalProductInfo] values (2, 'Car', GETDATE())


select * from [AdditionalProductInfo] as l inner join [Product] r on l.AdditionalProductInfoId = r.ProductId

select * from dbo.[Product]

select * from [Product] as l inner join [Company] as r on r.CompanyId = l.CompanyId

use [AdventureWorksLT2019]
select * from dbo.BuildVersion