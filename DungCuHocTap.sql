/*drop db trong truong hop in use*/
USE master
alter database DungCuHocTap set single_user with rollback immediate
drop database DungCuHocTap

CREATE DATABASE DungCuHocTap
GO

USE DungCuHocTap
GO

/*Tao bang du lieu*/
CREATE TABLE Loai
(
	MaLoai INT PRIMARY KEY IDENTITY(1, 1),
	TenLoai nvarchar(255) UNIQUE NOT NULL,
	MetaKeyword nvarchar(50),
	NgayTao datetime DEFAULT getdate()
)
GO

CREATE TABLE SanPham
(
	MaSP INT PRIMARY KEY IDENTITY(1, 1),
	TenSP nvarchar(255) NOT NULL,
	GiaSP DECIMAL(18, 0) NOT NULL,
	MotaSP NVARCHAR(MAX),
    AnhSP_1 NVARCHAR(MAX) DEFAULT N'',
    AnhSP_2 NVARCHAR(MAX) DEFAULT N'',
	Rating INT CHECK (RATING >=0 AND RATING <= 5),
	NgayTao DATETIME DEFAULT getdate(),
	TrangThaiSP bit,

	MaLoai INT REFERENCES Loai(MaLoai) NOT NULL
)
GO

CREATE TABLE GiamGia
(
	MaGG INT PRIMARY KEY IDENTITY(1, 1),
	GiaTriGiam int DEFAULT 0,
	NgayBatDau DATETIME DEFAULT getdate(),
	NgayKetThuc DATETIME DEFAULT getdate(),
)
GO
/*color table*/
CREATE TABLE NhaCC
(
	MaNCC INT PRIMARY KEY IDENTITY(1, 1),
	TenNCC nvarchar(255) UNIQUE NOT NULL,
	DiaChiNCC nvarchar(255)
)
GO

CREATE TABLE ChiTietSP(
	MaCTSP int PRIMARY KEY IDENTITY(1,1),
	MaSP int REFERENCES SanPham(MaSP) ON DELETE CASCADE,
	MaNCC int REFERENCES NhaCC(MaNCC)
)
GO

CREATE TABLE KhachHang
(
    MaKH INT PRIMARY KEY IDENTITY(1, 1),
    UserName NVARCHAR(255) UNIQUE NOT NULL,
    UserPassword NVARCHAR(255) NOT NULL,
    EmailKH NVARCHAR(255),
    TenKH NVARCHAR(255) NOT NULL,
    SDTKH NVARCHAR(20),
    DiaChiKH NVARCHAR(255),
    NgayDangKy DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE TrangThaiDH(
	MaTT int PRIMARY KEY IDENTITY(1,1),
	TenTT nvarchar(255),
	NgayTao datetime DEFAULT getdate()
)
GO

CREATE TABLE DatHang
(
    MaDH INT PRIMARY KEY IDENTITY(1, 1),
    NgayDatHang DATETIME DEFAULT GETDATE(),
	NgayGiaoHang datetime,
    TongTien DECIMAL(18, 0),

    MaKH INT REFERENCES KhachHang(MaKH),
	MaGG INT REFERENCES GiamGia(MaGG),
	MaTT int REFERENCES TrangThaiDH(MaTT)
)
GO

CREATE TABLE ChiTietDH
(
    MaCTDH int PRIMARY KEY IDENTITY(1,1),
	SoLuong int,

	MaDH int REFERENCES DatHang(MaDH),
	MaSP int REFERENCES SanPham(MaSP),
	MaNCC int REFERENCES NhaCC(MaNCC)
)
GO

CREATE TABLE Admin
(
    MaAdmin INT PRIMARY KEY IDENTITY(1, 1),
    AdminUserName NVARCHAR(255) UNIQUE NOT NULL,
    AdminPassword NVARCHAR(255) NOT NULL,
    TenAdmin NVARCHAR(255),

    NgayTao DATETIME DEFAULT getdate()
)
GO

/*Nhap du lieu*/
INSERT INTO dbo.Loai
VALUES
    (N'Bút các loại', N'but-cac-loai', getdate()),
	(N'Balo học sinh', N'balo-hoc-sinh', getdate()),
	(N'Hộp bút', N'hop-but', getdate()),
	(N'Dụng cụ khác', N'dung-cu-khac', getdate())
GO

INSERT INTO dbo.NhaCC
VALUES
	(N'Thiên long', N'Hà Nội'),
	(N'Nhà sách Fahasa', N'Hà Nội'),
	(N'Campus', N'Hà Nội')
GO

INSERT INTO dbo.TrangThaiDH
VALUES
    (N'Đang xử lý', getdate()),
	(N'Đang giao hàng', getdate()),
	(N'Đã giao hàng', getdate()),
	(N'Đã huỷ', getdate()),
	(N'Hàng có lỗi',getdate())
GO

	/*---INSERT SẢN PHẨM---*/

INSERT INTO dbo.SanPham
VALUES
(
    N'Bút Semi gel Super-SG03', -- TenSP - nvarchar
    4000, -- GiaSP - DECIMAL
    N'Bút Gel dành cho học sinh - sinh viên & văn phòng
		Sản phẩm đột phá về công nghệ sản xuất mực - phát huy tối đa ưu điểm của bút gel và bút bi', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    4, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    1 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Bút Semi gel Super-SG02', -- TenSP - nvarchar
    5500, -- GiaSP - DECIMAL
    N'Bút Gel dành cho học sinh - sinh viên & văn phòng
		Sản phẩm đột phá về công nghệ sản xuất mực - phát huy tối đa ưu điểm của bút gel và bút bi', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    4, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    1 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Bút Semi Gel SG 2600', -- TenSP - nvarchar
    6000, -- GiaSP - DECIMAL
    N'Bút Gel dành cho học sinh - sinh viên & văn phòng
	Kiểu dáng hiện đại - phần tay cầm có đệm cao su giảm trơn trượt giúp cầm bút thoải mái
	Sản phẩm đột phá về công nghệ sản xuất mực - phát huy tối đa ưu điểm của bút gel và bút bi', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    5, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    1 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Cặp học sinh Cozy', -- TenSP - nvarchar
    115000, -- GiaSP - DECIMAL
    N'Cặp nhựa Hồng Hà Cozy dành cho học sinh', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    5, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    2 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Cặp học sinh SQ06', -- TenSP - nvarchar
    58000, -- GiaSP - DECIMAL
    N'Sản phẩm cặp nhựa dành cho học sinh', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    4, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    2 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Hộp bút MJ Star Travel Astronaut 22x8.5', -- TenSP - nvarchar
    80000, -- GiaSP - DECIMAL
    N'abc', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    5, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    3 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Hộp bút MJ Gấu nâu 8x20', -- TenSP - nvarchar
    60000, -- GiaSP - DECIMAL
    N'abc', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    4, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    3 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Bộ thước kẻ Cute Cat Cherry Blossom 20cm', -- TenSP - nvarchar
    25000, -- GiaSP - DECIMAL
    N'abc', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    5, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    4 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Bộ thước kẻ compa Thỏ Molang and Friends', -- TenSP - nvarchar
    70000, -- GiaSP - DECIMAL
    N'abc', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    5, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    4 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Kẹp tài liệu A4 Sumikko Gurashi NB 22x31', -- TenSP - nvarchar
    35000, -- GiaSP - DECIMAL
    N'abc', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    5, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    4 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Túi đựng tài liệu MJ Bake Time Sweet 24x33', -- TenSP - nvarchar
    30000, -- GiaSP - DECIMAL
    N'abc', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    4, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    4 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Cục tẩy gôm Xương rồng Cactus đầu hoa - Xanh lá cây', -- TenSP - nvarchar
    10000, -- GiaSP - DECIMAL
    N'abc', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    5, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    4 -- MaLoai - INT
)

INSERT INTO dbo.SanPham
VALUES
(
    N'Cắt băng dính Pink heart', -- TenSP - nvarchar
    25000, -- GiaSP - DECIMAL
    N'abc', -- MotaSP - NVARCHAR
    N'', -- AnhSP_1 - NVARCHAR
    N'', -- AnhSP_2 - NVARCHAR
    5, -- Rating - INT
    getdate(), -- NgayTao - DATETIME
    1, -- TrangThaiSP - bit
    4 -- MaLoai - INT
)

INSERT INTO dbo.ChiTietSP
VALUES
    (1, 1),
	(1, 3),
	(2, 2),
	(3, 3),
	(2, 1)

INSERT INTO dbo.Admin
VALUES
    (N'hoang', N'123', N'Thái Việt Hoàng', getdate())

	/*---Cac thu tuc---*/

CREATE PROC SelectOrderID
	@MaKH int,
	@MaTT int
AS
BEGIN
	IF @MaTT = 0
	BEGIN
		SELECT MaDH
        FROM dbo.DatHang dh
        WHERE dh.MaDH=@MaKH
    END
        ELSE
        BEGIN
        SELECT MaDH
        FROM dbo.DatHang dh
        WHERE dh.MaKH=@MaKH
            AND dh.MaTT=@MaTT
    END
END
GO

CREATE PROC SelectOrder
    @MaKH INT
AS
BEGIN
    SELECT dh.MaDH, dh.TongTien, dh.MaTT, ttd.TenTT, 
		   dh.NgayDatHang, dh.NgayGiaoHang
    FROM dbo.DatHang dh JOIN dbo.TrangThaiDH ttd 
	ON dh.MaTT = ttd.MaTT
    WHERE dh.MaKH = @MaKH
END
GO

CREATE PROC SelectOrderProduct
    @MaDH INT
AS
BEGIN
    SELECT sp.MaSP, sp.TenSP, l.TenLoai,
	TenNCC, ctd.SoLuong
    FROM dbo.ChiTietDH ctd
        JOIN dbo.DatHang dh ON ctd.MaDH = dh.MaDH
        JOIN dbo.TrangThaiDH ttd ON dh.MaTT = ttd.MaTT
        JOIN dbo.NhaCC nc ON ctd.MaNCC = nc.MaNCC
        JOIN dbo.SanPham sp ON ctd.MaSP = sp.MaSP
        JOIN dbo.Loai l ON sp.MaLoai = l.MaLoai
    WHERE dh.MaDH = @MaDH
END
GO

/*chạy thử proc*/
EXEC SelectOrderID @MaKH = 1, @MaTT = 1
GO

EXEC SelectOrder @MaKH = 1
GO

EXEC SelectOrderProduct @MaDH = 1
GO
