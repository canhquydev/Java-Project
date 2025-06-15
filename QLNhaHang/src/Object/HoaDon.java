/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class HoaDon {
    private int maHoaDon;
    private int maNhanVienLap;
    private String ngayLapHoaDon;
    private double tongTienTruocGiam;
    private double soTienGiam;
    private double tongTienPhaiTra;
    private String trangThai;
    private int maKhuyenMai;
    private int maKhachHang;

    public HoaDon(int maHoaDon, int maNhanVienLap, String ngayLapHoaDon, double tongTienTruocGiam, double soTienGiam, double tongTienPhaiTra, String trangThai, int maKhuyenMai, int maKhachHang) {
        this.maHoaDon = maHoaDon;
        this.maNhanVienLap = maNhanVienLap;
        this.ngayLapHoaDon = ngayLapHoaDon;
        this.tongTienTruocGiam = tongTienTruocGiam;
        this.soTienGiam = soTienGiam;
        this.tongTienPhaiTra = tongTienPhaiTra;
        this.trangThai = trangThai;
        this.maKhuyenMai = maKhuyenMai;
        this.maKhachHang = maKhachHang;
    }

    public int getMaHoaDon() {
        return maHoaDon;
    }

    public int getMaNhanVienLap() {
        return maNhanVienLap;
    }

    public String getNgayLapHoaDon() {
        return ngayLapHoaDon;
    }

    public double getTongTienTruocGiam() {
        return tongTienTruocGiam;
    }

    public double getSoTienGiam() {
        return soTienGiam;
    }

    public double getTongTienPhaiTra() {
        return tongTienPhaiTra;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public int getMaKhuyenMai() {
        return maKhuyenMai;
    }

    public int getMaKhachHang() {
        return maKhachHang;
    }
}