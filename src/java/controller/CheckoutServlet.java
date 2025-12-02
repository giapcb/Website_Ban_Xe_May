/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ChiTietDonHangDAO;
import dao.ChiTietGioHangDAO;
import dao.DonHangDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import model.CartItem;
import model.NguoiDung;
import utility.EmailSender;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    // Phương thức này không cần thiết vì bạn đã có doGet/doPost riêng
    // protected void processRequest(...) { ... }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       // 1️⃣ Mã hóa UTF-8
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    // 2️⃣ Lấy thông tin người dùng
    HttpSession session = request.getSession();
    NguoiDung nd = (NguoiDung) session.getAttribute("user");

    if (nd != null && nd.getHoTen() != null) {
        String hoTenFull = nd.getHoTen();
        String[] parts = hoTenFull.split(" ", 2);
        request.setAttribute("ho", parts[0]);
        request.setAttribute("ten", parts.length > 1 ? parts[1] : "");
    }

   @SuppressWarnings("unchecked")
    Map<Integer, CartItem> cartMap = (Map<Integer, CartItem>) session.getAttribute("cart");

    Collection<CartItem> cartItems = null; // Khởi tạo List<CartItem> cho JSP

    double tongTien = 0;
    if (cartMap != null) {
        // Lấy danh sách CartItem (Collection of values) từ Map
        cartItems = cartMap.values(); 
        
        // Tính toán Tổng tiền
        for (CartItem item : cartItems) {
            // Đảm bảo method getTotal() trong CartItem trả về (giá * số lượng)
            tongTien += item.getTotal(); 
        }
    }

    // 4️⃣ Truyền dữ liệu sang JSP
    request.setAttribute("nd", nd);
    // Truyền Collection<CartItem> để khớp với <c:forEach var="item" items="${cartItems}"> trong checkout.jsp
    request.setAttribute("cartItems", cartItems); 
    // Truyền tổng tiền
    request.setAttribute("tongTien", tongTien);

    // 5️⃣ Chuyển đến trang thanh toán
    request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }
    
  
    
    // --- BẮT ĐẦU SỬA: Phương thức doPost xử lý thanh toán và lưu DB ---
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 // File: CheckoutServlet.java (Phương thức doPost đã tối ưu)


    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    HttpSession session = request.getSession(false);
    NguoiDung nd = (session != null) ? (NguoiDung) session.getAttribute("user") : null;
    
    // --- KHỞI TẠO VÀ LẤY DỮ LIỆU ---
    
    // 1. KIỂM TRA ĐĂNG NHẬP
    if (nd == null || nd.getMaND() == 0) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 2. LẤY DỮ LIỆU ĐƠN HÀNG VÀ GIỎ HÀNG
    String paymentMethod = request.getParameter("paymentMethod");
    String ho = request.getParameter("ho");
    String ten = request.getParameter("ten");
    String diaChi = request.getParameter("diaChi"); // Lấy địa chỉ nhận hàng
    
    @SuppressWarnings("unchecked")
    Map<Integer, CartItem> cartMap = (Map<Integer, CartItem>) session.getAttribute("cart");
    
    double tongTien = 0;
    if (cartMap == null || cartMap.isEmpty()) {
        request.setAttribute("errorMsg", "Giỏ hàng trống! Vui lòng thêm sản phẩm.");
        request.getRequestDispatcher("cart").forward(request, response);
        return;
    }
    
    for (CartItem item : cartMap.values()) {
        tongTien += item.getTotal();
    }

    // --- XỬ LÝ LƯU DB VÀ PHÂN LUỒNG ---
    
    try {
        // 3. XÁC ĐỊNH TRẠNG THÁI VÀ TRANG CHUYỂN HƯỚNG
        String trangThai;
        String redirectPage;
        
        if ("COD".equals(paymentMethod)) {
            trangThai = "Chờ xử lý"; 
            redirectPage = "cod_success.jsp";
        } else { // Ví điện tử/Chuyển khoản
            trangThai = "Chờ thanh toán"; 
            redirectPage = "qr_payment.jsp";
        }
        
        // 4. LƯU VÀO DB (Sử dụng DAO)
        DonHangDAO dhDAO = new DonHangDAO();
        ChiTietDonHangDAO ctdhDAO = new ChiTietDonHangDAO();
        
        long maDH = dhDAO.insert(nd.getMaND(), tongTien, trangThai);
        
        if (maDH <= 0) {
            throw new Exception("Lỗi khi chèn đơn hàng chính vào DB.");
        }

        boolean allDetailsSaved = true;
        for (CartItem item : cartMap.values()) {
            if (!ctdhDAO.insert(maDH, item)) {
                allDetailsSaved = false;
                throw new Exception("Lỗi lưu chi tiết sản phẩm MaSP: " + item.getSanPham().getMaSP());
            }
        }
        
        // --- 5. HÀNH ĐỘNG SAU KHI LƯU DB THÀNH CÔNG ---
        
        // 5a. GỬI EMAIL XÁC NHẬN
        if (EmailSender.sendOrderConfirmation(nd.getEmail(), maDH, tongTien, paymentMethod)) {
            System.out.println("Email xác nhận đã gửi thành công tới: " + nd.getEmail());
        } else {
            System.err.println("Lỗi: Không thể gửi email xác nhận.");
        }

        // 5b. XÓA GIỎ HÀNG
        session.removeAttribute("cart"); 
        
        // 5c. THIẾT LẬP THUỘC TÍNH CHO JSP VÀ CHUYỂN HƯỚNG
        request.setAttribute("maDH", maDH);
        request.setAttribute("tongTien", tongTien);
        request.setAttribute("paymentMethod", paymentMethod);
        request.setAttribute("cartItems", cartMap.values()); 
        request.setAttribute("hoTenNguoiNhan", ho + " " + ten); 
        request.setAttribute("diaChiNguoiNhan", diaChi);

        request.getRequestDispatcher(redirectPage).forward(request, response);
        
    } catch (Exception e) {
        // Xử lý Lỗi DB hoặc Lỗi Runtime khác (bao gồm lỗi Email hoặc Lỗi Chuyển hướng JSP)
        e.printStackTrace(); 
        
        // Lỗi này sẽ hiển thị khi có lỗi trong quá trình lưu DB hoặc chuyển hướng.
        request.setAttribute("errorMsg", "Đặt hàng thất bại do lỗi hệ thống. Vui lòng kiểm tra Console.");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }

      
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}