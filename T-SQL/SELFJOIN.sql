USE QLNS
GO
CREATE TABLE Employees(id INT,Name NVARCHAR(30),Boss_ID INT)
GO
INSERT INTO dbo.Employees
        ( id, Name, Boss_ID )
VALUES  ( 1, -- id - int
          N'Bob', -- Name - nvarchar(30)
          3  -- Boss_ID - int
          )
GO
INSERT INTO dbo.Employees
        ( id, Name, Boss_ID )
VALUES  ( 2, -- id - int
          N'Jim', -- Name - nvarchar(30)
          1  -- Boss_ID - int
          )
GO
INSERT INTO dbo.Employees
        ( id, Name, Boss_ID )
VALUES  ( 3, -- id - int
          N'Sam', -- Name - nvarchar(30)
          2  -- Boss_ID - int
          )
GO
--lay ra ten cua nhan vien va ten cua boss
SELECT dbo.Employees.Name,bosses.Name AS bosses FROM dbo.Employees INNER JOIN dbo.Employees AS bosses 
ON bosses.ID= Employees.Boss_ID
GO

