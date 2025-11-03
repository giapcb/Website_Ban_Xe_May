/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.NguoiDungDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NguoiDung;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("email");
String pass = request.getParameter("password");

        NguoiDungDAO dao = new NguoiDungDAO();
        NguoiDung u = dao.login(user, pass);

      if (u != null) {
    HttpSession session = request.getSession();
    session.setAttribute("user", u);

    // ✅ Đăng nhập thành công -> vào trang chính index.jsp
    response.sendRedirect("index.jsp");
} else {
    request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
    request.getRequestDispatcher("login.jsp").forward(request, response);
}

    }
}
