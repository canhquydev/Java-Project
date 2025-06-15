/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class PhieuNhapHang {
    private int maPhieuNhap;
    private String ngayTao;
    private String nhaCungCap;
    private int maNhanVienNhap;

    public PhieuNhapHang(int maPhieuNhap, String ngayTao, String nhaCungCap, int maNhanVienNhap) {
        this.maPhieuNhap = maPhieuNhap;
        this.ngayTao = ngayTao;
        this.nhaCungCap = nhaCungCap;
        this.maNhanVienNhap = maNhanVienNhap;
    }

    public int getMaPhieuNhap() {
        return maPhieuNhap;
    }

    public String getNgayTao() {
        return ngayTao;
    }

    public String getNhaCungCap() {
        return nhaCungCap;
    }

    public int getMaNhanVienNhap() {
        return maNhanVienNhap;
    }
}