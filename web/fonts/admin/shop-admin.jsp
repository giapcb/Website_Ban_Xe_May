<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<jsp:include page="sidebar.jsp" />
<%
    HttpSession sess = request.getSession(false);
    String vaitro = (sess != null) ? (String) sess.getAttribute("vaitro") : null;

    if (vaitro == null || !"admin".equalsIgnoreCase(vaitro)) {
        response.sendRedirect(request.getContextPath() + "/access-denied.jsp");
        return;
    }
%>


<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Admin – Danh sách sản phẩm</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <style>

            .content {
                margin-left: 260px;
                padding: 20px;
            }
            .product-card {
                border-radius: 8px;
                background: white;
                padding: 10px;
                box-shadow: 0 2px 6px rgba(0,0,0,0.15);
            }
            .product-card img {
                width: 100%;
                height: 180px;
                object-fit: cover;
                border-radius: 6px;
            }
        </style>
    </head>

    <body>

        <!-- NỘI DUNG CHÍNH -->
        <div class="content">
            <h2 class="mb-4">🛒 Danh sách sản phẩm (Admin)</h2>

            <div class="row g-4">

                <c:forEach var="x" items="${dsXe}">
                    <div class="col-md-3">
                        <div class="product-card">
                            <img src="<%=request.getContextPath()%>/image/${x.hinhAnh}" alt="${x.tenSp}">
                            <h6 class="mt-2 text-danger">${x.hangSX}</h6>
                            <strong>${x.tenSp}</strong><br>
                            <span class="text-success fw-bold">
                                <fmt:formatNumber value="${x.gia}" type="number"/> ₫
                            </span>

                            <!-- Nút dành cho admin -->
                            <div class="mt-2">

                              
                                <!-- SỬA -->
<a class="btn btn-warning w-100 mb-1"
   href="${pageContext.request.contextPath}/admin/editProductByName?name=${x.tenSp}">
    Sửa
</a>

<!-- XÓA -->
<a class="btn btn-danger w-100"
   href="${pageContext.request.contextPath}/admin/deleteProductByName?name=${x.tenSp}"
   onclick="return confirm('Bạn chắc muốn xóa sản phẩm: ${x.tenSp}?')">
    Xóa
</a>



                            </div>

                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>

        <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
