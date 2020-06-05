USE ORDERs
GO
CREATE TABLE Q4(product NVARCHAR(100), product_discount NUMERIC,event_discount NUMERIC,other_discount NUMERIC)
GO
--DROP TABLE dbo.Q4
GO

INSERT INTO dbo.Q4
        ( product ,
          product_discount ,
          event_discount ,
          other_discount
        )
VALUES  ( 'SPA' , -- product - text
          1 , -- product_discount - numeric
          2, -- event_discount - numeric
          3  -- other_discount - int
        )
GO
INSERT INTO dbo.Q4
        ( product ,
          product_discount ,
          event_discount ,
          other_discount
        )
VALUES  ( 'SPB' , -- product - text
          4, -- product_discount - numeric
          5 , -- event_discount - numeric
          6  -- other_discount - int
        )
GO
INSERT INTO dbo.Q4
        ( product ,
          product_discount ,
          event_discount ,
          other_discount
        )
VALUES  ( 'SPC' , -- product - text
          7 , -- product_discount - numeric
          8, -- event_discount - numeric
          9  -- other_discount - int
        )
GO
SELECT product,discount_type,value FROM
(SELECT product,product_discount,event_discount,other_discount FROM dbo.Q4)q
UNPIVOT
(value FOR discount_type IN (product_discount,event_discount,other_discount )) AS pvt
GO


