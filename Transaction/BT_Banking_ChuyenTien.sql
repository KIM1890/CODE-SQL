USE BANKING
go
ALTER PROCEDURE ChuyenTien(@tk1 INT,@tk2 INT,@TienChuyen INT)
AS
BEGIN
	BEGIN TRAN
			DECLARE @sotien INT
			SELECT @sotien=TienTK FROM TaiKhoan WHERE MaTk =@tk1
			WAITFOR DELAY '00:00:10'
			IF (@TienChuyen>@sotien)
					BEGIN
						PRINT 'khong the chuyen'
						ROLLBACK TRAN
						GOTO error
					END
			ELSE
				BEGIN
					UPDATE TaiKhoan SET TienTK=@sotien-@TienChuyen WHERE MaTk=@tk1
					UPDATE TaiKhoan SET TienTK=TienTK+@TienChuyen WHERE MaTk=@tk2
					IF @@ERROR <>0
					BEGIN
						IF @@TRANCOUNT>0
							ROLLBACK TRANSACTION
					END
				END
				BEGIN
					PRINT 'hoan thanh'
				END
				COMMIT TRAN 
				error:
END
GO
