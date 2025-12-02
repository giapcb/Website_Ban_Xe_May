/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Asus TUF
 */
public class ChiTietDonHang {
    private int MaCT;
    private int MaDH;
    private int MaSP;
       
    private int soLuong;
    private double thanhTien;

    // Thuộc tính hiển thị (KHÔNG map DB)
    private String tenSP;
    private String anhSP;
    private String tenMau;
    private String anhMau;


    public ChiTietDonHang() {
    }

    public ChiTietDonHang(int MaCT, int MaDH, int MaSP, int soLuong, double thanhTien) {
        this.MaCT = MaCT;
        this.MaDH = MaDH;
        this.MaSP = MaSP;
        this.soLuong = soLuong;
        this.thanhTien = thanhTien;
    }

    public int getMaCT() {
        return MaCT;
    }

    public void setMaCT(int MaCT) {
        this.MaCT = MaCT;
    }

    public int getMaDH() {
        return MaDH;
    }

    public void setMaDH(int MaDH) {
        this.MaDH = MaDH;
    }

    public int getMaSP() {
        return MaSP;
    }

    public void setMaSP(int MaSP) {
        this.MaSP = MaSP;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getThanhTien() {
        return thanhTien;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public String getAnhSP() {
        return anhSP;
    }

    public void setAnhSP(String anhSP) {
        this.anhSP = anhSP;
    }

    public String getTenMau() {
        return tenMau;
    }

    public void setTenMau(String tenMau) {
        this.tenMau = tenMau;
    }

    public String getAnhMau() {
        return anhMau;
    }

    public void setAnhMau(String anhMau) {
        this.anhMau = anhMau;
    }

   

    public void setThanhTien(double thanhTien) {
        this.thanhTien = thanhTien;
    }
    
}
