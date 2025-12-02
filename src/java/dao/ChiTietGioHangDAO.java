/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.DBConnection;
import model.SanPham;
/**
 *
 * @author Asus TUF
 */
public class ChiTietGioHangDAO {
   // Trong ChiTietGioHangDAO
public boolean insertOrUpdateItem(long maGH, CartItem item) {
    String checkSql = "SELECT SoLuong FROM bangchitietgiohang WHERE MaGH = ? AND MaSP = ?";
    String insertSql = "INSERT INTO bangchitietgiohang (MaGH, MaSP, SoLuong) VALUES (?, ?, ?)";
    String updateSql = "UPDATE bangchitietgiohang SET SoLuong = ? WHERE MaGH = ? AND MaSP = ?";

    try (Connection conn = DBConnection.getConnection()) {

        // 1. Kiểm tra item đã tồn tại trong giỏ chưa
        PreparedStatement check = conn.prepareStatement(checkSql);
        check.setLong(1, maGH);
        check.setInt(2, item.getSanPham().getMaSP());
        ResultSet rs = check.executeQuery();

        if (rs.next()) {
            // 2. Nếu đã có -> UPDATE
            PreparedStatement update = conn.prepareStatement(updateSql);
            update.setInt(1, item.getQuantity());
            update.setLong(2, maGH);
            update.setInt(3, item.getSanPham().getMaSP());
            return update.executeUpdate() > 0;

        } else {
            // 3. Nếu chưa có -> INSERT mới
            PreparedStatement insert = conn.prepareStatement(insertSql);
            insert.setLong(1, maGH);
            insert.setInt(2, item.getSanPham().getMaSP());
            insert.setInt(3, item.getQuantity());
            return insert.executeUpdate() > 0;
        }

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}


    
    /**
     * Xóa sản phẩm khỏi giỏ hàng.
     */
    public boolean deleteItem(long maGH, int maSP) {
        String sql = "DELETE FROM bangchitietgiohang WHERE MaGH = ? AND MaSP = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setLong(1, maGH);
            ps.setInt(2, maSP);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
  public List<CartItem> getItemsByMaGH(long maGH) {
    List<CartItem> list = new ArrayList<>();

    String sql = "SELECT ct.SoLuong, sp.MaSP, sp.TenSP, sp.Gia, sp.HinhAnh, " +
                 "sp.MoTa, sp.MaLoai, sp.HangSX, sp.SoLuong AS TonKho " +
                 "FROM bangchitietgiohang ct " +
                 "JOIN sanpham sp ON ct.MaSP = sp.MaSP " +
                 "WHERE ct.MaGH = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setLong(1, maGH);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            SanPham sp = new SanPham(
                rs.getInt("MaSP"),
                rs.getString("TenSP"),
                rs.getDouble("Gia"),
                rs.getString("MoTa"),
                rs.getString("HinhAnh"),
                rs.getString("MaLoai"),
                rs.getString("HangSX"),
                rs.getInt("TonKho")
            );

            CartItem item = new CartItem(sp, rs.getInt("SoLuong"));
            list.add(item);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }


    return list;
}
}
