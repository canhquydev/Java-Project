/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class ChiTietHoaDon {
    private int maHoaDon;
    private int maMonAn;
    private int soLuong;

    public ChiTietHoaDon(int maHoaDon, int maMonAn, int soLuong) {
        this.maHoaDon = maHoaDon;
        this.maMonAn = maMonAn;
        this.soLuong = soLuong;
    }

    public int getMaHoaDon() {
        return maHoaDon;
    }

    public int getMaMonAn() {
        return maMonAn;
    }

    public int getSoLuong() {
        return soLuong;
    }
}