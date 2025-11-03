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
    private int Ma_CT;
    private int Ma_DH;
    private int Ma_SP;
    private int So_Luong;
    private double Thanh_Tien;

    public ChiTietDonHang() {
    }

    public ChiTietDonHang(int Ma_CT, int Ma_DH, int Ma_SP, int So_Luong, double Thanh_Tien) {
        this.Ma_CT = Ma_CT;
        this.Ma_DH = Ma_DH;
        this.Ma_SP = Ma_SP;
        this.So_Luong = So_Luong;
        this.Thanh_Tien = Thanh_Tien;
    }

    public int getMa_CT() {
        return Ma_CT;
    }

    public void setMa_CT(int Ma_CT) {
        this.Ma_CT = Ma_CT;
    }

    public int getMa_DH() {
        return Ma_DH;
    }

    public void setMa_DH(int Ma_DH) {
        this.Ma_DH = Ma_DH;
    }

    public int getMa_SP() {
        return Ma_SP;
    }

    public void setMa_SP(int Ma_SP) {
        this.Ma_SP = Ma_SP;
    }

    public int getSo_Luong() {
        return So_Luong;
    }

    public void setSo_Luong(int So_Luong) {
        this.So_Luong = So_Luong;
    }

    public double getThanh_Tien() {
        return Thanh_Tien;
    }

    public void setThanh_Tien(double Thanh_Tien) {
        this.Thanh_Tien = Thanh_Tien;
    }
    
}
