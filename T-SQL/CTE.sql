CREATE DATABASE QLNS
GO
USE QLNS
GO
CREATE TABLE NhanVien(ID INT,Firstname NVARCHAR(50),LastName NVARCHAR(50),Gender NVARCHAR(50), Salary INT)
GO
INSERT INTO dbo.NhanVien
        ( ID ,
          Firstname ,
          LastName ,
          Gender ,
          Salary
        )
VALUES  ( 1 , -- ID - int
          N'Jahangir' , -- Firstname - nvarchar(50)
          N'Arifur' , -- LastName - nvarchar(50)
          N'Male' , -- Gender - nvarchar(50)
          70000  -- Salary - int
        )

GO
INSERT INTO dbo.NhanVien
        ( ID ,
          Firstname ,
          LastName ,
          Gender ,
          Salary
        )
VALUES  ( 2 , -- ID - int
          N'Arifur' , -- Firstname - nvarchar(50)
          N'Rahman' , -- LastName - nvarchar(50)
          N'Male' , -- Gender - nvarchar(50)
          60000  -- Salary - int
        )
GO
INSERT INTO dbo.NhanVien
        ( ID ,
          Firstname ,
          LastName ,
          Gender ,
          Salary
        )
VALUES  ( 3 , -- ID - int
          N'Oli' , -- Firstname - nvarchar(50)
          N'Ahammed' , -- LastName - nvarchar(50)
          N'Male' , -- Gender - nvarchar(50)
          45000  -- Salary - int
        )
GO
INSERT INTO dbo.NhanVien
        ( ID ,
          Firstname ,
          LastName ,
          Gender ,
          Salary
        )
VALUES  ( 4 , -- ID - int
          N'Sima' , -- Firstname - nvarchar(50)
          N'Sultana' , -- LastName - nvarchar(50)
          N'Female' , -- Gender - nvarchar(50)
          70000 -- Salary - int
        )
GO
INSERT INTO dbo.NhanVien
        ( ID ,
          Firstname ,
          LastName ,
          Gender ,
          Salary
        )
VALUES  ( 5 , -- ID - int
          N'Sudeepta' , -- Firstname - nvarchar(50)
          N'Roy' , -- LastName - nvarchar(50)
          N'Male' , -- Gender - nvarchar(50)
          80000  -- Salary - int
        )
--thuc hien cau lenh truy van lay ra luong cua nhan vien lon nhat,lon hai, lon ba,....
WITH Result AS
(
	SELECT Salary,DENSE_RANK() OVER (ORDER BY Salary DESC)  AS denserank
	FROM dbo.NhanVien
	)
SELECT TOP 2 Result.Salary FROM Result 
--WHERE Result.denserank=1
GO
SELECT * FROM dbo.NhanVien