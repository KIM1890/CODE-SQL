USE ORDERs
GO
CREATE PROCEDURE Q1(@stt VARCHAR(50))
	
AS

BEGIN
	CREATE TABLE donhang(MaDH INT, New TEXT,Processing TEXT,chuachuyen TEXT,Transporting TEXT,chuahoanthanh TEXT,complete TEXT)
	INSERT INTO dbo.donhang
	        ( MaDH ,
	          New ,
	          Processing ,
	          chuachuyen ,
	          Transporting ,
	          chuahoanthanh ,
	          complete
	        )
	VALUES  ( 12345 , -- MaDH - int
	          '2016-01-06 12:12:12' , -- New - text
	          '2016-01-06 13:00:00' , -- Processing - text
	          '' , -- chuachuyen - text
	          '' , -- Transporting - text
	          '' , -- chuahoanthanh - text
	          ''  -- complete - text
	        )
END
GO
