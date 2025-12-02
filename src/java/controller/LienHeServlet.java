/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.LienHeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LienHe;
import model.NguoiDung;
import utility.EmailSender;

/**
 *
 * @author Asus TUF
 */
@WebServlet(name = "LienHeServlet", urlPatterns = {"/LienHeServlet"})
public class LienHeServlet extends HttpServlet {
private static final String ADMIN_EMAIL = "giapthoi09@gmail.com"; // email nhận thông báo
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
            out.println("<title>Servlet LienHeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LienHeServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

        NguoiDung user = (NguoiDung) request.getSession().getAttribute("user");

        String hoTen = (user != null) ? user.getHoTen() : request.getParameter("hoTen");
        String email = (user != null) ? user.getEmail() : request.getParameter("email");
        String sdt = (user != null) ? user.getSDT() : request.getParameter("sdt");
        String noiDung = request.getParameter("noiDung");

        // 👉 Lưu vào DB
        LienHeDAO lhDAO = new LienHeDAO();
        LienHe lh = new LienHe();

        lh.setHoTen(hoTen);
        lh.setEmail(email);
        lh.setSDT(sdt);
        lh.setNoiDung(noiDung);
        lh.setNgayGui(new java.sql.Timestamp(System.currentTimeMillis()));

        boolean saved = lhDAO.insert(lh);

        // 👉 Gửi mail về Admin
        String subject = "KHÁCH HÀNG LIÊN HỆ: " + hoTen;
        String content = "<h3>Thông tin khách hàng liên hệ</h3>"
                + "<p><strong>Họ tên:</strong> " + hoTen + "</p>"
                + "<p><strong>Email:</strong> " + email + "</p>"
                + "<p><strong>Số điện thoại:</strong> " + sdt + "</p>"
                + "<p><strong>Nội dung liên hệ:</strong><br>" + noiDung + "</p>";

        boolean sent = EmailSender.sendEmail(ADMIN_EMAIL, subject, content);

        // 👉 Hiển thị thông báo ra giao diện
        if (saved && sent) {
            request.setAttribute("message", "Gửi liên hệ thành công! Chúng tôi sẽ phản hồi sớm nhất!");
        } else if (!saved) {
            request.setAttribute("message", "Lỗi khi lưu thông tin vào hệ thống!");
        } else {
            request.setAttribute("message", "Email không gửi được nhưng đã lưu vào hệ thống!");
        }

        request.getRequestDispatcher("contact.jsp").forward(request, response);
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
