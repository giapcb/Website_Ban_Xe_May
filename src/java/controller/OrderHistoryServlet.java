package controller;

import dao.ChiTietDonHangDAO;
import dao.DonHangDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ChiTietDonHang;
import model.DonHang;
import model.NguoiDung;

@WebServlet(name = "OrderHistoryServlet", urlPatterns = {"/order_history"})
public class OrderHistoryServlet extends HttpServlet {

    private DonHangDAO donHangDAO = new DonHangDAO();
    private ChiTietDonHangDAO chiTietDAO = new ChiTietDonHangDAO();

    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession();
    NguoiDung user = (NguoiDung) session.getAttribute("user");

    if (user == null) {
        // Chưa đăng nhập -> chuyển sang trang login
        response.sendRedirect("login.jsp");
        return;
    }

    int maND = user.getMaND(); // Lấy ID người dùng

    // Lấy danh sách đơn hàng của user
    List<DonHang> donHangList = donHangDAO.getByUser(maND);

    // Lấy chi tiết cho từng đơn và tính lại tổng tiền
    for (DonHang dh : donHangList) {
        List<ChiTietDonHang> chiTietList = chiTietDAO.getByMaDH(dh.getMaDH());
        dh.setChiTiet(chiTietList); // gán chi tiết đơn hàng

        // Tính tổng tiền chính xác từ chi tiết
        double tongTien = 0;
        for (ChiTietDonHang ct : chiTietList) {
            tongTien += ct.getThanhTien();
        }
        dh.setTongTien(tongTien);
    }

    // Truyền dữ liệu sang JSP
    request.setAttribute("orders", donHangList);
    request.getRequestDispatcher("order_history.jsp").forward(request, response);
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu không cần xử lý POST, có thể chỉ gọi doGet
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet hiển thị lịch sử đơn hàng của người dùng";
    }
}
