package controller;

import dao.ChiTietGioHangDAO;
import dao.GioHangDAO;
import dao.MauXeDAO;
import dao.SanPhamDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.CartItem;
import model.NguoiDung;
import model.SanPham;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    GioHangDAO gioHangDAO = new GioHangDAO();
    ChiTietGioHangDAO chiTietDAO = new ChiTietGioHangDAO();
    SanPhamDAO spDAO = new SanPhamDAO();
    MauXeDAO mxDAO = new MauXeDAO();

    /**
     * Lấy MaGH từ DB hoặc tạo mới MaGH nếu chưa tồn tại cho người dùng đã đăng nhập.
     * Trả về -1 nếu người dùng chưa đăng nhập.
     */
    private long getOrCreateCart(HttpSession session) {
        NguoiDung user = (NguoiDung) session.getAttribute("user");
        long maGH = -1;

        if (user != null) {
            // Lấy giỏ hàng từ DB
            maGH = gioHangDAO.getMaGHByMaND(user.getMaND());
            if (maGH == -1) {
                // Tạo giỏ hàng mới nếu chưa có
                maGH = gioHangDAO.insert(user.getMaND());
            }
        }

        return maGH;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new LinkedHashMap<>();
            session.setAttribute("cart", cart);
        }

        long maGH = getOrCreateCart(session);
        boolean loggedIn = maGH != -1;

        // Action thêm sản phẩm
        if ("add".equals(action)) {
            try {
                int maSP = Integer.parseInt(request.getParameter("MaSP"));
                int qty = request.getParameter("qty") != null ?
                        Integer.parseInt(request.getParameter("qty")) :
                        1;
                String color = request.getParameter("color");
                SanPham sp = spDAO.findById(maSP);
                
                // Lấy ảnh theo màu (nếu có chọn màu)
                String colorImage = null;
                if (color != null && !color.isEmpty()) {
                    colorImage = mxDAO.getColorImage(maSP, color);
                }
                
                if (sp != null) {
                    CartItem currentItem;
                    boolean isNewItem = !cart.containsKey(maSP);
                    
                    if (isNewItem) {
                        // THÊM MỚI vào Session
                        currentItem = new CartItem(sp, qty, color, colorImage);
                        cart.put(maSP, currentItem);
                    } else {
                        // CẬP NHẬT SỐ LƯỢNG và MÀU SẮC trong Session
                        currentItem = cart.get(maSP);
                        currentItem.setQuantity(currentItem.getQuantity() + qty);
                        
                        // Cập nhật màu sắc nếu có thay đổi hoặc được truyền vào
                        if (color != null && !color.isEmpty()) {
                            currentItem.setColor(color);
                            currentItem.setColorImage(colorImage);
                        }
                    }

                    // ⭐ CẬP NHẬT VÀO DATABASE (ĐÃ SỬA LỖI INSERT)
                    if (loggedIn) {
                        // Hàm này xử lý cả INSERT và UPDATE vào bangchitietgiohang
                        // và gọi update NgayCapNhat trong banggiohang
                        chiTietDAO.insertOrUpdateItem(maGH, currentItem); 
                    }
                }

                response.sendRedirect("cart");
                return;

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
                return;
            }
        }
        
        // Action cập nhật màu sắc
        if ("updateColor".equals(action)) {
            try {
                int ma = Integer.parseInt(request.getParameter("MaSP"));
                String newColor = request.getParameter("color");

                if (cart.containsKey(ma)) {
                    CartItem ci = cart.get(ma);
                    ci.setColor(newColor);
                    
                    // Cập nhật lại ảnh màu
                    String newColorImage = mxDAO.getColorImage(ma, newColor);
                    ci.setColorImage(newColorImage);
                    
                    // ⭐ Cập nhật vào DB
                    if (loggedIn) {
                        chiTietDAO.insertOrUpdateItem(maGH, ci); 
                    }
                }

                response.sendRedirect("cart");
                return;

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
                return;
            }
        }
        
        // Nếu user đã login → load lại từ DB để đồng bộ trước khi hiển thị
        if (loggedIn) {
            List<CartItem> dbCart = chiTietDAO.getItemsByMaGH(maGH);
            cart.clear(); // Xóa session cart cũ
            for (CartItem item : dbCart) {
                cart.put(item.getSanPham().getMaSP(), item); // Load từ DB vào Session
            }
        }

        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new LinkedHashMap<>();
            session.setAttribute("cart", cart);
        }

        long maGH = getOrCreateCart(session);
        boolean loggedIn = maGH != -1;

        try {
            if ("remove".equals(action)) {
                int maSP = Integer.parseInt(request.getParameter("MaSP"));
                cart.remove(maSP);

                if (loggedIn) {
                    chiTietDAO.deleteItem(maGH, maSP);
                }

            } else if ("update".equals(action)) {
                String[] ids = request.getParameterValues("maSP");
                if (ids != null) {
                    for (String id : ids) {
                        int maSP = Integer.parseInt(id);
                        int q = Integer.parseInt(request.getParameter("qty_" + maSP));
                        
                        CartItem currentItem = cart.get(maSP);

                        if (q <= 0) {
                            cart.remove(maSP);
                            if (loggedIn) chiTietDAO.deleteItem(maGH, maSP);
                        } else {
                            if (cart.containsKey(maSP)) {
                                currentItem.setQuantity(q);
                                
                                // ⭐ CẬP NHẬT VÀO DB
                                if (loggedIn) {
                                    chiTietDAO.insertOrUpdateItem(maGH, currentItem);
                                }
                            }
                        }
                    }
                }
            }

            response.sendRedirect("cart");
            return;

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }


    @Override
    public String getServletInfo() {
        return "Cart Servlet";
    }
}