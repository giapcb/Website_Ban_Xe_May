<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="sidebar.jsp" />
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm người dùng</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            background: #fff;
            margin: 60px auto;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            animation: fadeIn 0.5s ease;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            display: block;
            font-weight: 600;
            color: #555;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px 12px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 18px;
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input:focus, select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 6px rgba(0,123,255,0.3);
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            font-size: 15px;
            transition: 0.3s;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            margin-left: 8px;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .form-footer {
            text-align: center;
            margin-top: 25px;
        }

        .note {
            font-size: 13px;
            color: #888;
            text-align: center;
            margin-top: 15px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>➕ Thêm tài khoản mới</h2>

    <form action="${pageContext.request.contextPath}/admin/ManageUsersServlet" method="post">
        <input type="hidden" name="action" value="insert">

        <label>Họ tên:</label>
        <input type="text" name="HoTen" required>

        <label>Tên đăng nhập:</label>
        <input type="text" name="TenDN" required>

        <label>Mật khẩu:</label>
        <input type="password" name="MatKhau" required>

        <label>Email:</label>
        <input type="email" name="Email" required>

        <label>Số điện thoại:</label>
        <input type="text" name="SDT">

        <label>Địa chỉ:</label>
        <input type="text" name="Diachi">

        <label>Vai trò:</label>
        <select name="Vaitro">
            <option value="user">User</option>
            <option value="admin">Admin</option>
        </select>

        <div class="form-footer">
            <button type="submit" class="btn btn-primary">💾 Lưu</button>
            <a href="${pageContext.request.contextPath}/admin/ManageUsersServlet" class="btn btn-secondary">↩ Hủy</a>
        </div>
    </form>

    <p class="note">Vui lòng kiểm tra kỹ thông tin trước khi lưu.</p>
</div>
</body>
</html>
