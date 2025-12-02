/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Asus TUF
 */
public class DonHang {
    private int MaDH;
    private int MaND;
    private Date NgayDat;
    private double TongTien;
    private String TrangThai;
    private List<ChiTietDonHang> chiTiet;

    public DonHang() {
    }

    public DonHang(int MaDH, int MaND, Date NgayDat, double TongTien, String TrangThai) {
        this.MaDH = MaDH;
        this.MaND = MaND;
        this.NgayDat = NgayDat;
        this.TongTien = TongTien;
        this.TrangThai = TrangThai;
    }

    public int getMaDH() {
        return MaDH;
    }

    public void setMaDH(int MaDH) {
        this.MaDH = MaDH;
    }

    public int getMaND() {
        return MaND;
    }

    public void setMaND(int MaND) {
        this.MaND = MaND;
    }

    public Date getNgayDat() {
        return NgayDat;
    }

    public void setNgayDat(Date NgayDat) {
        this.NgayDat = NgayDat;
    }

    public double getTongTien() {
        return TongTien;
    }

    public void setTongTien(double TongTien) {
        this.TongTien = TongTien;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(String TrangThai) {
        this.TrangThai = TrangThai;
    }

    public List<ChiTietDonHang> getChiTiet() {
        return chiTiet;
    }

    public void setChiTiet(List<ChiTietDonHang> chiTiet) {
        this.chiTiet = chiTiet;
    }
    
}
