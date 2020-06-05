USE ORDERs
GO
CREATE TABLE ORDERs (
	order_id INT PRIMARY KEY
   ,customer_id INT
   ,order_date DATE
)
GO
CREATE TABLE order_detail (
	order_id INT
   ,product_id INT
   ,product_price NUMERIC
   ,order_quantity INT
   ,FOREIGN KEY (order_id) REFERENCES dbo.ORDERs
)
GO
INSERT INTO dbo.ORDERs (order_id, customer_id, order_date)
	VALUES (1, -- order_id - int
	1, -- customer_id - int
	'2016-01-25' -- order_date - datetime
	)
GO
INSERT INTO dbo.ORDERs (order_id, customer_id, order_date)
	VALUES (2, -- order_id - int
	2, -- customer_id - varchar(50)
	'2016-02-27'  -- order_date - date
	)
GO
INSERT INTO dbo.ORDERs (order_id, customer_id, order_date)
	VALUES (3, -- order_id - int
	3, -- customer_id - varchar(50)
	'2016-02-21'  -- order_date - date
	)
GO
INSERT INTO dbo.order_detail (order_id,
product_id,
product_price,
order_quantity)
	VALUES (1, -- order_id - int
	1, -- product_id - varchar(50)
	50000, -- product_price - numeric
	3 -- order_quantity - int
	)
GO

INSERT INTO dbo.order_detail (order_id,
product_id,
product_price,
order_quantity)
	VALUES (2, -- order_id - int
	2, -- product_id - varchar(50)
	40000, -- product_price - numeric
	1 -- order_quantity - int
	)

GO

/*cau a 
Viết câu SELECT lấy ra danh sách khách hàng mua hàng tháng 1/2016 
nhưng không mua hàng vào tháng 2/2016
*/
SELECT o.customer_id FROM orders o INNER JOIN orders o1
ON o.customer_id = o1.customer_id WHERE MONTH(o.order_date)=1 AND Year(o.order_date)=2016
AND o.customer_id != (SELECT o2.customer_id FROM orders o2 WHERE MONTH(o.order_date)=2 AND Year(o.order_date)=2016 )
GO
/*cau b
Viết câu SELECT lấy ra 10 khách hàng có tổng giá trị hóa đơn lớn nhất trong 3 tháng gần nhất
*/
SELECT TOP (10)
	customer_id
   ,SUM(q.product_price * q.order_quantity) AS tonggiatri
FROM dbo.ORDERs
LEFT JOIN dbo.order_detail q
	ON q.order_id = ORDERs.order_id
WHERE order_date >= DATEADD(MONTH, -3, GETDATE())
GROUP BY customer_id
ORDER BY tonggiatri DESC
GO
--c2
WITH customer
AS
(SELECT
		customer_id
	   ,SUM(q.product_price * q.order_quantity) AS tonggiatri
	FROM ORDERs o
	LEFT JOIN order_detail q
		ON o.order_id = q.order_id
	WHERE order_date >= DATEADD(MONTH, -3, GETDATE())
	GROUP BY o.customer_id)
SELECT TOP 10
	*
FROM customer
ORDER BY tonggiatri DESC

GO
