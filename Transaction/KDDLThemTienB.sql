USE BANKING
go
CREATE PROCEDURE ThemTienB(@tk INT,@TienChuyen INT)
AS
BEGIN
	BEGIN TRAN
					UPDATE ATM SET sotien=sotien+@TienChuyen WHERE matk=@tk
					IF @@ERROR <>0
				BEGIN
					PRINT 'hoan thanh'
				END
				COMMIT TRAN 
				
END
GO

