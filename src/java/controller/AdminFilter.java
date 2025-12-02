package controller;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        // ✅ Không tạo session mới nếu chưa có
        HttpSession session = request.getSession(false);

        // ✅ Lấy role từ session (đồng bộ với LoginServlet)
        String vaitro = (session != null) ? (String) session.getAttribute("vaitro") : null;

        System.out.println("🔍 Kiểm tra quyền: " + vaitro); // debug log

        // ✅ Nếu chưa đăng nhập hoặc không phải admin → chặn
        if (vaitro == null || !"admin".equalsIgnoreCase(vaitro)) {
            response.sendRedirect(request.getContextPath() + "/access-denied.jsp");
            return;
        }

        // ✅ Cho phép đi tiếp
        chain.doFilter(req, res);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Không cần cấu hình thêm
    }

    @Override
    public void destroy() {
        // Không cần xử lý khi hủy
    }
}
