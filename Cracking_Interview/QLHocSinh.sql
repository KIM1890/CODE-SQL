use QLHS
go
insert into Courses(CourseID,CourseName,TeacherID) values('C01',N'CNTT','T01')
go
insert into Courses(CourseID,CourseName,TeacherID) values('C02',N'DTVThong','T02')
go
--insert into Teachers(TeacherID,TeacherName) values('T01',N'Nguyen Ngoc Hoai')
go
--insert into Teachers(TeacherID,TeacherName) values('T02',N'Duong Thi Thanh')
go
insert into Students(StudentID,StudentName) values('S01',N'Do Thi Kim Lien')
go
insert into Students(StudentID,StudentName) values('S02',N'Nguyen Thi Thu Mai')
go
insert into StudentCourses(CourseID,StudentID) values('C01','S01')
go
insert into StudentCourses(CourseID,StudentID) values('C02','S02')
go
insert into StudentCourses(CourseID,StudentID) values('C02','S01')
GO
--truy van lay danh sach hoc sinh va so khoa hoc cua hoc sinh ay
SELECT dbo.Students.StudentID,dbo.Students.StudentName,
COUNT(dbo.StudentCourses.CourseID) AS [CT]
FROM  dbo.Students  LEFT JOIN dbo.StudentCourses
ON dbo.Students.StudentID =dbo.StudentCourses.StudentID
GROUP BY dbo.Students.StudentName,dbo.Students.StudentID
/* Cach 2*/
SELECT dbo.Students.StudentID,StudentName,COUNT(CourseID) AS[KH]
FROM dbo.Students, dbo.StudentCourses
WHERE dbo.Students.StudentID=dbo.StudentCourses.StudentID
GROUP BY dbo.Students.StudentID, StudentName
/*truy van danh sach giao vien và số học sinh và học dạy*/

SELECT TeacherName ,ISNULL(StudentSize.Number,0) AS [HS]
FROM dbo.Teachers LEFT JOIN 
(SELECT TeacherID,COUNT(dbo.StudentCourses.CourseID) AS [Number]
FROM dbo.Courses INNER JOIN dbo.StudentCourses
ON dbo.Courses.CourseID = dbo.StudentCourses.CourseID
GROUP BY dbo.Courses.TeacherID) StudentSize
ON dbo.Teachers.TeacherID=StudentSize.TeacherID
ORDER BY StudentSize.Number DESCs




