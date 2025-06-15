/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class KhuyenMai {
    private int maKhuyenMai;
    private String tenKhuyenMai;
    private int phanTramGiamGia;
    private String moTa;

    public KhuyenMai(int maKhuyenMai, String tenKhuyenMai, int phanTramGiamGia, String moTa) {
        this.maKhuyenMai = maKhuyenMai;
        this.tenKhuyenMai = tenKhuyenMai;
        this.phanTramGiamGia = phanTramGiamGia;
        this.moTa = moTa;
    }

    public int getMaKhuyenMai() {
        return maKhuyenMai;
    }

    public String getTenKhuyenMai() {
        return tenKhuyenMai;
    }

    public int getPhanTramGiamGia() {
        return phanTramGiamGia;
    }
    
    public String getMoTa() {
        return moTa;
    }
}