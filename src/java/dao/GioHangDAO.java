/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.DBConnection;
import model.GioHang;


public class GioHangDAO {
    public List<GioHang> getAll() {
        List<GioHang> list = new ArrayList<>();
        String sql = "SELECT * FROM banggiohang";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                GioHang gh = new GioHang(
                    rs.getInt("MaGH"),
                    rs.getInt("MaND"),
                    rs.getTimestamp("NgayCapNhat")
                );
                list.add(gh);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
     public long insert(int maND) {
        long maGH = -1;
        // MaGH và NgayCapNhat tự động, chỉ chèn MaND
        String sql = "INSERT INTO banggiohang (MaND) VALUES (?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, maND);
            if (ps.executeUpdate() > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        maGH = rs.getLong(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return maGH;
    }
    
    /**
     * Lấy MaGH dựa trên MaND.
     */
    public long getMaGHByMaND(int maND) {
        long maGH = -1;
        String sql = "SELECT MaGH FROM banggiohang WHERE MaND = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, maND);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    maGH = rs.getLong("MaGH");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return maGH;
    }
    public GioHang getGioHangByMaND(int maND) {
    GioHang gh = null;
    String sql = "SELECT * FROM banggiohang WHERE MaND = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, maND);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            gh = new GioHang(
                rs.getInt("MaGH"),
                rs.getInt("MaND"),
                rs.getTimestamp("NgayCapNhat")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return gh;
}

public boolean updateNgayCapNhat(long maGH) {
    String sql = "UPDATE banggiohang SET NgayCapNhat = NOW() WHERE MaGH = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        
        ps.setLong(1, maGH);
        return ps.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
}
