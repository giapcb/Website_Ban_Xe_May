/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus TUF
 */
@WebServlet(name = "QrCodeGeneratorServlet", urlPatterns = {"/generateQr"})
public class QrCodeGeneratorServlet extends HttpServlet {

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
            out.println("<title>Servlet QrCodeGeneratorServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QrCodeGeneratorServlet at " + request.getContextPath() + "</h1>");
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
      // 1. Lấy dữ liệu đã được làm sạch từ tham số URL
        // Chuỗi 'data' đã an toàn vì nó được xử lý bằng fn:replace trong JSP.
        String data = request.getParameter("data"); 
        
        if (data == null || data.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tham số 'data' bị thiếu.");
            return;
        }

        try {
            // 2. Thiết lập Header: Trả về hình ảnh PNG
            response.setContentType("image/png");
            
            // 3. Tạo BitMatrix từ dữ liệu (Truyền trực tiếp chuỗi đã làm sạch)
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            
            // Hàm encode sẽ tự động mã hóa chuỗi thành mã QR
            BitMatrix bitMatrix = qrCodeWriter.encode(data, BarcodeFormat.QR_CODE, 200, 200); 

            // 4. Ghi BitMatrix vào OutputStream của response
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", response.getOutputStream());
            
        } catch (WriterException e) {
            // Lỗi xảy ra nếu chuỗi data không hợp lệ hoặc không thể mã hóa
            System.err.println("Lỗi ZXing Writer: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi tạo QR (WriterException).");
        } catch (Exception e) {
             // Lỗi khác (IO, v.v.)
            System.err.println("Lỗi tạo QR chung: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi tạo QR chung.");
        }}
    

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
