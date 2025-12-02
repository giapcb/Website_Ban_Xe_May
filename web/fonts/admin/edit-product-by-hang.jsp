<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // ✅ Kiểm tra quyền admin
    HttpSession sess = request.getSession(false);
    String vaitro = (sess != null) ? (String) sess.getAttribute("vaitro") : null;
    if (vaitro == null || !"admin".equalsIgnoreCase(vaitro)) {
        response.sendRedirect(request.getContextPath() + "/access-denied.jsp");
        return;
    }
%>
<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa sản phẩm theo hãng</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
</head>
<body class="bg-light p-4">

    <h3>✏️ Sửa sản phẩm - ${spEdit.hangSX}</h3>
    <form action="ManageProductsServlet" method="post" class="mt-3">
        <input type="hidden" name="hangSX" value="${spEdit.hangSX}">

        <div class="mb-3">
            <label class="form-label">Số lượng bán:</label>
            <input type="number" name="soLuongBan" class="form-control" value="${spEdit.soLuongBan}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Số lượng còn lại:</label>
            <input type="number" name="soLuong" class="form-control" value="${spEdit.soLuong}" required>
        </div>

        <button type="submit" class="btn btn-success">Lưu thay đổi</button>
        <a href="ManageProductsServlet" class="btn btn-secondary">Hủy</a>
    </form>

</body>
</html>
