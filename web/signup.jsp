<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng ký – Motor Bike</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
</head>
<body class="bg-light">

<section class="vh-100 d-flex align-items-center">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-7 col-lg-6">
        <div class="card shadow-sm">
          <div class="card-body p-4">
            <h3 class="text-center mb-4">Đăng ký tài khoản</h3>
            <form action="RegisterServlet" method="post">
    <input type="text" name="fullname" placeholder="Họ tên" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Mật khẩu" required>
    <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>
    <input type="text" name="sdt" placeholder="Số điện thoại" required>  <!-- Thêm dòng này -->
    <input type="text" name="diachi" placeholder="Địa chỉ">
    <button type="submit">Đăng ký</button>
</form>

            <div class="mt-3 text-center">
              <span>Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
