/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class TaiKhoan {
    private int maTaiKhoan;
    private String tenDangNhap;
    private String matKhau;
    private String ngayTao;
    private String trangThai;
    private String loaiTaiKhoan;
    private int maNhanVien;

    public TaiKhoan(int maTaiKhoan, String tenDangNhap, String matKhau, String ngayTao, String trangThai, String loaiTaiKhoan, int maNhanVien) {
        this.maTaiKhoan = maTaiKhoan;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.ngayTao = ngayTao;
        this.trangThai = trangThai;
        this.loaiTaiKhoan = loaiTaiKhoan;
        this.maNhanVien = maNhanVien;
    }

    public int getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public String getNgayTao() {
        return ngayTao;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public String getLoaiTaiKhoan() {
        return loaiTaiKhoan;
    }

    public int getMaNhanVien() {
        return maNhanVien;
    }
}