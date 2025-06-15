/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class NhanVienCaLamViec {
    private String ngayLam;
    private int maNhanVien;
    private int maCa;

    public NhanVienCaLamViec(String ngayLam, int maNhanVien, int maCa) {
        this.ngayLam = ngayLam;
        this.maNhanVien = maNhanVien;
        this.maCa = maCa;
    }

    public String getNgayLam() {
        return ngayLam;
    }

    public int getMaNhanVien() {
        return maNhanVien;
    }

    public int getMaCa() {
        return maCa;
    }
}
