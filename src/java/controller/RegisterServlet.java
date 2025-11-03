/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.NguoiDungDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.NguoiDung;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})

public class RegisterServlet extends HttpServlet {

    private NguoiDungDAO nguoiDungDAO;

    @Override
    public void init() {
        nguoiDungDAO = new NguoiDungDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Đặt mã hóa UTF-8 để không lỗi tiếng Việt
      request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Lấy dữ liệu từ form
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
         String sdt = request.getParameter("sdt");
String diachi = request.getParameter("diachi");
        // Kiểm tra mật khẩu khớp
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Khởi tạo DAO
        NguoiDungDAO dao = new NguoiDungDAO();

        // Kiểm tra email đã tồn tại chưa
        if (dao.isEmailExists(email)) {
            request.setAttribute("error", "Email đã tồn tại!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng người dùng mới
        NguoiDung user = new NguoiDung();
        user.setHoTen(fullname);
user.setEmail(email);
user.setMatKhau(password);
user.setTenDN(email);
user.setSDT(sdt); // ✅ không null nữa
user.setDiaChi(diachi);

        boolean result = dao.register(user);

        if (result) {
    // ✅ Đăng ký thành công → chuyển đến trang đăng nhập
    response.sendRedirect("login.jsp");
} else {
    request.setAttribute("error", "Đăng ký thất bại. Vui lòng thử lại.");
    request.getRequestDispatcher("signup.jsp").forward(request, response);
}

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("signup.jsp");
    }
}

