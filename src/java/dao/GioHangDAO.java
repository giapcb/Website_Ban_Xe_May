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
}
