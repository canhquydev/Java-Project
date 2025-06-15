/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class ChiTietDatBan {
    private int maKhachHang;
    private int maBan;
    private int soLuongBan;

    public ChiTietDatBan(int maKhachHang, int maBan, int soLuongBan) {
        this.maKhachHang = maKhachHang;
        this.maBan = maBan;
        this.soLuongBan = soLuongBan;
    }

    public int getMaKhachHang() {
        return maKhachHang;
    }

    public int getMaBan() {
        return maBan;
    }

    public int getSoLuongBan() {
        return soLuongBan;
    }
}