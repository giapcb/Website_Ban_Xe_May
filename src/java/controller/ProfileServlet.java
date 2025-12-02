/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.NguoiDungDAO;
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
@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
    private NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
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
            out.println("<title>Servlet ProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServlet at " + request.getContextPath() + "</h1>");
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
       HttpSession session = request.getSession();
        NguoiDung user = (NguoiDung) session.getAttribute("user");

        if (user == null) {
            // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        // Nếu đã đăng nhập, chuyển hướng đến trang chỉnh sửa hồ sơ (profile.jsp)
        // Dữ liệu người dùng đã có sẵn trong session.getAttribute("user")
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
       HttpSession session = request.getSession();
        NguoiDung user = (NguoiDung) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        // Cài đặt mã hóa ký tự để nhận dữ liệu tiếng Việt từ form
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 2. Lấy dữ liệu mới từ form profile.jsp
        String hoTenMoi = request.getParameter("hoTen");
        String sdtMoi = request.getParameter("sdt");
        String diaChiMoi = request.getParameter("diaChi");
        
        // * Lưu ý: Các trường TenDN và Email được lấy từ user cũ vì chúng bị disabled trên form

        // 3. Cập nhật đối tượng NguoiDung
        user.setHoTen(hoTenMoi);
        user.setSDT(sdtMoi);
        user.setDiaChi(diaChiMoi);

        // 4. Gọi DAO để cập nhật vào Database
        boolean success = nguoiDungDAO.updateProfile(user);

        // 5. Xử lý kết quả và gửi phản hồi
        if (success) {
            // Cập nhật lại đối tượng 'user' trong Session để giao diện hiển thị dữ liệu mới
            session.setAttribute("user", user); 
            request.setAttribute("message", "Cập nhật hồ sơ thành công!");
            request.setAttribute("status", "success");
        } else {
            request.setAttribute("message", "Cập nhật thất bại. Vui lòng thử lại.");
            request.setAttribute("status", "danger");
        }

        // Forward lại về trang profile.jsp để hiển thị thông báo
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    
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
