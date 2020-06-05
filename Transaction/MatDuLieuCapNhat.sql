USE BANKING
GO
CREATE PROCEDURE ChuyenTien(@tk1 INT,@tk2 INT,@TienChuyen INT)
AS
BEGIN
	BEGIN TRAN
			DECLARE @sotien INT
			SELECT @sotien=sotien FROM ATM WHERE matk =@tk1
			WAITFOR DELAY '00:00:20'
			IF (@TienChuyen>@sotien)
					BEGIN
						PRINT 'khong the chuyen'
						ROLLBACK TRAN
						GOTO error
					END
			ELSE
				BEGIN
					UPDATE ATM SET sotien=@sotien-@TienChuyen WHERE matk=@tk1
					UPDATE ATM SET sotien=sotien+@TienChuyen WHERE matk=@tk2
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
