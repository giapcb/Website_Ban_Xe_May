package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.DBConnection;
import model.CartItem;
import model.ChiTietDonHang;

public class ChiTietDonHangDAO {

    // =============================
    // 1. THÊM CHI TIẾT ĐƠN HÀNG
    // =============================
   public boolean insert(long maDH, CartItem item) {
    String sql = "INSERT INTO bangchitietdonhang (MaDH, MaSP, SoLuong, ThanhTien) "
               + "VALUES (?, ?, ?, ?)";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setLong(1, maDH);
        ps.setInt(2, item.getSanPham().getMaSP());
        ps.setInt(3, item.getQuantity());
        ps.setDouble(4, item.getSanPham().getGia() * item.getQuantity());

        return ps.executeUpdate() > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}


    // =============================
    // 2. LẤY CHI TIẾT ĐƠN HÀNG THEO MÃ ĐƠN
    // =============================
public List<ChiTietDonHang> getByMaDH(long maDH) {
    List<ChiTietDonHang> list = new ArrayList<>();

    String sql = """
        SELECT 
            ct.MaCT, ct.MaDH, ct.MaSP, ct.SoLuong, ct.ThanhTien,
            sp.TenSp, sp.HinhAnh AS AnhSP,

            (SELECT tenmau FROM mauxe WHERE MaSP = sp.MaSP LIMIT 1) AS tenMau,
            (SELECT anhmau FROM mauxe WHERE MaSP = sp.MaSP LIMIT 1) AS anhMau

        FROM bangchitietdonhang ct
        JOIN sanpham sp ON ct.MaSP = sp.MaSP
        WHERE ct.MaDH = ?
    """;

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setLong(1, maDH);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ChiTietDonHang ct = new ChiTietDonHang();

                ct.setMaCT(rs.getInt("MaCT"));
                ct.setMaDH(rs.getInt("MaDH"));
                ct.setMaSP(rs.getInt("MaSP"));
                ct.setSoLuong(rs.getInt("SoLuong"));
                ct.setThanhTien(rs.getDouble("ThanhTien"));

                ct.setTenSP(rs.getString("TenSp"));
                ct.setAnhSP(rs.getString("AnhSP"));
                ct.setTenMau(rs.getString("tenMau"));
                ct.setAnhMau(rs.getString("anhMau"));

                list.add(ct);
            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return list;
}


}
