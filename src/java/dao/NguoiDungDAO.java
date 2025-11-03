package dao;

import java.sql.*;
import model.DBConnection;
import model.NguoiDung;

public class NguoiDungDAO {

    public boolean isUsernameExists(String username) {
        String sql = "SELECT MaND FROM nguoidung WHERE TenDN = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isEmailExists(String email) {
        String sql = "SELECT MaND FROM nguoidung WHERE Email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ CHUẨN VỚI CLASS NguoiDung & CSDL
    public boolean register(NguoiDung u) {
    String sql = "INSERT INTO nguoidung(HoTen, TenDN, MatKhau, Email, SDT, Diachi) VALUES (?, ?, ?, ?, ?, ?)";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, u.getHoTen());
        ps.setString(2, u.getTenDN());
        ps.setString(3, u.getMatKhau());
        ps.setString(4, u.getEmail());
        ps.setString(5, u.getSDT());   // có thể null
        ps.setString(6, u.getDiaChi()); // có thể null

        int rows = ps.executeUpdate();
        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}


    public NguoiDung login(String userOrEmail, String plainPassword) {
        String sql = "SELECT * FROM nguoidung WHERE TenDN = ? OR Email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userOrEmail);
            ps.setString(2, userOrEmail);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String password = rs.getString("MatKhau");
                    if (password.equals(plainPassword)) { // So sánh trực tiếp
                        NguoiDung u = new NguoiDung();
                        u.setMaND(rs.getInt("MaND"));
                        u.setHoTen(rs.getString("HoTen"));
                        u.setTenDN(rs.getString("TenDN"));
                        u.setMatKhau(rs.getString("MatKhau"));
                        u.setEmail(rs.getString("Email"));
                        u.setSDT(rs.getString("SDT"));
                        u.setDiaChi(rs.getString("Diachi"));
                        return u;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
