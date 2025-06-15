/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class DanhGia {
    private int maKhachHang;
    private int maMonAn;
    private String noiDungDanhGia;
    private String thoiGianDanhGia;
    private int diemDanhGia;

    public DanhGia(int maKhachHang, int maMonAn, String noiDungDanhGia, String thoiGianDanhGia, int diemDanhGia) {
        this.maKhachHang = maKhachHang;
        this.maMonAn = maMonAn;
        this.noiDungDanhGia = noiDungDanhGia;
        this.thoiGianDanhGia = thoiGianDanhGia;
        this.diemDanhGia = diemDanhGia;
    }

    public int getMaKhachHang() {
        return maKhachHang;
    }

    public int getMaMonAn() {
        return maMonAn;
    }

    public String getNoiDungDanhGia() {
        return noiDungDanhGia;
    }

    public String getThoiGianDanhGia() {
        return thoiGianDanhGia;
    }

    public int getDiemDanhGia() {
        return diemDanhGia;
    }
}