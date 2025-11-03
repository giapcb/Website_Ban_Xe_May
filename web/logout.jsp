<%-- 
    Document   : logout
    Created on : Nov 1, 2025, 2:37:47 PM
    Author     : Asus TUF
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // ✅ Hủy session người dùng
    session.invalidate();

    // ✅ Quay lại trang chủ (hoặc trang đăng nhập nếu bạn muốn)
    response.sendRedirect("index.jsp");
%>

