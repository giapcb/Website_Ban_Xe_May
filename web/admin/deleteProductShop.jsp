<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xóa sản phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background-color: #f5f5f5; text-align: center; }
        .delete-btn { background-color: #f44336; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        .delete-btn:hover { opacity: 0.9; }
        a { display: block; margin-top: 20px; color: #007BFF; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>

<h2>Xóa sản phẩm</h2>

<c:choose>
    <c:when test="${not empty sp}">
        <p>Bạn có chắc muốn xóa sản phẩm: <strong>${sp.name}</strong> ?</p>

        <form action="DeleteServletByName" method="post" onsubmit="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">
            <input type="hidden" name="name" value="${sp.name}" />
            <input type="submit" value="Xóa sản phẩm" class="delete-btn" />
        </form>

        <a href="AdminShopServlet">Quay lại danh sách sản phẩm</a>
    </c:when>

    <c:otherwise>
        <p>Không tìm thấy sản phẩm để xóa.</p>
        <a href="AdminShopServlet">Quay lại danh sách sản phẩm</a>
    </c:otherwise>
</c:choose>

</body>
</html>
