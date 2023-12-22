if DB_ID('ALevel') is not null
begin
   print 'ALevel exists'
end
else
begin
    create database [ALevel]
    use [ALevel]

    create table Student (
      studentId int primary key,
      [name] nvarchar(100),
      [email] nvarchar(150)
    );

    create table Course (
      courseId int primary key,
      [name] nvarchar(60),
      [description] nvarchar(200),
      [durationHours] int
    );

    create table Student_Course (
      studentId int,
      courseId int,
      primary key (studentId, courseId),
      foreign key (studentId) references Student(studentId),
      foreign key (courseId) references Course(courseId)
    );

    insert into Student values (1, 'Vlad', 'vlad1234@gmail.com')
    insert into Student values (2, 'Den', 'den2000@gmail.com')
    insert into Student values (3, 'Vlad_2', 'vlad1234123@gmail.com')

    insert into Course values (1, 'Databases', 'Course about dabases', 20)
    insert into Course values (2, '.NET C#', 'Course about web with C# using ASP.NET', 30)
    insert into Course values (3, 'Typescript/Javascript', 'Course about script lang', 20)
    insert into Course values (4, 'C++', 'Course about script lang', 20)

    insert into Student_Course values(1, 1) -- Vlad - Databases
    insert into Student_Course values(1, 2) -- Vlad - .NET C#
    insert into Student_Course values(1, 3) -- Vlad - Typescript/Javascript

    insert into Student_Course values(3, 2) -- Vlad_2 - .NET C#
    insert into Student_Course values(3, 4) -- Vlad_2 - C++

    select * from Student as l inner join Student_Course as r on l.studentId = r.studentId inner join Course c on  r.courseId = c.courseId

    -- update Student_Course set courseId = 4  where studentId = 2 -- Change To Vlad - C++

    -- delete from Student_Course -- Delete table Student_Course
    -- delete from Student_Course where (1, 1)
end