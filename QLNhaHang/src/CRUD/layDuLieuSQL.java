/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CRUD;

import Object.Ban;
import Object.CaLamViec;
import Object.ChiTietDatBan;
import Object.ChiTietHoaDon;
import Object.ChiTietNhapHang;
import Object.DanhGia;
import Object.HoaDon;
import Object.KhachHang;
import Object.KhuyenMai;
import Object.MonAn;
import Object.NguyenLieu;
import Object.NguyenLieuMonAn;
import Object.NhanVien;
import Object.NhanVienCaLamViec;
import Object.NhomMonAn;
import Object.PhieuNhapHang;
import Object.PhieuThongKe;
import Object.TaiKhoan;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;
/**
 *
 * @author HoCanhQuy
 */
public class layDuLieuSQL {
    public ArrayList<KhachHang> getDsKhachHang() {
        ArrayList<KhachHang> dsKhachHang = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM KHACHHANG";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsKhachHang.add(new KhachHang(
                    rs.getInt("MaKhachHang"),
                    rs.getString("TenKhachHang"),
                    rs.getString("SoDienThoai"),
                    rs.getString("DiaChi")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng KHACHHANG", ex);
        }
        return dsKhachHang;
    }
    
    public ArrayList<MonAn> getDsMonAn() {
        ArrayList<MonAn> dsMonAn = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM MONAN";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsMonAn.add(new MonAn(
                    rs.getInt("MaMonAn"),
                    rs.getString("TenMon"),
                    rs.getString("DonViTinh"),
                    rs.getDouble("DonGia"),
                    rs.getString("TrangThai"),
                    rs.getInt("MaNhom")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng MONAN", ex);
        }
        return dsMonAn;
    }
    
    public ArrayList<NhanVien> getDsNhanVien() {
        ArrayList<NhanVien> dsNhanVien = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM NHANVIEN";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsNhanVien.add(new NhanVien(
                    rs.getInt("MaNhanVien"),
                    rs.getString("HoTen"),
                    rs.getString("NgaySinh"),
                    rs.getString("GioiTinh"),
                    rs.getString("SoDienThoai"),
                    rs.getString("DiaChi"),
                    rs.getString("ChucVu"),
                    rs.getInt("MaQuanLy"),
                    rs.getDouble("LuongCoBan")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng NHANVIEN", ex);
        }
        return dsNhanVien;
    }
    
    public ArrayList<NhomMonAn> getDsNhomMonAn() {
        ArrayList<NhomMonAn> dsNhomMonAn = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM NHOMMONAN";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsNhomMonAn.add(new NhomMonAn(
                    rs.getInt("MaNhom"),
                    rs.getString("TenNhom")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng NHOMMONAN", ex);
        }
        return dsNhomMonAn;
    }
    
    public ArrayList<Ban> getDsBan() {
        ArrayList<Ban> dsBan = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM BAN";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsBan.add(new Ban(
                    rs.getInt("MaBan"),
                    rs.getString("LoaiBan"),
                    rs.getInt("SoLuongCho"),
                    rs.getInt("SoLuongCon"),
                    rs.getString("TrangThai")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng BAN", ex);
        }
        return dsBan;
    }
    
    public ArrayList<ChiTietDatBan> getDsChiTietDatBan() {
        ArrayList<ChiTietDatBan> dsChiTietDatBan = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM CHITIETDATBAN";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsChiTietDatBan.add(new ChiTietDatBan(
                    rs.getInt("MaKhachHang"),
                    rs.getInt("MaBan"),
                    rs.getInt("SoLuongBan")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng CHITIETDATBAN", ex);
        }
        return dsChiTietDatBan;
    }
    
    public ArrayList<DanhGia> getDsDanhGia() {
        ArrayList<DanhGia> dsDanhGia = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM DANHGIA";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsDanhGia.add(new DanhGia(
                    rs.getInt("MaKhachHang"),
                    rs.getInt("MaMonAn"),
                    rs.getString("NoiDungDanhGia"),
                    rs.getString("ThoiGianDanhGia"), // Lấy kiểu Datetime từ SQL ra thành String
                    rs.getInt("DiemDanhGia")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng DANHGIA", ex);
        }
        return dsDanhGia;
    }
    
    public ArrayList<CaLamViec> getDsCaLamViec() {
        ArrayList<CaLamViec> dsCaLamViec = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM CALAMVIEC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsCaLamViec.add(new CaLamViec(
                    rs.getInt("MaCa"),
                    rs.getString("GioBatDau"), // Lấy kiểu Time từ SQL ra thành String
                    rs.getString("GioKetThuc")  // Lấy kiểu Time từ SQL ra thành String
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng CALAMVIEC", ex);
        }
        return dsCaLamViec;
    }
    
    public ArrayList<NhanVienCaLamViec> getDsNhanVienCaLamViec() {
        ArrayList<NhanVienCaLamViec> dsNhanVienCaLamViec = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM NHANVIEN_CALAMVIEC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsNhanVienCaLamViec.add(new NhanVienCaLamViec(
                    rs.getString("NgayLam"), // Lấy kiểu Date từ SQL ra thành String
                    rs.getInt("MaNhanVien"),
                    rs.getInt("MaCa")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng NHANVIEN_CALAMVIEC", ex);
        }
        return dsNhanVienCaLamViec;
    }
    
    public ArrayList<KhuyenMai> getDsKhuyenMai() {
        ArrayList<KhuyenMai> dsKhuyenMai = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM KHUYENMAI";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsKhuyenMai.add(new KhuyenMai(
                    rs.getInt("MaKhuyenMai"),
                    rs.getString("TenKhuyenMai"),
                    rs.getInt("PhanTramGiamGia"),
                    rs.getString("MoTa")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng KHUYENMAI", ex);
        }
        return dsKhuyenMai;
    }
    
    public ArrayList<HoaDon> getDsHoaDon() {
        ArrayList<HoaDon> dsHoaDon = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM HOADON";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsHoaDon.add(new HoaDon(
                    rs.getInt("MaHoaDon"),
                    rs.getInt("MaNhanVienLap"),
                    rs.getString("NgayLapHoaDon"),
                    rs.getDouble("TongTienTruocGiam"),
                    rs.getDouble("SoTienGiam"),
                    rs.getDouble("TongTienPhaiTra"),
                    rs.getString("TrangThai"),
                    rs.getInt("MaKhuyenMai"),
                    rs.getInt("MaKhachHang")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng HOADON", ex);
        }
        return dsHoaDon;
    }
    
    public ArrayList<PhieuNhapHang> getDsPhieuNhapHang() {
        ArrayList<PhieuNhapHang> dsPhieuNhapHang = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM PHIEUNHAPHANG";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsPhieuNhapHang.add(new PhieuNhapHang(
                    rs.getInt("MaPhieuNhap"),
                    rs.getString("NgayTao"),
                    rs.getString("NhaCungCap"),
                    rs.getInt("MaNhanVienNhap")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng PHIEUNHAPHANG", ex);
        }
        return dsPhieuNhapHang;
    }
    
    public ArrayList<NguyenLieu> getDsNguyenLieu() {
        ArrayList<NguyenLieu> dsNguyenLieu = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM NGUYENLIEU";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsNguyenLieu.add(new NguyenLieu(
                    rs.getInt("MaNguyenLieu"),
                    rs.getString("TenNguyenLieu"),
                    rs.getString("Loai"),
                    rs.getString("NgaySanXuat"),
                    rs.getString("HanSuDung"),
                    rs.getDouble("GiaBan"),
                    rs.getString("DonViTinh"),
                    rs.getInt("SoLuongTon")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng NGUYENLIEU", ex);
        }
        return dsNguyenLieu;
    }
    
    public ArrayList<NguyenLieuMonAn> getDsNguyenLieuMonAn() {
        ArrayList<NguyenLieuMonAn> dsNguyenLieuMonAn = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM NGUYENLIEU_MONAN";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsNguyenLieuMonAn.add(new NguyenLieuMonAn(
                    rs.getInt("MaMonAn"),
                    rs.getInt("MaNguyenLieu"),
                    rs.getInt("SoLuong")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng NGUYENLIEU_MONAN", ex);
        }
        return dsNguyenLieuMonAn;
    }
    
    public ArrayList<ChiTietNhapHang> getDsChiTietNhapHang() {
        ArrayList<ChiTietNhapHang> dsChiTietNhapHang = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM CHITIETNHAPHANG";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsChiTietNhapHang.add(new ChiTietNhapHang(
                    rs.getInt("MaPhieuNhap"),
                    rs.getInt("MaNguyenLieu"),
                    rs.getInt("SoLuongNhap"),
                    rs.getDouble("DonGia"),
                    rs.getDouble("ThanhTien")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng CHITIETNHAPHANG", ex);
        }
        return dsChiTietNhapHang;
    }
    
    public ArrayList<PhieuThongKe> getDsPhieuThongKe() {
        ArrayList<PhieuThongKe> dsPhieuThongKe = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM PHIEUTHONGKE";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsPhieuThongKe.add(new PhieuThongKe(
                    rs.getInt("MaPhieu"),
                    rs.getString("NgayThongKe"),
                    rs.getDouble("DoanhThu"),
                    rs.getDouble("Thu"),
                    rs.getDouble("Chi"),
                    rs.getInt("MaNhanVien")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng PHIEUTHONGKE", ex);
        }
        return dsPhieuThongKe;
    }
    
    public ArrayList<ChiTietHoaDon> getDsChiTietHoaDon() {
        ArrayList<ChiTietHoaDon> dsChiTietHoaDon = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM CHITIETHOADON";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsChiTietHoaDon.add(new ChiTietHoaDon(
                    rs.getInt("MaHoaDon"),
                    rs.getInt("MaMonAn"),
                    rs.getInt("SoLuong")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng CHITIETHOADON", ex);
        }
        return dsChiTietHoaDon;
    }
    
    public ArrayList<TaiKhoan> getDsTaiKhoan() {
        ArrayList<TaiKhoan> dsTaiKhoan = new ArrayList<>();
        try (Connection conn = ConnectSQL.getConnection()) {
            String sql = "SELECT * FROM TAIKHOAN";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dsTaiKhoan.add(new TaiKhoan(
                    rs.getInt("MaTaiKhoan"),
                    rs.getString("TenDangNhap"),
                    rs.getString("MatKhau"),
                    rs.getString("NgayTao"),
                    rs.getString("TrangThai"),
                    rs.getString("LoaiTaiKhoan"),
                    rs.getInt("MaNhanVien")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Lỗi khi truy vấn bảng TAIKHOAN", ex);
        }
        return dsTaiKhoan;
    }
}
