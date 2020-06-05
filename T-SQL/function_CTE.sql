-- ================================================
-- Template generated from Template Explorer using:
-- Create Multi-Statement Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION Q5_name
(
	@inID INT 
)
RETURNS VARCHAR(255) 
AS
BEGIN
	DECLARE @gparentID INT = 0
	DECLARE @gpriority VARCHAR(255) = ''
	SET @gpriority = @inID
	SELECT
	q.parent_id INTO @gparentID
	FROM Q5 q
	WHERE id = @inID;
	WHILE @gparentID > 0
	BEGIN
	SET @gpriority = CONCAT(@gparentID, '.', @gpriority);
	SELECT
		parent_id INTO @gparentID
	FROM Q5
	WHERE id = @gparentID;
	END
	RETURN @gpriority;

END
GO