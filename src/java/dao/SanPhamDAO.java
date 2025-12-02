package dao;

import java.sql.*;
import java.util.*;
import model.DBConnection;
import model.SanPham;

public class SanPhamDAO {

    // =====================================================
    // 🧾 LẤY TẤT CẢ SẢN PHẨM
    // =====================================================
    public List<SanPham> getAll() {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM sanpham";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapResultSetToSanPham(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // =====================================================
    // 🔍 TÌM SẢN PHẨM THEO MÃ
    // =====================================================
    public SanPham findById(int id) {
        String sql = "SELECT * FROM sanpham WHERE MaSP = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToSanPham(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public SanPham getById(String maSP) {
        SanPham sp = null;
        String sql = "SELECT * FROM sanpham WHERE MaSP = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, maSP);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                sp = mapResultSetToSanPham(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return sp;
    }

    // =====================================================
    // 🔎 TÌM SẢN PHẨM THEO MÃ LOẠI
    // =====================================================
    public List<SanPham> findByLoai(String maLoai) {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM sanpham WHERE MaLoai = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, maLoai);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSetToSanPham(rs));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // =====================================================
    // 🧮 ĐẾM TỔNG SẢN PHẨM
    // =====================================================
    public int countSanPham() {
        String sql = "SELECT COUNT(*) FROM sanpham";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // =====================================================
    // 📄 PHÂN TRANG (MySQL & SQL Server)
    // =====================================================
    public List<SanPham> getSanPhamByPage(int page, int limit) {
        List<SanPham> list = new ArrayList<>();
        int offset = (page - 1) * limit;
        String sql = "SELECT * FROM sanpham ORDER BY MaSP LIMIT ? OFFSET ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, limit);
            ps.setInt(2, offset);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapResultSetToSanPham(rs));
            }

        } catch (SQLException e) {
            if (e.getMessage().contains("LIMIT")) {
                list = getSanPhamByPage_SQLServer(page, limit);
            } else e.printStackTrace();
        }
        return list;
    }

    private List<SanPham> getSanPhamByPage_SQLServer(int page, int limit) {
        List<SanPham> list = new ArrayList<>();
        int offset = (page - 1) * limit;
        String sql = "SELECT * FROM sanpham ORDER BY MaSP OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, offset);
            ps.setInt(2, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapResultSetToSanPham(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // =====================================================
    // 🧩 MAP KẾT QUẢ SQL -> SanPham
    // =====================================================
    private SanPham mapResultSetToSanPham(ResultSet rs) throws SQLException {
        return new SanPham(
                rs.getInt("MaSP"),
                rs.getString("TenSp"),
                rs.getDouble("Gia"),
                rs.getString("MoTa"),
                rs.getString("HinhAnh"),
                rs.getString("MaLoai"),
                rs.getString("HangSX"),
                rs.getInt("SoLuong")
        );
    }

    // =====================================================
    // 🔍 LỌC SẢN PHẨM
    // =====================================================
    public List<SanPham> filterSanPham(String type, String price, String brand) {
        List<SanPham> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM sanpham WHERE 1=1 ");

        if (type != null && !type.isEmpty()) sql.append(" AND MaLoai = ? ");
        if (brand != null && !brand.isEmpty()) sql.append(" AND HangSX = ? ");

        if (price != null && !price.isEmpty()) {
            switch (price) {
                case "1": sql.append(" AND Gia < 20000000 "); break;
                case "2": sql.append(" AND Gia BETWEEN 20000000 AND 30000000 "); break;
                case "3": sql.append(" AND Gia > 30000000 "); break;
            }
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int i = 1;
            if (type != null && !type.isEmpty()) ps.setString(i++, type);
            if (brand != null && !brand.isEmpty()) ps.setString(i++, brand);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapResultSetToSanPham(rs));
            }

        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }

    // =====================================================
    // ✅ CRUD THEO TÊN SẢN PHẨM
    // =====================================================
    public SanPham getByName(String name) {
        String sql = "SELECT * FROM sanpham WHERE TenSp = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapResultSetToSanPham(rs);

        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public boolean updateByName(String oldName, String name, String brand, String price, String image) {
        String sql = "UPDATE sanpham SET TenSp=?, HangSX=?, Gia=?, HinhAnh=? WHERE TenSp=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, brand);
            ps.setDouble(3, Double.parseDouble(price));
            ps.setString(4, image);
            ps.setString(5, oldName);
            return ps.executeUpdate() > 0;

        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    public boolean deleteByName(String name) {
        String sql = "DELETE FROM sanpham WHERE TenSp = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            return ps.executeUpdate() > 0;

        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    // =====================================================
    // ✅ CRUD THEO HÃNG SẢN XUẤT
    // =====================================================
    public SanPham getByHang(String hangSX) {
        String sql = "SELECT * FROM sanpham WHERE HangSX = ? LIMIT 1";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, hangSX);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapResultSetToSanPham(rs);

        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public boolean updateByHangSX(SanPham sp) {
        String sql = "UPDATE sanpham SET SoLuong = ?, SoLuong = ? WHERE HangSX = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, sp.getSoLuong());
            ps.setInt(2, sp.getSoLuong());
            ps.setString(3, sp.getHangSX());
            return ps.executeUpdate() > 0;

        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    public boolean deleteByHang(String hangSX) {
        String sql = "DELETE FROM sanpham WHERE HangSX = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, hangSX);
            return ps.executeUpdate() > 0;

        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    // =====================================================
    // 📊 THỐNG KÊ THEO HÃNG
    // =====================================================
    public List<SanPham> getThongKeTheoHang() {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT HangSX, SUM(SoLuong) AS SoLuong, SUM(SoLuong) AS SoLuong " +
                     "FROM sanpham GROUP BY HangSX";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setHangSX(rs.getString("HangSX"));
                sp.setSoLuong(rs.getInt("SoLuongBan"));
                sp.setSoLuong(rs.getInt("SoLuong"));
                list.add(sp);
            }

        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }

    // =====================================================
    // ✅ LẤY SẢN PHẨM LIÊN QUAN
    // =====================================================
    public List<SanPham> getSanPhamLienQuan(int maSP, String hangSX, String maLoai) {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM sanpham " +
                     "WHERE MaSP != ? AND (MaLoai = ? OR HangSX = ?) " +
                     "ORDER BY CASE WHEN MaLoai = ? THEN 1 ELSE 2 END, MaSP DESC " +
                     "LIMIT 8";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maSP);
            ps.setString(2, maLoai);
            ps.setString(3, hangSX);
            ps.setString(4, maLoai);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapResultSetToSanPham(rs));
            }
        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }
}
