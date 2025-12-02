/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.SanPham;

/**
 *
 * @author Acer Nitro 5
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/EditProductServlet"})
public class EditProductServlet extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equalsIgnoreCase((String) session.getAttribute("vaitro"))) {
            response.sendRedirect(request.getContextPath() + "/access-denied.jsp");
            return;
        }

        String hangSX = request.getParameter("hangSX");
        SanPhamDAO dao = new SanPhamDAO();
        SanPham sp = dao.getByHang(hangSX);

        request.setAttribute("sp", sp);
        request.getRequestDispatcher("/admin/edit-product-by-hang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String hangSX = request.getParameter("hangSX");

        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        int soLuongBan = Integer.parseInt(request.getParameter("soLuongBan"));

        SanPham sp = new SanPham();
        sp.setHangSX(hangSX);
        sp.setSoLuong(soLuongBan);
       
        sp.setSoLuong(soLuong);

        SanPhamDAO dao = new SanPhamDAO();
        dao.updateByHangSX(sp);

        response.sendRedirect(request.getContextPath() + "/admin/manage-products");
    }
}
