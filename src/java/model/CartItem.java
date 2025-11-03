/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Asus TUF
 */
public class CartItem {

   
    private SanPham sanPham;
    private int quantity;

    public CartItem(SanPham sanPham, int quantity) {
        this.sanPham = sanPham;
        this.quantity = quantity;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public double getTotal() {
        return sanPham.getGia() * quantity;
    }
}
