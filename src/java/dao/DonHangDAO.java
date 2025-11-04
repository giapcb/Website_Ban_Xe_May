/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Asus TUF
 */

import java.sql.*;
import java.util.*;
import model.DBConnection;
import model.DonHang;

public class DonHangDAO {
    public List<DonHang> getAll() {
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM donhang";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                DonHang dh = new DonHang(
                    rs.getInt("MaDH"),
                    rs.getInt("MaND"),
                    rs.getTimestamp("NgayDat"),
                    rs.getDouble("TongTien"),
                    rs.getString("TrangThai")
                );
                list.add(dh);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

