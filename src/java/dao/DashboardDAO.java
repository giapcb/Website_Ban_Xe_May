package dao;

import java.sql.*;
import java.util.*;
import model.DBConnection;
import java.sql.Date;
public class DashboardDAO {

    // ===============================
    //  HÀM CHUNG – HỖ TRỢ
    // ===============================
    private double getDouble(ResultSet rs, String col) throws SQLException {
        double v = rs.getDouble(col);
        return rs.wasNull() ? 0 : v;
    }

    private java.sql.Date sqlDate(Date d) {
        return new java.sql.Date(d.getTime());
    }

    // ===============================
    //  THỐNG KÊ HÔM NAY
    // ===============================

    public double getDoanhSoHomNay() {
        String sql = """
            SELECT SUM(TongTien) AS DoanhSo 
            FROM donhang 
            WHERE DATE(NgayDat)=CURDATE()
            AND TrangThai='Hoàn thành'
        """;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            return rs.next() ? getDouble(rs, "DoanhSo") : 0;

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int getTongDonHomNay() {
        String sql = "SELECT COUNT(*) AS TongDon FROM donhang WHERE DATE(NgayDat)=CURDATE()";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            return rs.next() ? rs.getInt("TongDon") : 0;

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int getSoLuongBanHomNay() {
        String sql = """
            SELECT SUM(ct.SoLuong) AS SoLuongBan
            FROM chitietdonhang ct 
            JOIN donhang dh ON ct.MaDH = dh.MaDH 
            WHERE DATE(dh.NgayDat)=CURDATE()
            AND dh.TrangThai='Hoàn thành'
        """;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            return rs.next() ? rs.getInt("SoLuongBan") : 0;

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int getTonKho() {
        String sql = "SELECT SUM(SoLuong) AS TonKho FROM sanpham";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            return rs.next() ? rs.getInt("TonKho") : 0;

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    // ===============================
    //  THỐNG KÊ THEO KHOẢNG NGÀY
    // ===============================

    public double getDoanhSo(Date from, Date to) {
        String sql = """
            SELECT SUM(TongTien) AS DoanhSo
            FROM donhang
            WHERE DATE(NgayDat) BETWEEN ? AND ?
            AND TrangThai='Hoàn thành'
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDate(1, sqlDate(from));
            ps.setDate(2, sqlDate(to));

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? getDouble(rs, "DoanhSo") : 0;
            }

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int getTongDon(Date from, Date to) {
        String sql = """
            SELECT COUNT(*) AS TongDon
            FROM donhang
            WHERE DATE(NgayDat) BETWEEN ? AND ?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDate(1, sqlDate(from));
            ps.setDate(2, sqlDate(to));

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getInt("TongDon") : 0;
            }

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int getSoLuongBan(Date from, Date to) {
        String sql = """
            SELECT SUM(ct.SoLuong) AS SoLuongBan
            FROM chitietdonhang ct 
            JOIN donhang dh ON ct.MaDH = dh.MaDH
            WHERE DATE(dh.NgayDat) BETWEEN ? AND ?
            AND dh.TrangThai='Hoàn thành'
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDate(1, sqlDate(from));
            ps.setDate(2, sqlDate(to));

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getInt("SoLuongBan") : 0;
            }

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    // ===============================
    //  TOP SẢN PHẨM BÁN CHẠY
    // ===============================

    public List<Map<String, Object>> getTopProducts(Date from, Date to, int limit) {
        String sql = """
            SELECT sp.MaSP, sp.TenSp, SUM(ct.SoLuong) AS SoLuongBan
            FROM chitietdonhang ct
            JOIN sanpham sp ON ct.MaSP = sp.MaSP
            JOIN donhang dh ON ct.MaDH = dh.MaDH
            WHERE DATE(dh.NgayDat) BETWEEN ? AND ?
            AND dh.TrangThai='Hoàn thành'
            GROUP BY sp.MaSP, sp.TenSp
            ORDER BY SoLuongBan DESC
            LIMIT ?
        """;

        List<Map<String, Object>> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDate(1, sqlDate(from));
            ps.setDate(2, sqlDate(to));
            ps.setInt(3, limit);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    row.put("maSP", rs.getInt("MaSP"));
                    row.put("tenSp", rs.getString("TenSp"));
                    row.put("soLuong", rs.getInt("SoLuongBan"));
                    list.add(row);
                }
            }

        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }
}
