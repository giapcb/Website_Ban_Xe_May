<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập – Motor Bike</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* 🌈 Nền tổng thể */
    body {
      background: linear-gradient(to right, #ff9a9e, #fad0c4);
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
    }

    /* 🧩 Bố cục tổng */
    .login-wrapper {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .login-card {
      display: flex;
      background: #fff;
      border-radius: 20px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      overflow: hidden;
      width: 950px;
      max-width: 95%;
    }

    /* 📋 Form đăng nhập */
    .login-form {
      flex: 1;
      padding: 40px;
    }

    .login-form h3 {
      text-align: center;
      color: #ff5c5c;
      margin-bottom: 25px;
      font-weight: 600;
    }

    .form-control {
      border-radius: 10px;
      padding: 12px;
    }

    .btn-login {
      background-color: #ff5c5c;
      border: none;
      border-radius: 10px;
      padding: 12px;
      font-size: 16px;
      font-weight: 500;
      transition: background-color 0.3s;
    }

    .btn-login:hover {
      background-color: #ff4040;
    }

    /* 🖼️ Phần slideshow ảnh */
    .login-image {
      flex: 1;
      position: relative;
      overflow: hidden;
    }

    .image-section {
      position: relative;
      width: 100%;
      height: 100%;
    }

    .image-section img {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
      opacity: 0;
      transition: opacity 1s ease-in-out;
    }

    .image-section img.active {
      opacity: 1;
    }

    .overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.3);
      z-index: 1;
    }

    .caption {
      position: absolute;
      bottom: 20px;
      left: 0;
      width: 100%;
      text-align: center;
      color: #fff;
      font-size: 18px;
      font-weight: 500;
      z-index: 2;
    }

    /* 📱 Responsive */
    @media (max-width: 768px) {
      .login-card {
        flex-direction: column;
        width: 90%;
      }
      .login-image {
        display: none;
      }
    }
  </style>
</head>
<body>
  <div class="login-wrapper">
    <div class="login-card">
      <!-- 🧾 Form đăng nhập -->
      <div class="login-form">
        <h3>Đăng nhập ngay</h3>
        <form action="LoginServlet" method="post">
          <div class="mb-3">
            <input type="tenDangNhap" name="tenDangNhap" id="tenDangNhap" class="form-control" placeholder="Tên đăng nhập hoặc email" required>
          </div>
          <div class="mb-3">
            <input type="password" name="password" id="password" class="form-control" placeholder="Mật khẩu" required>
          </div>
          <div class="d-grid">
            <button type="submit" class="btn btn-login text-white">Đăng nhập</button>
          </div>
        </form>
        <div class="mt-3 text-center">
          <span>Chưa có tài khoản? <a href="signup.jsp" class="text-danger">Đăng ký ngay</a></span>
        </div>
      </div>

      <!-- 🚗 Phần slideshow ảnh -->
      <div class="login-image">
        <div class="image-section">
          <div class="overlay"></div>
          <img src="${pageContext.request.contextPath}/image/Lead.jpg" class="active">
          <img src="${pageContext.request.contextPath}/image/sh mode.jpg">
          <img src="${pageContext.request.contextPath}/image/vison.jpg">
          <img src="${pageContext.request.contextPath}/image/Z125 Pro.jpg">
           <img src="${pageContext.request.contextPath}/image/CBR150R.jpg">
            <img src="${pageContext.request.contextPath}/image/super cub.jpg">
          <div class="caption">Khám phá những mẫu xe mới nhất</div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap -->
  <script src="js/bootstrap.bundle.min.js"></script>

  <!-- 🎞️ Script slideshow -->
  <script>
    let index = 0;
    const images = document.querySelectorAll('.image-section img');
    setInterval(() => {
      images[index].classList.remove('active');
      index = (index + 1) % images.length;
      images[index].classList.add('active');
    }, 3000); // đổi ảnh mỗi 3 giây
  </script>
</body>
</html>
