USE HowKteam
GO
-- tao function co tham so
CREATE FUNCTION function_name(@number INT)
	RETURNS VARCHAR(50)
	AS
    BEGIN
    	IF (@number%2=0)
			RETURN 'so chan'
		ELSE
			RETURN 'so le'
		RETURN 'khong xac dinh'
    END
GO
SELECT  dbo.function_name(6)
GO
-- lay tuoi cua giao vien
CREATE FUNCTION tuoi_GV(@Year DATE)
		RETURNS INT
	AS
	BEGIN
		RETURN  YEAR(GETDATE()) - YEAR(@Year)
	END
GO
SELECT dbo.tuoi_GV(NGSINH) AS old,dbo.function_name(dbo.tuoi_GV(NGSINH)) 
FROM dbo.GIAOVIEN
--create view table
CREATE VIEW [truyxuat] AS 
SELECT * FROM dbo.GIAOVIEN WHERE MAGV='001'
GO
SELECT * FROM [truyxuat]
GO
CREATE VIEW [id] AS 
SELECT MAGV FROM dbo.NGUOITHAN WHERE PHAI=N'Nữ'
GO
SELECT * FROM [id]
GO

