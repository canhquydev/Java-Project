/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class NguyenLieuMonAn {
    private int maMonAn;
    private int maNguyenLieu;
    private int soLuong;

    public NguyenLieuMonAn(int maMonAn, int maNguyenLieu, int soLuong) {
        this.maMonAn = maMonAn;
        this.maNguyenLieu = maNguyenLieu;
        this.soLuong = soLuong;
    }

    public int getMaMonAn() {
        return maMonAn;
    }

    public int getMaNguyenLieu() {
        return maNguyenLieu;
    }

    public int getSoLuong() {
        return soLuong;
    }
}