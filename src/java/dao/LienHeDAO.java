/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.LienHe;
import java.sql.*;
import java.util.*;
import model.DBConnection;
import java.sql.Timestamp;

/**
 *
 * @author Asus TUF
 */
public class LienHeDAO {
       public boolean insert(LienHe lh) {
        String sql = "INSERT INTO banglienhe (HoTen, Email, SDT, NoiDung, NgayGui) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, lh.getHoTen());
            ps.setString(2, lh.getEmail());
            ps.setString(3, lh.getSDT());
            ps.setString(4, lh.getNoiDung());
            ps.setTimestamp(5, lh.getNgayGui()); // DATETIME → Timestamp

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy liên hệ theo ID
    public LienHe getById(int id) {
        String sql = "SELECT * FROM banglienhe WHERE MaLH = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                LienHe lh = new LienHe();
                lh.setMaLH(rs.getInt("MaLH"));
                lh.setHoTen(rs.getString("HoTen"));
                lh.setEmail(rs.getString("Email"));
                lh.setSDT(rs.getString("SDT"));
                lh.setNoiDung(rs.getString("NoiDung"));
                lh.setNgayGui(rs.getTimestamp("NgayGui"));
                return lh;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Xóa liên hệ
    public boolean delete(int id) {
        String sql = "DELETE FROM banglienhe WHERE MaLH = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
