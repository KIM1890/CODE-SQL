USE ORDERs
GO
CREATE TABLE sales_flat_order(id INT,grand_total INT,customer_id VARCHAR(50))
GO
--DROP TABLE dbo.sales_flat_order
GO
INSERT INTO dbo.sales_flat_order
        ( id, grand_total, customer_id )
VALUES  ( 1, -- id - int
          30000, -- grand_total - int
          '1'  -- customer_id - varchar(50)
          )
GO
INSERT INTO dbo.sales_flat_order
        ( id, grand_total, customer_id )
VALUES  ( 2, -- id - int
          40000, -- grand_total - int
          '2'  -- customer_id - varchar(50)
          )
GO
INSERT INTO dbo.sales_flat_order
        ( id, grand_total, customer_id )
VALUES  ( 3, -- id - int
          30000, -- grand_total - int
          '3'  -- customer_id - varchar(50)
          )
GO
INSERT INTO dbo.sales_flat_order
        ( id, grand_total, customer_id )
VALUES  ( 4, -- id - int
          40000, -- grand_total - int
          '5'  -- customer_id - varchar(50)
          )
--quy trinh tu dong gom nhom tu dong
CREATE TABLE new_table(lowerlimit INT, upperlimit INT ,ranges TEXT)
GO
--DROP TABLE dbo.new_table
GO
DECLARE @from INT=0;
DECLARE @to INT = 50000;
DECLARE @tong INT  = (SELECT SUM(grand_total) FROM dbo.sales_flat_order)+50000;
WHILE(@from <@tong)
BEGIN
	INSERT INTO dbo.new_table
	        ( lowerlimit, upperlimit, ranges )
	VALUES  ( @from, -- lowerlimit - int
	          @to, --t upperlimit - int
	           CONCAT(@from,'-',@to) -- range - varchar(50)
	          )
	SET @from = @to;
	SET @to = @from + 50000;
END
GO
SELECT ranges AS 'from-to',COUNT(id) AS sodonhang,COUNT(customer_id) AS sokhachhang,SUM(grand_total) AS Tongdoanhthu 
FROM  dbo.new_table
INNER JOIN dbo.sales_flat_order ON grand_total>=lowerlimit AND grand_total<upperlimit
GROUP BY id ,customer_id,grand_total,ranges
ORDER BY id
GO


