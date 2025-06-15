/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class NhanVien {
    private int maNhanVien;
    private String hoTen;
    private String ngaySinh;
    private String gioiTinh;
    private String soDienThoai;
    private String diaChi;
    private String chucVu;
    private int maQuanLy;
    private double luongCoBan;

    public NhanVien(int maNhanVien, String hoTen, String ngaySinh, String gioiTinh, String soDienThoai, String diaChi, String chucVu, int maQuanLy, double luongCoBan) {
        this.maNhanVien = maNhanVien;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.gioiTinh = gioiTinh;
        this.soDienThoai = soDienThoai;
        this.diaChi = diaChi;
        this.chucVu = chucVu;
        this.maQuanLy = maQuanLy;
        this.luongCoBan = luongCoBan;
    }

    public int getMaNhanVien() {
        return maNhanVien;
    }

    public String getHoTen() {
        return hoTen;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public String getChucVu() {
        return chucVu;
    }

    public int getMaQuanLy() {
        return maQuanLy;
    }

    public double getLuongCoBan() {
        return luongCoBan;
    }
}