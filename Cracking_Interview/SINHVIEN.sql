CREATE DATABASE QLSV
USE QLSV
GO
CREATE TABLE LOP
(MALOP CHAR(10) PRIMARY KEY, 
TENLOP NVARCHAR(50),
SISO INT)
GO
CREATE TABLE SINHVIEN
(MASV CHAR(10) PRIMARY KEY, 
HOTEN NVARCHAR(50), 
NGAYSINH DATE,
MALOP CHAR(10) 
FOREIGN KEY(MALOP) REFERENCES LOP(MALOP))
GO
INSERT INTO dbo.LOP
(
    MALOP,
    TENLOP,
    SISO
)
VALUES
(   'cn16a',  -- MALOP - char(10)
    N'cong nghe thong tin', -- TENLOP - nvarchar(50)
    2   -- SISO - int
    )
GO
INSERT INTO dbo.SINHVIEN
(
    MASV,
    HOTEN,
    NGAYSINH,
    MALOP
)
VALUES
(   '001',        -- MASV - char(10)
    N'kimlien',       -- HOTEN - nvarchar(50)
    '1994/05/17', -- NGAYSINH - date
    'cn16a'         -- MALOP - char(10)
    )
GO
INSERT INTO dbo.SINHVIEN
(
    MASV,
    HOTEN,
    NGAYSINH,
    MALOP
)
VALUES
(   '002',        -- MASV - char(10)
    N'thanhkiet',       -- HOTEN - nvarchar(50)
    '1998/06/15', -- NGAYSINH - date
    'cn16a'         -- MALOP - char(10)
    )

