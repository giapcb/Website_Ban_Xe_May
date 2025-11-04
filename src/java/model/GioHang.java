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
public class GioHang {
     private int maGH;
    private int maND;
    private Date ngayCapNhat;

    public GioHang() {
    }

    public GioHang(int maGH, int maND, Date ngayCapNhat) {
        this.maGH = maGH;
        this.maND = maND;
        this.ngayCapNhat = ngayCapNhat;
    }

    public int getMaGH() {
        return maGH;
    }

    public void setMaGH(int maGH) {
        this.maGH = maGH;
    }

    public int getMaND() {
        return maND;
    }

    public void setMaND(int maND) {
        this.maND = maND;
    }

    public Date getNgayCapNhat() {
        return ngayCapNhat;
    }

    public void setNgayCapNhat(Date ngayCapNhat) {
        this.ngayCapNhat = ngayCapNhat;
    }
    
}
