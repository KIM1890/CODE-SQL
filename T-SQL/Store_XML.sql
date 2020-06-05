USE [IPTV]
GO
/****** Object:  StoredProcedure [dbo].[IN_QRCode_Insert_CampaignGift]    Script Date: 5/4/2019 3:03:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<NAMTD4>
-- Create date: <24/01/2018>
-- Description:	<CMS Campaign QRCode,,>
-- =============================================
CREATE PROCEDURE [dbo].[IN_QRCode_Insert_CampaignGift]
@InputValue	XML,
@Type INT, -- 1 insert, 2 update, 3 delete
@User varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @InputValue.modify('insert attribute Type {sql:variable("@Type")} into (/*)[1]')
	EXEC dbo.[In_Core_InsertLog] 'IN_QRCode_Insert_CampaignGift', @InputValue,NULL,NULL,@User
	BEGIN TRY
		SELECT [ID]				= ISNULL(x.o.value('@ID','INT'),0)
			  ,[CampaignID]		= x.o.value('@CampaignID','INT')
			  ,[GiftID]				= x.o.value('@GiftID','INT')
			  ,[NumGift]			= x.o.value('@NumGift','INT') 
			  ,[CreatedBy]			= x.o.value('@CreatedBy','VARCHAR(50)')
			  ,[ModifyBy]			= x.o.value('@ModifyBy','VARCHAR(50)')
		INTO #TEMP
		FROM	@InputValue.nodes('/T') AS x(o)
		BEGIN TRAN
			IF(@Type =1)
			BEGIN
				INSERT INTO PayTV_QRCode_CampaignGift
					   (           [CampaignID]
								  ,[GiftID]
								  ,[NumGift]
								  ,[Status]
								  ,[CreatedBy]
								  ,[CreatedDate]
								  ,[ModifyBy]
								  ,[ModifyDate]
						)
				SELECT [CampaignID]
								  ,[GiftID]
								  ,[NumGift]
								  ,1
								  ,[CreatedBy]
								  ,GETDATE()
								  ,[ModifyBy]
								  ,GETDATE()
				FROM #TEMP 
				SELECT 1 AS Result
			END
			ELSE IF (@Type =2)
			BEGIN
				UPDATE A
				SET		   A.CampaignID	=	T.CampaignID
							  ,A.GiftID = t.GiftID
							  ,A.NumGift = t.NumGift
							  ,A.[ModifyDate]		= GETDATE()
							  ,A.[ModifyBy]		= T.ModifyBy
				FROM PayTV_QRCode_CampaignGift A WITH (NOLOCK) 
				JOIN #TEMP T WITH (NOLOCK) ON A.ID = T.ID
				SELECT 1 AS Result
			END
			ELSE IF (@Type =3)
			BEGIN
				UPDATE A
				SET  A.[Status] = 0
				FROM PayTV_QRCode_CampaignGift  A  WITH (NOLOCK)  JOIN #TEMP T  WITH (NOLOCK)  ON A.ID = T.ID
				SELECT 1 AS Result
			END
			ELSE
			BEGIN
				SELECT 0 AS Result
			END
		COMMIT TRAN

	END TRY
	BEGIN CATCH
		DECLARE @lErrorValue XML 
		SET @lErrorValue=(SELECT * FROM( SELECT
		ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage) AS ErrorValue FOR XML AUTO)	
		IF(@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK TRAN	
		END
		SELECT 0 AS Result
		EXEC dbo.[In_Core_InsertLog] 'IN_QRCode_Insert_CampaignGift', @InputValue,@lErrorValue,NULL,@User	
		RETURN
	END CATCH
END
