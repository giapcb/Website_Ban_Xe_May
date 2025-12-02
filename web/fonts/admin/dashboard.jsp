<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<jsp:include page="sidebar.jsp" />

<%
    HttpSession sess = request.getSession(false);
    String vaitro = (sess != null) ? (String) sess.getAttribute("vaitro") : null;

    if (vaitro == null || !"admin".equalsIgnoreCase(vaitro)) {
        response.sendRedirect(request.getContextPath() + "/access-denied.jsp");
        return;
    }

    model.NguoiDung admin = (model.NguoiDung) sess.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">

<style>
    /* ✅ Sidebar chung cho tất cả trang admin */
    .sidebar {
        width: 250px;
        background-color: #1f354d;
        height: 100vh;
        color: white;
        padding: 25px 20px;
        position: fixed;
        top: 0;
        left: 0;
    }

    .sidebar a {
        color: white;
        text-decoration: none;
        display: block;
        padding: 10px 0;
    }

    .sidebar a:hover {
        color: #ffd700;
    }

    /* ✅ Nội dung được đẩy qua phải, không bị che */
    .admin-content {
        margin-left: 250px;
        padding: 30px;
        background: #f8f9fa;
        min-height: 100vh;
    }
</style>

</head>

<body>

<!-- ✅ Mọi thứ nằm trong admin-content để tránh bị đè -->
<div class="admin-content">

    <h2>📊 Thống kê tổng quan</h2>

    <div class="row mt-4">

        <div class="col-md-3">
            <div class="card p-3 text-center bg-light">
                <h5>Doanh số hôm nay</h5>
                <h3 style="color:#27ae60;">
                    <fmt:formatNumber value="${doanhSo}" type="currency" currencySymbol="₫"/>
                </h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card p-3 text-center bg-light">
                <h5>Tổng đơn hàng</h5>
                <h3 style="color:#2980b9;">${tongDon}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card p-3 text-center bg-light">
                <h5>Số lượng bán hôm nay</h5>
                <h3 style="color:#8e44ad;">${soLuongBan}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card p-3 text-center bg-light">
                <h5>Số lượng còn lại</h5>
                <h3 style="color:#d35400;">${tonKho}</h3>
            </div>
        </div>

    </div>

</div>

</body>
</html>
