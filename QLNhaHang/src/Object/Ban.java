/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

/**
 *
 * @author HoCanhQuy
 */
public class Ban {
    private int maBan;
    private String loaiBan;
    private int soLuongCho;
    private int soLuongCon;
    private String trangThai;

    public Ban(int maBan, String loaiBan, int soLuongCho, int soLuongCon, String trangThai) {
        this.maBan = maBan;
        this.loaiBan = loaiBan;
        this.soLuongCho = soLuongCho;
        this.soLuongCon = soLuongCon;
        this.trangThai = trangThai;
    }

    public int getMaBan() {
        return maBan;
    }

    public String getLoaiBan() {
        return loaiBan;
    }

    public int getSoLuongCho() {
        return soLuongCho;
    }

    public int getSoLuongCon() {
        return soLuongCon;
    }
    
    public String getTrangThai() {
        return trangThai;
    }
}
