/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class MonAn {
    private int maMonAn;
    private String tenMon;
    private String donViTinh;
    private double donGia;
    private String trangThai;
    private int maNhom;

    public MonAn(int maMonAn, String tenMon, String donViTinh, double donGia, String trangThai, int maNhom) {
        this.maMonAn = maMonAn;
        this.tenMon = tenMon;
        this.donViTinh = donViTinh;
        this.donGia = donGia;
        this.trangThai = trangThai;
        this.maNhom = maNhom;
    }

    public int getMaMonAn() {
        return maMonAn;
    }

    public String getTenMon() {
        return tenMon;
    }

    public String getDonViTinh() {
        return donViTinh;
    }

    public double getDonGia() {
        return donGia;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public int getMaNhom() {
        return maNhom;
    }
}