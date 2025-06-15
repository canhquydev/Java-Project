/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class ChiTietNhapHang {
    private int maPhieuNhap;
    private int maNguyenLieu;
    private int soLuongNhap;
    private double donGia;
    private double thanhTien;

    public ChiTietNhapHang(int maPhieuNhap, int maNguyenLieu, int soLuongNhap, double donGia, double thanhTien) {
        this.maPhieuNhap = maPhieuNhap;
        this.maNguyenLieu = maNguyenLieu;
        this.soLuongNhap = soLuongNhap;
        this.donGia = donGia;
        this.thanhTien = thanhTien;
    }

    public int getMaPhieuNhap() {
        return maPhieuNhap;
    }

    public int getMaNguyenLieu() {
        return maNguyenLieu;
    }

    public int getSoLuongNhap() {
        return soLuongNhap;
    }

    public double getDonGia() {
        return donGia;
    }

    public double getThanhTien() {
        return thanhTien;
    }

    @Override
    public String toString() {
        return "ChiTietNhapHang{" + "maPhieuNhap=" + maPhieuNhap + ", maNguyenLieu=" + maNguyenLieu + ", soLuongNhap=" + soLuongNhap + ", donGia=" + donGia + ", thanhTien=" + thanhTien + '}';
    }
    
    
}