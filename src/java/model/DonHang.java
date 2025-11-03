/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Asus TUF
 */
public class DonHang {
    private int Ma_DH;
    private int Ma_ND;
    private Date Ngay_Dat;
    private double Tong_Tien;
    private String Trang_Thai;

    public DonHang() {
    }

    public DonHang(int Ma_DH, int Ma_ND, Date Ngay_Dat, double Tong_Tien, String Trang_Thai) {
        this.Ma_DH = Ma_DH;
        this.Ma_ND = Ma_ND;
        this.Ngay_Dat = Ngay_Dat;
        this.Tong_Tien = Tong_Tien;
        this.Trang_Thai = Trang_Thai;
    }

    public int getMa_DH() {
        return Ma_DH;
    }

    public void setMa_DH(int Ma_DH) {
        this.Ma_DH = Ma_DH;
    }

    public int getMa_ND() {
        return Ma_ND;
    }

    public void setMa_ND(int Ma_ND) {
        this.Ma_ND = Ma_ND;
    }

    public Date getNgay_Dat() {
        return Ngay_Dat;
    }

    public void setNgay_Dat(Date Ngay_Dat) {
        this.Ngay_Dat = Ngay_Dat;
    }

    public double getTong_Tien() {
        return Tong_Tien;
    }

    public void setTong_Tien(double Tong_Tien) {
        this.Tong_Tien = Tong_Tien;
    }

    public String getTrang_Thai() {
        return Trang_Thai;
    }

    public void setTrang_Thai(String Trang_Thai) {
        this.Trang_Thai = Trang_Thai;
    }
    
}
