/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import java.util.ArrayList;
import java.util.List;
import model.DBConnection;
import model.Mau;

/**
 *
 * @author Asus TUF
 */
public class MauXeDAO {
    public List<Mau> getColorsByProduct(int maSP) {
        List<Mau> list = new ArrayList<>();
        String sql = "SELECT id, MaSP, tenmau, anhmau FROM mauxe WHERE MaSP = ? ORDER BY id";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maSP);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Mau m = new Mau();
                    m.setId(rs.getInt("id"));
                    m.setMaSP(rs.getInt("MaSP"));

                    // CHÚ Ý: đặt tên setter/getter theo model Mau của bạn
                    // ở đây mình dùng tenMau / anhMau (camelCase)
                    m.setTenMau(rs.getString("tenmau"));
                    m.setAnhMau(rs.getString("anhmau"));

                    list.add(m);
                }
            }

        } catch (SQLException ex) {
            // Log lỗi rõ hơn để debug (in stack trace)
            ex.printStackTrace();
        }

        return list;
    }
 // ================================
// LẤY LINK ẢNH MÀU THEO MaSP + tenMau
// ================================
public String getColorImage(int maSP, String tenMau) {

    String sql = "SELECT anhmau FROM mauxe WHERE MaSP = ? AND tenmau = ? LIMIT 1";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, maSP);
        ps.setString(2, tenMau);

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getString("anhmau");
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return null; // nếu không có → trả ảnh mặc định
}
 
}
