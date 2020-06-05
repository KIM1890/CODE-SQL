CREATE DATABASE FOOD
GO
USE FOOD
GO
CREATE TABLE Beverange(name VARCHAR(50),code VARCHAR(50))
GO 
CREATE TABLE Calories_Beverange(name VARCHAR(50),code VARCHAR(50))
GO
--INSERT data cho TABLE beverange
INSERT INTO dbo.Beverange
        ( name, code )
VALUES  ( 'Budweiser', -- name - varchar(50)
          'BUDWEISER'  -- code - varchar(50)
          )
GO
INSERT INTO dbo.Beverange
        ( name, code )
VALUES  ( 'Coca-Cola', -- name - varchar(50)
          'COCACOLA'  -- code - varchar(50)
          )
GO
INSERT INTO dbo.Beverange
        ( name, code )
VALUES  ( 'Pepsi', -- name - varchar(50)
          'PEPSI'  -- code - varchar(50)
          )
GO
--INSERT data cho TABLE calories-FREE beverages
INSERT INTO dbo.Calories_Beverange
        ( name, code )
VALUES  ( 'Diet Coca-Cola', -- name - varchar(50)
          'COCACOLA'  -- code - varchar(50)
          )
GO
INSERT INTO dbo.Calories_Beverange
        ( name, code )
VALUES  ( 'Fresca', -- name - varchar(50)
          'FRESCA'  -- code - varchar(50)
          )
GO 
INSERT INTO dbo.Calories_Beverange
        ( name, code )
VALUES  ( 'Diet Pepsi', -- name - varchar(50)
          'PEPSI'  -- code - varchar(50)
          )
GO
INSERT INTO dbo.Calories_Beverange
        ( name, code )
VALUES  ( 'Pepsi Light', -- name - varchar(50)
          'PEPSI'  -- code - varchar(50)
          )

GO
INSERT INTO dbo.Calories_Beverange
        ( name, code )
VALUES  ( 'Purified Water', -- name - varchar(50)
          'Water'  -- code - varchar(50)
          )
GO
SELECT * FROM dbo.Beverange LEFT JOIN dbo.Calories_Beverange ON Calories_Beverange.code = Beverange.code
GO
