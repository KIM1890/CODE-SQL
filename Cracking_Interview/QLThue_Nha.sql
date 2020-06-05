CREATE DATABASE QLRENTAL
USE QLRENTAL
GO
INSERT INTO dbo.Buildings
        ( BuildingID ,
          ComplexID ,
          BuildingName ,
          Address
        )
VALUES  ( N'B01' , -- BuildingID - nchar(10)
          N'A' , -- ComplexID - nchar(10)
          N'FPT TOWER' , -- BuildingName - nvarchar(50)
          N'Tân Thuận, Quận 7'  -- Address - nvarchar(50)
        )
GO
INSERT INTO dbo.Buildings
        ( BuildingID ,
          ComplexID ,
          BuildingName ,
          Address
        )
VALUES  ( N'B02' , -- BuildingID - nchar(10)
          N'B' , -- ComplexID - nchar(10)
          N'HAPPY TOWER' , -- BuildingName - nvarchar(50)
          N'Quận 3'  -- Address - nvarchar(50)
        )
GO

INSERT INTO dbo.Complexes
        ( ComplexsID, ComplexName )
VALUES  ( N'A', -- ComplexsID - nchar(10)
          N'Jumo'  -- ComplexName - nvarchar(50)
          )
GO
INSERT INTO dbo.Apartments
        ( AptID, UnitNumber, BuildingID )
VALUES  ( N'P01', -- AptID - nchar(10)
          1, -- UnitNumber - int
          N'B01'  -- BuildingID - nchar(10)
          )
GO
INSERT INTO dbo.Apartments
        ( AptID, UnitNumber, BuildingID )
VALUES  ( N'P03', -- AptID - nchar(10)
          1, -- UnitNumber - int
          N'B01'  -- BuildingID - nchar(10)
          )
GO
INSERT INTO dbo.Apartments
        ( AptID, UnitNumber, BuildingID )
VALUES  ( N'P02', -- AptID - nchar(10)
          1, -- UnitNumber - int
          N'B01'  -- BuildingID - nchar(10)
          )
GO
INSERT INTO dbo.Apartments
        ( AptID, UnitNumber, BuildingID )
VALUES  ( N'N01', -- AptID - nchar(10)
          1, -- UnitNumber - int
          N'B02'  -- BuildingID - nchar(10)
          )
GO

INSERT INTO dbo.Tenants
        ( TenantID, TenantName )
VALUES  ( N'T01', -- TenantID - nchar(10)
          N'Đỗ Thị Kim Liên'  -- TenantName - nvarchar(50)
          )
GO

INSERT INTO dbo.Tenants
        ( TenantID, TenantName )
VALUES  ( N'T02', -- TenantID - nchar(10)
          N'Phan Thị Thanh Nguyệt'  -- TenantName - nvarchar(50)
          )
GO
INSERT INTO dbo.AptTenants
        ( TenantID, AptID )
VALUES  ( N'T01', -- TenantID - nchar(10)
          N'P01'  -- AptID - nchar(10)
          )
GO
INSERT INTO dbo.AptTenants
        ( TenantID, AptID )
VALUES  ( N'T01', -- TenantID - nchar(10)
          N'P03'  -- AptID - nchar(10)
          )
GO
INSERT INTO dbo.AptTenants
        ( TenantID, AptID )
VALUES  ( N'T02', -- TenantID - nchar(10)
          N'P02'  -- AptID - nchar(10)
          )
GO
INSERT INTO dbo.Request
        ( RequestID ,
          Status ,
          AptID ,
          Description
        )
VALUES  ( N'R01' , -- RequestID - nchar(10)
          N'open' , -- Status - nvarchar(50)
          N'P01' , -- AptID - nchar(10)
          N'Đẹp,Tiện lợi'  -- Description - nvarchar(50)
        )
GO
INSERT INTO dbo.Request
        ( RequestID ,
          Status ,
          AptID ,
          Description
        )
VALUES  ( N'R02' , -- RequestID - nchar(10)
          N'open' , -- Status - nvarchar(50)
          N'P02' , -- AptID - nchar(10)
          N'kha Sang'  -- Description - nvarchar(50)
        )
GO
INSERT INTO dbo.Request
        ( RequestID ,
          Status ,
          AptID ,
          Description
        )
VALUES  ( N'R02' , -- RequestID - nchar(10)
          N'close' , -- Status - nvarchar(50)
          N'N01' , -- AptID - nchar(10)
          N'Sang trọng'  -- Description - nvarchar(50)
        )

/*thuc hien truy van
1. xuat ra nhung nguoi thue nhieu hon hai can ho
2. xuat ra toa nha và trạng thái của tòa nhà
*/
--1
SELECT TenantName FROM dbo.Tenants
INNER JOIN 
(SELECT TenantID FROM dbo.AptTenants
GROUP BY TenantID HAVING COUNT(*)>1
) c
ON dbo.Tenants.TenantID = c.TenantID
--2
SELECT BuildingName,ISNULL( ReqCounts.count,0) AS [count] FROM dbo.Buildings
LEFT JOIN
(SELECT dbo.Apartments.BuildingID,COUNT(*) AS [count] 
FROM dbo.Request INNER JOIN dbo.Apartments
ON dbo.Request.AptID = dbo.Apartments.AptID
WHERE dbo.Request.Status='open'
GROUP BY dbo.Apartments.BuildingID)  ReqCounts
ON ReqCounts.BuildingID=dbo.Buildings.BuildingID


