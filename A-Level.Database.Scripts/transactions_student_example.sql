--Transaction
select * from Student

select @@TRANCOUNT as OpenTrans
use [ALevel]

begin transaction

select @@TRANCOUNT as OpenTrans

begin try
    update Student set name = 'Vlad_outlook_updated' where studentId = 6
    select * from Student
    insert into Student values((select max(studentId) from Student) /*+ 1*/, 'Vlad_Outlook', 'vlad2000@outlook.microsoft')
    commit transaction
end try
begin catch
    rollback transaction
end catch

select * from Student