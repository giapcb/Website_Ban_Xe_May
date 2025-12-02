package controller;

import dao.SanPhamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.SanPham;

@WebServlet("/admin/editProductByName")
public class EditProductByNameServlet extends HttpServlet {

    private SanPhamDAO sanPhamDAO = new SanPhamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");

        if (name == null || name.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/shop");
            return;
        }

        // GỌI DAO — tên cột phải là tenSp
        SanPham sp = sanPhamDAO.getByName(name);

        if (sp == null) {
            // Không tìm thấy => quay lại shop
            response.sendRedirect(request.getContextPath() + "/admin/shop?error=notfound");
            return;
        }

        // Đẩy sản phẩm lên JSP để hiển thị form sửa
        request.setAttribute("sp", sp);
        request.getRequestDispatcher("/admin/editProductShop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String oldName = request.getParameter("oldName");
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String price = request.getParameter("price");
        String image = request.getParameter("image");

        boolean updated = sanPhamDAO.updateByName(oldName, name, brand, price, image);

        if (updated) {
            response.sendRedirect(request.getContextPath() + "/admin/shop?success=updated");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/editProductByName?name=" + oldName + "&error=fail");
        }
    }
}
