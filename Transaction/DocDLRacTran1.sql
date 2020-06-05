GO
USE BANKING
GO
ALTER PROCEDURE NopTien(@mtk INT, @Tiennop INT)	
AS
BEGIN
	--kiem tra tai khoan
	BEGIN TRANSACTION
		UPDATE  ATM SET sotien=sotien+@Tiennop WHERE matk=@mtk;
		WAITFOR DELAY '00:00:10';
		ROLLBACK TRAN
	
END

