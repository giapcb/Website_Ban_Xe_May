package controller;

import dao.SanPhamDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.SanPham;

@WebServlet(name = "SanPhamServlet", urlPatterns = {"/shop"})
public class SanPhamServlet extends HttpServlet {

    private static final int LIMIT = 6; // số sản phẩm mỗi trang

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ===============================
        // ⚙️ LẤY TRANG HIỆN TẠI TỪ PARAM
        // ===============================
        int page = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
                if (page < 1) page = 1;
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        // ===============================
        // 📦 LẤY DỮ LIỆU TỪ DAO
        // ===============================
        SanPhamDAO dao = new SanPhamDAO();
        int totalSanPham = dao.countSanPham();

        // Tính tổng số trang
        int totalPages = (int) Math.ceil((double) totalSanPham / LIMIT);
        if (totalPages == 0) totalPages = 1;
        if (page > totalPages) page = totalPages; // tránh lỗi vượt trang

        // Lấy danh sách sản phẩm trang hiện tại
        List<SanPham> dsXe = dao.getSanPhamByPage(page, LIMIT);

        // ===============================
        // 📤 GỬI DỮ LIỆU SANG JSP
        // ===============================
        request.setAttribute("dsXe", dsXe);
        request.setAttribute("page", page);
        request.setAttribute("totalPages", totalPages);

        // ===============================
        // 🔁 CHUYỂN HƯỚNG TỚI shop.jsp
        // ===============================
        RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet hiển thị danh sách sản phẩm có phân trang";
    }
}
