package controller;

import dao.DonHangDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.DonHang;

@WebServlet(name = "AddOrderServlet", urlPatterns = {"/admin/add-order"})

public class AddOrderServlet extends HttpServlet {


    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    try {
        int maND = Integer.parseInt(request.getParameter("maND"));
        double tongTien = Double.parseDouble(request.getParameter("tongTien"));
        String trangThai = request.getParameter("trangThai");

        // Khởi tạo DonHang mới (MaDH để 0 để DB tự tăng, NgayDat = ngày hiện tại)
        DonHang dh = new DonHang(0, maND, new java.util.Date(), tongTien, trangThai);

        DonHangDAO dao = new DonHangDAO();
        dao.insertOrder(dh);

        response.sendRedirect(request.getContextPath() + "/admin/ManageOrdersServlet");

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    }
}
}
