package filter; 

import java.io.IOException;
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
import java.util.logging.Logger;
import java.net.URLEncoder;


@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/checkout", "/checkout.jsp", "/user/checkout.jsp"})

public class AuthenticationFilter implements Filter {

    private static final Logger LOGGER = Logger.getLogger(AuthenticationFilter.class.getName());

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false); 

        // Kiểm tra xem người dùng đã đăng nhập
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (isLoggedIn) {
            LOGGER.info("USER LOGGED IN. Continuing chain.");
            chain.doFilter(request, response);
            
        } else {
            // CHƯA ĐĂNG NHẬP:
            LOGGER.info("USER NOT LOGGED IN. Redirecting to login."); 

            // 1. KHAI BÁO VÀ LƯU LẠI URL MONG MUỐN (Đã sửa lỗi khai báo biến targetUrl)
           String targetUrl = req.getRequestURI().substring(req.getContextPath().length());
String queryString = req.getQueryString();
if (queryString != null) {
     targetUrl += "?" + queryString;
}

            // Lấy/Tạo Session để lưu trữ
            session = req.getSession(true); 
            session.setAttribute("targetUrl", targetUrl);
            LOGGER.info("Saved targetUrl: " + targetUrl); 

            // 2. Chuyển hướng đến trang đăng nhập
          String message = URLEncoder.encode("Vui lòng đăng nhập để thanh toán", "UTF-8");
String loginPage = req.getContextPath() + "/login.jsp?msg=" + message;

            LOGGER.info("Redirecting to: " + loginPage); 
            
            res.sendRedirect(loginPage);
            return; // Dừng xử lý Filter
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}