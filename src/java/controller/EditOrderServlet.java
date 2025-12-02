/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DonHangDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import model.DonHang;

/**
 *
 * @author Acer Nitro 5
 */
@WebServlet(name = "EditOrderServlet", urlPatterns = {"/admin/edit-order"})

public class EditOrderServlet extends HttpServlet {
    DonHangDAO dao = new DonHangDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        DonHang dh = dao.getOrderById(id);

        request.setAttribute("dh", dh);
        request.getRequestDispatcher("/admin/edit-order.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    try {
        String maDH_raw = request.getParameter("maDH");
        String maND_raw = request.getParameter("maND");
        String tongTien_raw = request.getParameter("tongTien");

        // CHẶN NULL hoặc chuỗi rỗng
        if (maDH_raw == null || maDH_raw.isEmpty() ||
            maND_raw == null || maND_raw.isEmpty() ||
            tongTien_raw == null || tongTien_raw.isEmpty()) {

            System.out.println("❌ LỖI: Thiếu dữ liệu khi cập nhật đơn hàng!");
            response.sendRedirect("ManageOrdersServlet?action=list");
            return;
        }

        int maDH = Integer.parseInt(maDH_raw);
        int maND = Integer.parseInt(maND_raw);
        double tongTien = Double.parseDouble(tongTien_raw);
        String trangThai = request.getParameter("trangThai");

        DonHang dh = new DonHang(maDH, maND, new Date(), tongTien, trangThai);

        dao.updateOrder(dh);

        response.sendRedirect(request.getContextPath() + "/admin/ManageOrdersServlet");


    } catch (Exception e) {
        e.printStackTrace();
       response.sendRedirect(request.getContextPath() + "/admin/ManageOrdersServlet");

    }
}

}
