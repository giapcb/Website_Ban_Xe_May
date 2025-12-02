<%-- 
    Document   : error
    Created on : Nov 14, 2025, 9:11:50 AM
    Author     : Asus TUF
--%>

<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lỗi Hệ Thống</title>
</head>
<body>
    <h1>Xin lỗi, đã xảy ra lỗi trong quá trình xử lý đơn hàng.</h1>
    <p>Vui lòng thử lại hoặc liên hệ hỗ trợ.</p>
    <%-- Hiển thị thông báo lỗi nếu có --%>
    <p>Chi tiết lỗi (Nếu có): ${errorMsg}</p>
    <a href="index">Quay về trang chủ</a>
</body>
</html>