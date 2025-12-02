<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.NguoiDung" %>


<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin-style.css">
    <style>
        body {
            background-color: #f6f8fb;
            font-family: "Segoe UI", sans-serif;
        }
        .content {
            margin-left: 260px; /* Đẩy sang phải để không đè sidebar */
            padding: 30px;
        }
        .card {
            border-radius: 12px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.05);
        }
        .table thead {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .table tbody tr:hover {
            background-color: #f1f5ff;
        }
        .btn-add {
            background-color: #28a745;
            color: white;
            border-radius: 6px;
            font-weight: 500;
        }
        .btn-add:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>

    <div class="content">
        <div class="card p-4">
            <h3 class="mb-4"><i class="bi bi-person-badge"></i> Quản lý người dùng</h3>
            
            <a href="${pageContext.request.contextPath}/admin/ManageUsersServlet?action=add" class="btn btn-add mb-3">
                + Thêm người dùng
            </a>

            <table class="table table-bordered align-middle">
                <thead>
                    <tr>
                        <th>Mã ND</th>
                        <th>Họ tên</th>
                        <th>Tên đăng nhập</th>
                        <th>Email</th>
                        <th>SĐT</th>
                        <th>Địa chỉ</th>
                        <th>Vai trò</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<NguoiDung> list = (List<NguoiDung>) request.getAttribute("listUsers");
                        if (list != null && !list.isEmpty()) {
                            for (NguoiDung u : list) {
                    %>
                    <tr>
                        <td><%= u.getMaND() %></td>
                        <td><%= u.getHoTen() %></td>
                        <td><%= u.getTenDN() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getSDT() %></td>
                        <td><%= u.getDiaChi() %></td>
                        <td><%= u.getVaiTro() %></td>
                        <td class="text-center">
                            <a href="${pageContext.request.contextPath}/admin/ManageUsersServlet?action=edit&MaND=<%=u.getMaND()%>" 
                               class="btn btn-warning btn-sm text-white">Sửa</a>
                            <a href="${pageContext.request.contextPath}/admin/ManageUsersServlet?action=delete&MaND=<%=u.getMaND()%>" 
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Bạn có chắc muốn xóa người dùng này không?');">Xóa</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr><td colspan="8" class="text-center text-muted">Chưa có người dùng nào</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
