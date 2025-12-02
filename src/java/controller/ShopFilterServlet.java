
package controller;

import dao.SanPhamDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.SanPham;

@WebServlet(name = "ShopFilterServlet", urlPatterns = {"/ShopFilterServlet"})
public class ShopFilterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // ✅ Nhận dữ liệu từ form (đúng với JSP)
        String type = request.getParameter("type");     // loại xe
        String price = request.getParameter("price");   // mức giá
        String brand = request.getParameter("brand");   // hãng xe

        // ✅ Gọi DAO để lấy danh sách sản phẩm đã lọc
        SanPhamDAO dao = new SanPhamDAO();
        List<SanPham> dsXe = dao.filterSanPham(type, price, brand);

        // ✅ Gửi dữ liệu về lại JSP
        request.setAttribute("dsXe", dsXe);
        request.setAttribute("totalCount", dsXe.size());
        request.setAttribute("page", 1);
        request.setAttribute("totalPages", 1);
        
        
        request.setAttribute("type", type);
        request.setAttribute("price", price);
        request.setAttribute("brand", brand);


        RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

