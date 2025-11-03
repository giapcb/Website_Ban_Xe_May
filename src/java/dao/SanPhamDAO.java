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
import model.SanPham;

/**
 *
 * @author Asus TUF
 */

    public class SanPhamDAO {

    public List<SanPham> getAll() {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM sanpham";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                SanPham s = new SanPham(
                    rs.getInt("MaSP"),
                    rs.getString("TenSp"),
                    rs.getDouble("Gia"),
                    rs.getString("MoTa"),
                    rs.getString("HinhAnh"),
                    rs.getString("MaLoai"), // ✅ sửa lại thành getString
                    rs.getString("HangSX"),
                    rs.getInt("SoLuong")
                );
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public SanPham findById(int id) {
        String sql = "SELECT * FROM sanpham WHERE MaSP=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new SanPham(
                        rs.getInt("MaSP"),
                        rs.getString("TenSp"),
                        rs.getDouble("Gia"),
                        rs.getString("MoTa"),
                        rs.getString("HinhAnh"),
                        rs.getString("MaLoai"), // ✅ sửa lại thành getString
                        rs.getString("HangSX"),
                        rs.getInt("SoLuong")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<SanPham> findByLoai(String maLoai) { // ✅ truyền kiểu String
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM sanpham WHERE MaLoai=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maLoai);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new SanPham(
                        rs.getInt("MaSP"),
                        rs.getString("TenSp"),
                        rs.getDouble("Gia"),
                        rs.getString("MoTa"),
                        rs.getString("HinhAnh"),
                        rs.getString("MaLoai"), // ✅ sửa lại thành getString
                        rs.getString("HangSX"),
                        rs.getInt("SoLuong")
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}



