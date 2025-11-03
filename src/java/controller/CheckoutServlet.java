/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NguoiDung;

/**
 *
 * @author Asus TUF
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false); // false = không tạo session mới
        NguoiDung nd = (session != null) ? (NguoiDung) session.getAttribute("user") : null;

        if (nd == null) {
            // ❌ Chưa đăng nhập → chuyển hướng sang trang login
            String msg = java.net.URLEncoder.encode("Vui lòng đăng nhập để thanh toán", "UTF-8");
            response.sendRedirect("login.jsp?msg=" + msg);
        } else {
    request.setAttribute("nd", nd); // ✅ truyền đối tượng người dùng sang JSP
    request.getRequestDispatcher("checkout.jsp").forward(request, response);
}

    }
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        NguoiDung nd = (session != null) ? (NguoiDung) session.getAttribute("user") : null;

        if (nd == null) {
            // Nếu người dùng chưa đăng nhập → quay lại trang login
            String msg = java.net.URLEncoder.encode("Vui lòng đăng nhập để thanh toán", "UTF-8");
            response.sendRedirect("login.jsp?msg=" + msg);
            return;
        }

        // ✅ Lấy thông tin từ form checkout.jsp
        String ho = request.getParameter("ho");
        String ten = request.getParameter("ten");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String diaChi = request.getParameter("diaChi");
        String payment = request.getParameter("paymentMethod");

        // ✅ Lấy tổng tiền từ session (hoặc tính lại từ giỏ hàng)
        Double tongTien = (Double) session.getAttribute("tongTien");
        if (tongTien == null) tongTien = 0.0;

        // ✅ TODO: Lưu đơn hàng vào DB (ví dụ)
        // DonHang dh = new DonHang(nd.getMaND(), ho + " " + ten, email, sdt, diaChi, tongTien, payment);
        // DonHangDAO.insert(dh);

        // ✅ Sau khi lưu thành công → xoá giỏ hàng (nếu có)
        session.removeAttribute("cartItems");

        // ✅ Chuyển hướng sang trang thông báo thành công
        request.setAttribute("msg", "Thanh toán thành công! Cảm ơn bạn đã mua hàng.");
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
