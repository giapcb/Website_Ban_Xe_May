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
import java.util.LinkedHashMap;
import java.util.Map;
import model.CartItem;
import model.SanPham;

/**
 *
 * @author Asus TUF
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

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
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
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
    

    // 👉 Hiển thị giỏ hàng
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new LinkedHashMap<>();
            session.setAttribute("cart", cart);
        }

        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    // 👉 Xử lý thêm, cập nhật, xoá sản phẩm
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action"); // add, update, remove

        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new LinkedHashMap<>();
            session.setAttribute("cart", cart);
        }

        SanPhamDAO dao = new SanPhamDAO();

        try {
            if ("add".equals(action)) {
                int ma = Integer.parseInt(request.getParameter("maSP"));
                int qty = 1; // mặc định 1 nếu không truyền

                if (request.getParameter("qty") != null) {
                    qty = Integer.parseInt(request.getParameter("qty"));
                }

                SanPham sp = dao.findById(ma);
                if (sp != null) {
                    if (cart.containsKey(ma)) {
                        CartItem ci = cart.get(ma);
                        ci.setQuantity(ci.getQuantity() + qty);
                    } else {
                        cart.put(ma, new CartItem(sp, qty));
                    }
                }

                // Sau khi thêm, quay lại giỏ hàng
               response.sendRedirect(request.getContextPath() + "/cart");

                return;

            } else if ("remove".equals(action)) {
                int ma = Integer.parseInt(request.getParameter("maSP"));
                cart.remove(ma);
                response.sendRedirect("cart");
                return;

            } else if ("update".equals(action)) {
                String[] ids = request.getParameterValues("maSP");
                if (ids != null) {
                    for (String id : ids) {
                        int ma = Integer.parseInt(id);
                        int q = Integer.parseInt(request.getParameter("qty_" + ma));
                        if (q <= 0) {
                            cart.remove(ma);
                        } else if (cart.containsKey(ma)) {
                            cart.get(ma).setQuantity(q);
                        }
                    }
                }
               response.sendRedirect(request.getContextPath() + "/cart");

                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
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
