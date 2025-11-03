/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Asus TUF
 */
public class LoaiXe {
    private int Ma_Loai;
    private String Ten_Loai;
    private String Mo_Ta;

    public LoaiXe() {
    }

    public LoaiXe(int Ma_Loai, String Ten_Loai, String Mo_Ta) {
        this.Ma_Loai = Ma_Loai;
        this.Ten_Loai = Ten_Loai;
        this.Mo_Ta = Mo_Ta;
    }

    public int getMa_Loai() {
        return Ma_Loai;
    }

    public void setMa_Loai(int Ma_Loai) {
        this.Ma_Loai = Ma_Loai;
    }

    public String getTen_Loai() {
        return Ten_Loai;
    }

    public void setTen_Loai(String Ten_Loai) {
        this.Ten_Loai = Ten_Loai;
    }

    public String getMo_Ta() {
        return Mo_Ta;
    }

    public void setMo_Ta(String Mo_Ta) {
        this.Mo_Ta = Mo_Ta;
    }
    
}
