package controller;

import dao.SanPhamDAO;

import model.SanPham;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.SanPham;

@WebServlet("/admin/shop")
public class AdminShopServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy danh sách tất cả sản phẩm
        SanPhamDAO dao = new SanPhamDAO();
        List<SanPham> ds = dao.getAll();

        // Truyền sang JSP
        request.setAttribute("dsXe", ds);

        // Điều hướng tới trang admin/shop-admin.jsp
        request.getRequestDispatcher("/admin/shop-admin.jsp")
                .forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin xem danh sách sản phẩm";
    }
}
