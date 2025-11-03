/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class SanPham {
    private int MaSP;
    private String TenSp;
    private double Gia;
    private String MoTa;
    private String HinhAnh;
    private String MaLoai;
    private String HangSX;
    private int SoLuong;

    public SanPham() {
    }

    public SanPham(int MaSP, String TenSp, double Gia, String MoTa, String HinhAnh, String MaLoai, String HangSX, int SoLuong) {
        this.MaSP = MaSP;
        this.TenSp = TenSp;
        this.Gia = Gia;
        this.MoTa = MoTa;
        this.HinhAnh = HinhAnh;
        this.MaLoai = MaLoai;
        this.HangSX = HangSX;
        this.SoLuong = SoLuong;
    }

    public int getMaSP() {
        return MaSP;
    }

    public void setMaSP(int MaSP) {
        this.MaSP = MaSP;
    }

    public String getTenSp() {
        return TenSp;
    }

    public void setTenSp(String TenSp) {
        this.TenSp = TenSp;
    }

    public double getGia() {
        return Gia;
    }

    public void setGia(double Gia) {
        this.Gia = Gia;
    }

    public String getMoTa() {
        return MoTa;
    }

    public void setMoTa(String MoTa) {
        this.MoTa = MoTa;
    }

    public String getHinhAnh() {
        return HinhAnh;
    }

    public void setHinhAnh(String HinhAnh) {
        this.HinhAnh = HinhAnh;
    }

    public String getMaLoai() {
        return MaLoai;
    }

    public void setMaLoai(String MaLoai) {
        this.MaLoai = MaLoai;
    }

    public String getHangSX() {
        return HangSX;
    }

    public void setHangSX(String HangSX) {
        this.HangSX = HangSX;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }
}
