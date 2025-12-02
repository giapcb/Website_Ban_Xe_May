<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    HttpSession sess = request.getSession(false);
    model.NguoiDung admin = (sess != null) ? (model.NguoiDung) sess.getAttribute("user") : null;
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">

<div class="sidebar">
    <h2>MotorBike Admin</h2>
    <p class="text-center">
        Xin chào:
        <b><%= admin != null ? admin.getHoTen() : "Admin" %></b>
    </p>
    <hr style="border-color:white;">

    <a href="<%=request.getContextPath()%>/admin/dashboard.jsp">Thống kê</a>
    <a href="<%=request.getContextPath()%>/ManageProductsServlet">Quản lý sản phẩm</a>
    <a href="<%=request.getContextPath()%>/admin/ManageUsersServlet">Quản lý người dùng</a>
    <a href="${pageContext.request.contextPath}/admin/manage-orders">Quản lý đơn hàng</a>

    <a href="<%=request.getContextPath()%>/admin/shop">Shop</a>

    <div class="logout">
        <a href="<%=request.getContextPath()%>/logout.jsp">Đăng xuất</a>
    </div>
</div>
