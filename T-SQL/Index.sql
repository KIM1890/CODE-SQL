USE HowKteam 
GO
--- tao index trong bang giao vien
CREATE INDEX Index_name ON dbo.GIAOVIEN(MAGV)
GO
--- xoa chi muc indexname
DROP INDEX Indexname ON dbo.GIAOVIEN
GO
SELECT * FROM dbo.GIAOVIEN WHERE PHAI=N'Nữ'
GO
SELECT * FROM dbo.GIAOVIEN
GO
SELECT * FROM dbo.GIAOVIEN WHERE MAGV='004' AND PHAI=N'Nam'
GO
------khong tao index trong bang nguoi than
SELECT * FROM DBO.NGUOITHAN
GO
SELECT * FROM dbo.NGUOITHAN WHERE MAGV='010' AND TEN=N'Nguyệt'
GO
DROP INDEX Index_name ON dbo.GIAOVIEN
GO
CREATE CLUSTERED INDEX Indexname ON dbo.GIAOVIEN(LUONG)



