use master
create database QLNHANG
use QLNHANG

Create table KHACHHANG
(
	MaKhachHang int identity(1,1) NOT NULL,
	TenKhachHang Nvarchar(50) NOT NULL,
	SoDienThoai char(10) NULL UNIQUE Check (SoDienThoai Like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	DiaChi Nvarchar(50) NULL,
Primary Key (MaKhachHang)
) 
Create table MONAN
(
	MaMonAn int identity(1,1) NOT NULL,
	TenMon Nvarchar(50) NOT NULL,
	DonViTinh Nvarchar(50) NOT NULL,
	DonGia Money NOT NULL,
	TrangThai Nvarchar(50) NOT NULL,
	MaNhom int NOT NULL,
Primary Key (MaMonAn)
) 
Create table NHANVIEN
(
	MaNhanVien int identity(1,1) NOT NULL,
	HoTen Nvarchar(50) NOT NULL,
	NgaySinh date NULL,
	GioiTinh Nchar(5) NULL,
	SoDienThoai char(10) NULL Unique Check (SoDienThoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	DiaChi Ntext NULL,
	ChucVu Nvarchar(50) NOT NULL,
	MaQuanLy int NULL,
	LuongCoBan Money NULL,
Primary Key (MaNhanVien)
) 
Create table NHOMMONAN
(
	MaNhom int identity(1,1) NOT NULL,
	TenNhom Nvarchar(50) NOT NULL,
Primary Key (MaNhom)
) 

Create table BAN
(
	MaBan int identity(1,1) NOT NULL,
	LoaiBan Nvarchar(50) NOT NULL,
	SoLuongCho Integer NOT NULL,
	SoLuongCon int NOT NULL,
	TrangThai Nvarchar(50) NOT NULL Check ((TrangThai = N'Còn Bàn') or (TrangThai = N'Hết Bàn')),
Primary Key (MaBan)
)
Create table CHITIETDATBAN
(
	MaKhachHang int NOT NULL,
	MaBan int NOT NULL,
	SoLuongBan Integer NOT NULL,
Primary Key (MaKhachHang,MaBan)
) 
Create table DANHGIA
(
    MaKhachHang int NOT NULL,
    MaMonAn int NOT NULL,
    NoiDungDanhGia nvarchar(100) NULL,
    ThoiGianDanhGia datetime NULL,
    DiemDanhGia int NULL,
    Primary Key (MaKhachHang, MaMonAn)
)
Create table CALAMVIEC
(
	MaCa int identity(1,1) NOT NULL,
	GioBatDau time(0) NOT NULL,
	GioKetThuc time(0) NOT NULL,
Primary Key (MaCa)
) 
Create table NHANVIEN_CALAMVIEC
(
	NgayLam date NOT NULL,
	MaNhanVien int NOT NULL,
	MaCa int NOT NULL,
Primary Key (MaNhanVien,MaCa)
) 
Create table KHUYENMAI
(
	MaKhuyenMai int identity(1,1) NOT NULL,
	TenKhuyenMai Nvarchar(30) NOT NULL,
	PhanTramGiamGia int NOT NULL,
	MoTa Nvarchar(50) NOT NULL,
Primary Key (MaKhuyenMai)
) 
Create table HOADON
(
	MaHoaDon int identity(1,1) NOT NULL,
	MaNhanVienLap int NOT NULL,
	NgayLapHoaDon Datetime NOT NULL,
	TongTienTruocGiam Money NULL,
	SoTienGiam Money NULL,
	TongTienPhaiTra Money NOT NULL,
	TrangThai Nvarchar(50) NOT NULL Check ((TrangThai = N'Đã thanh toán') or (TrangThai = N'Chưa thanh toán')),
	MaKhuyenMai int ,
	MaKhachHang int NOT NULL,
Primary Key (MaHoaDon)
) 
Create table PHIEUNHAPHANG
(
	MaPhieuNhap int identity(1,1) NOT NULL,
	NgayTao Date NOT NULL,
	NhaCungCap Nvarchar(50) NOT NULL,
	MaNhanVienNhap int NOT NULL,
Primary Key (MaPhieuNhap)
) 
Create table NGUYENLIEU
(
	MaNguyenLieu int identity(1,1) NOT NULL,
	TenNguyenLieu Nvarchar(50) NULL,
	Loai Nvarchar(30) NOT NULL,
	NgaySanXuat date NOT NULL,
	HanSuDung date NOT NULL,
	GiaBan Money NOT NULL,
	DonViTinh Nvarchar(30) NOT NULL,
	SoLuongTon int NOT NULL
Primary Key (MaNguyenLieu)
) 
Create table NGUYENLIEU_MONAN
(
	MaMonAn int NOT NULL,
	MaNguyenLieu int NOT NULL,
	SoLuong Integer NOT NULL,
Primary Key (MaMonAn,MaNguyenLieu)
) 
Create table CHITIETNHAPHANG
(
	MaPhieuNhap int NOT NULL,
	MaNguyenLieu int NOT NULL,
	SoLuongNhap Integer NOT NULL,
	DonGia Money NOT NULL,
	ThanhTien Money NOT NULL,
Primary Key (MaNguyenLieu,MaPhieuNhap)
) 
Create table PHIEUTHONGKE
(
	MaPhieu int identity(1,1) NOT NULL,
	NgayThongKe Date NOT NULL,
	DoanhThu Money NOT NULL,
	Thu Money NOT NULL,
	Chi Money NOT NULL,
	MaNhanVien int NOT NULL,
Primary Key (MaPhieu)
) 
Create table CHITIETHOADON
(
	MaHoaDon int NOT NULL,
	MaMonAn int NOT NULL,
	SoLuong Integer NOT NULL,
Primary Key (MaHoaDon,MaMonAn)
) 
Create table TAIKHOAN
(
	MaTaiKhoan int identity(1,1) NOT NULL,
	TenDangNhap Nchar(20) NOT NULL,
	MatKhau Nchar(20) NOT NULL,
	NgayTao Date NOT NULL,
	TrangThai Nvarchar(50) NOT NULL,
	LoaiTaiKhoan Nvarchar(50) NOT NULL,
	MaNhanVien int,
Primary Key(MaTaiKhoan)
)
Alter table CHITIETDATBAN add  foreign key(MaKhachHang) references KHACHHANG (MaKhachHang)  on update no action on delete no action 
go
Alter table DANHGIA add  foreign key(MaKhachHang) references KHACHHANG (MaKhachHang)  on update no action on delete no action 
go
Alter table HOADON add  foreign key(MaKhachHang) references KHACHHANG (MaKhachHang)  on update no action on delete no action 
go
Alter table DANHGIA add  foreign key(MaMonAn) references MONAN (MaMonAn)  on update no action on delete no action 
go
Alter table NGUYENLIEU_MONAN add  foreign key(MaMonAn) references MONAN (MaMonAn)  on update no action on delete no action 
go
Alter table CHITIETHOADON add  foreign key(MaMonAn) references MONAN (MaMonAn)  on update no action on delete no action 
go
Alter table NHANVIEN_CALAMVIEC add  foreign key(MaNhanVien) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table NHANVIEN add  foreign key(MaQuanLy) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table TAIKHOAN add  foreign key(MaNhanVien) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table PHIEUTHONGKE add  foreign key(MaNhanVien) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table HOADON add  foreign key(MaNhanVienLap) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table PHIEUNHAPHANG add  foreign key(MaNhanVienNhap) references NHANVIEN (MaNhanVien)  on update no action on delete no action 
go
Alter table MONAN add  foreign key(MaNhom) references NHOMMONAN (MaNhom)  on update no action on delete no action 
go
Alter table CHITIETDATBAN add  foreign key(MaBan) references BAN (MaBan)  on update no action on delete no action 
go
Alter table NHANVIEN_CALAMVIEC add  foreign key(MaCa) references CALAMVIEC (MaCa)  on update no action on delete no action 
go
Alter table HOADON add  foreign key(MaKhuyenMai) references KHUYENMAI (MaKhuyenMai)  on update no action on delete no action 
go
Alter table CHITIETHOADON add  foreign key(MaHoaDon) references HOADON (MaHoaDon)  on update no action on delete no action 
go
Alter table CHITIETNHAPHANG add  foreign key(MaPhieuNhap) references PHIEUNHAPHANG (MaPhieuNhap)  on update no action on delete no action 
go
Alter table NGUYENLIEU_MONAN add  foreign key(MaNguyenLieu) references NGUYENLIEU (MaNguyenLieu)  on update no action on delete no action 
go
Alter table CHITIETNHAPHANG add  foreign key(MaNguyenLieu) references NGUYENLIEU (MaNguyenLieu)  on update no action on delete no action 
go

--======================================================INSERT INTO=====================================================
insert into KHACHHANG (TenKhachHang, SoDienThoai, DiaChi) values
(N'Hoàng Gia Huy', '0920154470', N'416 Nguyễn Trãi, Q5'),
(N'Đặng Nhật Quân', '0972750775', N'102 Lý Thường Kiệt, Q10'),
(N'Võ Hải Bình', '0990926027', N'789 Cách Mạng Tháng 8, Q3'),
(N'Ngô Thị Nam', '0969882772', N'203 Điện Biên Phủ, Q Bình Thạnh'),
(N'Bùi Thanh Huy', '0948125366', N'202 Điện Biên Phủ, Q Bình Thạnh'),
(N'Phạm Thanh Sơn', '0938299117', N'418 Nguyễn Trãi, Q5'),
(N'Bùi Gia Dung', '0978072682', N'121 Lý Thường Kiệt, Q10'),
(N'Hoàng Phúc Hùng', '0933490814', N'421 Nguyễn Trãi, Q5'),
(N'Trần Thị Chi', '0939890476', N'791 Cách Mạng Tháng 8, Q3'),
(N'Đỗ Thị Huy', '0997852752', N'209 Điện Biên Phủ, Q Bình Thạnh'),
(N'Võ Hoài Tú', '0962908082', N'456 Nguyễn Trãi, Q5'),
(N'Đặng Hải Tú', '0941608448', N'101 Lý Thường Kiệt, Q10'),
(N'Lê Hải Việt', '0954595045', N'406 Nguyễn Trãi, Q5'),
(N'Phạm Phúc Dương', '0929726094', N'123 Lê Văn Sỹ, Q3'),
(N'Trần Gia Sơn', '0986421640', N'204 Điện Biên Phủ, Q Bình Thạnh'),
(N'Ngô Gia Hùng', '0969369484', N'212 Điện Biên Phủ, Q Bình Thạnh'),
(N'Lê Khánh Phong', '0922286527', N'206 Điện Biên Phủ, Q Bình Thạnh'),
(N'Nguyễn Gia An', '0995867440', N'111 Lý Thường Kiệt, Q10'),
(N'Hoàng Gia Dung', '0911861274', N'123 Trần Hưng Đạo, Q1'),
(N'Ngô Hải Quân', '0989001980', N'108 Lý Thường Kiệt, Q10'),
(N'Nguyễn Gia Hân', '0911111111', N'12 Nguyễn Huệ, Q1'),
(N'Lê Thanh Tú', '0911111112', N'45 Nguyễn Văn Cừ, Q5'),
(N'Trần Văn Duy', '0911111113', N'78 Lý Thường Kiệt, Q10'),
(N'Phan Thị Mai', '0911111114', N'123 Cách Mạng Tháng 8, Q3'),
(N'Đỗ Minh Nhật', '0911111115', N'22 Điện Biên Phủ, Q Bình Thạnh'),
(N'Lê Minh Tân', '0911111116', N'99 Trần Hưng Đạo, Q1')

insert into NHOMMONAN (TenNhom) values
(N'Món Khai Vị'),
(N'Món Chính'),
(N'Tráng Miệng'),
(N'Đồ Uống'),
(N'Món Ăn Nhanh'),
(N'Món Ăn Sáng'),
(N'Món Ăn Chay'),
(N'Món Lẩu'),
(N'Món Đặc Biệt'),
(N'Món Truyền Thống'),
(N'VIP'),
(N'Luxury'),
(N'Đặc biệt'),
(N'Giới hạn'),
(N'Độc lạ');

INSERT INTO CALAMVIEC (GioBatDau, GioKetThuc) VALUES
('07:00', '11:00'),
('11:00', '14:00'),
('14:00', '17:00'),
('17:00', '22:00'),
('07:00', '22:00'),
('22:00', '02:00');

INSERT INTO KHUYENMAI (TenKhuyenMai, PhanTramGiamGia, MoTa) VALUES
(N'Giảm 10% Gỏi cuốn', 10, N'Giảm 10% khi gọi món Gỏi cuốn'),
(N'Giảm 15% Nem rán', 15, N'Giảm 15% khi gọi món Nem rán'),
(N'Giảm 20% Phở bỏ tái', 20, N'Giảm 20% cho món Phở bỏ tái'),
(N'Giảm 25% Xôi gà', 25, N'Giảm 25% khi gọi món Xôi gà'),
(N'Giảm 10% Mì Quảng', 10, N'Gọi Mì Quảng giảm ngay 10%'),
(N'Giảm 15% Chè 3 màu', 15, N'Giảm 15% cho món Chè 3 màu'),
(N'Giảm 20% Súp cua', 20, N'Giảm 20% khi gọi món Súp cua'),
(N'Giảm 25% Cơm tấm sườn bì', 25, N'Gọi Cơm tấm sườn bì giảm ngay 25%'),
(N'Giảm 10% Bún bò Huế', 10, N'Giảm 10% khi gọi món Bún bò Huế'),
(N'Giảm 15% Bánh mì chảo', 15, N'Gọi Bánh mì chảo giảm ngay 15%');


INSERT INTO NGUYENLIEU (TenNguyenLieu, Loai, NgaySanXuat, HanSuDung, GiaBan, DonViTinh, SoLuongTon) VALUES
(N'Thịt bò', N'Thịt', '2020-01-10', '2020-03-10', 198000, N'nguyên gói', 25),
(N'Thịt gà', N'Thịt', '2020-05-20', '2020-07-20', 50000, N'kg', 30),
(N'Thịt heo', N'Thịt', '2020-09-01', '2020-11-01', 60000, N'kg', 28),
(N'Tôm sú', N'Hải sản', '2021-02-15', '2021-04-15', 90000, N'gói', 22),
(N'Cua biển', N'Hải sản', '2021-06-05', '2021-08-05', 68000, N'bó', 18),
(N'Cá hồi', N'Hải sản', '2021-10-12', '2021-12-12', 62000, N'kg', 20),
(N'Cá lóc', N'Hải sản', '2022-01-28', '2022-03-28', 77000, N'kg', 24),
(N'Mực ống', N'Hải sản', '2022-04-03', '2022-06-03', 96000, N'kg', 29),
(N'Trứng gà', N'Trứng', '2022-07-10', '2022-09-10', 87000, N'quả', 90),
(N'Trứng vịt', N'Trứng', '2022-10-20', '2022-12-20', 118000, N'quả', 50),
(N'Gạo', N'Gạo', '2023-01-05', '2023-12-05', 113000, N'gói', 30),
(N'Bún tươi', N'Tinh bột', '2023-03-17', '2023-05-17', 91000, N'kg', 29),
(N'Phở khô', N'Tinh bột', '2023-06-25', '2023-09-25', 195000, N'gói', 24),
(N'Mì trứng', N'Tinh bột', '2023-09-08', '2023-11-08', 152000, N'gói', 26),
(N'Nước mắm', N'Gia vị', '2023-12-01', '2024-11-01', 27000, N'nguyên chai', 30),
(N'Nước tương', N'Gia vị', '2024-01-14', '2024-12-14', 83000, N'Nguyên chai', 27),
(N'Muối', N'Gia vị', '2024-03-03', '2025-02-03', 133000, N'kg', 30),
(N'Đường', N'Gia vị', '2024-05-10', '2025-04-10', 183000, N'kg', 29),
(N'Tiêu đen', N'Gia vị', '2024-07-22', '2025-06-22', 167000, N'nguyên hộp', 25),
(N'Ớt', N'Rau củ', '2024-09-05', '2024-11-05', 172000, N'kg', 13),
(N'Tỏi', N'Gia vị', '2024-10-18', '2024-12-18', 121000, N'kg', 20),
(N'Hành tím', N'Gia vị', '2024-11-25', '2025-01-25', 180000, N'kg', 22),
(N'Cà rốt', N'Rau củ', '2024-12-10', '2025-02-10', 137000, N'kg', 26),
(N'Khoai tây', N'Rau củ', '2025-01-02', '2025-03-02', 124000, N'kg', 28),
(N'Bắp cải', N'Rau củ', '2025-02-19', '2025-04-19', 124000, N'kg', 21),
(N'Xà lách', N'Rau củ', '2025-03-07', '2025-05-07', 22000, N'kg', 26),
(N'Dầu ăn', N'Gia vị', '2025-03-15', '2026-03-15', 50000, N'Chai', 18),
(N'Sữa đặc', N'Khác', '2025-03-21', '2026-03-21', 145000, N'nguyên hộp', 20),
(N'Gừng', N'Gia vị', '2025-03-25', '2025-05-25', 188000, N'kg', 19),
(N'Hành lá', N'Rau củ', '2025-03-30', '2025-05-30', 38000, N'kg', 14),
(N'Nho đỏ Pháp', N'Trái cây', '2025-04-01', '2025-06-01', 39000, N'nguyên hộp', 17),
(N'Nho trắng Ý', N'Trái cây', '2025-04-05', '2025-06-05', 133000, N'nguyên gói', 16),
(N'Gạo nếp cái hoa vàng', N'Gạo', '2025-04-10', '2026-04-10', 172000, N'kg', 105),
(N'Men rượu truyền thống', N'Gia vị', '2025-04-12', '2026-04-12', 181000, N'nguyên chai', 16),
(N'Siro chanh dây', N'Đồ uống', '2025-04-15', '2026-04-15', 109000, N'nguyên chai', 22),
(N'Siro đào', N'Đồ uống', '2025-04-18', '2026-04-18', 66000, N'nguyên chai', 20),
(N'Soda', N'Đồ uống', '2025-04-20', '2026-04-20', 175000, N'nguyên chai', 24),
(N'Tonic', N'Đồ uống', '2025-04-22', '2026-04-22', 159000, N'nguyên chai', 23),
(N'Đá viên tinh khiết', N'Đồ uống', '2025-04-25', '2025-06-25', 122000, N'nguyên chai', 30),
(N'Rượu nền vodka', N'Đồ uống', '2025-04-28', '2026-04-28', 198000, N'nguyên chai', 18);

INSERT INTO BAN (LoaiBan, SoLuongCho, TrangThai, SoLuongCon) VALUES
(N'Bàn thường', 2, N'Còn bàn', 3),
(N'Bàn thường', 4, N'Còn bàn', 5),
(N'Bàn thường', 6, N'Hết bàn', 0),
(N'Bàn thường', 8, N'Còn bàn', 5),
(N'Bàn thường', 10, N'Hết bàn', 0),
-- Bàn VIP
(N'Bàn VIP', 1, N'Còn bàn',5),
(N'Bàn VIP', 2, N'Hết bàn', 0),
(N'Bàn VIP', 4, N'Còn bàn', 2),
(N'Bàn VIP', 6, N'Còn bàn', 3),
(N'Bàn VIP', 8, N'Hết bàn', 0),
(N'Bàn VIP', 10, N'Còn bàn', 4),
-- Bàn luxury
(N'Bàn luxury', 5, N'Còn bàn', 5),
(N'Bàn luxury', 10, N'Hết bàn', 0),
(N'Bàn luxury', 15, N'Còn bàn', 5),
(N'Bàn luxury', 20, N'Hết bàn', 0);

INSERT INTO MONAN (TenMon, DonViTinh, DonGia, TrangThai, MaNhom) VALUES
(N'Gỏi cuốn', N'Cái', 57000, N'Ngừng kinh doanh', 1),
(N'Nem rán', N'Phần', 52000, N'Ngừng kinh doanh', 1),
(N'Bánh xèo miền Tây', N'Cái', 56000, N'Ngừng kinh doanh', 1),
(N'Cơm tấm sườn bì', N'Đĩa', 78000, N'Ngừng kinh doanh', 2),
(N'Phở bò tái', N'Tô', 47000, N'Ngừng kinh doanh', 2),
(N'Bún bò Huế', N'Tô', 39000, N'Hoạt động', 2),
(N'Mì Quảng', N'Tô', 41000, N'Hoạt động', 6),
(N'Bánh cuốn nóng', N'Đĩa', 61000, N'Hoạt động', 6),
(N'Bánh mì chảo', N'Phần', 33000, N'Hoạt động', 6),
(N'Xôi gà', N'Hộp', 56000, N'Hoạt động', 6),
(N'Chè ba màu', N'Ly', 45000, N'Hoạt động', 3),
(N'Bánh bèo Huế', N'Chén', 41000, N'Hoạt động', 3),
(N'Súp cua', N'Tô', 47000, N'Hoạt động', 3),
(N'Trà đào cam sả', N'Ly', 68000, N'Hoạt động', 5),
(N'Sinh tố bơ', N'Ly', 43000, N'Hoạt động', 4),
(N'Coca Cola', N'Chai', 60000, N'Hoạt động', 4),
(N'Lẩu hải sản', N'Nồi', 71000, N'Hoạt động', 8),
(N'Lẩu bò nhúng giấm', N'Nồi', 56000, N'Hoạt động', 8),
(N'Cơm chay thập cẩm', N'Đĩa', 74000, N'Hoạt động', 7),
(N'Bún riêu chay', N'Tô', 73000, N'Hoạt động', 7),
(N'Tôm hùm nướng phô mai', N'Phần', 1531000, N'Hoạt động', 9),
(N'Lẩu cá hồi Sapa', N'Nồi', 2361000, N'Hoạt động', 8),
(N'Bò Wagyu nướng đá', N'Phần', 1792000, N'Hoạt động', 9),
(N'Cua hoàng đế hấp', N'Phần', 2080000, N'Hoạt động', 9),
(N'Combo hải sản đặc biệt', N'Set', 2294000, N'Hoạt động', 9),
(N'Rượu Hennessy Paradis', N'Chai', 3400000, N'Hoạt động', 4),
(N'Rượu Hibiki 21 năm', N'Chai', 4100000, N'Hoạt động', 4),
(N'Rượu Yamazaki 18 năm', N'Chai', 4500000, N'Hoạt động', 4),
(N'Rượu Glenfiddich 21 năm', N'Chai', 6600000, N'Hoạt động', 4),
(N'Rượu MaCallan Rare Cask', N'Chai', 3300000, N'Hoạt động', 4),
(N'Rượu Laphroaig 25 năm', N'Chai', 4200000, N'Hoạt động', 4),
(N'Rượu Highland Park 18 năm', N'Chai', 8400000, N'Hoạt động', 4),
(N'Rượu Louis XIII mini', N'Chai', 7100000, N'Hoạt động', 4),
(N'Rượu Dom Pérignon Rose', N'Chai', 8200000, N'Hoạt động', 4),
(N'Rượu Krug Vintage', N'Chai', 5700000, N'Hoạt động', 4),
(N'Rượu Vang Ý Tignanello', N'Chai', 3100000, N'Hoạt động', 4),
(N'Rượu Bordeaux Grand Cru', N'Chai', 9100000, N'Hoạt động', 4),
(N'Rượu Rémy Martin Club', N'Chai', 7200000, N'Hoạt động', 4),
(N'Rượu Glenlivet 18 năm', N'Chai', 6300000, N'Hoạt động', 4),
(N'Rượu Beluga Gold Line', N'Chai', 3700000, N'Hoạt động', 4);

INSERT INTO NHANVIEN (HoTen, NgaySinh, GioiTinh, SoDienThoai, DiaChi, ChucVu, MaQuanLy, LuongCoBan) VALUES
-- Quản lý (ID 1, 2)
(N'Ngô Gia Bình', '1996-07-11', N'Nam', '0977613007', N'Đà Nẵng', N'Quản lý nhân sự', NULL, 9200000),
(N'Nguyễn Thanh Nam', '1994-09-18', N'Nam', '0953878843', N'TP.HCM', N'Quản lý kho và bếp', NULL, 9400000);

INSERT INTO NHANVIEN (HoTen, NgaySinh, GioiTinh, SoDienThoai, DiaChi, ChucVu, MaQuanLy, LuongCoBan) VALUES
-- Lễ tân (5 nhân viên mới, ID 3-7)
(N'Trần Minh Khang', '1998-03-10', N'Nam', '0912345678', N'Hà Nội', N'Lễ tân', 1, 7000000),
(N'Hoàng Thị Thùy Linh', '1997-06-25', N'Nữ', '0901234567', N'TP.HCM', N'Lễ tân', 1, 6800000),
(N'Lê Văn Cường', '1999-01-15', N'Nam', '0987654321', N'Cần Thơ', N'Lễ tân', 1, 6500000),
(N'Vũ Thị Mai Anh', '1996-09-02', N'Nữ', '0965432109', N'Đà Nẵng', N'Lễ tân', 2, 7200000),
(N'Phan Thanh Tú', '1995-11-28', N'Nam', '0934567890', N'Bình Dương', N'Lễ tân', 2, 6900000),
-- PHỤC VỤ (23 nhân viên, ID từ 8 đến 30)
(N'Phạm Minh An', '1997-11-20', N'Nam', '0940899397', N'Cần Thơ', N'Phục vụ', 1, 6200000),
(N'Ngô Phúc Phong', '1999-10-10', N'Nam', '0984331446', N'TP.HCM', N'Phục vụ', 1, 6200000),
(N'Lê Hải Phong', '1994-12-27', N'Nữ', '0978402962', N'Cần Thơ', N'Phục vụ', 1, 6300000),
(N'Phạm Gia Lan', '1993-05-05', N'Nữ', '0994819319', N'TP.HCM', N'Phục vụ', 1, 6500000),
(N'Bùi Thị Tú', '1995-05-14', N'Nam', '0918742201', N'Bình Dương', N'Phục vụ', 1, 6200000),
(N'Đỗ Thanh Việt', '1994-11-11', N'Nam', '0961348290', N'Bình Dương', N'Phục vụ', 1, 6750000),
(N'Đỗ Phúc Việt', '1996-07-14', N'Nữ', '0999486872', N'Hà Nội', N'Phục vụ', 1, 5650000),
(N'Ngô Khánh Linh', '1997-08-11', N'Nữ', '0994366622', N'Bình Dương', N'Phục vụ', 1, 7000000),
(N'Bùi Thanh Nam', '1999-10-09', N'Nữ', '0955892146', N'Bình Dương', N'Phục vụ', 1, 6900000),
(N'Ngô Khánh Hùng', '1998-07-14', N'Nữ', '0913742021', N'Cần Thơ', N'Phục vụ', 2, 6600000),
(N'Trần Quốc An', '1994-12-24', N'Nữ', '0986902868', N'Đà Nẵng', N'Phục vụ', 2, 7300000),
(N'Nguyễn Hải Nam', '1993-07-01', N'Nam', '0929638223', N'Cần Thơ', N'Phục vụ', 1, 5900000),
(N'Nguyễn Văn An', '1995-02-08', N'Nữ', '0916129886', N'Hà Nội', N'Phục vụ', 1, 5850000),
(N'Võ Minh Linh', '1999-07-11', N'Nam', '0949581184', N'TP.HCM', N'Phục vụ', 2, 5000000),
(N'Đỗ Gia Nam', '1997-07-08', N'Nam', '0988376941', N'Hải Phòng', N'Phục vụ', 2, 5500000),
(N'Hoàng Nhật Dung', '1999-05-25', N'Nữ', '0964553581', N'Hải Phòng', N'Phục vụ', 1, 5400000),
(N'Trần Hải Lan', '1999-05-03', N'Nam', '0997015796', N'Cần Thơ', N'Phục vụ', 2, 5550000),
(N'Nguyễn Khánh Việt', '1997-10-08', N'Nam', '0917769511', N'Đà Nẵng', N'Phục vụ', 1, 6300000),
(N'Ngô Văn Linh', '1993-02-04', N'Nữ', '0975927226', N'Hải Phòng', N'Phục vụ', 2, 6950000),
(N'Phạm Thị Bình', '1999-10-26', N'Nữ', '0987254189', N'Đà Nẵng', N'Phục vụ', 1, 6800000),
(N'Đặng Thị Chi', '1996-03-06', N'Nữ', '0958625131', N'Đà Nẵng', N'Phục vụ', 1, 5950000),
(N'Trần Văn Long', '2000-01-20', N'Nam', '0911223344', N'TP.HCM', N'Phục vụ', 1, 6100000),
(N'Võ Thị Ngọc', '1999-08-08', N'Nữ', '0912334455', N'Cần Thơ', N'Phục vụ', 2, 6000000),
-- ĐẦU BẾP (10 nhân viên, ID từ 31 đến 40)
(N'Lê Thanh Dung', '1994-12-01', N'Nữ', '0999680763', N'Cần Thơ', N'Đầu bếp', 1, 8100000),
(N'Lê Phúc Phong', '1995-03-21', N'Nam', '0935549587', N'TP.HCM', N'Đầu bếp', 1, 8800000),
(N'Đặng Gia Hùng', '1999-01-04', N'Nam', '0969194871', N'Cần Thơ', N'Đầu bếp', 1, 8200000),
(N'Trần Nhật Dung', '1995-10-19', N'Nữ', '0978896061', N'Hà Nội', N'Đầu bếp', 2, 8500000),
(N'Nguyễn Văn Thịnh', '1992-04-01', N'Nam', '0912123123', N'TP.HCM', N'Đầu bếp', 1, 8700000),
(N'Phạm Thị Yến', '1993-11-11', N'Nữ', '0909876543', N'Đà Nẵng', N'Đầu bếp', 1, 8300000),
(N'Đinh Công Bằng', '1990-07-07', N'Nam', '0987123456', N'Hải Phòng', N'Đầu bếp', 2, 8900000),
(N'Mai Thanh Hương', '1994-02-28', N'Nữ', '0976543210', N'Cần Thơ', N'Đầu bếp', 2, 8000000),
(N'Nguyễn Hoàng Dũng', '1991-05-15', N'Nam', '0945678901', N'TP.HCM', N'Đầu bếp', 1, 8600000),
(N'Lê Thị Lan Hương', '1992-10-20', N'Nữ', '0932109876', N'Bình Dương', N'Đầu bếp', 2, 8400000);


INSERT INTO TAIKHOAN (TenDangNhap, MatKhau, NgayTao, TrangThai, LoaiTaiKhoan, MaNhanVien) VALUES
('qlns', '123456', '2025-04-16', N'Hoạt động', N'Quản lý nhân sự', 1),
('qlkb', '123456', '2025-04-16', N'Hoạt động', N'Quản lý kho và bếp', 2),
('letan1', '123456', '2025-04-17', N'Hoạt động', N'Lễ tân', 3),
('letan2', '123456', '2025-04-17', N'Hoạt động', N'Lễ tân', 4),
('letan3', '123456', '2025-04-18', N'Hoạt động', N'Lễ tân', 5),
('letan4', '123456', '2025-04-18', N'Hoạt động', N'Lễ tân', 6),
('letan5', '123456', '2025-04-19', N'Hoạt động', N'Lễ tân', 7);

INSERT INTO PHIEUNHAPHANG (NgayTao, NhaCungCap, MaNhanVienNhap) VALUES
('2024-04-02', N'TP Sạch An Phát', 3),
('2023-04-13', N'HTX Rau Củ Miền Tây', 4),
('2022-03-03', N'Nông sản Hưng Thịnh', 5),
('2021-04-08', N'Kho NL Chế biến CN1', 6),
('2020-05-02', N'Kho NL Chế biến CN2', 7),
('2024-04-14', N'Gia Vị Minh Châu', 8),
('2022-05-15', N'HTX Rau Củ Miền Tây', 3),
('2023-04-07', N'Rượu Vang Quốc Tế', 4),
('2022-03-01', N'Thực đơn mới – Bếp Việt', 5),
('2023-02-15', N'Thực đơn mới – Bếp Việt', 6),
('2021-04-01', N'Chợ Đầu Mối Bình Điền', 7),
('2023-03-11', N'Rượu Vang Quốc Tế', 8),
('2024-02-13', N'Nông sản Hưng Thịnh', 3),
('2022-01-11', N'Chợ Hòa Bình', 4),
('2024-03-12', N'Chợ Hòa Bình', 5),
('2023-04-04', N'Rượu Vang Quốc Tế', 6),
('2021-06-03', N'Rượu Vang Quốc Tế', 7),
('2020-07-03', N'Rượu Vang Quốc Tế', 8),
('2022-05-06', N'Tổng kho NL Miền Nam', 3),
('2021-08-07', N'Tổng kho NL Miền Nam', 4),
('2024-01-05', N'Thực phẩm tươi sống Sài Gòn', 28),
('2023-02-20', N'Cà phê rang xay Miền Đông', 29),
('2022-06-10', N'Nước giải khát Xanh', 30),
('2021-09-01', N'Công ty Bánh kẹo Á Châu', 8),
('2020-11-15', N'Nhà máy sữa Việt Nam', 9),
('2024-03-25', N'Đông lạnh Phú Quốc', 10),
('2023-07-07', N'Hải sản tươi sống Vũng Tàu', 11),
('2022-10-18', N'Nông sản hữu cơ Đà Lạt', 12),
('2021-12-01', N'Nhà cung cấp bao bì Nhựa Xanh', 13),
('2020-09-22', N'Thiết bị nhà bếp ACom', 14);

INSERT INTO PHIEUTHONGKE (NgayThongKe, DoanhThu, Thu, Chi, MaNhanVien) VALUES
('2025-01-12', 6172575, 3774009, 2398566, 3),
('2025-02-22', 5655660, 1255660, 4400000, 4),
('2025-03-19', 9762636, 4366427, 5396209, 5),
('2025-05-04', 6715290, 2780992, 3934298, 6),
('2025-06-12', 30128904, 30128904, 0, 7),
('2025-06-14', 2492996, 975460, 1517536, 4),
('2025-06-15', 9789191, 5010582, 4778609, 5),
('2024-03-07', 3023701, 697299, 2326402, 6),
('2024-06-17', 12552934, 12552934, 0, 7),
('2024-09-05', 16271450, 11000000, 5271450, 3),
('2024-11-11', 9192085, 6543172, 2648913, 4),
('2024-12-30', 7112232, 5569227, 1543005, 5),
('2023-02-14', 21594334, 15808678, 5785656, 6),
('2023-04-18', 12379564, 11108119, 1271445, 7),
('2023-06-23', 1016609, 1000000, 16609, 3),
('2023-08-09', 8450120, 6450120, 2000000, 4),
('2023-10-01', 5600000, 5600000, 0, 5),
('2022-01-25', 3789221, 1989221, 1800000, 6),
('2022-03-15', 9945566, 5000000, 4945566, 7),
('2022-06-27', 7200033, 4500000, 2700033, 3),
('2021-02-18', 6572000, 6572000, 0, 4),
('2021-07-04', 8123000, 8123000, 0, 5),
('2020-04-10', 4321000, 2900000, 1421000, 6),
('2020-08-22', 10450000, 7450000, 3000000, 7),
('2020-12-05', 6020000, 6020000, 0, 3);

INSERT INTO CHITIETNHAPHANG (MaPhieuNhap, MaNguyenLieu, SoLuongNhap, DonGia, ThanhTien) VALUES
(1, 1, 6, 198000, 1188000),
(1, 35, 6, 109000, 654000),
(1, 31, 9, 39000, 351000),
(1, 2, 2, 50000, 100000),
(2, 23, 8, 137000, 1096000),
(2, 1, 4, 198000, 792000),
(2, 14, 9, 152000, 1368000),
(2, 12, 8, 91000, 728000),
(2, 30, 4, 38000, 152000),
(3, 15, 3, 27000, 81000),
(3, 7, 3, 77000, 231000),
(3, 38, 5, 159000, 795000),
(3, 21, 9, 121000, 1089000),
(4, 20, 9, 172000, 1548000),
(4, 33, 9, 172000, 1548000),
(4, 31, 5, 39000, 195000),
(4, 22, 9, 180000, 1620000),
(5, 30, 9, 38000, 342000),
(5, 5, 10, 68000, 680000),
(5, 32, 9, 133000, 1197000),
(5, 3, 8, 60000, 480000),
(6, 22, 1, 180000, 180000),
(6, 17, 4, 133000, 532000),
(6, 25, 3, 124000, 372000),
(6, 38, 7, 159000, 1113000),
(6, 31, 1, 39000, 39000),
(7, 34, 3, 181000, 543000),
(7, 5, 10, 68000, 680000),
(7, 2, 7, 50000, 350000),
(8, 28, 2, 145000, 290000),
(8, 16, 9, 83000, 747000),
(8, 25, 10, 124000, 1240000),
(8, 5, 2, 68000, 136000),
(9, 14, 2, 152000, 304000),
(9, 30, 6, 38000, 228000),
(9, 17, 1, 133000, 133000),
(10, 17, 6, 133000, 798000),
(10, 18, 6, 183000, 1098000),
(10, 36, 8, 66000, 528000),
(11, 17, 4, 133000, 532000),
(11, 20, 5, 172000, 860000),
(11, 37, 6, 175000, 1050000),
(12, 19, 6, 167000, 1002000),
(12, 23, 5, 137000, 685000),
(13, 13, 5, 195000, 975000),
(13, 16, 4, 83000, 332000),
(13, 35, 7, 109000, 763000),
(13, 3, 8, 60000, 480000),
(14, 26, 4, 22000, 88000),
(14, 11, 9, 113000, 1017000),
(15, 21, 2, 121000, 242000),
(15, 39, 9, 122000, 1098000),
(16, 9, 8, 87000, 696000),
(16, 15, 7, 27000, 189000),
(16, 8, 3, 96000, 288000),
(16, 36, 10, 66000, 660000),
(17, 31, 5, 39000, 195000),
(17, 37, 2, 175000, 350000),
(18, 4, 2, 90000, 180000),
(18, 11, 6, 113000, 678000),
(18, 35, 7, 109000, 763000),
(18, 28, 6, 145000, 870000),
(18, 33, 3, 172000, 516000),
(19, 39, 8, 122000, 976000),
(19, 1, 7, 198000, 1386000),
(20, 24, 9, 124000, 1116000),
(20, 13, 6, 195000, 1170000),
(20, 8, 3, 96000, 288000),
(20, 39, 2, 122000, 244000);

INSERT INTO NGUYENLIEU_MONAN (MaMonAn, MaNguyenLieu, SoLuong) VALUES
(8, 2, 2),
(10, 11, 2),
(9, 15, 2),
(1, 11, 1),
(4, 15, 2),
(1, 15, 1),
(3, 22, 1),
(8, 24, 2),
(9, 20, 1),
(3, 40, 1),
(5, 3, 1),
(5, 39, 1),
(5, 22, 1),
(1, 8, 1),
(7, 23, 2),
(7, 25, 1),
(7, 28, 1),
(10, 24, 2),
(9, 6, 2),
(6, 4, 2),
(6, 39, 1),
(2, 36, 1),
(1, 21, 1),
(4, 7, 1),
(4, 11, 1),
(3, 35, 1),
(9, 16, 2),
(10, 30, 1),
(1, 5, 1),
(12, 22, 1),
(14, 30, 1),
(16, 27, 2),
(18, 11, 1),
(20, 13, 2),
(21, 1, 3),
(23, 2, 2),
(25, 4, 1),
(26, 37, 1),
(28, 38, 1);
INSERT INTO HOADON (MaNhanVienLap, NgayLapHoaDon, TongTienTruocGiam, SoTienGiam, TongTienPhaiTra, TrangThai, MaKhuyenMai, MaKhachHang) VALUES
(3, '2020-07-20', 355000, 0, 355000, N'Đã thanh toán', NULL, 3),
(7, '2021-04-11', 517000, 0, 517000, N'Chưa thanh toán', NULL, 1),
(4, '2022-01-05', 159000, 0, 159000, N'Chưa thanh toán', NULL, 4),
(4, '2023-03-05', 150000, 0, 150000, N'Đã thanh toán', NULL, 6),
(6, '2024-05-09', 103000, 0, 103000, N'Đã thanh toán', NULL, 5),
(5, '2020-09-09', 217000, 0, 217000, N'Đã thanh toán', NULL, 7),
(6, '2021-02-03', 239000, 0, 239000, N'Đã thanh toán', NULL, 9),
(7, '2022-06-09', 238000, 35700, 202300, N'Chưa thanh toán', 6, 6),
(3, '2023-08-10', 138000, 0, 138000, N'Đã thanh toán', NULL, 10),
(4, '2024-01-05', 369000, 0, 369000, N'Đã thanh toán', NULL, 11),
(6, '2025-03-15', 180000, 0, 180000, N'Chưa thanh toán', NULL, 12),
(5, '2020-10-01', 5124000, 0, 5124000, N'Chưa thanh toán', NULL, 1),
(7, '2021-07-05', 240000, 0, 240000, N'Đã thanh toán', NULL, 1),
(5, '2020-08-20', 147000, 14700, 132300, N'Đã thanh toán', 1, 2),
(3, '2021-01-10', 2109000, 0, 2109000, N'Chưa thanh toán', NULL, 3),
(4, '2022-03-05', 1849000, 184900, 1664100, N'Đã thanh toán', 5, 4),
(7, '2023-07-25', 2316000, 0, 2316000, N'Đã thanh toán', NULL, 1),
(3, '2024-02-14', 1880000, 282000, 1598000, N'Đã thanh toán', 10, 5),
(5, '2020-11-01', 3568000, 0, 3568000, N'Chưa thanh toán', NULL, 6),
(7, '2021-09-19', 7480000, 0, 7480000, N'Đã thanh toán', NULL, 7),
(3, '2022-12-08', 9794000, 0, 9794000, N'Chưa thanh toán', NULL, 8),
(6, '2023-04-03', 8870000, 1330500, 7539500, N'Đã thanh toán', 2, 9),
(7, '2024-11-29', 11900000, 0, 11900000, N'Đã thanh toán', NULL, 10),
(4, '2020-09-01', 12200000, 2440000, 9760000, N'Đã thanh toán', 3, 11),
(3, '2021-06-15', 13600000, 0, 13600000, N'Chưa thanh toán', NULL, 12),
(5, '2022-01-20', 142000, 35500, 106500, N'Đã thanh toán', 7, 1),
(4, '2023-09-10', 96000, 0, 96000, N'Đã thanh toán', NULL, 2),
(7, '2024-07-02', 2100000, 0, 2100000, N'Chưa thanh toán', NULL, 3),
(4, '2025-01-05', 125000, 0, 125000, N'Đã thanh toán', NULL, 4),
(5, '2025-05-20', 97000, 9700, 87300, N'Đã thanh toán', 9, 5),
(3, '2020-06-25', 106000, 10600, 95400, N'Đã thanh toán', 1, 15),
(4, '2021-08-12', 103000, 0, 103000, N'Chưa thanh toán', NULL, 18),
(5, '2022-04-30', 41000, 4100, 36900, N'Đã thanh toán', 5, 21),
(6, '2023-01-18', 68000, 0, 68000, N'Chưa thanh toán', NULL, 24),
(7, '2024-03-08', 216000, 32400, 183600, N'Đã thanh toán', 10, 26),
(3, '2020-10-15', 2248000, 0, 2248000, N'Đã thanh toán', NULL, 17),
(4, '2021-11-22', 1792000, 0, 1792000, N'Chưa thanh toán', NULL, 19),
(5, '2022-09-01', 2080000, 0, 2080000, N'Đã thanh toán', NULL, 22),
(6, '2023-05-11', 2294000, 0, 2294000, N'Đã thanh toán', NULL, 25),
(7, '2024-06-10', 3400000, 0, 3400000, N'Chưa thanh toán', NULL, 20);

INSERT INTO DANHGIA (MaKhachHang, MaMonAn, NoiDungDanhGia, ThoiGianDanhGia, DiemDanhGia) VALUES
(1, 3, N'Ngon xuất sắc!', '2025-04-06', 5),
(4, 4, N'Hơi mặn nhưng ổn.', '2025-04-07', 2),
(4, 9, N'Bình thường, không có gì đặc biệt.', '2025-04-01', 3),
(1, 10, N'Bình thường, không có gì đặc biệt.', '2025-04-08', 1),
(4, 2, N'Trình bày đẹp, món ngon.', '2025-04-10', 2),
(4, 5, N'Rất hài lòng với món này!', '2025-04-14', 5),
(4, 3, N'Không hợp khẩu vị lắm.', '2025-04-07', 1),
(1, 9, N'Rất hài lòng với món này!', '2025-04-13', 4),
(3, 1, N'Hơi mặn nhưng ổn.', '2025-04-01', 2),
(5, 4, N'Rất đáng tiền, sẽ quay lại.', '2025-04-06', 5),
(6, 15, N'Món này tuyệt vời ông mặt trời!', '2024-11-20', 5),
(7, 20, N'Giá hơi cao so với chất lượng.', '2023-08-01', 3),
(8, 25, N'Chắc chắn sẽ gọi lại lần nữa!', '2022-05-10', 5),
(9, 30, N'Không tệ, nhưng chưa xuất sắc.', '2021-03-15', 4),
(10, 35, N'Món ăn kém chất lượng, không như mong đợi.', '2020-09-22', 1),
(11, 28, N'Tuyệt hảo, xứng đáng 5 sao.', '2025-01-01', 5),
(12, 32, N'Vị lạ, khá cuốn hút.', '2024-06-05', 4),
(13, 1, N'Hết món nên chưa thử được, tiếc quá!', '2023-01-20', 2),
(14, 7, N'Đồ uống rất tươi mát.', '2022-10-10', 5),
(15, 12, N'Chất lượng món ăn giảm sút.', '2021-04-03', 2);

INSERT INTO CHITIETDATBAN (MaKhachHang, MaBan, SoLuongBan) VALUES
(1, 1, 2),
(2, 2, 3),
(5, 5, 4),
(7, 7, 1),
(8, 8, 1),
(10, 10, 3),
(11, 11, 3),
(14, 14, 1),
(16, 1, 2),
(21, 1, 1),
(22, 2, 4),
(25, 5, 2),
(1, 7, 1),
(2, 8, 1),
(4, 10, 4),
(5, 11, 2),
(6, 14, 1),
(11, 1, 3),
(12, 2, 2),
(13, 5, 1),
(14, 7, 1),
(15, 8, 1);

INSERT INTO NHANVIEN_CALAMVIEC (NgayLam, MaNhanVien, MaCa) VALUES
('2020-07-01', 3, 1),
('2020-07-01', 4, 4),
('2020-08-15', 8, 6),
('2020-09-20', 7, 3),
('2020-10-05', 10, 2),
('2020-11-10', 15, 4),
('2020-12-25', 11, 5),
('2021-01-30', 20, 2),
('2021-02-14', 23, 1),
('2021-03-22', 4, 2),
('2021-03-22', 5, 3),
('2021-04-07', 6, 1),
('2021-05-18', 21, 6),
('2021-06-03', 19, 3),
('2021-07-11', 11, 3),
('2021-08-28', 10, 6),
('2021-09-02', 15, 5),
('2021-10-17', 4, 1),
('2021-11-09', 12, 6),
('2021-12-24', 20, 4),
('2022-01-08', 25, 1),
('2022-02-23', 23, 3),
('2022-03-10', 17, 3),
('2022-04-26', 21, 2),
('2022-05-01', 25, 2),
('2022-06-16', 3, 5),
('2022-07-29', 14, 4),
('2022-08-04', 4, 6),
('2022-09-19', 3, 2),
('2022-10-11', 8, 4),
('2022-11-27', 20, 3),
('2022-12-05', 5, 6),
('2023-01-20', 18, 2),
('2023-02-08', 24, 1),
('2023-03-03', 22, 6),
('2023-04-18', 21, 5),
('2023-05-07', 22, 4),
('2023-06-22', 23, 4),
('2023-07-04', 9, 5),
('2023-08-19', 13, 4),
('2023-09-02', 16, 6),
('2023-10-10', 15, 2),
('2023-11-25', 10, 1),
('2024-01-05', 8, 5),
('2024-02-14', 11, 4),
('2024-03-29', 12, 5),
('2024-04-10', 13, 2),
('2024-05-20', 14, 1),
('2024-06-07', 16, 3),
('2024-07-19', 17, 4),
('2024-08-30', 18, 6),
('2024-09-11', 19, 5),
('2024-11-01', 21, 1),
('2024-12-15', 22, 3),
('2025-01-03', 23, 5),
('2025-02-10', 24, 6),
('2025-03-22', 25, 5),
('2025-04-15', 3, 3),
('2025-04-15', 5, 2),
('2025-05-05', 6, 4),
('2025-06-10', 5, 1),
('2025-06-10', 7, 2);

INSERT INTO CHITIETHOADON (MaHoaDon, MaMonAn, SoLuong) VALUES
(1, 4, 4),
(2, 4, 2),
(2, 7, 5),
(2, 2, 3),
(3, 6, 3),
(4, 7, 2),
(8, 5, 1),
(8, 2, 2),
(10, 1, 2),
(10, 4, 4),
(11, 5, 1),
(11, 3, 3),
(13, 6, 3),
(13, 3, 3),
(14, 2, 2),
(15, 4, 3),
(16, 1, 1),
(17, 6, 4),
(18, 5, 2),
(19, 3, 3),
(1, 15, 1),
(3, 11, 2),
(4, 14, 1),
(5, 12, 2),
(5, 16, 1),
(6, 17, 1),
(6, 20, 2),
(7, 18, 1),
(7, 19, 1),
(8, 8, 3),
(9, 9, 2),
(9, 10, 1),
(12, 21, 1),
(12, 26, 1),
(14, 15, 2),
(15, 22, 1),
(16, 23, 1),
(17, 24, 1),
(18, 25, 1),
(19, 27, 1),
(20, 28, 1),
(20, 30, 1),
(21, 29, 1),
(21, 31, 1),
(22, 32, 1),
(22, 33, 1),
(23, 34, 1),
(23, 35, 1),
(24, 36, 1),
(24, 37, 1),
(25, 38, 1),
(25, 39, 1),
(26, 40, 1),
(27, 1, 1),
(27, 2, 1),
(28, 3, 1),
(28, 4, 1),
(29, 5, 1),
(29, 6, 1),
(30, 7, 1),
(30, 8, 1),
(31, 9, 1),
(31, 10, 1),
(32, 11, 1),
(32, 12, 1),
(33, 13, 1),
(33, 14, 1),
(34, 15, 1),
(34, 16, 1),
(35, 17, 1),
(35, 18, 1),
(36, 19, 1),
(36, 20, 1),
(37, 21, 1),
(37, 22, 1),
(38, 23, 1),
(38, 24, 1),
(39, 25, 1),
(39, 26, 1),
(40, 27, 1),
(40, 28, 1);
--======================================================READ=====================================================

-- DANH SÁCH TẤT CẢ BẢNG - select TOÀN BỘ DỮ LIỆU
select * from KHACHHANG
select * from MONAN
select * from NHOMMONAN
select * from NHANVIEN
select * from BAN
select * from CHITIETDATBAN
select * from DANHGIA
select * from CALAMVIEC
select * from NHANVIEN_CALAMVIEC
select * from KHUYENMAI
select * from HOADON
select * from CHITIETHOADON
select * from PHIEUNHAPHANG
select * from CHITIETNHAPHANG
select * from NGUYENLIEU
select * from NGUYENLIEU_MONAN
select * from PHIEUTHONGKE﻿
select * from TAIKHOAN
--Kiểm tra tốc độ truy vấn
--Kiểm tra thời gian
set statistics time on
set statistics time off

--Kiểm tra tài nguyên
set statistics io on
set statistics io off


--======================================================THỦ TỤC (STORED PROCEDURES)=====================================================

go
create proc sp_ThemMoiMotBan(@LoaiBan nvarchar(50),@SoLuongCho int, @soLuongCon int, @TrangThai nvarchar(50))
as
begin
	declare @chk int
	set @chk = (select count(*) from BAN where LoaiBan = @LoaiBan and SoLuongCho = @SoLuongCho)
	if(@chk > 0)
		raiserror(N'Loại bàn đã tồn tại',16,1)
	else
		insert into BAN (LoaiBan, SoLuongCho, SoLuongCon, TrangThai) values (@LoaiBan,@SoLuongCho,@soLuongCon,@TrangThai)
end
go
create proc sp_XoaMotBan(@MaBan int)
as
begin
	if exists (select * from CHITIETDATBAN where MaBan = @MaBan)
		raiserror(N'Bàn đang được sử dụng không thể xoá',16,1)
	else
		delete BAN where MaBan = @MaBan
end

go
create proc sp_SuaMotBan(@LoaiBan nvarchar(50),@SoLuongCho int, @soLuongCon int, @TrangThai nvarchar(50), @MaBan int)
as
begin
	if not exists (select *from BAN where MaBan = @MaBan)
		raiserror(N'Mã bàn không tồn tại',16,1)
	else
		update BAN set LoaiBan = @LoaiBan, SoLuongCho = @SoLuongCho, SoLuongCon = @soLuongCon, TrangThai = @TrangThai where MaBan = @MaBan 
end
go
create proc sp_ThemChiTietBan(@maKH int, @maBan int, @soLuongBan int)
as
begin
	declare @soLuongCon int, @chk int
	set @chk = (select count(*) from CHITIETDATBAN where MaKhachHang = @maKH and MaBan = @maBan)
	set @soLuongCon = (select SoLuongCon from BAN where MaBan = @maBan)
	if(@chk > 0)
		raiserror(N'Khách hàng này đã đặt loại bàn này rồi!', 16, 1)
	else if(@soLuongCon < @soLuongBan)
		raiserror(N'Số lượng bàn đặt (%d) vượt quá số lượng còn lại (%d)!', 16, 1, @soLuongBan, @soLuongCon)
	else
		insert into CHITIETDATBAN (MaKhachHang, MaBan, SoLuongBan) values (@maKH, @maBan, @soLuongBan)
end
go
create proc sp_XoaChiTietBan(@maKH int, @maBan int) 
as
begin
	delete from CHITIETDATBAN where MaKhachHang = @maKH AND MaBan = @maBan
end

go
create proc sp_ThemCaLamViec(@GioBD time, @GioKT time)
as
begin
	declare @chk int
	set @chk = (select count(*) from CALAMVIEC where GioBatDau = @GioBD and GioKetThuc = @GioKT)
	if(@chk > 0)
		raiserror(N'Ca làm việc đã tồn tại', 16, 1)
	else 
		insert into CALAMVIEC (GioBatDau, GioKetThuc) VALUES (@GioBD, @GioKT)
end
go
create proc sp_SuaCaLamViec(@GioBD time, @GioKT time, @maCa int)
as
begin
	update CALAMVIEC set GioBatDau = @GioBD, GioKetThuc = @GioKT where MaCa = @maCa
end
go
create proc sp_XoaCaLamViec(@maCa int)
as
begin
	if(exists(select * from NHANVIEN_CALAMVIEC where MaCa = @maCa))
		raiserror(N'Không thể xóa! Ca này đã được phân công cho nhân viên.', 16, 1)
	else
		delete from CALAMVIEC where MaCa = @maCa
end
go
create proc sp_ThemChiTietCa(@ngayLam date, @maNV int, @maCa int)
as
begin
	
	if exists(select * from NHANVIEN_CALAMVIEC where MaNhanVien = @maNV and MaCa = @maCa)
		raiserror(N'Nhân viên này đã được phân công ca này!',16,1)
	else
		insert into NHANVIEN_CALAMVIEC (NgayLam, MaNhanVien, MaCa) values (@ngayLam, @maNV, @maCa)
end
go
create proc sp_XoaChiTietCa(@ngayLam date, @maNV int, @maCa int)
as
begin
	delete from NHANVIEN_CALAMVIEC where NgayLam = @ngayLam AND MaNhanVien = @maNV AND MaCa = @maCa
end

go
create proc sp_ThemKhachHang(@TenKhachHang nvarchar(50), @SoDienThoai char(10), @DiaChi nvarchar(50))
as
begin
    if exists (select * from KHACHHANG where SoDienThoai = @SoDienThoai)
        raiserror(N'Số điện thoại đã tồn tại.', 16, 1)
    else
        insert into KHACHHANG (TenKhachHang, SoDienThoai, DiaChi) values (@TenKhachHang, @SoDienThoai, @DiaChi)
end
go
go
create proc sp_SuaKhachHang(@TenKhachHang nvarchar(50), @SoDienThoai char(10), @DiaChi nvarchar(50), @MaKhachHang int)
as
begin
    if exists (select * from KHACHHANG where SoDienThoai = @SoDienThoai and MaKhachHang != @MaKhachHang)
        raiserror(N'Số điện thoại đã tồn tại ở một khách hàng khác.', 16, 1)
    else
        update KHACHHANG set TenKhachHang = @TenKhachHang, SoDienThoai = @SoDienThoai, DiaChi = @DiaChi where MaKhachHang = @MaKhachHang
end
go
create proc sp_XoaKhachHang(@MaKhachHang int)
as
begin
    if exists(select * from HOADON where MaKhachHang = @MaKhachHang)
        raiserror(N'Không thể xóa khách hàng này vì có dữ liệu liên quan trong bảng hoá đơn.', 16, 1)
    else if exists(select * from DANHGIA where MaKhachHang = @MaKhachHang)
		raiserror(N'Không thể xóa khách hàng này vì có dữ liệu liên quan trong bảng đánh giá.', 16, 1)
	else if exists(select * from CHITIETDATBAN where MaKhachHang = @MaKhachHang)
		raiserror(N'Không thể xóa khách hàng này vì có dữ liệu liên quan trong bảng chi tiết đặt bàn.', 16, 1)
	else
        delete from KHACHHANG where MaKhachHang = @MaKhachHang
end
go
-- Thêm hóa đơn mới.
create proc sp_ThemHoaDon(@MaNhanVienLap int, @NgayLapHoaDon datetime, @MaKhuyenMai int, @MaKhachHang int)
as
begin
    insert into HOADON (MaNhanVienLap, NgayLapHoaDon, TongTienTruocGiam, SoTienGiam, TongTienPhaiTra, TrangThai, MaKhuyenMai, MaKhachHang)
    values (@MaNhanVienLap, @NgayLapHoaDon, 0, 0, 0, N'Chưa thanh toán', @MaKhuyenMai, @MaKhachHang)
end
go
-- Thêm chi tiết hóa đơn.
create proc sp_ThemChiTietHoaDon(@MaHoaDon int, @MaMonAn int, @SoLuong int)
as
begin
	declare @chk int
	set @chk = (select COUNT(*) from CHITIETHOADON where MaHoaDon = @MaHoaDon and MaMonAn = @MaMonAn)
	if(@chk > 0)
		raiserror(N'Món ăn đã tồn tại trong hoá đơn', 16, 1)
	else
		insert into CHITIETHOADON (MaHoaDon, MaMonAn, SoLuong) values (@MaHoaDon, @MaMonAn, @SoLuong)
end
go
-- Xóa chi tiết hóa đơn.
create proc sp_XoaChiTietHoaDon(@MaHoaDon int, @MaMonAn int)
as
begin
    delete from CHITIETHOADON where MaHoaDon = @MaHoaDon and MaMonAn = @MaMonAn
end
go
-- Cập nhật trạng thái thanh toán của hóa đơn.
create proc sp_ThanhToanHoaDon(@MaHoaDon int)
as
begin
    update HOADON set TrangThai = N'Đã thanh toán' where MaHoaDon = @MaHoaDon
end
go
-- Thêm chương trình khuyến mãi.
create proc sp_ThemKhuyenMai(@TenKhuyenMai nvarchar(30), @PhanTramGiamGia int, @MoTa nvarchar(50))
as
begin
    insert into KHUYENMAI(TenKhuyenMai, PhanTramGiamGia, MoTa) values (@TenKhuyenMai, @PhanTramGiamGia, @MoTa)
end
go
-- Sửa chương trình khuyến mãi.
create proc sp_SuaKhuyenMai(@TenKhuyenMai nvarchar(30), @PhanTramGiamGia int, @MoTa nvarchar(50), @MaKhuyenMai int)
as
begin
    update KHUYENMAI set TenKhuyenMai = @TenKhuyenMai, PhanTramGiamGia = @PhanTramGiamGia, MoTa = @MoTa where MaKhuyenMai = @MaKhuyenMai
end
go
create proc sp_XoaKhuyenMai(@MaKhuyenMai int)
as
begin
    if exists (select * from HOADON where MaKhuyenMai = @MaKhuyenMai)
        raiserror(N'Không thể xóa khuyến mãi này vì đang được áp dụng cho hóa đơn.', 16, 1)
    else
        delete from KHUYENMAI where MaKhuyenMai = @MaKhuyenMai
end
go
create proc sp_ThemNhomMonAn(@TenNhom nvarchar(50))
as
begin
    insert into NHOMMONAN(TenNhom) values (@TenNhom)
end
go
create proc sp_SuaNhomMonAn(@MaNhom int, @TenNhom nvarchar(50))
as
begin
    update NHOMMONAN set TenNhom = @TenNhom where MaNhom = @MaNhom
end
go
create proc sp_XoaNhomMonAn(@MaNhom int)
as
begin
    if exists (select * from MONAN where MaNhom = @MaNhom)
        raiserror(N'Không thể xóa nhóm này vì còn món ăn thuộc nhóm.', 16, 1)
    else
        delete from NHOMMONAN where MaNhom = @MaNhom
end
go
-- Thêm món ăn mới.
create proc sp_ThemMonAn(@TenMon nvarchar(50), @DonViTinh nvarchar(50), @DonGia money, @TrangThai nvarchar(50), @MaNhom int)
as
begin
    insert into MONAN(TenMon, DonViTinh, DonGia, TrangThai, MaNhom) values (@TenMon, @DonViTinh, @DonGia, @TrangThai, @MaNhom)
end
go
-- Sửa thông tin món ăn.
create proc sp_SuaMonAn(@MaMonAn int, @TenMon nvarchar(50), @DonViTinh nvarchar(50), @DonGia money, @TrangThai nvarchar(50), @MaNhom int)
as
begin
    update MONAN set TenMon = @TenMon, DonViTinh = @DonViTinh, DonGia = @DonGia, TrangThai = @TrangThai, MaNhom = @MaNhom where MaMonAn = @MaMonAn
end
go
-- Xóa món ăn.
create proc sp_XoaMonAn(@MaMonAn int)
as
begin
	if(exists(select * from CHITIETHOADON where MaMonAn = @MaMonAn))
		raiserror(N'Không thể xóa! Món ăn này đã tồn tại trong các hóa đơn.', 16, 1)
    else
		begin
			delete from DANHGIA where MaMonAn = @MaMonAn
			delete from NGUYENLIEU_MONAN where MaMonAn = @MaMonAn
			delete from MONAN where MaMonAn = @MaMonAn
		end
end
go
-- Thêm phiếu nhập hàng.
create proc sp_ThemPhieuNhapHang(@NgayTao date, @NhaCungCap nvarchar(50), @MaNhanVienNhap int)
as
begin
    insert into PHIEUNHAPHANG(NgayTao, NhaCungCap, MaNhanVienNhap) values (@NgayTao, @NhaCungCap, @MaNhanVienNhap)
end
go
go
-- Thêm chi tiết phiếu nhập hàng.
create proc sp_ThemChiTietNhapHang(@MaPhieuNhap int, @MaNguyenLieu int, @SoLuongNhap int, @DonGia money)
as
begin
	if exists(select * from CHITIETNHAPHANG where MaPhieuNhap = @MaPhieuNhap and MaNguyenLieu = @MaNguyenLieu)
		raiserror(N'Nguyên liệu này đã tồn tại trong phiếu nhập!', 16, 1)
    else
		begin
			declare @ThanhTien money
			set @ThanhTien = @SoLuongNhap * @DonGia
			insert into CHITIETNHAPHANG(MaPhieuNhap, MaNguyenLieu, SoLuongNhap, DonGia, ThanhTien) values (@MaPhieuNhap, @MaNguyenLieu, @SoLuongNhap, @DonGia, @ThanhTien)
		end
end
go
-- Thêm nguyên liệu mới.
create proc sp_ThemNguyenLieu(@TenNguyenLieu nvarchar(50), @Loai nvarchar(30), @NgaySanXuat date, @HanSuDung date, @GiaBan money, @DonViTinh nvarchar(30), @SoLuongTon int)
as
begin
    insert into NGUYENLIEU(TenNguyenLieu, Loai, NgaySanXuat, HanSuDung, GiaBan, DonViTinh, SoLuongTon) values (@TenNguyenLieu, @Loai, @NgaySanXuat, @HanSuDung, @GiaBan, @DonViTinh, @SoLuongTon)
end
go
-- Sửa thông tin nguyên liệu.
create proc sp_SuaNguyenLieu(@TenNguyenLieu nvarchar(50), @Loai nvarchar(30), @NgaySanXuat date, @HanSuDung date, @GiaBan money, @DonViTinh nvarchar(30), @SoLuongTon int, @MaNguyenLieu int)
as
begin
    update NGUYENLIEU set TenNguyenLieu = @TenNguyenLieu, Loai = @Loai, NgaySanXuat = @NgaySanXuat, HanSuDung = @HanSuDung, GiaBan = @GiaBan, DonViTinh = @DonViTinh, SoLuongTon = @SoLuongTon where MaNguyenLieu = @MaNguyenLieu
end
go
-- Xóa nguyên liệu.
create proc sp_XoaNguyenLieu(@MaNguyenLieu int)
as
begin
    if exists (select * from NGUYENLIEU_MONAN where MaNguyenLieu = @MaNguyenLieu) or exists (select 1 from CHITIETNHAPHANG where MaNguyenLieu = @MaNguyenLieu)
        raiserror(N'Không thể xóa nguyên liệu này vì có dữ liệu liên quan.', 16, 1)
    else
        delete from NGUYENLIEU where MaNguyenLieu = @MaNguyenLieu
end
go
-- Thêm nhân viên mới.
create proc sp_ThemNhanVien(@HoTen nvarchar(50), @NgaySinh date, @GioiTinh nchar(5), @SoDienThoai char(10), @DiaChi ntext, @ChucVu nvarchar(50), @MaQuanLy int, @LuongCoBan money)
as
begin
    if exists (select * from NHANVIEN where SoDienThoai = @SoDienThoai)
        raiserror(N'Số điện thoại đã tồn tại.', 16, 1)
    else
        insert into NHANVIEN (HoTen, NgaySinh, GioiTinh, SoDienThoai, DiaChi, ChucVu, MaQuanLy, LuongCoBan) values (@HoTen, @NgaySinh, @GioiTinh, @SoDienThoai, @DiaChi, @ChucVu, @MaQuanLy, @LuongCoBan)
end
go
-- Sửa thông tin nhân viên.
create proc sp_SuaNhanVien(@HoTen nvarchar(50), @NgaySinh date, @GioiTinh nchar(5), @SoDienThoai char(10), @DiaChi ntext, @ChucVu nvarchar(50), @MaQuanLy int, @LuongCoBan money, @MaNhanVien int)
as
begin
    if not exists (select * from NHANVIEN where MaNhanVien = @MaNhanVien)
        raiserror(N'Mã nhân viên không tồn tại.', 16, 1)
    else if exists (select * from NHANVIEN where SoDienThoai = @SoDienThoai and MaNhanVien != @MaNhanVien)
        raiserror(N'Số điện thoại đã tồn tại ở một nhân viên khác.', 16, 1)
    else
        update NHANVIEN set HoTen = @HoTen, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh, SoDienThoai = @SoDienThoai, DiaChi = @DiaChi, ChucVu = @ChucVu, MaQuanLy = @MaQuanLy, LuongCoBan = @LuongCoBan where MaNhanVien = @MaNhanVien
end
go
-- Xóa nhân viên.
create proc sp_XoaNhanVien(@MaNhanVien int)
as
begin
	if exists(select * from HOADON where MaNhanVienLap = @MaNhanVien)
		raiserror(N'Không thể xóa nhân viên này vì đã có lịch sử lập hóa đơn.',16, 1)
	else if exists(select * from PHIEUNHAPHANG where MaNhanVienNhap = @MaNhanVien)
		raiserror(N'Không thể xóa nhân viên này vì đã có lịch sử nhập hàng.',16, 1)
	else if exists(select * from PHIEUTHONGKE where MaNhanVien = @MaNhanVien)
		raiserror(N'Không thể xóa nhân viên này vì đã có lịch sử thống kê.',16, 1)
    else
    begin
        update NHANVIEN set MaQuanLy = NULL where MaQuanLy = @MaNhanVien
        delete from TAIKHOAN where MaNhanVien = @MaNhanVien
        delete from NHANVIEN_CALAMVIEC where MaNhanVien = @MaNhanVien
        delete from NHANVIEN where MaNhanVien = @MaNhanVien
    end
end
go
-- Thêm tài khoản mới.
create proc sp_ThemTaiKhoan(@TenDangNhap nchar(20), @MatKhau nchar(20), @TrangThai nvarchar(50), @LoaiTaiKhoan nvarchar(50), @MaNhanVien int)
as
begin
    if exists (select * from TAIKHOAN where TenDangNhap = @TenDangNhap)
        raiserror(N'Tên đăng nhập đã tồn tại.', 16, 1)
    else if exists (select * from TAIKHOAN where MaNhanVien = @MaNhanVien)
        raiserror(N'Nhân viên này đã có tài khoản.', 16, 1)
    else
        insert into TAIKHOAN(TenDangNhap, MatKhau, NgayTao, TrangThai, LoaiTaiKhoan, MaNhanVien) values (@TenDangNhap, @MatKhau, GETDATE(), @TrangThai, @LoaiTaiKhoan, @MaNhanVien)
end
go
-- Sửa thông tin tài khoản.
create proc sp_SuaTaiKhoan(@TenDangNhap nchar(20), @MatKhau nchar(20), @TrangThai nvarchar(50), @LoaiTaiKhoan nvarchar(50), @MaNhanVien int, @MaTaiKhoan int)
as
begin
    if exists (select * from TAIKHOAN where TenDangNhap = @TenDangNhap and MaTaiKhoan != @MaTaiKhoan)
        raiserror(N'Tên đăng nhập đã tồn tại.', 16, 1)
    else
        update TAIKHOAN set TenDangNhap = @TenDangNhap, MatKhau = @MatKhau, TrangThai = @TrangThai, LoaiTaiKhoan = @LoaiTaiKhoan, MaNhanVien = @MaNhanVien where MaTaiKhoan = @MaTaiKhoan
end
go
-- Xóa tài khoản.
go
create proc sp_XoaTaiKhoan(@MaTaiKhoan int)
as
begin
    delete from TAIKHOAN where MaTaiKhoan = @MaTaiKhoan
end
go
--======================================================TRIGGER=====================================================
--Trigger update hoá đơn khi thêm vào chi tiết hoá đơn
go
create trigger trg_CapNhatTongTienHoaDon
on CHITIETHOADON
after insert, update, delete
as
begin
	declare @dsMaHoaDon table (MaHoaDon int)

	insert into @dsMaHoaDon(MaHoaDon)
	select MaHoaDon from inserted
	union
	select MaHoaDon from deleted

	update HOADON
	set 
		TongTienTruocGiam = isnull((select sum(ct.SoLuong * m.DonGia)
			from CHITIETHOADON ct
			join MONAN m on ct.MaMonAn = m.MaMonAn
			where ct.MaHoaDon = HOADON.MaHoaDon), 0),
		SoTienGiam = isnull((select sum(ct.SoLuong * m.DonGia)
			from CHITIETHOADON ct
			join MONAN m on ct.MaMonAn = m.MaMonAn
			where ct.MaHoaDon = HOADON.MaHoaDon), 0) * isnull((
			select km.PhanTramGiamGia
			from KHUYENMAI km
			where km.MaKhuyenMai = HOADON.MaKhuyenMai), 0) / 100.0
	where MaHoaDon in (select MaHoaDon from @dsMaHoaDon)
	update HOADON
    set TongTienPhaiTra = TongTienTruocGiam - SoTienGiam
    where MaHoaDon IN (select MaHoaDon from @dsMaHoaDon);
end
go
-- Trigger thêm một chi tiết đặt bàn từ khách hàng
go
create trigger trg_ThemChiTietDatBan
on CHITIETDATBAN
for insert
as
begin
	declare @MaBan int
	set @MaBan = (select MaBan from inserted)
	if not exists (select *from BAN where MaBan = @MaBan)
		begin
			raiserror(N'Không tồn tại bàn đó',16,1)
			rollback transaction
		end
	else
		declare @SoLuong int
		set @SoLuong = (select SoLuongBan from inserted)
		declare @SoLuongCon int
		set @SoLuongCon = (select SoLuongCon from BAN where MaBan = @MaBan)
		if(@SoLuong > @SoLuongCon)
			begin
				raiserror(N'Không đủ bàn để đặt',16,1)
				rollback transaction
			end

		else if(@SoLuong - @SoLuongCon = 0)
			update BAN set SoLuongCon = 0, TrangThai = N'Hết Bàn' where MaBan = @MaBan
		else
			update BAN set SoLuongCon = SoLuongCon - @SoLuong where MaBan = @MaBan
end
go
--> Trigger Xóa một chi tiết đặt bàn
go
create trigger trg_XoaChiTietDatBan
on CHITIETDATBAN
for delete
as
begin
	declare @MaBan int
	set @MaBan = (select MaBan from deleted)
	declare @SoLuong int
	set @SoLuong = (select SoLuongBan from deleted)
	declare @SoLuongCon int
	set @SoLuongCon = (select SoLuongCon from BAN where MaBan = @MaBan)
	if(@SoLuongCon = 0)
		update BAN set SoLuongCon = @SoLuong, TrangThai = N'Còn Bàn' where MaBan = @MaBan
	else
		update BAN set SoLuongCon = SoLuongCon + @SoLuong,TrangThai = N'Còn Bàn'  where MaBan = @MaBan
end
go
--Trigger cập nhật lại số lượng bàn trong bảng chi tiết đặt bàn
go
create trigger trg_CapNhatSoLuongBan
on CHITIETDATBAN
for update
as 
begin
	declare @MaBan int
	set @MaBan = (select MaBan from inserted)
	declare @SoLuongCu int
	declare @SoLuongMoi int
	declare @SoLuongCon int
	set @SoLuongCu = (select SoLuongBan from deleted)
	set @SoLuongMoi = (select SoLuongBan from inserted)
	set @SoLuongCon = (select SoLuongCon from BAN where MaBan = @MaBan)
	if (@SoLuongCon < @SoLuongMoi - @SoLuongCu)
		begin
			raiserror(N'Số lượng không đủ để cập nhật',16,1)
			rollback transaction
		end
	else if (@SoLuongCon - (@SoLuongMoi - @SoLuongCu) = 0)
		update BAN set SoLuongCon = 0, TrangThai = N'Hết Bàn' where MaBan = @MaBan
	else
		update BAN set SoLuongCon = SoLuongCon - (@SoLuongMoi - @SoLuongCu), TrangThai = N'Còn Bàn' where MaBan = @MaBan
end
go
-- Trigger ngăn chặn việc xóa một bàn khi đang nằm trong bảng CHITIETHOADON
go
create trigger trg_NganChanViecXoa
on BAN
for delete
as
begin
	declare @MaBan int
	set @MaBan = (select MaBan from deleted)
	if exists (select *from CHITIETDATBAN where MaBan = @MaBan)
		begin
			raiserror(N'Bàn đang được sử dụng',16,1)
			rollback transaction
		end
end
go
--Trigger cập nhật số lượng tồn khi nhập hàng
create trigger trg_CapNhatSoLuongTonKhiNhapHang
on CHITIETNHAPHANG
for insert
as
begin
	declare @MaNguyenLieu int
	declare @SoLuongNhap float
	
	select @MaNguyenLieu = MaNguyenLieu, @SoLuongNhap = SoLuongNhap from inserted
	
	update NGUYENLIEU
	set SoLuongTon = SoLuongTon + @SoLuongNhap
	where MaNguyenLieu = @MaNguyenLieu
end

go
--Trigger trừ số lượng tồn khi xoá nhập hàng
create trigger trg_TruSoLuongTonKhiXoaNhapHang
on CHITIETNHAPHANG
for delete
as
begin
	declare @MaNguyenLieu int
	declare @SoLuongNhap float
	
	select @MaNguyenLieu = MaNguyenLieu, @SoLuongNhap = SoLuongNhap from deleted
	
	update NGUYENLIEU
	set SoLuongTon = SoLuongTon - @SoLuongNhap
	where MaNguyenLieu = @MaNguyenLieu
end

--======================================================HÀM (FUNCTION)=====================================================
--Hàm thống kê doanh thu, thu và chi theo từng ngày với Ngày bắt đầu thống kê và Ngày kết thúc thống kê nhập từ bàn phím
go
create function fn_ThongKeDoanhThuTheoNgay(@NgayBatDau date,@NgayKetThuc date)
returns @tabletkngay table(
	ThoiGian date,
	DoanhThu money,
	Thu money,
	Chi money
)
as
begin
	insert into @tabletkngay 
		select NgayThongKe, sum(DoanhThu), sum(Thu), SUM(Chi)
		from PHIEUTHONGKE where NgayThongKe between @NgayBatDau and @NgayKetThuc
		group by NgayThongKe order by NgayThongKe
	return
end
go

--Hàm thống kê doanh thu, thu và chi theo từng tháng với Ngày bắt đầu thống kê và Ngày kết thúc thống kê nhập từ bàn phím
go
create function fn_ThongKeDoanhThuTheoThang(@NgayBatDau date,@NgayKetThuc date)
returns @tabletkthang table(
	ThoiGian nvarchar(7),
	DoanhThu money,
	Thu money,
	Chi money
)
as
begin
	insert into @tabletkthang
		select format(NgayThongKe, 'yyyy-MM') as 'ThoiGian', sum(DoanhThu) as 'DoanhThu', sum(Thu) as 'Thu', sum(Chi) as 'Chi'
		from PHIEUTHONGKE where NgayThongKe between @NgayBatDau and @NgayKetThuc
		group by format(NgayThongKe, 'yyyy-MM') order by format(NgayThongKe, 'yyyy-MM')
	return
end
go
--Hàm thống kê doanh thu, thu và chi theo từng năm với Ngày bắt đầu thống kê và Ngày kết thúc thống kê nhập từ bàn phím
go
create function fn_ThongKeDoanhThuTheoNam(@NgayBatDau date,@NgayKetThuc date)
returns @tabletknam table(
	ThoiGian int,
	DoanhThu money,
	Thu money,
	Chi money
)
as
begin
	insert into @tabletknam
		select year(NgayThongKe) as 'ThoiGian', sum(DoanhThu) as 'DoanhThu', sum(Thu) as 'Thu', sum(Chi) as 'Chi'
		from PHIEUTHONGKE where NgayThongKe between @NgayBatDau and @NgayKetThuc
		group by year(NgayThongKe) order by year(NgayThongKe)
	return
end
--======================================================KIỂM TRA TRÙNG LẶP DỮ LIỆU=====================================================
--Tìm và in ra các khách hàng có số điện thoại bị trùng
declare @sdt char(10)
declare cur_sdt cursor for
	select SoDienThoai From KHACHHANG
open cur_sdt
fetch next from cur_sdt into @sdt
while @@FETCH_STATUS = 0
begin
	if(select count(*) from KHACHHANG where SoDienThoai = @sdt) > 1
		print(N'Số điện thoại bị trùng là: ' + @sdt)
	fetch next from cur_sdt into @sdt
end

close cur_sdt
deallocate cur_sdt

--Tìm và in ra các tên món ăn bị trùng
declare @tenmonan nvarchar(50)
declare cur_tenmonan cursor for
	select TenMon from MONAN
open cur_tenmonan
fetch next from cur_tenmonan into @tenmonan
while @@FETCH_STATUS = 0
begin
	if(select count(*) from MONAN where TenMon = @tenmonan) > 1
		print(N'Tên món ăn bị trùng là: ' + @tenmonan)
	fetch next from cur_tenmonan into @tenmonan
end

close cur_tenmonan
deallocate cur_tenmonan
--Tìm và in ra tên các nhóm món ăn bị trùng
declare @tennhommon nvarchar(50)
declare cur_tennhommon cursor for
	select TenNhom from NHOMMONAN
open cur_tennhommon
fetch next from cur_tennhommon into @tennhommon
while @@FETCH_STATUS = 0
begin
	if(select count(*) from NHOMMONAN where TenNhom = @tennhommon) > 1
		print(N'Tên nhóm món ăn bị trùng là: ' + @tennhommon)
	fetch next from cur_tennhommon into @tennhommon
end

close cur_tennhommon
deallocate cur_tennhommon

--======================================================GIAO DỊCH - TRANSACTION=====================================================
--> Giao dịch
--Transaction
--  Giao dịch: Hủy hóa đơn
create proc sp_HuyHoaDon
    @MaHoaDon char(10)
as
begin
    begin transaction;
    begin try
        delete from CHITIETHOADON where MaHoaDon = @MaHoaDon
        delete from HOADON where MaHoaDon = @MaHoaDon
        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go

--  Giao dịch: Đánh dấu hóa đơn đã hoàn tiền
create proc sp_HoanTienHoaDon
    @MaHoaDon char(10)
as
begin
    begin transaction
    begin try
        update HOADON
        set TrangThai = N'Đã hoàn tiền'
        where MaHoaDon = @MaHoaDon
        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go

--  Giao dịch: Gộp bàn
create proc sp_gopBan
    @MaKH char(10),
    @MaBanCu char(10),
    @MaBanMoi char(10)
as
begin
    begin transaction
    begin try
        update CHITIETDATBAN
        set MaBan = @MaBanMoi
        where MaKhachHang = @MaKH AND MaBan = @MaBanCu

        update BAN set TrangThai = N'Còn Bàn' where MaBan = @MaBanCu
        update BAN set TrangThai = N'Hết Bàn' where MaBan = @MaBanMoi

        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go

--======================================================CHỈ MỤC INDEX=====================================================
create index IDX_KHACHHANG_TEN on KHACHHANG(TenKhachHang);
--> Tăng tốc truy vấn tìm kiếm khách hàng theo tên.
create unique index IDX_KHACHHANG_SDT on KHACHHANG(SoDienThoai);
--> Đảm bảo số điện thoại không bị trùng lặp và hỗ trợ tìm kiếm nhanh theo SĐT.
create index IDX_KHACHHANG_DIACHI on KHACHHANG(DiaChi);
--> Hỗ trợ truy vấn, thống kê khách hàng theo khu vực địa chỉ.
create unique index IDX_MONAN_TENMON on MONAN(TenMon);
--> Đảm bảo tên món ăn là duy nhất trong hệ thống.
create index IDX_MONAN_DONVITINH on MONAN(DonViTinh);
--> Hỗ trợ lọc món ăn theo đơn vị tính (ví dụ: phần, tô…).
create index IDX_MONAN_TRANGTHAI on MONAN(TrangThai);
--> Giúp truy vấn nhanh trạng thái món ăn: còn món ,hết món
create index IDX_MONAN_MANHOM on MONAN(MaNhom);
--> Hỗ trợ kiểm tra, cảnh báo món sắp hết khi số lượng tồn kho giảm.
create index IDX_NHANVIEN_HOTEN on NHANVIEN(HoTen);
--> Truy vấn nhanh nhân viên theo họ tên.
create index IDX_NHANVIEN_GIOITINH on NHANVIEN(GioiTinh);
--> Lọc nhân viên theo giới tính.
create index IDX_NHANVIEN_CHUCVU on NHANVIEN(ChucVu);
--> Truy vấn nhanh danh sách nhân viên theo chức vụ.
create index IDX_NHANVIEN_MAQUANLY on NHANVIEN(MaQuanLy);
--> Phục vụ cho mô hình phân cấp quản lý nhân viên.
create index IDX_NHANVIEN_LUONG on NHANVIEN(LuongCoBan);
--> Hỗ trợ sắp xếp hoặc lọc nhân viên theo mức lương cơ bản.

create index IDX_BAN_LOAIBAN on BAN(LoaiBan);
--> Lọc bàn theo loại bàn (đơn, nhóm…).
create index IDX_BAN_SOLUONGCHO on BAN(SoLuongCho);
--> Truy vấn nhanh các bàn theo số lượng chỗ ngồi.
create index IDX_BAN_TRANGTHAI on BAN(TrangThai);
--> Hỗ trợ kiểm tra bàn đang trống, có khách hoặc đã đặt.

create index IDX_CTDB_MAKHACHHANG on CHITIETDATBAN(MaKhachHang);
--> Tìm các lần đặt bàn của một khách hàng cụ thể.
create index IDX_CTDB_MABAN on CHITIETDATBAN(MaBan);
--> Truy vấn thông tin đặt bàn theo từng bàn cụ thể.

create index IDX_DANHGIA_MAKHACHHANG on DANHGIA(MaKhachHang);
--> Lọc danh sách đánh giá theo khách hàng.
create index IDX_DANHGIA_MAMONAN on DANHGIA(MaMonAn);
--> Truy vấn đánh giá của từng món ăn.
create index IDX_DANHGIA_THOIGIAN on DANHGIA(ThoiGianDanhGia);
--> Hỗ trợ lọc đánh giá theo khoảng thời gian.

create index IDX_CALAMVIEC_GIOBATDAU on CALAMVIEC(GioBatDau);
--> Tìm ca làm việc bắt đầu vào thời gian cụ thể.
create index IDX_CALAMVIEC_GIOKETTHUC on CALAMVIEC(GioKetThuc);
--> Tìm ca làm kết thúc vào thời gian cụ thể.

create index IDX_NVCA_NGAYLAM on NHANVIEN_CALAMVIEC(NgayLam);
--> Truy vấn ca làm của nhân viên theo ngày cụ thể.
create index IDX_NVCA_MACA on NHANVIEN_CALAMVIEC(MaCa);
--> Lọc danh sách ca làm theo mã ca.

create index IDX_HOADON_NGAY on HOADON(NgayLapHoaDon);
--> Truy vấn nhanh hóa đơn theo ngày lập.
create index IDX_HOADON_TRANGTHAI on HOADON(TrangThai);
--> Lọc hóa đơn theo trạng thái (đã thanh toán, chưa thanh toán).
create index IDX_HOADON_KHACHHANG on HOADON(MaKhachHang);
--> Truy xuất hóa đơn của một khách hàng.

create index IDX_PHIEUNHAP_NGAYTAO on PHIEUNHAPHANG(NgayTao);
--> Truy vấn phiếu nhập hàng theo ngày tạo.
create index IDX_PHIEUNHAP_NV on PHIEUNHAPHANG(MaNhanVienNhap);
--> Lọc phiếu nhập theo nhân viên thực hiện.
create index IDX_PHIEUNHAP_NCC on PHIEUNHAPHANG(NhaCungCap);
--> Truy vấn phiếu nhập theo nhà cung cấp.

create index IDX_NL_HANSUDUNG on NGUYENLIEU(HanSuDung);
--> Hỗ trợ kiểm tra và cảnh báo nguyên liệu gần hết hạn.
create index IDX_NL_LOAI on NGUYENLIEU(LOAI);
--> Truy vấn nhanh nguyên liệu theo loại (thịt, rau, gia vị…).
create index IDX_NL_NGAYSX on NGUYENLIEU(NgaySanXuat);
--> Lọc nguyên liệu theo ngày sản xuất.
create index IDX_NL_GIABAN on NGUYENLIEU(GiaBan);
--> Hỗ trợ so sánh giá nguyên liệu, sắp xếp theo giá.
create index IDX_NL_LOAI_HSD on NGUYENLIEU(Loai, HanSuDung);
--> Tìm nguyên liệu theo loại và hạn sử dụng kết hợp.

create index IDX_CTNHAPHANG_MAPHIEUNHAP on CHITIETNHAPHANG(MaPhieuNhap);
--> Truy vấn chi tiết nhập theo mã phiếu nhập.
create index IDX_CTNHAPHANG_MANGUYENLIEU on CHITIETNHAPHANG(MaNguyenLieu);
--> Truy xuất chi tiết nhập của nguyên liệu cụ thể.
create index IDX_CTNHAPHANG_THANHTIEN on CHITIETNHAPHANG(ThanhTien);
--> Hỗ trợ thống kê tổng giá trị nhập từng dòng.
create index IDX_CTNHAPHANG_MANGUYENLIEU_MAPHIEUNHAP 
on CHITIETNHAPHANG(MaNguyenLieu, MaPhieuNhap);
--> Tăng tốc truy vấn khi kết hợp tìm nguyên liệu trong một phiếu cụ thể.

create index IDX_PT_NGAYTHONGKE on PHIEUTHONGKE(NgayThongKe);
--> Truy vấn phiếu thống kê theo ngày.
create index IDX_PT_MANHANVIEN on PHIEUTHONGKE(MaNhanVien);
--> Truy vấn thống kê theo nhân viên.
create index IDX_PT_NGAY_MANHANVIEN on PHIEUTHONGKE(NgayThongKe, MaNhanVien);
--> Tìm thống kê của nhân viên trong một khoảng thời gian.

create index IDX_CTHD_MAHOADON on CHITIETHOADON(MaHoaDon);
--> Truy xuất chi tiết các món ăn trong hóa đơn.
create index IDX_CTHD_MAMONAN on CHITIETHOADON(MaMonAn);
--> Tìm tất cả hóa đơn có món ăn cụ thể.
create index IDX_CTHD_MAMONAN_MAHOADON 
on CHITIETHOADON(MaMonAn, MaHoaDon);
--> Truy vấn nâng cao: tìm món trong hóa đơn cụ thể.

--======================================================KIỂM TRA TỐC ĐỘ TRUY VẤN=====================================================
--Kiểm tra thời gian
set statistics time on
set statistics time off

--Kiểm tra tài nguyên
set statistics io on
set statistics io off
-- 1. MÓN ĂN BÁN CHẠY NHẤT (được gọi nhiều nhất)
set statistics io on
set statistics time on
select top 1 ct.MaMonAn, m.TenMon, sum(ct.SoLuong) as SoLuongBan
from CHITIETHOADON ct
join MONAN m on ct.MaMonAn = m.MaMonAn
group by ct.MaMonAn, m.TenMon
order by sum(ct.SoLuong) desc;
set statistics time off
set statistics io off


--======================================================PHÂN QUYỀN TRUY CẬP GRANT - REVOKE=====================================================

-- tạo login và user 
create login user_nhanvien with password = 'NhanVien123!';
create user user_nhanvien for login user_nhanvien;


create login user_quanly with password = 'QuanLy123!';
create user user_quanly for login user_quanly;

create login user_ketoan with password = 'KeToan123!';
create user user_ketoan for login user_ketoan;

-- cho phép xem thông tin bàn
grant select on BAN to user_nhanvien;

-- cho phép xem danh sách món ăn
grant select on MONAN to user_nhanvien;

-- cho phép tra cứu thông tin khách hàng
grant select on KHACHHANG to user_nhanvien;

-- cho phép xem và tạo chi tiết đặt bàn
grant select, insert on CHITIETDATBAN to user_nhanvien;

-- cho phép xem và đăng ký ca làm việc
grant select, insert on NHANVIEN_CALAMVIEC to user_nhanvien;

-- cho phép xem thông tin các ca làm
grant select on CALAMVIEC to user_nhanvien;

-- cho phép tạo hóa đơn khi thanh toán
grant insert on HOADON to user_nhanvien;

-- cho phép ghi chi tiết hóa đơn
grant insert on CHITIETHOADON to user_nhanvien;

-- cho phép gửi đánh giá món ăn
grant insert on DANHGIA to user_nhanvien;

-- cho phép xem các chương trình khuyến mãi
grant select on KHUYENMAI to user_nhanvien;

-- cấp quyền grant cho quản lý (user_quanly)
-- quản lý nhân viên
grant select, insert, update, delete on NHANVIEN to user_quanly;

-- quản lý ca làm việc
grant select, insert, update, delete on CALAMVIEC to user_quanly;

-- quản lý phân công ca làm
grant select, insert, update, delete on NHANVIEN_CALAMVIEC to user_quanly;

-- quản lý thông tin khách hàng
grant select, insert, update, delete on KHACHHANG to user_quanly;

-- quản lý hóa đơn
grant select, insert, update, delete on HOADON to user_quanly;

-- quản lý chi tiết hóa đơn
grant select, insert, update, delete on CHITIETHOADON to user_quanly;

-- quản lý chi tiết đặt bàn
grant select, insert, update, delete on CHITIETDATBAN to user_quanly;

-- quản lý bàn ăn
grant select, insert, update, delete on BAN to user_quanly;

-- quản lý món ăn
grant select, insert, update, delete on MONAN to user_quanly;

-- quản lý nhóm món ăn
grant select, insert, update, delete on NHOMMONAN to user_quanly;

-- quản lý nguyên liệu
grant select, insert, update, delete on NGUYENLIEU to user_quanly;

-- quản lý nguyên liệu trong món ăn
grant select, insert, update, delete on NGUYENLIEU_MONAN to user_quanly;

-- quản lý đánh giá của khách hàng
grant select, insert, update, delete on DANHGIA to user_quanly;

-- quản lý chương trình khuyến mãi
grant select, insert, update, delete on KHUYENMAI to user_quanly;

-- quản lý báo cáo thống kê
grant select, insert, update, delete on PHIEUTHONGKE to user_quanly;

-- cấp quyền grant cho kế toán 
-- quản lý hóa đơn
grant select, insert, update, delete on HOADON to user_ketoan;

-- quản lý chi tiết hóa đơn
grant select, insert, update, delete on CHITIETHOADON to user_ketoan;

-- quản lý phiếu nhập hàng
grant select, insert, update, delete on PHIEUNHAPHANG to user_ketoan;

-- quản lý chi tiết nhập hàng
grant select, insert, update, delete on CHITIETNHAPHANG to user_ketoan;

-- xem món ăn để đối chiếu báo cáo
grant select on MONAN to user_ketoan;

-- xem nguyên liệu để kiểm tra tồn kho
grant select on NGUYENLIEU to user_ketoan;

-- lập và xem báo cáo thống kê tài chính
grant select, insert, update, delete on PHIEUTHONGKE to user_ketoan;

-- thu hồi quyền của nhân viên (user_nhanvien)
-- thu hồi quyền xem thông tin bàn
revoke all on BAN from user_nhanvien;

-- thu hồi quyền xem món ăn
revoke all on MONAN from user_nhanvien;

-- thu hồi quyền truy cập khách hàng
revoke all on KHACHHANG from user_nhanvien;

-- thu hồi quyền đặt bàn
revoke all on CHITIETDATBAN from user_nhanvien;

-- thu hồi quyền đăng ký ca
revoke all on NHANVIEN_CALAMVIEC from user_nhanvien;

-- thu hồi quyền xem ca làm việc
revoke all on CALAMVIEC from user_nhanvien;

-- thu hồi quyền tạo hóa đơn
revoke all on HOADON from user_nhanvien;

-- thu hồi quyền tạo chi tiết hóa đơn
revoke all on CHITIETHOADON from user_nhanvien;

-- thu hồi quyền gửi đánh giá
revoke all on DANHGIA from user_nhanvien;

-- thu hồi quyền xem khuyến mãi
revoke all on KHUYENMAI from user_nhanvien;

-- thu hồi quyền của quản lý (user_quanly)
-- thu hồi quyền trên bảng NHANVIEN
revoke all on NHANVIEN from user_quanly;

-- thu hồi quyền trên bảng CALAMVIEC
revoke all on CALAMVIEC from user_quanly;

-- thu hồi quyền trên bảng NHANVIEN_CALAMVIEC
revoke all on NHANVIEN_CALAMVIEC from user_quanly;

-- thu hồi quyền trên bảng KHACHHANG
revoke all on KHACHHANG from user_quanly;

-- thu hồi quyền trên bảng HOADON
revoke all on HOADON from user_quanly;

-- thu hồi quyền trên bảng CHITIETHOADON
revoke all on CHITIETHOADON from user_quanly;

-- thu hồi quyền trên bảng CHITIETDATBAN
revoke all on CHITIETDATBAN from user_quanly;

-- thu hồi quyền trên bảng BAN
revoke all on BAN from user_quanly;

-- thu hồi quyền trên bảng MONAN
revoke all on MONAN from user_quanly;

-- thu hồi quyền trên bảng NHOMMONAN
revoke all on NHOMMONAN from user_quanly;

-- thu hồi quyền trên bảng NGUYENLIEU
revoke all on NGUYENLIEU from user_quanly;

-- thu hồi quyền trên bảng NGUYENLIEU_MONAN
revoke all on NGUYENLIEU_MONAN from user_quanly;

-- thu hồi quyền trên bảng DANHGIA
revoke all on DANHGIA from user_quanly;

-- thu hồi quyền trên bảng KHUYENMAI
revoke all on KHUYENMAI from user_quanly;

-- thu hồi quyền trên bảng PHIEUTHONGKE
revoke all on PHIEUTHONGKE from user_quanly;

-- thu hồi quyền của kế toán (user_ketoan)
-- thu hồi quyền trên bảng HOADON
revoke all on HOADON from user_ketoan;

-- thu hồi quyền trên bảng CHITIETHOADON
revoke all on CHITIETHOADON from user_ketoan;

-- thu hồi quyền trên bảng PHIEUNHAPHANG
revoke all on PHIEUNHAPHANG from user_ketoan;

-- thu hồi quyền trên bảng CHITIETNHAPHANG
revoke all on CHITIETNHAPHANG from user_ketoan;

-- thu hồi quyền select trên bảng MONAN
revoke all on MONAN from user_ketoan;

-- thu hồi quyền select trên bảng NGUYENLIEU
revoke all on NGUYENLIEU from user_ketoan;

-- thu hồi quyền trên bảng PHIEUTHONGKE
revoke all on PHIEUTHONGKE from user_ketoan;

-- 1. MÓN ĂN BÁN CHẠY NHẤT (được gọi nhiều nhất)
set statistics io on
set statistics time on
select top 1 ct.MaMonAn, m.TenMon, sum(ct.SoLuong) as SoLuongBan
from CHITIETHOADON ct
join MONAN m on ct.MaMonAn = m.MaMonAn
group by ct.MaMonAn, m.TenMon
order by sum(ct.SoLuong) desc;
set statistics time off
set statistics io off
go
--2.top 5 món ăn bán chạy nhất
select top 5 ma.TenMon, sum(ct.SoLuong) as TongSoLuongBan
from CHITIETHOADON ct
join MONAN ma on ct.MaMonAn = ma.MaMonAn
group by ma.TenMon
order by TongSoLuongBan desc;
go

-- ======================================================================================
-- 3. TÌM MÓN ĂN THEO TÊN (dùng like)
-- Ví dụ: tìm tất cả món có từ "cơm"
select * from MONAN
where TenMon like N'%cơm%';
go
-- ======================================================================================
---- 4. NHÂN VIÊN CÓ NHIỀU HOÁ ĐƠN LẬP NHẤT
select top 1 nv.MaNhanVien, nv.HoTen, count(hd.MaHoaDon) as SoLuongHoaDon
from HOADON hd
join NHANVIEN nv on hd.MaNhanVienLap = nv.MaNhanVien
group by nv.MaNhanVien, nv.HoTen
order by count(hd.MaHoaDon) ;
go

-- ======================================================================================
-- 5. DANH SÁCH MÓN ĂN ĐƯỢC GỌI TRONG BÀN (theo lịch sử đặt bàn)
-- Truy vấn món ăn trong một bàn cụ thể (ví dụ: bàn 11)
select db.MaBan, b.LoaiBan, ma.TenMon, cthd.SoLuong
from CHITIETDATBAN db
join BAN b on db.MaBan = b.MaBan
join HOADON hd on db.MaKhachHang = hd.MaKhachHang
join CHITIETHOADON cthd on hd.MaHoaDon = cthd.MaHoaDon
join MONAN ma on cthd.MaMonAn = ma.MaMonAn
where db.MaBan = '11';
go

-- ======================================================================================
-- 6. CHI TIẾT PHIẾU NHẬP HÀNG
select p.MaPhieuNhap, nl.TenNguyenLieu, c.SoLuongNhap, c.DonGia, c.ThanhTien
from CHITIETNHAPHANG c
join NGUYENLIEU nl on c.MaNguyenLieu = nl.MaNguyenLieu
join PHIEUNHAPHANG p on c.MaPhieuNhap = p.MaPhieuNhap
order by p.MaPhieuNhap asc;
go

-- ======================================================================================
-- 7. DOANH THU, LỢI NHUẬN THEO NGÀY
select convert(date, NgayThongKe) as Ngay, 
       sum(DoanhThu) as TongDoanhThu, 
       sum(Thu - Chi) as LoiNhuan
from PHIEUTHONGKE
group by convert(date, NgayThongKe)
order by Ngay;
go
-- ======================================================================================
---- 8. DOANH THU, LỢI NHUẬN THEO THÁNG
select year(NgayThongKe) as Nam, 
       month(NgayThongKe) as Thang,
       sum(DoanhThu) as TongDoanhThu,
       sum(Thu - Chi) as LoiNhuan
from PHIEUTHONGKE
group by year(NgayThongKe), month(NgayThongKe)
order by Nam, Thang;
go

-- ======================================================================================
---- 9. THÔNG TIN CHI TIẾT NHÂN VIÊN (kèm tên quản lý)
select nv.*, ql.HoTen as TenQuanLy
from NHANVIEN nv
left join NHANVIEN ql on nv.MaQuanLy = ql.MaNhanVien;
go

-- ======================================================================================
-- 10. THÔNG TIN CHI TIẾT HÓA ĐƠN (kèm món ăn)
select hd.MaHoaDon, hd.NgayLapHoaDon, kh.TenKhachHang, nv.HoTen as NhanVienLap, 
       km.TenKhuyenMai, hd.TongTienPhaiTra, ma.TenMon, cthd.SoLuong
from HOADON hd
join KHACHHANG kh on hd.MaKhachHang = kh.MaKhachHang
join NHANVIEN nv on hd.MaNhanVienLap = nv.MaNhanVien
left join KHUYENMAI km on hd.MaKhuyenMai = km.MaKhuyenMai
join CHITIETHOADON cthd on hd.MaHoaDon = cthd.MaHoaDon
join MONAN ma on cthd.MaMonAn = ma.MaMonAn;
go

-- ======================================================================================
-- 11. NGUYÊN LIỆU SẮP HẾT HẠN (trong vòng 7 ngày tới)
select MaNguyenLieu, TenNguyenLieu, HanSuDung
from NGUYENLIEU
where HanSuDung <= dateadd(day, 7, getdate())
order by HanSuDung;
go
-- ======================================================================================
-- 12. LỊCH SỬ ĐẶT BÀN & GỌI MÓN CỦA KHÁCH
-- Lịch sử đặt bàn:
select kh.MaKhachHang, kh.TenKhachHang, db.MaBan, b.LoaiBan, db.SoLuongBan
from CHITIETDATBAN db
join BAN b on db.MaBan = b.MaBan
join KHACHHANG kh on db.MaKhachHang = kh.MaKhachHang;
go
-- ======================================================================================
-- Lịch sử gọi món (thông qua hóa đơn):
select kh.MaKhachHang, kh.TenKhachHang, hd.MaHoaDon, ma.TenMon, cthd.SoLuong
from HOADON hd
join CHITIETHOADON cthd on hd.MaHoaDon = cthd.MaHoaDon
join MONAN ma on cthd.MaMonAn = ma.MaMonAn
join KHACHHANG kh on hd.MaKhachHang = kh.MaKhachHang;
go

-- ======================================================================================
--13.Thống kê số lượng đơn hàng mỗi ngày
select convert(DATE, NgayLapHoaDon) as Ngay, count(*) as SoHoaDon
from HOADON
group by convert(DATE, NgayLapHoaDon)
order by Ngay;

--======================================================UPDATE=====================================================

-- 1. Cập nhật giá món ăn
update MONAN
set DonGia = 85000
where MaMonAn = 3;

-- 2. Cập nhật trạng thái bàn
update BAN
set TrangThai = N'Hết bàn'
where MaBan = 3;

-- 3. Cập nhật mã khuyến mãi trong hóa đơn
update HOADON
set MaKhuyenMai = 5
where MaHoaDon = 22;

-- 4. Cập nhật trạng thái hóa đơn
update HOADON
set TrangThai = N'Đã thanh toán'
where MaHoaDon = 22;
--======================================================DELETE=====================================================
--  Xóa hóa đơn (chú ý ràng buộc khóa ngoại)
delete from CHITIETHOADON
where MaHoaDon = 2;

delete from HOADON
where MaHoaDon = 2;

--  Xóa nhân viên (phải xử lý các bảng liên quan trước)
delete from NHANVIEN_CALAMVIEC
where MaNhanVien = 15;

delete from NHANVIEN
where MaNhanVien = 15;

--Xoá bàn
delete from CHITIETDATBAN where MaBan = 2;
delete from BAN
where MaBan = 2;

-- ===================== THỐNG KÊ & BÁO CÁO (SUM - COUNT) =====================
-- đếm số lượng hóa đơn theo trạng thái
select 
    TrangThai,
    count(MaHoaDon) as SoLuongHoaDon
from HOADON
group by TrangThai;

-- đếm số lượng bàn theo loại bàn và trạng thái
select 
    LoaiBan,
    TrangThai,
    count(MaBan) as SoLuongBan
from BAN
group by LoaiBan, TrangThai;

-- đếm số lượng đánh giá theo điểm đánh giá
select 
    DiemDanhGia,
    count(*) as SoLuongDanhGia
from DANHGIA
group by DiemDanhGia;

-- đếm số lượng phiếu nhập hàng theo nhà cung cấp
select 
    NhaCungCap,
    count(MaPhieuNhap) as SoLuongPhieuNhap
from PHIEUNHAPHANG
group by NhaCungCap;

-- đếm số lượng nhân viên theo chức vụ
select 
    ChucVu,
    count(MaNhanVien) as SoLuongNhanVien
from NHANVIEN
group by ChucVu;

-- đếm số lượng ca làm việc của nhân viên
select 
    NHANVIEN.HoTen,
    count(NHANVIEN_CALAMVIEC.MaCa) as SoLuongCaLam
from NHANVIEN
left join NHANVIEN_CALAMVIEC on NHANVIEN.MaNhanVien = NHANVIEN_CALAMVIEC.MaNhanVien
group by NHANVIEN.HoTen;

-- đếm số lượng khách hàng đặt bàn
select 
    KHACHHANG.TenKhachHang,
    count(CHITIETDATBAN.MaBan) as SoLuongBanDat
from KHACHHANG
left join CHITIETDATBAN on KHACHHANG.MaKhachHang = CHITIETDATBAN.MaKhachHang
group by KHACHHANG.TenKhachHang;

-- đếm số lượng hóa đơn sử dụng khuyến mãi
select 
    KHUYENMAI.TenKhuyenMai,
    count(HOADON.MaHoaDon) as SoLuongHoaDon
from HOADON
join KHUYENMAI on HOADON.MaKhuyenMai = KHUYENMAI.MaKhuyenMai
group by KHUYENMAI.TenKhuyenMai;

-- 2. tính tổng doanh thu, tổng số lượng sản phẩm đã bán (sum, avg)

-- tính tổng doanh thu và doanh thu trung bình theo ngày
select 
    convert(date, NgayLapHoaDon) as Ngay,
    sum(TongTienPhaiTra) as TongDoanhThu,
    avg(TongTienPhaiTra) as DoanhThuTrungBinh
from HOADON
where TrangThai = N'Đã thanh toán'
group by convert(date, NgayLapHoaDon);

-- tính tổng số lượng món ăn đã bán theo nhóm món ăn
select 
    NHOMMONAN.TenNhom,
    sum(CHITIETHOADON.SoLuong) as TongSoLuongBan,
    avg(CHITIETHOADON.SoLuong) as SoLuongBanTrungBinh
from CHITIETHOADON
join MONAN on CHITIETHOADON.MaMonAn = MONAN.MaMonAn
join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
join HOADON on CHITIETHOADON.MaHoaDon = HOADON.MaHoaDon
where HOADON.TrangThai = N'Đã thanh toán'
group by NHOMMONAN.TenNhom;

-- tính tổng chi phí nhập hàng theo nhà cung cấp
select 
    PHIEUNHAPHANG.NhaCungCap,
    sum(CHITIETNHAPHANG.ThanhTien) as TongChiPhiNhap,
    avg(CHITIETNHAPHANG.ThanhTien) as ChiPhiNhapTrungBinh
from PHIEUNHAPHANG
join CHITIETNHAPHANG on PHIEUNHAPHANG.MaPhieuNhap = CHITIETNHAPHANG.MaPhieuNhap
group by PHIEUNHAPHANG.NhaCungCap;

-- tính tổng số tiền giảm giá theo khuyến mãi
select 
    KHUYENMAI.TenKhuyenMai,
    sum(HOADON.SoTienGiam) as TongTienGiam,
    avg(HOADON.SoTienGiam) as TienGiamTrungBinh
from HOADON
join KHUYENMAI on HOADON.MaKhuyenMai = KHUYENMAI.MaKhuyenMai
group by KHUYENMAI.TenKhuyenMai;

-- tính tổng số lượng nguyên liệu nhập theo loại nguyên liệu
select 
    NGUYENLIEU.Loai,
    sum(CHITIETNHAPHANG.SoLuongNhap) as TongSoLuongNhap,
    avg(CHITIETNHAPHANG.SoLuongNhap) as SoLuongNhapTrungBinh
from NGUYENLIEU
join CHITIETNHAPHANG on NGUYENLIEU.MaNguyenLieu = CHITIETNHAPHANG.MaNguyenLieu
group by NGUYENLIEU.Loai;

-- tính tổng lương cơ bản theo chức vụ nhân viên
select 
    ChucVu,
    sum(LuongCoBan) as TongLuongCoBan,
    avg(LuongCoBan) as LuongCoBanTrungBinh
from NHANVIEN
group by ChucVu;

-- tính tổng số bàn đã đặt theo khách hàng
select 
    KHACHHANG.TenKhachHang,
    sum(CHITIETDATBAN.SoLuongBan) as TongSoBanDat,
    avg(CHITIETDATBAN.SoLuongBan) as SoBanDatTrungBinh
from CHITIETDATBAN
join KHACHHANG on CHITIETDATBAN.MaKhachHang = KHACHHANG.MaKhachHang
group by KHACHHANG.TenKhachHang;

-- tính tổng số món ăn đã bán theo món
select 
    MONAN.TenMon,
    sum(CHITIETHOADON.SoLuong) as TongSoLuongBan,
    avg(CHITIETHOADON.SoLuong) as SoLuongBanTrungBinh
from CHITIETHOADON
join MONAN on CHITIETHOADON.MaMonAn = MONAN.MaMonAn
join HOADON on CHITIETHOADON.MaHoaDon = HOADON.MaHoaDon
where HOADON.TrangThai = N'Đã thanh toán'
group by MONAN.TenMon;

-- tính tổng doanh thu theo tháng
select 
    year(NgayLapHoaDon) as Nam,
    month(NgayLapHoaDon) as Thang,
    sum(TongTienPhaiTra) as TongDoanhThu,
    avg(TongTienPhaiTra) as DoanhThuTrungBinh
from HOADON
where TrangThai = N'Đã thanh toán'
group by year(NgayLapHoaDon), month(NgayLapHoaDon)
order by Nam, Thang;

-- tính tổng doanh thu theo nhóm món ăn
select 
    NHOMMONAN.TenNhom,
    sum(CHITIETHOADON.SoLuong * MONAN.DonGia) as TongDoanhThu,
    avg(CHITIETHOADON.SoLuong * MONAN.DonGia) as DoanhThuTrungBinh
from CHITIETHOADON
join MONAN on CHITIETHOADON.MaMonAn = MONAN.MaMonAn
join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
join HOADON on CHITIETHOADON.MaHoaDon = HOADON.MaHoaDon
where HOADON.TrangThai = N'Đã thanh toán'
group by NHOMMONAN.TenNhom;

-- 3. XÂY DỰNG BÁO CÁO TỪ DỮ LIỆU TRONG HỆ THỐNG

-- Báo cáo doanh thu chi tiết theo ngày và nhân viên
select 
    convert(date, hoadon.NgayLapHoaDon) as Ngay,
    nhanvien.HoTen as NhanVienLap,
    nhanvien.ChucVu as ChucVuNhanVien,
    count(distinct hoadon.MaHoaDon) as SoHoaDon,
    sum(hoadon.TongTienPhaiTra) as TongDoanhThu,
    sum(chitiethoadon.SoLuong) as TongSoLuongMonBan,
    avg(hoadon.TongTienPhaiTra) as DoanhThuTrungBinhHoaDon
from hoadon
join nhanvien on hoadon.MaNhanVienLap = nhanvien.MaNhanVien
join chitiethoadon on hoadon.MaHoaDon = chitiethoadon.MaHoaDon
where hoadon.TrangThai = N'Đã thanh toán'
group by convert(date, hoadon.NgayLapHoaDon), nhanvien.HoTen, nhanvien.ChucVu
order by Ngay desc;

-- Báo cáo nhập hàng chi tiết
select 
    phieunhaphang.MaPhieuNhap,
    phieunhaphang.NgayTao,
    nhanvien.HoTen as NhanVienNhap,
    nhanvien.ChucVu as ChucVuNhanVien,
    phieunhaphang.NhaCungCap,
    sum(chitietnhaphang.SoLuongNhap) as TongSoLuongNhap,
    sum(chitietnhaphang.ThanhTien) as TongChiPhiNhap,
    count(distinct chitietnhaphang.MaNguyenLieu) as SoLoaiNguyenLieu
from phieunhaphang
join nhanvien on phieunhaphang.MaNhanVienNhap = nhanvien.MaNhanVien
join chitietnhaphang on phieunhaphang.MaPhieuNhap = chitietnhaphang.MaPhieuNhap
group by phieunhaphang.MaPhieuNhap, phieunhaphang.NgayTao, nhanvien.HoTen, nhanvien.ChucVu, phieunhaphang.NhaCungCap
order by phieunhaphang.NgayTao desc;

-- Báo cáo đặt bàn và sử dụng bàn
select 
    ban.MaBan,
    ban.LoaiBan,
    ban.TrangThai as TrangThaiBan,
    count(chitietdatban.MaKhachHang) as SoLuongDatBan,
    sum(chitietdatban.SoLuongBan) as TongSoBanDat,
    string_agg(khachhang.TenKhachHang, ', ') as DanhSachKhachHang
from ban
left join chitietdatban on ban.MaBan = chitietdatban.MaBan
left join khachhang on chitietdatban.MaKhachHang = khachhang.MaKhachHang
group by ban.MaBan, ban.LoaiBan, ban.TrangThai
order by ban.MaBan;

-- Báo cáo hóa đơn chi tiết
select 
    hoadon.MaHoaDon,
    hoadon.NgayLapHoaDon,
    nhanvien.HoTen as NhanVienLap,
    khachhang.TenKhachHang,
    sum(chitiethoadon.SoLuong) as TongSoLuongMon,
    hoadon.TongTienPhaiTra,
    khuyenmai.TenKhuyenMai,
    hoadon.SoTienGiam
from hoadon
join nhanvien on hoadon.MaNhanVienLap = nhanvien.MaNhanVien
join khachhang on hoadon.MaKhachHang = khachhang.MaKhachHang
join khuyenmai on hoadon.MaKhuyenMai = khuyenmai.MaKhuyenMai
join chitiethoadon on hoadon.MaHoaDon = chitiethoadon.MaHoaDon
where hoadon.TrangThai = N'Đã thanh toán'
group by hoadon.MaHoaDon, hoadon.NgayLapHoaDon, nhanvien.HoTen, 
         khachhang.TenKhachHang, hoadon.TongTienPhaiTra, khuyenmai.TenKhuyenMai, hoadon.SoTienGiam
order by hoadon.NgayLapHoaDon desc;

-- Báo cáo thống kê tài chính
select 
    phieuthongke.MaPhieu,
    phieuthongke.NgayThongKe,
    nhanvien.HoTen as NhanVienLap,
    phieuthongke.DoanhThu,
    phieuthongke.Thu,
    phieuthongke.Chi,
    (phieuthongke.Thu - phieuthongke.Chi) as LoiNhuan
from phieuthongke
join nhanvien on phieuthongke.MaNhanVien = nhanvien.MaNhanVien
order by phieuthongke.NgayThongKe desc;

-- Báo cáo nguyên liệu sử dụng cho món ăn
select 
    monan.TenMon,
    nhommonan.TenNhom,
    nguyenlieu.TenNguyenLieu,
    nguyenlieu.Loai,
    nguyenlieu_monan.SoLuong as SoLuongNguyenLieuCanDung,
    nguyenlieu.DonViTinh
from nguyenlieu_monan
join monan on nguyenlieu_monan.MaMonAn = monan.MaMonAn
join nhommonan on monan.MaNhom = nhommonan.MaNhom
join nguyenlieu on nguyenlieu_monan.MaNguyenLieu = nguyenlieu.MaNguyenLieu
order by monan.TenMon;

-- Báo cáo nhân viên và ca làm việc
select 
    nhanvien.HoTen,
    nhanvien.ChucVu,
    count(nhanvien_calamviec.MaCa) as SoLuongCaLam,
    string_agg(concat(calamviec.MaCa, ': ', convert(varchar, calamviec.GioBatDau, 108), ' - ', convert(varchar, calamviec.GioKetThuc, 108)), ', ') as LichLamViec
from nhanvien
left join nhanvien_calamviec on nhanvien.MaNhanVien = nhanvien_calamviec.MaNhanVien
left join calamviec on nhanvien_calamviec.MaCa = calamviec.MaCa
group by nhanvien.HoTen, nhanvien.ChucVu
order by nhanvien.HoTen;

-- Báo cáo chi tiết sử dụng khuyến mãi
select 
    khuyenmai.TenKhuyenMai,
    khuyenmai.MoTa,
    count(hoadon.MaHoaDon) as SoLuongHoaDon,
    sum(hoadon.SoTienGiam) as TongTienGiam,
    avg(hoadon.SoTienGiam) as TienGiamTrungBinh,
    string_agg(khachhang.TenKhachHang, ', ') as DanhSachKhachHang
from hoadon
join khuyenmai on hoadon.MaKhuyenMai = khuyenmai.MaKhuyenMai
join khachhang on hoadon.MaKhachHang = khachhang.MaKhachHang
group by khuyenmai.TenKhuyenMai, khuyenmai.MoTa
order by SoLuongHoaDon desc;

-- Báo cáo chi tiết phiếu nhập hàng để in
select 
    phieunhaphang.MaPhieuNhap,
    phieunhaphang.NgayTao,
    nhanvien.HoTen as NhanVienNhap,
    phieunhaphang.NhaCungCap,
    nguyenlieu.TenNguyenLieu,
    chitietnhaphang.SoLuongNhap,
    chitietnhaphang.DonGia,
    chitietnhaphang.ThanhTien
from phieunhaphang
join nhanvien on phieunhaphang.MaNhanVienNhap = nhanvien.MaNhanVien
join chitietnhaphang on phieunhaphang.MaPhieuNhap = chitietnhaphang.MaPhieuNhap
join nguyenlieu on chitietnhaphang.MaNguyenLieu = nguyenlieu.MaNguyenLieu
order by phieunhaphang.MaPhieuNhap, nguyenlieu.TenNguyenLieu;



