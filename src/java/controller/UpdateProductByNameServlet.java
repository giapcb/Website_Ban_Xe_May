package controller;

import dao.SanPhamDAO;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/admin/updateProductByName")
@MultipartConfig
public class UpdateProductByNameServlet extends HttpServlet {

    private SanPhamDAO dao = new SanPhamDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String oldName = request.getParameter("oldName");
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String price = request.getParameter("price");

        String oldImage = request.getParameter("oldImage");

        Part filePart = request.getPart("imageFile");

        String fileName;

        if (filePart != null && filePart.getSize() > 0) {

            fileName = filePart.getSubmittedFileName();

            String uploadPath = request.getServletContext().getRealPath("/images");

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) uploadDir.mkdirs();

            filePart.write(uploadPath + File.separator + fileName);

        } else {
            fileName = oldImage;
        }

        boolean ok = dao.updateByName(oldName.trim(), name.trim(), brand.trim(), price.trim(), fileName);

        if (ok) {
            response.sendRedirect(request.getContextPath() + "/admin/shop");
        } else {
            response.getWriter().println("Cập nhật thất bại!");
        }
    }
}

