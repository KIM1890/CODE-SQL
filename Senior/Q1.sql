USE ORDERs
GO
CREATE TABLE sales_flat_order_status_history (
	Order_id INT
   ,statuss VARCHAR(50)
   ,created_at DATETIME
)
GO
INSERT INTO dbo.sales_flat_order_status_history (Order_id, statuss, created_at)
	VALUES (12345, -- Order_id - int
	'New', -- statuss - varchar(50)
	'2016-01-06 12:12:12'  -- created_at - datetime
	)
GO
INSERT INTO dbo.sales_flat_order_status_history (Order_id, statuss, created_at)
	VALUES (12345, -- Order_id - int
	'processing', --statuss - varchar(50)
	'2016-01-06 13:00:00'  -- created_at - text
	)
GO
INSERT INTO dbo.sales_flat_order_status_history (Order_id, statuss, created_at)
	VALUES (23456, -- Order_id - int
	'New', -- statuss - varchar(50)
	'2016-02-06 13:00:00'  -- created_at - text
	)
GO
SELECT
	a.Order_id
   ,MIN(a.New) AS New
   ,MIN(a.processing) AS processing
   ,MIN(a.[Chua VC]) AS ChucVC
   ,MIN(a.Transporting) AS Transporting
   ,MIN(a.[chua hoan thanh]) AS Chuahoanthanh
   ,MIN(a.complete) AS complete
FROM (SELECT
		H.Order_id
	   ,CASE
			WHEN H.statuss = 'New' THEN H.created_at
			ELSE NULL
		END AS 'New'
	   ,CASE
			WHEN H.statuss = 'processing' THEN H.created_at
			ELSE NULL
		END AS 'processing'
	   ,CASE
			WHEN H.statuss = 'New' AND
				H.statuss = 'processing' THEN H.created_at
			ELSE NULL
		END AS 'Chua VC'
	   ,CASE
			WHEN H.statuss = 'Transporting' THEN H.created_at
			ELSE NULL
		END AS 'Transporting'
	   ,CASE
			WHEN H.statuss = 'Transporting' AND
				H.statuss = 'processing' THEN H.created_at
			ELSE NULL
		END AS 'chua hoan thanh'
	   ,CASE
			WHEN H.statuss = 'complete' THEN H.created_at
			ELSE NULL
		END AS 'complete'
	FROM dbo.sales_flat_order_status_history H) a
GROUP BY a.Order_id
GO

