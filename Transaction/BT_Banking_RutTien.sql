CREATE DATABASE BANKING
GO
USE BANKING
GO
ALTER PROCEDURE RutTien(@mtk INT, @TienRut INT)	
AS
BEGIN
	--kiem tra tai khoan
	BEGIN TRANSACTION
		DECLARE @SoTien INT
		SELECT @SoTien=TienTK FROM TaiKhoan WHERE MaTk=@mtk
		WAITFOR DELAY '0:0:15'
		IF (@SoTien<@mtk)
					BEGIN
						PRINT 'khong the rut tien'
						ROLLBACK TRAN
						GOTO error
					END
		ELSE
		BEGIN
			UPDATE TaiKhoan SET TienTK=TienTK-@TienRut WHERE MaTk=@mtk
			IF @@ERROR <> 0
			BEGIN
				IF @@TRANCOUNT>0
					ROLLBACK TRAN
			END
			ELSE
			BEGIN
				PRINT 'hoan thanh'
			END
		END
	
		COMMIT TRAN
		error:
END
GO
