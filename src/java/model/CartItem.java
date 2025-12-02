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
     private String color;    // tên màu người dùng đã chọn
    private String colorImage; // ảnh ứng với màu xe (lấy từ bảng mauxe)

    public CartItem() {
    }
public CartItem(SanPham sanPham, int quantity) {
        this.sanPham = sanPham;
        this.quantity = quantity;
    }
    public CartItem(SanPham sanPham, int quantity, String color, String colorImage) {
        this.sanPham = sanPham;
        this.quantity = quantity;
        this.color = color;
        this.colorImage = colorImage;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getColorImage() {
        return colorImage;
    }

    public void setColorImage(String colorImage) {
        this.colorImage = colorImage;
    }
    
    public double getTotal() {
        return sanPham.getGia() * quantity;
    }
    
}
