/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class PhieuThongKe {
    private int maPhieu;
    private String ngayThongKe;
    private double doanhThu;
    private double thu;
    private double chi;
    private int maNhanVien;

    public PhieuThongKe(int maPhieu, String ngayThongKe, double doanhThu, double thu, double chi, int maNhanVien) {
        this.maPhieu = maPhieu;
        this.ngayThongKe = ngayThongKe;
        this.doanhThu = doanhThu;
        this.thu = thu;
        this.chi = chi;
        this.maNhanVien = maNhanVien;
    }

    public int getMaPhieu() {
        return maPhieu;
    }

    public String getNgayThongKe() {
        return ngayThongKe;
    }

    public double getDoanhThu() {
        return doanhThu;
    }

    public double getThu() {
        return thu;
    }

    public double getChi() {
        return chi;
    }

    public int getMaNhanVien() {
        return maNhanVien;
    }
}