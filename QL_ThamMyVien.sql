     CREATE DATABASE QL_ThamMyVien;
GO

USE QL_ThamMyVien;
GO

CREATE TABLE DONVI (
    MaDV INT PRIMARY KEY,
    TenDV NVARCHAR(100)
);

CREATE TABLE NHANVIEN (
    MaNV INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DiaChi NVARCHAR(200),
    MaDV INT NULL,
    FOREIGN KEY (MaDV) REFERENCES DONVI(MaDV)
);

CREATE TABLE QL_DONVI (
    MaNV INT PRIMARY KEY,
    MaDV INT,
    FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
    FOREIGN KEY (MaDV) REFERENCES DONVI(MaDV)
);

CREATE TABLE DICHVU (
    MaDVU INT PRIMARY KEY,
    TenDVU NVARCHAR(100),
    NgayBD DATE,
    NgayKT DATE
);

CREATE TABLE DIEUTRI (
    MaNV INT,
    MaDVU INT,
    PRIMARY KEY (MaNV, MaDVU),
    FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
    FOREIGN KEY (MaDVU) REFERENCES DICHVU(MaDVU)
);

CREATE TABLE LICHHEN (
    MaLH INT PRIMARY KEY,
    TenLH NVARCHAR(100)
);

CREATE TABLE LICHLAMVIEC (
    MaDV INT,
    MaLH INT,
    ThoiGian DATE,
    PRIMARY KEY (MaDV, MaLH, ThoiGian),
    FOREIGN KEY (MaDV) REFERENCES DONVI(MaDV),
    FOREIGN KEY (MaLH) REFERENCES LICHHEN(MaLH)
);
--Insert dữ liệu
INSERT INTO DONVI VALUES
(1, N'Phòng CNTT'), (2, N'Phòng Nhân sự'), (3, N'Phòng Kế toán'),
(4, N'Phòng Marketing'), (5, N'Phòng Kỹ thuật'), (6, N'Phòng Thiết kế'),
(7, N'Phòng Bán hàng'), (8, N'Phòng QA'), (9, N'Phòng Nghiên cứu'),
(10, N'Phòng Pháp lý'), (11, N'Phòng Sản xuất'), (12, N'Phòng Hành chính'),
(13, N'Phòng Logistics'), (14, N'Phòng Đối ngoại'), (15, N'Phòng Dự án'),
(16, N'Phòng Chăm sóc KH'), (17, N'Phòng Kiểm thử'), (18, N'Phòng Mạng'),
(19, N'Phòng An ninh mạng'), (20, N'Phòng Đào tạo');

INSERT INTO NHANVIEN VALUES
(101, N'Nguyễn Văn A', '1990-01-01', N'Nam', N'Hà Nội', 1),
(102, N'Trần Thị B', '1992-03-15', N'Nữ', N'Hải Phòng', 2),
(103, N'Lê Văn C', '1988-05-20', N'Nam', N'TP.HCM', 1),
(104, N'Phạm Thị D', '1995-08-12', N'Nữ', N'Cần Thơ', NULL),
(105, N'Hoàng Văn E', '1991-06-22', N'Nam', N'Đà Nẵng', 3),
(106, N'Ngô Thị F', '1993-02-10', N'Nữ', N'Nghệ An', 4),
(107, N'Bùi Văn G', '1990-09-18', N'Nam', N'Thanh Hóa', 5),
(108, N'Đỗ Thị H', '1994-12-01', N'Nữ', N'Hà Nội', 6),
(109, N'Phan Văn I', '1996-07-30', N'Nam', N'HCM', 7),
(110, N'Nguyễn Thị J', '1991-11-25', N'Nữ', N'Bình Dương', 8),
(111, N'Trần Văn K', '1989-10-14', N'Nam', N'TP.HCM', 9),
(112, N'Lê Thị L', '1995-03-09', N'Nữ', N'Cần Thơ', 10),
(113, N'Phạm Văn M', '1987-08-05', N'Nam', N'Hà Nội', 11),
(114, N'Nguyễn Thị N', '1992-04-28', N'Nữ', N'Huế', 12),
(115, N'Hồ Văn O', '1985-05-17', N'Nam', N'Nghệ An', 13),
(116, N'Cao Thị P', '1993-10-30', N'Nữ', N'Bắc Ninh', 14),
(117, N'Mai Văn Q', '1990-07-08', N'Nam', N'TP.HCM', 15),
(118, N'Tạ Thị R', '1994-11-02', N'Nữ', N'Bình Định', 16),
(119, N'Võ Văn S', '1988-01-27', N'Nam', N'Tây Ninh', 17),
(120, N'Đinh Thị T', '1996-06-18', N'Nữ', N'Lào Cai', 18);

INSERT INTO QL_DONVI VALUES
(101, 1), (102, 2), (105, 3), (106, 4), (107, 5),
(108, 6), (109, 7), (110, 8), (111, 9), (112, 10),
(113, 11), (114, 12), (115, 13), (116, 14), (117, 15),
(118, 16), (119, 17), (120, 18), (103, 19), (104, 20);

INSERT INTO DICHVU VALUES
(201, N'Dự án A', '2024-01-01', '2024-06-30'),
(202, N'Dự án B', '2024-07-01', '2024-12-31'),
(203, N'Dự án C', '2025-01-01', '2025-06-30'),
(204, N'Dự án D', '2023-05-01', '2023-11-30'),
(205, N'Dự án E', '2022-03-15', '2022-09-15'),
(206, N'Dự án F', '2024-02-10', '2024-08-10'),
(207, N'Dự án G', '2024-09-01', '2025-03-01'),
(208, N'Dự án H', '2023-01-01', '2023-06-01'),
(209, N'Dự án I', '2025-04-01', '2025-10-01'),
(210, N'Dự án J', '2023-07-01', '2024-01-01'),
(211, N'Dự án K', '2024-03-01', '2024-07-01'),
(212, N'Dự án L', '2023-09-01', '2024-02-01'),
(213, N'Dự án M', '2022-11-01', '2023-04-01'),
(214, N'Dự án N', '2024-05-01', '2024-11-01'),
(215, N'Dự án O', '2023-08-01', '2024-02-01'),
(216, N'Dự án P', '2024-06-15', '2025-01-15'),
(217, N'Dự án Q', '2025-01-01', '2025-06-01'),
(218, N'Dự án R', '2023-10-01', '2024-03-01'),
(219, N'Dự án S', '2023-12-01', '2024-06-01'),
(220, N'Dự án T', '2024-09-15', '2025-04-15'),
(222, N'Dự án trống', '2025-06-23', '2025-06-24'); 

INSERT INTO DIEUTRI VALUES
(101, 201), (101, 202), (102, 201), (103, 202),
(104, 203), (105, 204), (106, 205), (107, 206), (108, 207), (109, 208),
(110, 209), (111, 210), (112, 211), (113, 212), (114, 213),
(115, 214), (116, 215), (117, 216), (118, 217), (119, 218),
(120, 219), (101, 220), (102, 203), (103, 204), (104, 205),
(105, 206), (106, 207), (107, 208), (108, 209), (109, 210);

INSERT INTO LICHHEN VALUES
(301, N'Triển khai phần mềm'), (302, N'Bảo trì hệ thống'),
(303, N'Phân tích yêu cầu'), (304, N'Thiết kế UI/UX'),
(305, N'Kiểm thử chức năng'), (306, N'Triển khai DevOps'),
(307, N'Quản lý máy chủ'), (308, N'Nâng cấp hệ thống'),
(309, N'Đào tạo người dùng'), (310, N'Tư vấn giải pháp'),
(311, N'Phát triển Backend'), (312, N'Phát triển Frontend'),
(313, N'Tối ưu hiệu suất'), (314, N'Triển khai AI'),
(315, N'Ứng cứu sự cố'), (316, N'Backup dữ liệu'),
(317, N'Giám sát hệ thống'), (318, N'Thiết lập mạng nội bộ'),
(319, N'Bảo mật dữ liệu'), (320, N'Tổ chức hội thảo'),
(322, N'Hoạt động chưa phân công');	

INSERT INTO LICHLAMVIEC VALUES
(1, 301, '2024-04-01'), (2, 302, '2024-05-10'),
(3, 303, '2024-03-05'), (4, 304, '2024-06-01'),
(5, 305, '2024-07-15'),(6, 306, '2024-08-01'),
(7, 307, '2024-09-12'), (8, 308, '2024-10-22'),
(9, 309, '2024-11-01'), (10, 310, '2024-12-05'),
(11, 311, '2024-06-18'), (12, 312, '2024-07-25'),
(13, 313, '2024-08-20'), (14, 314, '2024-09-30'),
(15, 315, '2024-10-15'), (16, 316, '2024-11-21'),
(17, 317, '2024-12-30'), (18, 318, '2025-01-10'),
(19, 319, '2025-02-01'), (20, 320, '2025-03-05'),
(1, 305, '2024-04-05'), (1, 306, '2024-04-10'),
(2, 307, '2024-05-12'), (3, 308, '2024-06-06'),
(4, 309, '2024-06-20');


--XÂY DỰNG CÁC VIEW VÀ INDEX
--View: Danh sách nhân viên + tên đơn vị
CREATE VIEW V_NhanVien_DonVi AS
SELECT NV.MaNV, NV.HoTen, NV.NgaySinh, NV.GioiTinh, DV.TenDV
FROM NHANVIEN NV
LEFT JOIN DONVI DV ON NV.MaDV = DV.MaDV;

--View: Nhân viên đang tham gia dịch vụ
CREATE VIEW V_NhanVien_DichVu AS
SELECT NV.MaNV, NV.HoTen, DVU.TenDVU, DT.MaDVU
FROM DIEUTRI DT
JOIN NHANVIEN NV ON DT.MaNV = NV.MaNV
JOIN DICHVU DVU ON DT.MaDVU = DVU.MaDVU;

--View: Lịch làm việc chi tiết
CREATE VIEW V_LichLamViecChiTiet AS
SELECT LLV.MaDV, D.TenDV, LLV.MaLH, LH.TenLH, LLV.ThoiGian
FROM LICHLAMVIEC LLV
JOIN DONVI D ON LLV.MaDV = D.MaDV
JOIN LICHHEN LH ON LLV.MaLH = LH.MaLH;

-- STORED PROCEDURE & CURSOR
--Procedure: Thêm nhân viên
ALTER PROCEDURE SP_ThemNhanVien
    @MaNV INT,
    @HoTen NVARCHAR(100),
    @NgaySinh DATE,
    @GioiTinh NVARCHAR(10),
    @DiaChi NVARCHAR(200),
    @MaDV INT
AS
BEGIN
    -- Kiểm tra mã NV đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM NHANVIEN WHERE MaNV = @MaNV)
    BEGIN
        RAISERROR ('Mã nhân viên đã tồn tại!', 16, 1);
        RETURN;
    END;

    INSERT INTO NHANVIEN(MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, MaDV)
    VALUES (@MaNV, @HoTen, @NgaySinh, @GioiTinh, @DiaChi, @MaDV);
END;
EXEC SP_ThemNhanVien 
    @MaNV = 201,
    @HoTen = N'Lương Thị Hằng',
    @NgaySinh = '1997-02-14',
    @GioiTinh = N'Nữ',
    @DiaChi = N'Hà Nội',
    @MaDV = 2;


--Procedure: Lấy danh sách nhân viên theo đơn vị
CREATE PROCEDURE SP_NhanVienTheoDonVi
    @MaDV INT
AS
BEGIN
    SELECT * FROM NHANVIEN WHERE MaDV = @MaDV;
END;
EXEC SP_ThemNhanVien 301, N'Ngô Minh Trí', '1990-11-20', N'Nam', N'Hà Nội', 1;

--CURSOR: In danh sách nhân viên (demo cursor)
DECLARE @MaNV INT, @HoTen NVARCHAR(100);

DECLARE CurNhanVien CURSOR FOR
SELECT MaNV, HoTen FROM NHANVIEN;

OPEN CurNhanVien;
FETCH NEXT FROM CurNhanVien INTO @MaNV, @HoTen;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Nhân viên: ' + CAST(@MaNV AS NVARCHAR) + ' - ' + @HoTen;
    FETCH NEXT FROM CurNhanVien INTO @MaNV, @HoTen;
END;

CLOSE CurNhanVien;
DEALLOCATE CurNhanVien;

INSERT INTO NHANVIEN (MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, MaDV)
VALUES (501, N'Nguyễn Văn A', '1990-05-12', N'Nam', N'Hà Nội', 1);

--TRIGGER
--Trigger kiểm tra ngày kết thúc dịch vụ phải lớn hơn ngày bắt đầu
CREATE TRIGGER TRG_CheckNgayDichVu
ON DICHVU
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE NgayKT <= NgayBD
    )
    BEGIN
        RAISERROR ('Ngày kết thúc phải lớn hơn ngày bắt đầu!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

INSERT INTO DICHVU (MaDVU, TenDVU, NgayBD, NgayKT)
VALUES (301, N'Dự án Alpha', '2025-01-01', '2025-06-30');

--Trigger tự động ghi log khi thêm nhân viên
CREATE TABLE LOG_NHANVIEN (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    MaNV INT,
    ThoiGian DATETIME DEFAULT GETDATE(),
    HanhDong NVARCHAR(200)
);
CREATE TRIGGER TRG_LogNhanVien
ON NHANVIEN
AFTER INSERT
AS
BEGIN
    INSERT INTO LOG_NHANVIEN(MaNV, HanhDong)
    SELECT MaNV, N'Thêm mới nhân viên'
    FROM inserted;
END;

INSERT INTO NHANVIEN (MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, MaDV)
VALUES (601, N'Nguyễn Văn A', '1990-05-12', N'Nam', N'Hà Nội', 1);

--PHÂN QUYỀN & BẢO MẬT CSDL
--Tạo LOGIN và USER
CREATE LOGIN User_QLTMV WITH PASSWORD = '123@Password';

USE QL_ThamMyVien;
CREATE USER User_QLTMV FOR LOGIN User_QLTMV;

EXEC SP_ThemNhanVien 
    @MaNV = 706, 
    @HoTen = N'Nguyễn Văn F', 
    @NgaySinh = '1994-06-12', 
    @GioiTinh = N'Nam', 
    @DiaChi = N'Hà Nội', 
    @MaDV = 3;

    EXECUTE AS USER = 'User_QLTMV';

-- Xem nhân viên qua view
SELECT * FROM V_NhanVien_DonVi;

-- Thêm nhân viên bằng procedure
EXEC SP_ThemNhanVien 
    @MaNV = 707, 
    @HoTen = N'Lê Thị G', 
    @NgaySinh = '1995-07-07', 
    @GioiTinh = N'Nữ', 
    @DiaChi = N'Hải Phòng', 
    @MaDV = 2;

REVERT;



--Phân quyền đọc dữ liệu
GRANT SELECT ON NHANVIEN TO User_QLTMV;
GRANT SELECT ON DONVI TO User_QLTMV;

EXECUTE AS USER = 'User_QLTMV';
-- Xem danh sách nhân viên
SELECT * FROM NHANVIEN;

-- Xem danh sách đơn vị
SELECT * FROM DONVI;

REVERT;  -- Quay lại quyền ban đầu


--Phân quyền hạn chế (chỉ xem VIEW)
GRANT SELECT ON V_NhanVien_DonVi TO User_QLTMV;
EXECUTE AS USER = 'User_QLTMV';

-- Xem danh sách nhân viên kèm tên đơn vị
SELECT * FROM V_NhanVien_DonVi;

REVERT;  -- Quay lại quyền ban đầu


--Phân quyền cho phép chạy procedure
GRANT EXECUTE ON SP_ThemNhanVien TO User_QLTMV;
EXECUTE AS USER = 'User_QLTMV';

-- Thêm nhân viên mới qua procedure
EXEC SP_ThemNhanVien 
    @MaNV = 1003, 
    @HoTen = N'Lê Văn C', 
    @NgaySinh = '1988-03-15', 
    @GioiTinh = N'Nam', 
    @DiaChi = N'Đà Nẵng', 
    @MaDV = 1;

EXEC SP_ThemNhanVien 
    @MaNV = 1004, 
    @HoTen = N'Phạm Thị D', 
    @NgaySinh = '1993-04-20', 
    @GioiTinh = N'Nữ', 
    @DiaChi = N'TP.HCM', 
    @MaDV = 2;

REVERT;

-- Xem nhân viên mới thêm
SELECT * FROM NHANVIEN
WHERE MaNV IN (1003, 1004);

-- Xem log tự động
SELECT * FROM LOG_NHANVIEN
WHERE MaNV IN (1003, 1004);


--Thu hồi quyền\
REVOKE SELECT ON NHANVIEN FROM User_QLTMV;
