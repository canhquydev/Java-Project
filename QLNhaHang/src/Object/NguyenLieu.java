/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class NguyenLieu {
    private int maNguyenLieu;
    private String tenNguyenLieu;
    private String loai;
    private String ngaySanXuat;
    private String hanSuDung;
    private double giaBan;
    private String donViTinh;
    private int soLuongTon;

    public NguyenLieu(int maNguyenLieu, String tenNguyenLieu, String loai, String ngaySanXuat, String hanSuDung, double giaBan, String donViTinh, int soLuongTon) {
        this.maNguyenLieu = maNguyenLieu;
        this.tenNguyenLieu = tenNguyenLieu;
        this.loai = loai;
        this.ngaySanXuat = ngaySanXuat;
        this.hanSuDung = hanSuDung;
        this.giaBan = giaBan;
        this.donViTinh = donViTinh;
        this.soLuongTon = soLuongTon;
    }

    public int getMaNguyenLieu() {
        return maNguyenLieu;
    }

    public String getTenNguyenLieu() {
        return tenNguyenLieu;
    }

    public String getLoai() {
        return loai;
    }

    public String getNgaySanXuat() {
        return ngaySanXuat;
    }

    public String getHanSuDung() {
        return hanSuDung;
    }

    public double getGiaBan() {
        return giaBan;
    }

    public String getDonViTinh() {
        return donViTinh;
    }

    public int getSoLuongTon() {
        return soLuongTon;
    }
    
}