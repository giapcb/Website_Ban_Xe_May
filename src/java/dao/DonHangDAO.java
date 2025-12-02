package dao;

import java.sql.*;
import java.util.*;
import model.DBConnection;
import model.DonHang;
import model.ChiTietDonHang;

public class DonHangDAO {

    // ======================================================
    // Lấy tất cả đơn hàng
    // ======================================================
    public List<DonHang> getAll() {
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM donhang ORDER BY MaDH DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                DonHang dh = createDonHang(rs);
                list.add(dh);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // ======================================================
    // Tạo DonHang từ ResultSet
    // ======================================================
    private DonHang createDonHang(ResultSet rs) throws SQLException {
        DonHang dh = new DonHang();

        dh.setMaDH(rs.getInt("MaDH"));
        dh.setMaND(rs.getInt("MaND"));
        dh.setNgayDat(rs.getTimestamp("NgayDat"));
        dh.setTongTien(rs.getDouble("TongTien"));
        dh.setTrangThai(rs.getString("TrangThai"));

        return dh;
    }

public boolean insertOrder(DonHang dh) {
        String sql = "INSERT INTO donhang (MaND, TongTien, TrangThai) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, dh.getMaND());
            ps.setDouble(2, dh.getTongTien());
            ps.setString(3, dh.getTrangThai());

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    // ======================================================
    // Lấy đơn hàng theo ID
    // ======================================================
    public DonHang getById(int maDH) {
        String sql = "SELECT * FROM donhang WHERE MaDH=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maDH);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return createDonHang(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
 public DonHang getOrderById(int id) {
    String sql = "SELECT * FROM donhang WHERE MaDH=?";
    
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) 
    {
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            DonHang dh = new DonHang();
            dh.setMaDH(rs.getInt("MaDH"));
            dh.setMaND(rs.getInt("MaND"));
            dh.setNgayDat(rs.getTimestamp("NgayDat"));
            dh.setTongTien(rs.getDouble("TongTien"));
            dh.setTrangThai(rs.getString("TrangThai"));
            return dh;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return null;
}
public boolean updateOrder(DonHang dh) {
        String sql = "UPDATE donhang SET MaND=?, TongTien=?, TrangThai=? WHERE MaDH=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, dh.getMaND());
            ps.setDouble(2, dh.getTongTien());
            ps.setString(3, dh.getTrangThai());
            ps.setInt(4, dh.getMaDH());

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deleteOrder(int id) {
        String sql = "DELETE FROM donhang WHERE MaDH=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    // ======================================================
    // Lấy đơn hàng theo người dùng
    // ======================================================
    public List<DonHang> getByUser(int maND) {
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM donhang WHERE MaND=? ORDER BY NgayDat DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maND);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DonHang dh = createDonHang(rs);
                list.add(dh);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // ======================================================
    // Lấy chi tiết đơn hàng
    // ======================================================
    public List<ChiTietDonHang> getChiTietByMaDH(int maDH) {
        List<ChiTietDonHang> list = new ArrayList<>();

        String sql = """
            SELECT ct.*, sp.TenSP, sp.Anh, sp.Mau
            FROM chitietdonhang ct
            JOIN sanpham sp ON ct.MaSP = sp.MaSP
            WHERE ct.MaDH = ?
        """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maDH);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChiTietDonHang ct = new ChiTietDonHang();

                ct.setMaCT(rs.getInt("MaCT"));
                ct.setMaDH(rs.getInt("MaDH"));
                ct.setMaSP(rs.getInt("MaSP"));
                ct.setSoLuong(rs.getInt("SoLuong"));
                ct.setThanhTien(rs.getDouble("ThanhTien"));

                // Nếu model có setter sản phẩm thì bật lên:
                // ct.setTenSP(rs.getString("TenSP"));
                // ct.setAnhSP(rs.getString("Anh"));
                // ct.setMau(rs.getString("Mau"));

                list.add(ct);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // ======================================================
    // Insert + trả về ID tự tăng
    // ======================================================
    public long insert(int maND, double tongTien, String trangThai) {
        long maDH = -1;

        String sql = "INSERT INTO donhang (MaND, TongTien, TrangThai) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, maND);
            ps.setDouble(2, tongTien);
            ps.setString(3, trangThai);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    maDH = rs.getLong(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return maDH;
    }


    // ======================================================
    // Update trạng thái
    // ======================================================
    public boolean updateTrangThai(long maDH, String trangThai) {
        String sql = "UPDATE donhang SET TrangThai=? WHERE MaDH=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, trangThai);
            ps.setLong(2, maDH);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    // ======================================================
    // Update toàn bộ đơn hàng
    // ======================================================
    public boolean update(DonHang dh) {
        String sql = "UPDATE donhang SET MaND=?, TongTien=?, TrangThai=? WHERE MaDH=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, dh.getMaND());
            ps.setDouble(2, dh.getTongTien());
            ps.setString(3, dh.getTrangThai());
            ps.setInt(4, dh.getMaDH());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    // ======================================================
    // Xóa đơn hàng
    // ======================================================
    public boolean delete(long maDH) {
        String sql = "DELETE FROM donhang WHERE MaDH=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, maDH);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
