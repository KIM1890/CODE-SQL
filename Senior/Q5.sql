USE ORDERs
GO
CREATE TABLE Q5 (
	id INT PRIMARY KEY
   ,names VARCHAR(50)
   ,parent_id INT
	FOREIGN KEY (parent_id) REFERENCES Q5
)
GO
INSERT INTO dbo.Q5 (id, names, parent_id)
	VALUES (1, -- id - int
	'Operration Head', -- Name - text
	NULL -- parent_id - int
	)
GO
INSERT INTO dbo.Q5 (id, names, parent_id)
	VALUES (2, -- id - int
	'Tech Hub', -- Name - text
	NULL -- parent_id - int
	)
GO
INSERT INTO dbo.Q5 (id, names, parent_id)
	VALUES (3, -- id - int
	'OP HCM', -- Name - text
	1  -- parent_id - int
	)
-----------------------
INSERT INTO dbo.Q5 (id, names, parent_id)
	VALUES (4, -- id - int
	'OP HN', -- Name - text
	1  -- parent_id - int
	)
GO
INSERT INTO dbo.Q5 (id, names, parent_id)
	VALUES (5, -- id - int
	'Tech HN', -- Name - text
	2  -- parent_id - int
	)
GO
INSERT INTO dbo.Q5 (id, names, parent_id)
	VALUES (6, -- id - int
	'Tech HCM', -- Name - text
	2  -- parent_id - int
	)
GO
INSERT INTO dbo.Q5 (id, names, parent_id)
	VALUES (7, -- id - int
	'Team 1', -- Name - text
	3 -- parent_id - int
	)
GO

INSERT INTO dbo.Q5 (id, names, parent_id)
	VALUES (8, -- id - int
	'Team 2', -- Name - text
	4  -- parent_id - int
	)

--cau 5
GO
WITH cte (id, [names],[level], parent_id,[ordering])
AS
(SELECT
		id
	   ,[names]
	   ,0
	   ,parent_id
	   ,CAST(ROW_NUMBER()OVER(ORDER BY id) AS VARCHAR(MAX))	
	   FROM dbo.Q5 
	WHERE parent_id IS NULL 
	UNION ALL
	SELECT
		b.id,
		b.[names]
		,[level]+1
	   ,b.parent_id
	   ,a.[ordering]+'.'+CAST(ROW_NUMBER() 
		OVER (PARTITION BY a.parent_id ORDER BY b.id) as VARCHAR(MAX)) as ordering
	FROM Q5 AS b
	 INNER JOIN cte AS a
	on a.id = b.parent_id 
	)
SELECT * FROM cte  ORDER BY ordering















