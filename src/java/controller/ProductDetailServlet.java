/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MauXeDAO;
import dao.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Mau;
import model.SanPham;

/**
 *
 * @author Asus TUF
 */
@WebServlet(name = "ProductDetailServlet", urlPatterns = {"/ProductDetailServlet"})
public class ProductDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailServlet at " + request.getContextPath() + "</h1>");
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
        String maSP_raw = request.getParameter("MaSP");

        // Kiểm tra mã sản phẩm
        if (maSP_raw == null || maSP_raw.trim().isEmpty()) {
            response.getWriter().println("<h3 style='color:red;text-align:center;'>⚠ Thiếu mã sản phẩm.</h3>");
            return;
        }

        int maSP;
        try {
            maSP = Integer.parseInt(maSP_raw);
        } catch (NumberFormatException e) {
            response.getWriter().println("<h3 style='color:red;text-align:center;'>⚠ Mã sản phẩm không hợp lệ.</h3>");
            return;
        }

        SanPhamDAO dao = new SanPhamDAO();
        SanPham sp = dao.findById(maSP);

        if (sp == null) {
            response.getWriter().println("<h3 style='color:red;text-align:center;'>⚠ Không tìm thấy sản phẩm.</h3>");
            return;
        }
        
        MauXeDAO mxdao = new MauXeDAO();
        // Lấy danh sách màu xe
        List<Mau> mauList = mxdao.getColorsByProduct(maSP);

        // Lấy sản phẩm liên quan
        List<SanPham> spLienQuan = dao.getSanPhamLienQuan(
                sp.getMaSP(), sp.getHangSX(), sp.getMaLoai()
        );

        // -------------------------------
        // ⭐ THÊM CHO CHẾ ĐỘ UPDATE COLOR
        // -------------------------------
        String mode = request.getParameter("mode");   // nhận mode=edit từ giỏ hàng
        request.setAttribute("mode", mode);           // gửi qua detail.jsp

        // Gửi dữ liệu sang JSP
        request.setAttribute("sp", sp);
        request.setAttribute("mauList", mauList);
        request.setAttribute("spLienQuan", spLienQuan);

        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
        processRequest(request, response);
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
