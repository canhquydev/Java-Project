﻿use master
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
drop table BAN
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
(N'Khuyến mãi 1', 10, N'Giảm 10% khi gọi món Cơm tấm'),
(N'Khuyến mãi 2', 15, N'Giảm 15% cho nhóm từ 5 người trở lên'),
(N'Khuyến mãi 3', 20, N'Giảm 20% cho nhóm từ 6 người trở lên'),
(N'Khuyến mãi 4', 10, N'Giảm 10% cho hóa đơn trên 200.000đ'),
(N'Khuyến mãi 5', 20, N'Giảm 20% hóa đơn từ 14h đến 17h'),
(N'Khuyến mãi 6', 15, N'Giảm 15% cho combo 3 món + tráng miệng'),
(N'Khuyến mãi 7', 10, N'Giảm 10% cho combo 3 món + tráng miệng'),
(N'Khuyến mãi 8', 15, N'Giảm 15% cho combo 2 món chính + 2 nước'),
(N'Khuyến mãi 9', 15, N'Giảm 15% khi gọi món Cơm tấm'),
(N'Khuyến mãi 10', 25, N'Giảm 25% hóa đơn từ 14h đến 17h'),
(N'Khuyến mãi 11', 15, N'Giảm 15% khi gọi món Bún bò Huế'),
(N'Khuyến mãi 12', 10, N'Giảm 10% cho combo 2 món chính + 2 nước'),
(N'Khuyến mãi 13', 10, N'Giảm 10% cho hóa đơn trên 100.000đ'),
(N'Khuyến mãi 14', 15, N'Giảm 15% cho nhóm từ 5 người trở lên'),
(N'Khuyến mãi 15', 15, N'Giảm 15% cho combo 2 món chính + 2 nước'),
(N'Khuyến mãi 16', 10, N'Giảm 10% cho hóa đơn trên 150.000đ'),
(N'Khuyến mãi 17', 20, N'Giảm 20% hóa đơn từ 14h đến 17h'),
(N'Khuyến mãi 18', 15, N'Giảm 15% cho combo 2 món chính + 2 nước'),
(N'Khuyến mãi 19', 20, N'Giảm 20% cho combo 3 món + tráng miệng'),
(N'Khuyến mãi 20', 25, N'Giảm 25% khi gọi món Bún bò Huế'),
(N'Khuyến mãi 21', 15, N'Giảm 15% cho nhóm từ 6 người trở lên'),
(N'Khuyến mãi 22', 15, N'Giảm 15% khi gọi món Bún bò Huế'),
(N'Khuyến mãi 23', 15, N'Giảm 15% hóa đơn từ 18h đến 20h'),
(N'Khuyến mãi 24', 25, N'Giảm 25% hóa đơn từ 14h đến 17h'),
(N'Khuyến mãi 25', 15, N'Giảm 15% cho hóa đơn trên 150.000đ');

INSERT INTO NGUYENLIEU (TenNguyenLieu, Loai, NgaySanXuat, HanSuDung, GiaBan, DonViTinh, SoLuongTon) VALUES
(N'Thịt bò', N'Thịt', '2025-03-22', '2025-05-28', 198194, N'nguyên gói', 20),
(N'Thịt gà', N'Thịt', '2025-03-08', '2025-08-28', 49849, N'bó', 35),
(N'Thịt heo', N'Thịt', '2025-03-11', '2025-06-12', 60385, N'gói', 25),
(N'Tôm sú', N'Hải sản', '2025-03-11', '2025-06-17', 90251, N'gói', 18),
(N'Cua biển', N'Hải sản', '2025-03-27', '2025-06-22', 68085, N'bó', 15),
(N'Cá hồi', N'Hải sản', '2025-03-22', '2025-09-05', 61591, N'bó', 22),
(N'Cá lóc', N'Hải sản', '2025-03-14', '2025-07-26', 77141, N'nguyên hộp', 30),
(N'Mực ống', N'Hải sản', '2025-03-26', '2025-07-13', 96258, N'chai', 28),
(N'Trứng gà', N'Trứng', '2025-03-24', '2025-07-26', 86713, N'chai', 50),
(N'Trứng vịt', N'Trứng', '2025-03-03', '2025-08-12', 117693, N'nguyên hộp', 45),
(N'Gạo', N'Gạo', '2025-03-04', '2025-08-20', 113245, N'gói', 100),
(N'Bún tươi', N'Tinh bột', '2025-03-05', '2025-07-27', 90531, N'kg', 70),
(N'Phở khô', N'Tinh bột', '2025-03-09', '2025-05-31', 195295, N'lít', 40),
(N'Mì trứng', N'Tinh bột', '2025-03-26', '2025-06-02', 152015, N'lít', 38),
(N'Nước mắm', N'Gia vị', '2025-03-28', '2025-08-10', 26899, N'nguyên chai', 60),
(N'Nước tương', N'Gia vị', '2025-03-12', '2025-07-23', 82794, N'gói', 55),
(N'Muối', N'Gia vị', '2025-03-01', '2025-07-26', 133154, N'kg', 80),
(N'Đường', N'Gia vị', '2025-03-15', '2025-07-23', 182955, N'hộp', 65),
(N'Tiêu đen', N'Gia vị', '2025-03-21', '2025-08-15', 167399, N'nguyên hộp', 42),
(N'Ớt', N'Rau củ', '2025-03-19', '2025-06-18', 171982, N'hộp', 33),
(N'Tỏi', N'Gia vị', '2025-04-02', '2025-06-17', 120778, N'lít', 38),
(N'Hành tím', N'Gia vị', '2025-03-27', '2025-06-16', 180156, N'nguyên hộp', 36),
(N'Cà rốt', N'Rau củ', '2025-03-21', '2025-07-03', 136978, N'nguyên gói', 45),
(N'Khoai tây', N'Rau củ', '2025-03-14', '2025-06-02', 123683, N'nguyên gói', 50),
(N'Bắp cải', N'Rau củ', '2025-03-22', '2025-05-27', 124481, N'hộp', 25),
(N'Xà lách', N'Rau củ', '2025-03-23', '2025-06-22', 21851, N'nguyên hộp', 48),
(N'Dầu ăn', N'Gia vị', '2025-03-15', '2025-05-26', 49946, N'gói', 70),
(N'Sữa đặc', N'Khác', '2025-03-21', '2025-07-06', 145193, N'nguyên hộp', 27),
(N'Gừng', N'Gia vị', '2025-03-15', '2025-05-23', 187755, N'bó', 40),
(N'Hành lá', N'Rau củ', '2025-03-26', '2025-06-16', 38239, N'gói', 32),
(N'Nho đỏ Pháp', N'Trái cây', '2025-03-19', '2025-06-05', 39418, N'nguyên hộp', 20),
(N'Nho trắng Ý', N'Trái cây', '2025-03-27', '2025-07-17', 133432, N'nguyên gói', 18),
(N'Gạo nếp cái hoa vàng', N'Gạo', '2025-03-31', '2025-06-12', 172263, N'nguyên hộp', 60),
(N'Men rượu truyền thống', N'Gia vị', '2025-03-24', '2025-06-01', 180658, N'nguyên chai', 23),
(N'Siro chanh dây', N'Đồ uống', '2025-03-30', '2025-07-27', 109018, N'nguyên hộp', 15),
(N'Siro đào', N'Đồ uống', '2025-03-26', '2025-07-18', 66186, N'nguyên hộp', 12),
(N'Soda', N'Đồ uống', '2025-03-31', '2025-06-17', 175019, N'nguyên hộp', 28),
(N'Tonic', N'Đồ uống', '2025-03-29', '2025-07-06', 159205, N'nguyên chai', 18),
(N'Đá viên tinh khiết', N'Đồ uống', '2025-03-27', '2025-06-07', 122104, N'nguyên chai', 40),
(N'Rượu nền vodka', N'Đồ uống', '2025-04-01', '2025-06-29', 198143, N'nguyên gói', 10);


INSERT INTO BAN (LoaiBan, SoLuongCho, SoLuongCon, TrangThai) VALUES
(N'Bàn thường', 4, 4, N'Còn bàn'),
(N'Bàn thường', 2, 2, N'Còn bàn'),
(N'Bàn luxury', 6, 0, N'Hết bàn'),
(N'Bàn VIP', 8, 0, N'Hết bàn'),
(N'Bàn thường', 4, 4, N'Còn bàn'),
(N'Bàn thường', 4, 0, N'Hết bàn'),
(N'Bàn luxury', 6, 6, N'Còn bàn'),
(N'Bàn VIP', 10, 10, N'Còn bàn'),
(N'Bàn thường', 2, 0, N'Hết bàn'),
(N'Bàn thường', 4, 4, N'Còn bàn'),
(N'Bàn thường', 4, 4, N'Còn bàn'),
(N'Bàn thường', 2, 0, N'Hết bàn'),
(N'Bàn Luxury bản giới hạn', 20, 0, N'Hết bàn'),
(N'Bàn VIP', 8, 8, N'Còn bàn'),
(N'Bàn thường', 4, 0, N'Hết bàn'),
(N'Bàn thường', 2, 2, N'Còn bàn'),
(N'Bàn luxury', 6, 6, N'Còn bàn'),
(N'Bàn VIP', 10, 0, N'Hết bàn'),
(N'Bàn thường', 4, 4, N'Còn bàn'),
(N'Bàn thường', 4, 4, N'Còn bàn');

INSERT INTO MONAN (TenMon, DonViTinh, DonGia, TrangThai, MaNhom) VALUES
(N'Gỏi cuốn', N'Cái', 57366, N'Còn Món', 1),
(N'Nem rán', N'Phần', 51743, N'Còn Món', 1),
(N'Bánh xèo miền Tây', N'Cái', 55812, N'Còn Món', 1),
(N'Cơm tấm sườn bì', N'Đĩa', 77576, N'Còn Món', 2),
(N'Phở bò tái', N'Tô', 46799, N'Còn Món', 2),
(N'Bún bò Huế', N'Tô', 39088, N'Còn Món', 2),
(N'Mì Quảng', N'Tô', 41394, N'Còn Món', 6),
(N'Bánh cuốn nóng', N'Đĩa', 61210, N'Còn Món', 6),
(N'Bánh mì chảo', N'Phần', 32857, N'Còn Món', 6),
(N'Xôi gà', N'Hộp', 56263, N'Còn Món', 6),
(N'Chè ba màu', N'Ly', 45233, N'Còn Món', 3),
(N'Bánh bèo Huế', N'Chén', 40596, N'Còn Món', 3),
(N'Súp cua', N'Tô', 47032, N'Còn Món', 3),
(N'Trà đào cam sả', N'Ly', 67836, N'Còn Món', 5),
(N'Sinh tố bơ', N'Ly', 42623, N'Còn Món', 4),
(N'Coca Cola', N'Chai', 60083, N'Còn Món', 4),
(N'Lẩu hải sản', N'Nồi', 70732, N'Còn Món', 8),
(N'Lẩu bò nhúng giấm', N'Nồi', 56354, N'Còn Món', 8),
(N'Cơm chay thập cẩm', N'Đĩa', 74433, N'Còn Món', 7),
(N'Bún riêu chay', N'Tô', 72982, N'Còn Món', 7),
(N'Tôm hùm nướng phô mai', N'Phần', 1530771, N'Còn Món', 9),
(N'Lẩu cá hồi Sapa', N'Nồi', 2361439, N'Còn Món', 8),
(N'Bò Wagyu nướng đá', N'Phần', 1791654, N'Còn Món', 9),
(N'Cua hoàng đế hấp', N'Phần', 2079513, N'Còn Món', 9),
(N'Combo hải sản đặc biệt', N'Set', 2293877, N'Còn Món', 9),
(N'Rượu Hennessy Paradis', N'Chai', 3400000, N'Còn Món', 4),
(N'Rượu Hibiki 21 năm', N'Chai', 4100000, N'Còn Món', 4),
(N'Rượu Yamazaki 18 năm', N'Chai', 4500000, N'Còn Món', 4),
(N'Rượu Glenfiddich 21 năm', N'Chai', 6600000, N'Còn Món', 4),
(N'Rượu MaCallan Rare Cask', N'Chai', 3300000, N'Còn Món', 4),
(N'Rượu Laphroaig 25 năm', N'Chai', 4200000, N'Còn Món', 4),
(N'Rượu Highland Park 18 năm', N'Chai', 8400000, N'Còn Món', 4),
(N'Rượu Louis XIII mini', N'Chai', 7100000, N'Còn Món', 4),
(N'Rượu Dom Pérignon Rose', N'Chai', 8200000, N'Còn Món', 4),
(N'Rượu Krug Vintage', N'Chai', 5700000, N'Còn Món', 4),
(N'Rượu Vang Ý Tignanello', N'Chai', 3100000, N'Còn Món', 4),
(N'Rượu Bordeaux Grand Cru', N'Chai', 9100000, N'Còn Món', 4),
(N'Rượu Rémy Martin Club', N'Chai', 7200000, N'Còn Món', 4),
(N'Rượu Glenlivet 18 năm', N'Chai', 6300000, N'Còn Món', 4),
(N'Rượu Beluga Gold Line', N'Chai', 3700000, N'Còn Món', 4);



INSERT INTO NHANVIEN (HoTen, NgaySinh, GioiTinh, SoDienThoai, DiaChi, ChucVu, MaQuanLy, LuongCoBan) VALUES
-- Quản lý
(N'Ngô Gia Bình', '1996-07-11', N'Nam', '0977613007', N'Đà Nẵng', N'Quản lý', NULL, 7200000),
(N'Nguyễn Thanh Nam', '1994-09-18', N'Nam', '0953878843', N'TP.HCM', N'Quản lý', NULL, 7400000),
(N'Ngô Gia Tú', '1997-02-07', N'Nữ', '0968427260', N'Hải Phòng', N'Quản lý', NULL, 8550000),
(N'Nguyễn Nhật Lan', '1994-06-24', N'Nam', '0998832020', N'Cần Thơ', N'Quản lý', NULL, 5650000),
(N'Đặng Khánh Hùng', '1995-02-13', N'Nữ', '0942463808', N'Đà Nẵng', N'Quản lý', NULL, 7800000)

INSERT INTO NHANVIEN (HoTen, NgaySinh, GioiTinh, SoDienThoai, DiaChi, ChucVu, MaQuanLy, LuongCoBan) VALUES
-- Nhân viên
(N'Phạm Minh An', '1997-11-20', N'Nam', '0940899397', N'Cần Thơ', N'Phục vụ', 1, 7200000),
(N'Ngô Phúc Phong', '1999-10-10', N'Nam', '0984331446', N'TP.HCM', N'Phục vụ', 1, 9200000),
(N'Lê Hải Phong', '1994-12-27', N'Nữ', '0978402962', N'Cần Thơ', N'Phục vụ', 1, 7300000),
(N'Phạm Gia Lan', '1993-05-05', N'Nữ', '0994819319', N'TP.HCM', N'Đầu bếp', 1, 9500000),
(N'Bùi Thị Tú', '1995-05-14', N'Nam', '0918742201', N'Bình Dương', N'Thu ngân', 1, 7200000),
(N'Lê Thanh Dung', '1994-12-01', N'Nữ', '0999680763', N'Cần Thơ', N'Đầu bếp', 1, 6100000),
(N'Lê Phúc Phong', '1995-03-21', N'Nam', '0935549587', N'TP.HCM', N'Đầu bếp', 1, 10300000),
(N'Đỗ Thanh Việt', '1994-11-11', N'Nam', '0961348290', N'Bình Dương', N'Kế toán', 1, 10250000),
(N'Đỗ Phúc Việt', '1996-07-14', N'Nữ', '0999486872', N'Hà Nội', N'Phục vụ', 1, 5650000),
(N'Ngô Khánh Linh', '1997-08-11', N'Nữ', '0994366622', N'Bình Dương', N'Phục vụ', 1, 9050000),
(N'Đặng Gia Hùng', '1999-01-04', N'Nam', '0969194871', N'Cần Thơ', N'Đầu bếp', 1, 9200000),
(N'Bùi Thanh Nam', '1999-10-09', N'Nữ', '0955892146', N'Bình Dương', N'Phục vụ', 1, 6900000),
(N'Ngô Khánh Hùng', '1998-07-14', N'Nữ', '0913742021', N'Cần Thơ', N'Đầu bếp', 2, 6600000),
(N'Trần Quốc An', '1994-12-24', N'Nữ', '0986902868', N'Đà Nẵng', N'Kế toán', 2, 9300000),
(N'Nguyễn Hải Nam', '1993-07-01', N'Nam', '0929638223', N'Cần Thơ', N'Thu ngân', 1, 11400000),
(N'Nguyễn Văn An', '1995-02-08', N'Nữ', '0916129886', N'Hà Nội', N'Phục vụ', 3, 10400000),
(N'Võ Minh Linh', '1999-07-11', N'Nam', '0949581184', N'TP.HCM', N'Phục vụ', 3, 9000000),
(N'Đỗ Gia Nam', '1997-07-08', N'Nam', '0988376941', N'Hải Phòng', N'Đầu bếp', 4, 7500000),
(N'Hoàng Nhật Dung', '1999-05-25', N'Nữ', '0964553581', N'Hải Phòng', N'Đầu bếp', 4, 8400000),
(N'Trần Hải Lan', '1999-05-03', N'Nam', '0997015796', N'Cần Thơ', N'Thu ngân', 4, 9550000),
(N'Trần Nhật Dung', '1995-10-19', N'Nữ', '0978896061', N'Hà Nội', N'Đầu bếp', 2, 7550000),
(N'Nguyễn Khánh Việt', '1997-10-08', N'Nam', '0917769511', N'Đà Nẵng', N'Đầu bếp', 3, 5300000),
(N'Ngô Văn Linh', '1993-02-04', N'Nữ', '0975927226', N'Hải Phòng', N'Phục vụ', 4, 9950000),
(N'Phạm Thị Bình', '1999-10-26', N'Nữ', '0987254189', N'Đà Nẵng', N'Đầu bếp', 1, 5150000),
(N'Đặng Thị Chi', '1996-03-06', N'Nữ', '0958625131', N'Đà Nẵng', N'Phục vụ', 5, 10500000);


INSERT INTO TAIKHOAN (TenDangNhap, MatKhau, NgayTao, TrangThai, LoaiTaiKhoan, MaNhanVien) VALUES
('admin1', '123456', '2025-04-16', N'Hoạt động', N'Quản lý nhân sự', 1),
('admin2', '123456', '2025-04-16', N'Hoạt động', N'Quản lý kho và bếp', 6),
('admin3', '123456', '2025-04-16', N'Hoạt động', N'Quản lý nhân sự', 7),
('nhanvien3', 'nhanvien', '2025-04-16', N'Hoạt động', N'Phục vụ', 8),
('nhanvien4', 'nhanvien', '2025-04-16', N'Hoạt động', N'Phục vụ', 9),
('nhanvien5', 'nhanvien', '2025-04-16', N'Hoạt động', N'Phục vụ', 10),
('nhanvien6', 'nhanvien', '2025-04-16', N'Hoạt động', N'Phục vụ', 11),
('nhanvien7', 'nhanvien', '2025-04-16', N'Hoạt động', N'Phục vụ', 12),
('nhanvien8', 'nhanvien', '2025-04-16', N'Hoạt động', N'Phục vụ', 13);
delete from TAIKHOAN
INSERT INTO PHIEUNHAPHANG (NgayTao, NhaCungCap, MaNhanVienNhap) VALUES
('2025-04-02', N'Nhà cung cấp A', 14),
('2025-04-13', N'Nhà cung cấp miền Tây', 15),
('2025-04-03', N'Nhà cung cấp miền Tây', 16),
('2025-04-08', N'Kho nguyên liệu chế biến', 10),
('2025-04-02', N'Kho nguyên liệu chế biến', 4),
('2025-04-14', N'Kho nguyên liệu chế biến', 17),
('2025-04-15', N'Nhà cung cấp miền Tây', 2),
('2025-04-07', N'Nhập rượu cao cấp', 15),
('2025-04-01', N'Thực đơn mới', 10),
('2025-04-15', N'Thực đơn mới', 18),
('2025-04-01', N'Định kỳ tuần', 4),
('2025-04-11', N'Nhập rượu cao cấp', 19),
('2025-04-13', N'Nhà cung cấp miền Tây', 20),
('2025-04-11', N'Định kỳ tuần', 21),
('2025-04-12', N'Định kỳ tuần', 16),
('2025-04-04', N'Nhập rượu cao cấp', 22),
('2025-04-03', N'Nhập rượu cao cấp', 22),
('2025-04-03', N'Nhập rượu cao cấp', 23),
('2025-04-06', N'Kho nguyên liệu chế biến', 24),
('2025-04-07', N'Kho nguyên liệu chế biến', 25);

INSERT INTO PHIEUTHONGKE (NgayThongKe, DoanhThu, Thu, Chi, MaNhanVien) VALUES
('2025-04-01', 6172575, 3774009, 2398566, 19),
('2025-04-02', 5655660, 202159, 5453501, 20),
('2025-04-03', 1029781, -4366427, 5396209, 11),
('2025-04-04', 1153305, -2780992, 3934298, 26),
('2025-04-05', 30128904, 30128904, 0, 6),
('2025-04-06', 2492996, 975460, 1517536, 27),
('2025-04-07', 9789191, 5010582, 4778609, 1),
('2025-04-08', 3023701, 697299, 2326402, 25),
('2025-04-09', 12552934, 12552934, 0, 12),
('2025-04-10', 16271450, 16271450, 0, 19),
('2025-04-11', 9192085, 6543172, 2648912, 26),
('2025-04-12', 7112232, 5569227, 1543004, 28),
('2025-04-13', 5687236, 15808678, 5685656, 20),
('2025-04-14', 12379565, 11108119, 1271445, 14),
('2025-04-15', 1016609, -2268396, 3285006, 11);

INSERT INTO CHITIETNHAPHANG (MaPhieuNhap, MaNguyenLieu, SoLuongNhap, DonGia, ThanhTien) VALUES
(1, 1, 5.59, 116134, 649189.06),
(1, 35, 5.78, 177290, 1024736.20),
(1, 31, 8.77, 183810, 1612013.70),
(1, 2, 2.44, 86300, 210572.00),
(2, 23, 8.12, 98397, 798983.64),
(2, 1, 3.73, 113453, 423179.69),
(2, 14, 9.07, 131070, 1188804.90),
(2, 12, 7.67, 52215, 400489.05),
(2, 30, 4.21, 132497, 557812.37),
(3, 15, 2.8, 186557, 522359.60),
(3, 7, 3.3, 169985, 560950.50),
(3, 38, 5.21, 110355, 574949.55),
(3, 21, 8.63, 105390, 909515.70),
(4, 20, 8.82, 129840, 1145188.80),
(4, 33, 8.55, 50757, 433972.35),
(4, 31, 4.91, 29221, 143475.11),
(4, 22, 9.37, 64436, 603765.32),
(5, 30, 8.84, 51173, 452369.32),
(5, 5, 10.0, 26360, 263600.00),
(5, 32, 9.01, 105276, 948536.76),
(5, 3, 8.34, 35070, 292983.80),
(6, 22, 1.06, 65925, 69880.50),
(6, 17, 3.88, 174087, 675451.56),
(6, 25, 3.4, 35747, 121539.80),
(6, 38, 7.42, 43278, 321157.56),
(6, 31, 1.26, 66226, 83444.76),
(7, 34, 2.69, 152443, 410073.67),
(7, 5, 9.62, 124354, 1196368.48),
(7, 2, 7.44, 104742, 779268.48),
(8, 28, 2.1, 198183, 416184.30),
(8, 16, 9.42, 53714, 505968.88),
(8, 25, 9.82, 196464, 1928871.48),
(8, 5, 1.85, 164628, 304561.80),
(9, 14, 2.4, 150228, 360547.20),
(9, 30, 5.86, 21072, 123493.92),
(9, 17, 1.36, 81168, 110388.48),
(10, 17, 6.22, 70702, 439968.44),
(10, 18, 5.64, 22931, 129354.84),
(10, 36, 8.32, 39696, 330396.72),
(11, 17, 3.84, 25112, 96429.12),
(11, 20, 4.68, 165259, 773011.32),
(11, 37, 6.48, 144183, 933289.84),
(12, 19, 5.83, 49656, 289513.48),
(12, 23, 5.28, 119208, 629388.24),
(13, 13, 5.05, 113504, 573191.20),
(13, 16, 4.06, 103812, 421478.72),
(13, 35, 6.95, 110007, 764548.65),
(13, 3, 7.84, 71067, 557167.28),
(14, 26, 3.81, 185847, 708064.07),
(14, 11, 9.06, 112795, 1021683.70),
(15, 21, 2.43, 59052, 143488.36),
(15, 39, 8.8, 159035, 1399488.00),
(16, 9, 7.99, 194862, 1557396.38),
(16, 15, 6.61, 30047, 198626.67),
(16, 8, 2.74, 164047, 449493.00),
(16, 36, 9.51, 181835, 1731561.85),
(17, 31, 5.18, 107302, 556915.36),
(17, 37, 1.82, 42780, 77879.60),
(18, 4, 2.04, 159734, 325848.36),
(18, 11, 6.47, 70198, 454197.06),
(18, 35, 7.44, 107853, 801424.32),
(18, 28, 6.38, 56938, 363654.44),
(18, 33, 2.57, 96895, 249011.15),
(19, 39, 8.27, 32106, 265429.62),
(19, 1, 7.07, 177089, 1250870.23),
(20, 24, 9.38, 84976, 797222.88),
(20, 13, 6.46, 71288, 460900.48),
(20, 8, 2.88, 43186, 124359.68),
(20, 39, 1.9, 126647, 240629.30);


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
(1, 5, 1);

INSERT INTO HOADON (MaNhanVienLap, NgayLapHoaDon, TongTienTruocGiam, SoTienGiam, TongTienPhaiTra, TrangThai, MaKhuyenMai, MaKhachHang) VALUES
(23, '2025-04-10', 9353646, 20000, 10513336, N'Đã thanh toán', 16, 3),
(2, '2025-04-11', 8108980, 0, 8758091, N'Chưa thanh toán', NULL, 1),
(14, '2025-04-05', 12964988, 0, 13453924, N'Chưa thanh toán', 1, 4),
(4, '2025-04-05', 13615130, 10000, 14025555, N'Đã thanh toán', 11, 6),
(1, '2025-04-09', 1021315, 0, 402992, N'Đã thanh toán', NULL, 5),
(28, '2025-04-09', 8686214, 0, 1148131, N'Đã thanh toán', NULL, 7),
(29, '2025-04-03', 4397672, 0, 1029781, N'Đã thanh toán', NULL, 9),
(27, '2025-04-09', 4594582, 10000, 1642819, N'Chưa thanh toán', 6, 6),
(8, '2025-04-10', 6605998, 0, 1887597, N'Đã thanh toán', NULL, 10),
(13, '2025-04-05', 1586907, 0, 343543, N'Đã thanh toán', NULL, 11),
(16, '2025-04-15', 3306137, 50000, 1016609, N'Chưa thanh toán', 20, 12),
(2, '2025-04-01', 9560640, 10000, 423951, N'Chưa thanh toán', 14, 1),
(9, '2025-04-05', 3839909, 0, 721675, N'Đã thanh toán', NULL, 1);


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
(5, 4, N'Rất đáng tiền, sẽ quay lại.', '2025-04-06', 5);


INSERT INTO CHITIETDATBAN (MaKhachHang, MaBan, SoLuongBan) VALUES
(1, 1, 5),
(2, 2, 5),
(3, 3, 10),
(4, 4, 9),
(5, 5, 8),
(6, 6, 2),
(7, 7, 10),
(8, 8, 9),
(9, 9, 8),
(10, 10, 3),
(11, 11, 10),
(12, 12, 10),
(13, 13, 5),
(14, 14, 2),
(15, 15, 8),
(16, 16, 9),
(17, 17, 7),
(18, 18, 7),
(19, 19, 2),
(20, 20, 10);


INSERT INTO NHANVIEN_CALAMVIEC (NgayLam, MaNhanVien, MaCa) VALUES
('2025-04-12', 2, 3),
('2025-04-12', 8, 6),
('2025-04-11', 7, 3),
('2025-04-12', 10, 2),
('2025-04-12', 15, 4),
('2025-04-12', 11, 5),
('2025-04-11', 20, 2),
('2025-04-12', 23, 1),
('2025-04-10', 4, 2),
('2025-04-10', 6, 1),
('2025-04-12', 21, 6),
('2025-04-10', 19, 3),
('2025-04-11', 11, 3),
('2025-04-12', 10, 6),
('2025-04-12', 15, 5),
('2025-04-11', 1, 4),
('2025-04-11', 12, 6),
('2025-04-11', 20, 4),
('2025-04-10', 25, 1),
('2025-04-11', 23, 3),
('2025-04-12', 17, 3),
('2025-04-12', 21, 2),
('2025-04-12', 26, 1),
('2025-04-11', 1, 5),
('2025-04-11', 14, 4),
('2025-04-10', 4, 6),
('2025-04-12', 3, 4),
('2025-04-11', 8, 4),
('2025-04-10', 28, 4),
('2025-04-12', 5, 6),
('2025-04-12', 18, 2),
('2025-04-12', 24, 1),
('2025-04-12', 22, 6),
('2025-04-12', 30, 5),
('2025-04-12', 27, 4),
('2025-04-12', 29, 3),
('2025-04-12', 9, 5),
('2025-04-12', 13, 4),
('2025-04-12', 16, 6);

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
(13, 3, 3);

-------------------------------------------------READ------------------------------------
-- DANH SÁCH TẤT CẢ BẢNG - select TOÀN BỘ DỮ LIỆU
select * from KHACHHANG
select * from MONAN
select * from NHOMMONAN
select * from NHANVIEN
select * from TAIKHOAN
update TAIKHOAN set LoaiTaiKhoan = N'Phục Vụ' where MaTaiKhoan = 2;
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
select * from PHIEUTHONGKE

GO
CREATE TRIGGER trg_CapNhatSoLuongVaTrangThaiBan
ON CHITIETDATBAN
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Tạo một bảng tạm để chứa mã bàn bị ảnh hưởng
    DECLARE @AffectedBanIDs TABLE (MaBan INT);

    -- Lấy mã bàn từ các dòng vừa được thêm
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO @AffectedBanIDs (MaBan)
        SELECT DISTINCT MaBan FROM inserted;
    END

    -- Lấy mã bàn từ các dòng vừa bị xóa
    IF EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO @AffectedBanIDs (MaBan)
        SELECT DISTINCT MaBan FROM deleted;
    END

    -- Cập nhật số lượng còn lại cho các bàn bị ảnh hưởng
    UPDATE b
    SET b.SoLuongCon = b.SoLuongCho - ISNULL((SELECT SUM(SoLuongBan) FROM CHITIETDATBAN cdb WHERE cdb.MaBan = b.MaBan), 0)
    FROM BAN b
    JOIN (SELECT DISTINCT MaBan FROM @AffectedBanIDs) aff ON b.MaBan = aff.MaBan;

    -- Cập nhật trạng thái dựa trên số lượng còn lại
    UPDATE BAN
    SET TrangThai = CASE
                        WHEN SoLuongCon > 0 THEN N'Còn bàn'
                        ELSE N'Hết bàn'
                    END
    WHERE MaBan IN (SELECT DISTINCT MaBan FROM @AffectedBanIDs);
END
GO

-- Trigger này ngăn việc xóa một bàn nếu nó đã được đặt
GO
CREATE TRIGGER trg_NganXoaBanDaDat
ON BAN
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaBan INT;
    SELECT @MaBan = MaBan FROM deleted;

    -- Kiểm tra xem bàn có trong chi tiết đặt bàn không
    IF EXISTS (SELECT 1 FROM CHITIETDATBAN WHERE MaBan = @MaBan)
    BEGIN
        -- Nếu có, báo lỗi và không cho xóa
        RAISERROR (N'Không thể xóa. Bàn này đã được khách hàng đặt.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    ELSE
    BEGIN
        -- Nếu không, tiến hành xóa
        DELETE FROM BAN WHERE MaBan = @MaBan;
    END
END
GO
-- Bước 2: Tạo Trigger để tự động cập nhật hóa đơn
CREATE TRIGGER trg_CapNhatTongTienHoaDon
ON CHITIETHOADON
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy tất cả các mã hóa đơn bị ảnh hưởng từ cả hai bảng 'inserted' và 'deleted'
    DECLARE @AffectedHoaDonIDs TABLE (MaHoaDon INT);
    INSERT INTO @AffectedHoaDonIDs (MaHoaDon) SELECT MaHoaDon FROM inserted;
    INSERT INTO @AffectedHoaDonIDs (MaHoaDon) SELECT MaHoaDon FROM deleted;

    -- Duyệt qua từng hóa đơn bị ảnh hưởng để cập nhật
    DECLARE @CurrentMaHD INT;
    DECLARE cur CURSOR FOR SELECT DISTINCT MaHoaDon FROM @AffectedHoaDonIDs;
    OPEN cur;
    FETCH NEXT FROM cur INTO @CurrentMaHD;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Khai báo các biến để tính toán
        DECLARE @TongTienTruocGiam MONEY;
        DECLARE @PhanTramGiam INT; -- Đổi kiểu dữ liệu sang INT
        DECLARE @SoTienGiam MONEY;
        DECLARE @TongTienPhaiTra MONEY;

        -- Tính tổng tiền trước giảm bằng cách SUM từ chi tiết hóa đơn
        SELECT @TongTienTruocGiam = ISNULL(SUM(ct.SoLuong * m.DonGia), 0)
        FROM CHITIETHOADON ct
        JOIN MONAN m ON ct.MaMonAn = m.MaMonAn
        WHERE ct.MaHoaDon = @CurrentMaHD;

        -- Lấy phần trăm giảm giá từ khuyến mãi của hóa đơn
        SELECT @PhanTramGiam = ISNULL(km.PhanTramGiamGia, 0)
        FROM HOADON hd
        LEFT JOIN KHUYENMAI km ON hd.MaKhuyenMai = km.MaKhuyenMai
        WHERE hd.MaHoaDon = @CurrentMaHD;

        -- Tính toán các giá trị còn lại (chia cho 100.0 để ra tỷ lệ)
        SET @SoTienGiam = @TongTienTruocGiam * (@PhanTramGiam / 100.0);
        SET @TongTienPhaiTra = @TongTienTruocGiam - @SoTienGiam;

        -- Cập nhật lại hóa đơn chính
        UPDATE HOADON
        SET
            TongTienTruocGiam = @TongTienTruocGiam,
            SoTienGiam = @SoTienGiam,
            TongTienPhaiTra = @TongTienPhaiTra
        WHERE
            MaHoaDon = @CurrentMaHD;

        FETCH NEXT FROM cur INTO @CurrentMaHD;
    END

    CLOSE cur;
    DEALLOCATE cur;
END
go
	create proc sp_ThemMonAn(@TenMon nvarchar(50),@DonViTinh nvarchar(50),@DonGia money,@TrangThai nvarchar(50),@MaNhom nvarchar(50))
	as
	begin
		insert into MONAN values(@TenMon,@DonViTinh,@DonGia,@TrangThai,@MaNhom)
		print(N'Thêm thành công')
	end
go
--exec sp_CapNhatSoLuongMonAn 'MA005',40
--select *from MONAN

--> Thủ tục
go
	create proc sp_XoaMonAn(@MaMonAn int)
	as
	begin
		if(not exists(select *from MONAN where MaMonAn = @MaMonAn))
			raiserror(N'Không tồn tại món ăn đó', 16, 1)
		else
			begin
				delete from MONAN where MaMonAn = @MaMonAn
				print(N'Xóa thành công')
			end
	end
go

go
	create proc sp_CapNhatMonAn(@MaMonAn int, @TenMoi nvarchar(50), @DonViTinh nvarchar(50), @GiaMoi money, @TrangThai nvarchar(50), @MaNhom int)
	as
	begin
		if(not exists(select *from MONAN where MaMonAn = @MaMonAn))
			raiserror(N'Không tồn tại món ăn đó', 16, 1)
		else if(not exists(select * from NHOMMONAN where MaNhom = MaNhom))
			raiserror(N'Không tồn nhóm món ăn đó', 16, 1)
			begin
				update MONAN set TenMon = @TenMoi, DonViTinh = @DonViTinh, DonGia = @GiaMoi, TrangThai = @TrangThai, MaNhom = @MaNhom where MaMonAn = @MaMonAn
				print(N'Cập nhật thành công')
			end
	end
go
--Kiểm tra tốc độ truy vấn
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
go
--top 5 món ăn bán chạy nhất
select top 5 ma.TenMon, sum(ct.SoLuong) as TongSoLuongBan
from CHITIETHOADON ct
join MONAN ma on ct.MaMonAn = ma.MaMonAn
group by ma.TenMon
order by TongSoLuongBan desc;

-- 2. MÓN ĂN TỒN KHO NHIỀU NHẤT (ít được gọi → tồn kho cao)
select top 1 MaMonAn, TenMon, SoLuongCon
from MONAN
order by SoLuongCon desc;
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
order by count(hd.MaHoaDon) desc;
go

-- ======================================================================================
-- 5. DANH SÁCH MÓN ĂN ĐƯỢC GỌI TRONG BÀN (theo lịch sử đặt bàn)
-- Truy vấn món ăn trong một bàn cụ thể (ví dụ: bàn B031)
select db.MaBan, b.LoaiBan, ma.TenMon, cthd.SoLuong
from CHITIETDATBAN db
join BAN b on db.MaBan = b.MaBan
join HOADON hd on db.MaKhachHang = hd.MaKhachHang
join CHITIETHOADON cthd on hd.MaHoaDon = cthd.MaHoaDon
join MONAN ma on cthd.MaMonAn = ma.MaMonAn
where db.MaBan = 'B031';
go

-- ======================================================================================
-- 6. CHI TIẾT PHIẾU NHẬP HÀNG
select p.MaPhieuNhap, nl.TenNguyenLieu, c.SoLuongNhap, c.DonGia, c.ThanhTien
from CHITIETNHAPHANG c
join NGUYENLIEU nl on c.MaNguyenLieu = nl.MaNguyenLieu
join PHIEUNHAPHANG p on c.MaPhieuNhap = p.MaPhieuNhap;
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

---------------------------------------------update------------
-- 1. Cập nhật giá món ăn
update MONAN
set DonGia = 85000
where MaMonAn = 4;

-- 2. Cập nhật số lượng món ăn còn lại
update MONAN
set SoLuongCon = SoLuongCon - 2
where MaMonAn = 4;

-- 3. Cập nhật trạng thái bàn
update BAN
set TrangThai = N'Hết bàn'
where MaBan = 3;

-- 4. Cập nhật mã khuyến mãi trong hóa đơn
update HOADON
set MaKhuyenMai = 5
where MaHoaDon = 2;

-- 5. Cập nhật trạng thái hóa đơn
update HOADON
set TrangThai = N'Đã thanh toán'
where MaHoaDon = 2;
-----------------------------------------------------delete-----------------
-- 1. Xóa món ăn theo mã
delete from MONAN
where MaMonAn = 5;

-- 2. Xóa hóa đơn (chú ý ràng buộc khóa ngoại)
delete from CHITIETHOADON
where MaHoaDon = 5;

delete from HOADON
where MaHoaDon = 5;

-- 3. Xóa nhân viên (phải xử lý các bảng liên quan trước)
delete from NHANVIEN_CALAMVIEC
where MaNhanVien = 1;

delete from NHANVIEN
where MaNhanVien = 1;

-- 4. Xóa khách hàng
delete from CHITIETDATBAN where MaKhachHang = 5;
delete from HOADON where MaKhachHang = 5;
delete from KHACHHANG where MaKhachHang = 5;


-- ===================== THỐNG KÊ & BÁO CÁO =====================

-- 1. đếm số lượng bản ghi theo nhóm (group by, count)

-- đếm số lượng món ăn theo nhóm món ăn
select 
    NHOMMONAN.TenNhom,
    count(MONAN.MaMonAn) as SoLuongMonAn,
    sum(MONAN.SoLuongCon) as TongSoLuongCon
from NHOMMONAN
left join MONAN on NHOMMONAN.MaNhom = MONAN.MaNhom
group by NHOMMONAN.TenNhom;

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

-- đếm số lượng món ăn tồn kho
select 
    NHOMMONAN.TenNhom,
    sum(MONAN.SoLuongCon) as TongSoLuongTonKho,
    count(case when MONAN.SoLuongCon <= 10 then 1 end) as SoMonGanHet
from MONAN
join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
group by NHOMMONAN.TenNhom;

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

-- Báo cáo món ăn bán chạy nhất
select 
    monan.TenMon,
    nhommonan.TenNhom,
    sum(chitiethoadon.SoLuong) as TongSoLuongBan,
    sum(chitiethoadon.SoLuong * monan.DonGia) as TongDoanhThuMon,
    count(distinct danhgia.MaKhachHang) as SoLuongDanhGia,
    avg(case 
        when danhgia.DiemDanhGia = N'5 sao' then 5 
        when danhgia.DiemDanhGia = N'4 sao' then 4 
        when danhgia.DiemDanhGia = N'3 sao' then 3 
        when danhgia.DiemDanhGia = N'2 sao' then 2 
        when danhgia.DiemDanhGia = N'1 sao' then 1 
        else 0 
    end) as DiemDanhGiaTrungBinh
from chitiethoadon
join monan on chitiethoadon.MaMonAn = monan.MaMonAn
join nhommonan on monan.MaNhom = nhommonan.MaNhom
join hoadon on chitiethoadon.MaHoaDon = hoadon.MaHoaDon
left join danhgia on monan.MaMonAn = danhgia.MaMonAn
where hoadon.TrangThai = N'Đã thanh toán'
group by monan.TenMon, nhommonan.TenNhom
order by TongSoLuongBan desc;

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

--> Giao dịch: 

-- 1. Giao dịch: Tạo hoá đơn
go
alter proc sp_TaoHoaDon
    @MaNhanVien int,
    @NgayLap datetime,
    @TongTien money,
    @GiamGia money,
    @PhaiTra money,
    @TrangThai nvarchar(50),
    @MaKhuyenMai int,
    @MaKhachHang int,
    @MaMonAn int,
    @SoLuong int
as
begin
    begin transaction
    begin try
        insert into HOADON values (@MaNhanVien, @NgayLap, @TongTien, @GiamGia, @PhaiTra, @TrangThai, @MaKhuyenMai, @MaKhachHang)
		
        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go



-- 2. Giao dịch: Nhập hàng và chi tiết nguyên liệu
create proc sp_NhapHang
    @MaPhieu int,
    @NgayTao datetime,
    @SoLuong int,
    @NhaCungCap nvarchar(50),
    @MaNV int
as
begin
    begin transaction
    begin try
        insert into PHIEUNHAPHANG values (@MaPhieu, @NgayTao, @SoLuong, @NhaCungCap, @MaNV)
        commit
    end try
    begin catch
        rollback
        print error_message()
    end catch
end
go

-- 3. Giao dịch: Hủy hóa đơn
create proc sp_HuyHoaDon
    @MaHoaDon int
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

-- 4. Giao dịch: Đánh dấu hóa đơn đã hoàn tiền
create proc sp_HoanTienHoaDon
    @MaHoaDon int
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

-- 5. Giao dịch: Gộp bàn
create proc sp_gopBan
    @MaKH int,
    @MaBanCu int,
    @MaBanMoi int
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



--> Thủ tục

--> Thủ tục thêm một món ăn



select * from MONAN
--exec sp_ThemMonAn 'MA005',N'Trà đào',N'Cốc',20000,N'Còn món','NM03',12
--select *from MONAN
--> Thủ tục cập nhật món ăn

--exec sp_XoaMonAn 'MA005'
--select *from MONAN

--> Thủ tục tìm kiếm món ăn theo từ ví dụ: Bánh tráng -> Bánh tráng trộn, bánh tráng nướng ....
go
	create proc sp_TimMonAn(@KeyWord nvarchar(50))
	as
	begin
		select *from MONAN where TenMon like N'%' + @KeyWord + N'%'
	end
go
--exec sp_TimMonAn N'gà'

-->Thủ tục cập nhật lại giá món ăn


--> Thủ tục thêm bàn mới
go
	create proc sp_ThemBan(@MaBan int,@LoaiBan Nvarchar(50),@SoLuongCho int,@TrangThai nvarchar(50))
	as 
	begin
		if(exists(select *from BAN where MaBan = @MaBan))
			print(N'Đã tồn tại mã bàn đó')
		else
			begin
				insert into BAN values(@MaBan,@LoaiBan,@SoLuongCho,@TrangThai)
				print(N'Thêm thành công')
			end
	end
go


--exec sp_ThemBan 'B03',N'Bàn tròn',6,N'Còn Bàn'
--select *from BAN

--> Cập nhật trạng thái bàn
go
	create proc sp_CapNhatTrangThaiBan(@MaBan int,@TrangThaiMoi nvarchar(50))
	as
	begin
		if(not exists(select *from BAN where MaBan = @MaBan))
			print(N'Không tồn tại mã bàn đó')
		else
			begin
				update BAN set TrangThai = @TrangThaiMoi where MaBan = @MaBan
				print(N'Cập nhật thành công')
			end
	end
go
--exec sp_CapNhatTrangThaiBan 'B03',N'Hết Bàn'
--select *from BAN

--> Xóa bàn 
go
	create proc sp_XoaBan(@MaBan int)
	as
	begin
		if(not exists(select *from BAN where MaBan = @MaBan))
			print(N'Không tồn tại mã bàn đó')
		else
			begin
				delete from BAN where MaBan = @MaBan
				print(N'Xóa thành công')
			end
	end
go

--exec sp_XoaBan 'B03'
--select *from BAN

--> Thủ tục thêm khách hàng
go
	create proc sp_ThemKhachHang (@MaKhachHang int,@TenKhachHang nvarchar(50),@SoDienThoai int,@DiaChi nvarchar(50))
	as
	begin
		if(exists(select *from KHACHHANG where MaKhachHang = @MaKhachHang))
			print(N'Đã tồn tại khách hàng này')
		else
			begin
				insert into KHACHHANG values(@MaKhachHang,@TenKhachHang,@SoDienThoai,@DiaChi)
				print(N'Thêm thành công')
			end
	end
go

--exec sp_ThemKhachHang 'KKH001',N'Hoàng Văn Quyết','0374823461',N'48 Hồ Tùng Mậu'
--select *from KHACHHANG

--> Thủ tục cập nhật thông tin khách hàng
go
	create proc sp_CapNhatThongTinKhachHang(@MaKhachHang int,@DiaChi nvarchar(50),@SoDienThoai int)
	as
	begin
		if(not exists(select *from KHACHHANG where MaKhachHang = @MaKhachHang))
			print(N'Không tồn tại khách hàng này')
		else
			begin
				update KHACHHANG set DiaChi = @DiaChi,SoDienThoai = @SoDienThoai where MaKhachHang = @MaKhachHang
				print(N'Cập nhật thành công')
			end
	end
go
--exec sp_CapNhatThongTinKhachHang 'KKH001',N'40 Hồ Tùng Mậu','0762823461'
--select *from KHACHHANG

--> Thêm ca làm việc 
go
	create proc sp_ThemCaLamViec(@MaCa int,@GioBatDau datetime,@GioKetThuc datetime)
	as
	begin
		if(exists(select *from CALAMVIEC where MaCa = @MaCa))
			print(N'Đã tồn tại ca làm việc đó')
		else
			begin
				insert into CALAMVIEC values(@MaCa,@GioBatDau,@GioKetThuc)
				print(N'Thêm thành công')
			end
	end
go
--> Sửa giờ làm việc của ca đó
go
	create proc sp_SuaGioLamViec(@MaCa int,@GioBatDau datetime,@GioKetThuc datetime)
	as
	begin
		if(not exists(select *from CALAMVIEC where MaCa = @MaCa))
			print(N'Không tồn tại ca làm việc đó')
		else
			begin
				Update CALAMVIEC set GioBatDau = @GioBatDau, GioKetThuc = @GioKetThuc where MaCa = @MaCa
				print(N'Cập nhật thành công thành công')
			end
	end
go
--> Xóa ca làm việc 
go
	create proc sp_XoaCaLamViec(@MaCa int)
	as
	begin
		if(not exists(select *from CALAMVIEC where MaCa = @MaCa))
			print(N'Không tồn tại ca làm việc đó')
		else
			begin
				delete from CALAMVIEC where MaCa = @MaCa
				print(N'Xóa thành công')
			end
	end
go

--> Thêm nguyên liệu mới
go
	create proc sp_ThemNguyenLieu(@MaNguyenLieu int,@TenNguyenLieu nvarchar(50),@Loai nvarchar(50),@NgaySanXuat Datetime,@HanSuDung datetime,@GiaBan money,@DonViTinh nvarchar(30))
	as
	begin
		if(exists(select *from NGUYENLIEU where MaNguyenLieu = @MaNguyenLieu))
			print(N'Đã tồn tại nguyên liệu đó')
		else
			begin
				insert into NGUYENLIEU values(@MaNguyenLieu,@TenNguyenLieu,@Loai,@NgaySanXuat,@HanSuDung,@GiaBan,@DonViTinh)
				print(N'Thêm thành công')
			end
	end
go
--> Điều chỉnh nguyên liệu
go
	create proc sp_DieuChinhNguyenLieu(@MaNguyenLieu int,@GiaBan money)
	as
	begin
		if(not exists(select *from NGUYENLIEU where MaNguyenLieu = @MaNguyenLieu))
			print(N'Không tồn tại nguyên liệu đó')
		else
			begin
				update NGUYENLIEU set GiaBan = @GiaBan where MaNguyenLieu = @MaNguyenLieu
				print(N'Điều chỉnh thành công')
			end
	end
go

-->Xóa nguyên liệu
go
	create proc sp_XoaNguyenLieu(@MaNguyenLieu int)
	as
	begin
		if(not exists(select *from NGUYENLIEU where MaNguyenLieu = @MaNguyenLieu))
			print(N'Không tồn tại nguyên liệu đó')
		else
			begin
				delete from NGUYENLIEU where MaNguyenLieu = @MaNguyenLieu
				print(N'Xóa thành công')
			end
	end
go

-->Thêm nhân viên
go
	create proc sp_ThemNhanVien(@MaNhanVien int,@HoTen nvarchar(50),@NgaySinh Datetime,@GioiTinh nchar(5),@SoDienThoai int,@DiaChi ntext,@Chucvu nvarchar(50),@MaQuanLy int,@LuongCoBan money)
	as
	begin
		if(exists(select *from NHANVIEN where MaNhanVien = @MaNhanVien))
			print(N'Đã tồn tại nhân viên đó')
		else
			begin 
				insert into NHANVIEN values(@MaNhanVien,@HoTen,@NgaySinh,@GioiTinh,@SoDienThoai,@DiaChi,@Chucvu,@MaQuanLy,@LuongCoBan)
				print(N'Thêm thành công')
			end
	end
go
-->Xóa nhân viên
go
	create proc sp_XoaNhanVien(@MaNhanVien int)
	as
	begin
		if(not exists(select *from NHANVIEN where MaNhanVien = @MaNhanVien))
			print(N'Không tồn tại nhân viên đó')
		else
			begin
				delete from NHANVIEN where MaNhanVien = @MaNhanVien
				print(N'Xóa thành công')
			end
	end
go
--> Sửa thông tin nhân viên
go
	create proc sp_SuaThongTinNhanVien(@MaNhanVien int,@SoDienThoai int,@DiaChi ntext,@ChucVu nvarchar(50),@LuongCoBan money)
	as
	begin
		if(not exists(select *from NHANVIEN where MaNhanVien = @MaNhanVien))
			print(N'Không tồn tại nhân viên đó')
		else
			begin
				update NHANVIEN set SoDienThoai = @SoDienThoai,DiaChi = @DiaChi, ChucVu = @ChucVu, LuongCoBan = @LuongCoBan where MaNhanVien = @MaNhanVien
				print(N'Xóa thành công')
			end
	end
go

--> Hàm
--> Hàm trả về tên của người dùng với Mã khách hàng nhập từ bàn phím
go
	create function fn_TraVeTenKhachHang(@MaKhachHang int)
	returns nvarchar(50)
	as
	begin
		declare @TenKhachHang nvarchar(50)
		set @TenKhachHang = (select TenKhachHang from KHACHHANG where MaKhachHang = @MaKhachHang)
		return @TenKhachHang
	end
go

--select dbo.fn_TraVeTenKhachHang ('KH001') as N'Tên khách hàng'
--select *from KHACHHANG


--> hàm đếm số lượng bàn, loại bàn điều kiện Trạng thái còn bàn với số lượng chỗ ngồi nhập từ bàn phím
go
	create function fn_SoLuong_LoaiBan(@SoLuongCho int)
	returns @table_soluong_loaiban table(
		LoaiBan nvarchar(50),
		SoLuongCon int
	)
	as
	begin
		insert into @table_soluong_loaiban
			select LoaiBan, count(*) from BAN where SoLuongCho = @SoLuongCho and TrangThai = N'Còn Bàn'
			group by LoaiBan
		return
	end
go
--select *from fn_SoLuong_LoaiBan (4)
--select *from BAN


--> Hàm trả về tổng số tiền ban đầu, tổng số tiền giảm giá, tổng số tiền sau khi giảm giá của một Hóa đơn với trạng thái và ngày lập được nhập từ bàn phím
go
	create function fn_TongTien(@TrangThai nvarchar(50),@NgayLap datetime)
	returns @table_TongTien table(
		TongTienBanDau money,
		TongTienGiamGia money,
		TongTienThanhToan money
	)
	as
	begin
		insert into @table_TongTien
			select sum(TongTienTruocGiam),sum(SoTienGiam),sum(TongTienPhaiTra) from HOADON where TrangThai = @TrangThai and NgayLapHoaDon = @NgayLap
		return
	end
go

--select *from fn_TongTien (N'Đã thanh toán','2025-')
--select *from HOADON

-->Hàm đếm số lượng đơn hàng của một khách hàng với tên khách hàng, số điện thoại được nhập từ bàn phím
go
	create function fn_SoLuongDonHang(@TenKhachHang nvarchar(50),@SoDienthoai int)
	returns int
	as
	begin
		declare @SoLuong int
		set @SoLuong = (select count(*) from HOADON inner join KHACHHANG on KHACHHANG.MaKhachHang = HOADON.MaKhachHang where TenKhachHang = @TenKhachHang and SoDienThoai = @SoDienthoai
						group by TenKhachHang,SoDienThoai)
		return @SoLuong
	end
go
--select dbo.fn_SoLuongDonHang (N'Hà Văn An','0912345678') as N'Số lượng đơn hàng'
--select *from HOADON inner join KHACHHANG on KHACHHANG.MaKhachHang = HOADON.MaKhachHang



--> Hàm tính tổng doanh thu trong tháng @Thang của năm @Nam
go
	create function fn_DoanhThuTheoThang(@Month int,@Year int)
	returns money
	as
	begin
		declare @TongDoanhThu money
		set @TongDoanhThu = (select sum(DoanhThu) from PHIEUTHONGKE where month(NgayThongKe) = @Month and year(NgayThongKe) = @Year)
		return @TongDoanhThu
	end
go
--select dbo.fn_DoanhThuTheoThang(4,2025) as N'Doanh thu của tháng đó là'
--select *from PHIEUTHONGKE

-->Hàm trả về danh sách nhân viên làm trong ngày @NgayLam nhập từ bàn phím
go
	create function fn_DanhSachLamViec(@NgayLam date)
	returns @table_DanhSachLamViec table(
		MaNhanVien int,
		HoTen nvarchar(50)
	)
	as
	begin
		insert into @table_DanhSachLamViec
			select NHANVIEN.MaNhanVien, HoTen from NHANVIEN inner join NHANVIEN_CALAMVIEC on NHANVIEN.MaNhanVien = NHANVIEN_CALAMVIEC.MaNhanVien where NgayLam = @NgayLam
		return
	end
go
--select *from fn_DanhSachLamViec ('2025-04-10')
--select *from NHANVIEN  inner join NHANVIEN_CALAMVIEC on NHANVIEN.MaNhanVien = NHANVIEN_CALAMVIEC.MaNhanVien

--> Hàm đưa ra danh sách các món ăn với trạng thái còn món trong một nhóm món ăn với Tên nhóm được nhập từ bàn phím
go
	create function fn_SoMonAnTrongNhom(@TenNhom nvarchar(50))
	returns @table_DanhSach table(
		MaMonAn int,
		TenMonAn nvarchar(50),
		DonGia money
	)
	as
	begin
		insert into @table_DanhSach
			select MaMonAn,TenMon,DonGia from MONAN inner join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom
			where TenNhom = @TenNhom and TrangThai = N'Còn Món'
		return
	end
go

--select *from fn_SoMonAnTrongNhom (N'Món Chính')
--select *from MONAN inner join NHOMMONAN on MONAN.MaNhom = NHOMMONAN.MaNhom

--> Đưa ra số lượt đánhh giá của món ăn với tên món ăn và thời gian đánh giá được nhập từ bàn phím
go
	create function fn_SoLuotDanhGia(@TenMon nvarchar(50),@ThoiGianDanhGia datetime)
	returns int
	as
	begin
		declare @SoLuotDanhGia int
		set @SoLuotDanhGia = (select count(*) from DANHGIA inner join MONAN on DANHGIA.MaMonAn = MONAN.MaMonAn
								where TenMon = @TenMon and ThoiGianDanhGia = @ThoiGianDanhGia
								group by TenMon,ThoiGianDanhGia)
		return @SoLuotDanhGia
	end
go

--select dbo.fn_SoLuotDanhGia (N'Cơm gà',N'2025-04-11') as N'Số lượt đánh giá'
--select *from DANHGIA inner join MONAN on DANHGIA.MaMonAn = MONAN.MaMonAn

--> Hàm tính tổng số lượng món ăn thuộc nhóm món ăn @TenNhom được nhập từ bàn phím
go
	create function fn_TongSLMonAn(@TenNhom nvarchar(50))
	returns int
	as
	begin
		declare @TongSoLuong int
		set @TongSoLuong = (select sum(SoLuong) from  NHOMMONAN inner join MONAN on NHOMMONAN.MaNhom = MONAN.MaNhom inner join CHITIETHOADON on MONAN.MaMonAn = CHITIETHOADON.MaMonAn
							where TenNhom = @TenNhom)
		return @TongSoLuong
	end
go

--select dbo.fn_TongSLMonAn (N'Món chính') as N'Tổng số lượng món ăn'
--select TenNhom, TenMon, SoLuong from NHOMMONAN inner join MONAN on NHOMMONAN.MaNhom = MONAN.MaNhom inner join CHITIETHOADON on MONAN.MaMonAn = CHITIETHOADON.MaMonAn

--> Trigger

--> Trigger cập nhật lại trạng thái bàn khi bàn được đặt (được thêm vào)
go
	create trigger trg_CapNhatTrangThaiBan
	on CHITIETDATBAN
	for insert
	as
	begin
		declare @MaBan int
		set @MaBan = (select MaBan from inserted)
		if(not exists(select *from BAN where MaBan = @MaBan))
			begin
				raiserror(N'Không tồn lại mã bàn đó',16,1)
				rollback transaction
			end
		else
			begin
				declare @TrangThai nvarchar(50)
				set @TrangThai = (select TrangThai from BAN where MaBan = @MaBan)
				if(@TrangThai = N'Hết Bàn')
					begin
						raiserror(N'Bàn đã có người đặt trước',16,1)
						rollback transaction
					end
				else
					update BAN set TrangThai = N'Hết Bàn' where MaBan = @MaBan
			end
	end
go
--insert into BAN values('B03',N'Bàn VIP',7,N'Còn Bàn')
--insert into CHITIETDATBAN values('KH001','B03',1)
--select *from CHITIETDATBAN
--select *from BAN
--select *from KHACHHANG
--> trigger trả bàn (khi ra về khách hàng sẽ trả lại bàn đó) xóa thông tin chi tiết đặt bàn thì bàn từ trạng thái 'Hết bàn' sẽ trở thành 'Còn bàn'
go
	create trigger trg_TraBan
	on CHITIETDATBAN
	for delete
	as
	begin
		declare @MaBan int
		set @MaBan = (select MaBan from deleted)
		update Ban set TrangThai = N'Còn bàn' where MaBan = @MaBan
	end
go

--delete from CHITIETDATBAN where MaBan = 'B02'
--select *from CHITIETDATBAN
--select *from BAN
--select *from KHACHHANG
--> trigger chuyển bàn tức là khách hàng A đang đặt bàn B1 muốn chuyển thành bàn B2 
go
	create trigger trg_ChuyenBan
	on CHITIETDATBAN
	for update
	as
	begin
		declare @MaBanBanDau int
		declare @MaBanMuonChuyen int
		set @MaBanBanDau = (select MaBan from deleted)
		set @MaBanMuonChuyen = (select MaBan from inserted)
		declare @TrangThaiChuyen nvarchar(50)
		set @TrangThaiChuyen = (select TrangThai from BAN where MaBan = @MaBanMuonChuyen)
		if(@TrangThaiChuyen = N'Hết Bàn')
			begin
				raiserror(N'Không còn bàn muốn chuyển',16,1)
				rollback transaction
			end
		else
			update BAN set TrangThai = N'Còn Bàn' where MaBan = @MaBanBanDau
			update BAN set TrangThai = N'Hết Bàn' where MaBan = @MaBanMuonChuyen
	end
go

--update CHITIETDATBAN set MaBan = 'B03' where MaBan = 'B01'
--select *from CHITIETDATBAN
--select *from BAN
--select *from KHACHHANG

--> trigger gọi món (nếu khách hàng gọi món thì trong chi tiết hóa đơn cần chèn thêm một món ăn)
go
	create trigger trg_ThemMonAn
	on CHITIETHOADON
	for insert 
	as
	begin
		declare @MaMonAn int
		set @MaMonAn = (select MaMonAn from inserted)
		if(not exists(select *from MONAN where MaMonAn = @MaMonAn))
			begin
				raiserror(N'Không tồn tại món ăn đó',16,1)
				rollback transaction
			end
		else
			begin
				declare @SoLuong int
				set @SoLuong = (select SoLuongCon from MONAN where MaMonAn = @MaMonAn)
				declare @SoLuongGoi int
				set @SoLuongGoi = (select SoLuong from inserted)
				if(@SoLuong < @SoLuongGoi)
					begin
						raiserror(N'Nhà hàng không có đủ món ăn đó',16,1)
						rollback transaction
					end
				else
					update MONAN set SoLuongCon = SoLuongCon - @SoLuongGoi where MaMonAn = @MaMonAn
			end
	end
go
--insert into CHITIETHOADON values('HD01','MA003',2)
--insert into MONAN values('MA004',N'Nước mía',N'Cốc',10000,N'Hết Món','NM03',0)
--select *from MONAN
--select *from CHITIETHOADON
--select *from HOADON
--> trigger sửa lại trạng thái món ăn nếu số lượng còn của món ăn đó thay đổi 
go
	create trigger trg_CapNhatTrangThai
	on MONAN
	for update
	as
	begin
		if(update  (MaMonAn))
		begin
			raiserror(N'Không được phép cập nhật theo Mã món ăn',16,1)
			rollback transaction
		end
		else
			begin
				declare @SoLuongCu int
				set @SoLuongCu = (select SoLuongCon from deleted)
				declare @SoLuongMoi int
				set @SoLuongMoi = (select SoLuongCon from inserted)
				if(@SoLuongCu = 0 and @SoLuongMoi > 0)
					update MONAN set TrangThai = N'Còn Món' where SoLuongCon = @SoLuongMoi
				else
					update MONAN set TrangThai = N'Hết Món' where SoLuongCon = @SoLuongMoi
			end
	end
go
--update MONAN set SoLuongCon = 0 where MaMonAn = 'MA004'
--select *from MONAN
--select *from CHITIETHOADON
--select *from HOADON

--> trigger cập nhật lại số lượng món ăn
go
	create trigger trg_CapNhatMonAn
	on CHITIETHOADON
	for update
	as
	begin
		declare @MaMonCu int
		set @MaMonCu = (select MaMonAn from deleted)
		declare @MaMonMoi int
		set @MaMonMoi = (select MaMonAn from inserted)
		declare @SoLuongCu int
		set @SoLuongCu = (select SoLuong from deleted)
		declare @SoLuongMoi int
		set @SoLuongMoi = (select SoLuong from inserted)
		declare @SoLuongMC int
		set @SoLuongMC = (select SoLuongCon from MONAN where MaMonAn = @MaMonCu)
		declare @SoLuongMM int
		set @SoLuongMM = (select SoLuongCon from MONAN where MaMonAn = @MaMonMoi)
		if(@SoLuongMM < @SoLuongMoi)
			begin
				raiserror(N'Không có đủ món đó',16,1)
				rollback transaction
			end
		else
			begin
				update MONAN set SoLuongCon = SoLuongCon + @SoLuongCu where MaMonAn = @MaMonCu
				update MONAN set SoLuongCon = SoLuongCon - @SoLuongMoi where MaMonAn = @MaMonMoi
			end
	end
go
--update CHITIETHOADON set MaMonAn = 'MA001',SoLuong = 2 where MaMonAn = 'MA002' and MaHoaDon = 'HD02'
--update CHITIETHOADON set SoLuong = 4 where MaMonAn = 'MA001' and MaHoaDon = 'HD02'
--select *from MONAN
--select *from CHITIETHOADON
--select *from HOADON


--select *from PHIEUNHAPHANG 
--select *from CHITIETNHAPHANG

--> trigger tạo một chi tiets phiếu nhập
go
	create trigger trg_TaoChiTietPhieuNhap
	on CHITIETNHAPHANG
	for insert
	as
	begin
		declare @MaPhieuNhap int
		set @MaPhieuNhap = (select MaPhieuNhap from inserted)
		if(not exists(Select *from PHIEUNHAPHANG where MaPhieuNhap = @MaPhieuNhap))
			begin
				raiserror(N'Không tồn tại phiếu nhập hàng đó',16,1)
				rollback transaction
			end
		else
			begin
				declare @SoLuongNhap int
				set @SoLuongNhap = (select SoLuongNhap from inserted)
				declare @SoLuongCo int
				set @SoLuongCo = (select SoLuong from PHIEUNHAPHANG where MaPhieuNhap = @MaPhieuNhap)
				if(@SoLuongCo < @SoLuongNhap)
					begin
						raiserror(N'Không đủ số lượng nhập vào',16,1)
						rollback transaction
					end
				else
					update PHIEUNHAPHANG set SoLuong = SoLuong - @SoLuongNhap where MaPhieuNhap = @MaPhieuNhap
			end
	end
go
--insert into CHITIETNHAPHANG values('NL01','PN002',1,18000,18000)
--select *from PHIEUNHAPHANG 
--select *from CHITIETNHAPHANG

--> trigger chỉnh sửa lại số lượng phiếu nhập

go
	create trigger trg_ChinhSuaPhieuNhap
	on CHITIETNHAPHANG
	for update
	as
	begin
		declare @MaPhieuNhap int
		set @MaPhieuNhap = (select MaPhieuNhap from inserted)
		declare @SoLuongTruoc int
		set @SoLuongTruoc = (select SoLuongNhap from inserted)
		declare @SoLuongSau int
		set @SoLuongSau = (select SoLuongNhap from deleted)
		declare @SoLuongCo int
		set @SoLuongCo = (select SoLuong from PHIEUNHAPHANG where MaPhieuNhap = @MaPhieuNhap)
		if(@SoLuongSau - @SoLuongTruoc > @SoLuongCo)
			begin
				raiserror(N'Không đủ số lượng nhập vào',16,1)
				rollback transaction
			end
		else
			update PHIEUNHAPHANG set SoLuong = SoLuong - (@SoLuongTruoc - @SoLuongSau) where MaPhieuNhap = @MaPhieuNhap
	end
go	
--update CHITIETNHAPHANG set SoLuongNhap = 2 where MaNguyenLieu = 'NL01' and MaPhieuNhap = 'PN002'
--select *from PHIEUNHAPHANG 
--select *from CHITIETNHAPHANG
