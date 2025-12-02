/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;


/**
 *
 * @author Asus TUF
 */
public class LienHe {
    private int MaLH;
    private String HoTen;
    private String Email;
    private String SDT;
    private String NoiDung;
    private Timestamp NgayGui; 

    public LienHe() {
    }

    public LienHe(int MaLH, String HoTen, String Email, String SDT, String NoiDung, Timestamp NgayGui) {
        this.MaLH = MaLH;
        this.HoTen = HoTen;
        this.Email = Email;
        this.SDT = SDT;
        this.NoiDung = NoiDung;
        this.NgayGui = NgayGui;
    }

    public int getMaLH() {
        return MaLH;
    }

    public void setMaLH(int MaLH) {
        this.MaLH = MaLH;
    }

    public String getHoTen() {
        return HoTen;
    }

    public void setHoTen(String HoTen) {
        this.HoTen = HoTen;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getNoiDung() {
        return NoiDung;
    }

    public void setNoiDung(String NoiDung) {
        this.NoiDung = NoiDung;
    }

    public Timestamp getNgayGui() {
        return NgayGui;
    }

    public void setNgayGui(Timestamp NgayGui) {
        this.NgayGui = NgayGui;
    }
    
    
}
