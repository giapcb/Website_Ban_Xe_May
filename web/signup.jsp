<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng ký – Motor Bike</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(to right, #ff9a9e, #fad0c4);
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
    }

    .signup-wrapper {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .signup-card {
      display: flex;
      background: #fff;
      border-radius: 20px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      overflow: hidden;
      width: 950px;
      max-width: 95%;
    }

    .signup-form {
      flex: 1;
      padding: 40px;
    }

    .signup-form h3 {
      text-align: center;
      color: #ff5c5c;
      margin-bottom: 25px;
      font-weight: 600;
    }

    .form-control {
      border-radius: 10px;
      padding: 12px;
    }

    .btn-signup {
      background-color: #ff5c5c;
      border: none;
      border-radius: 10px;
      padding: 12px;
      font-size: 16px;
      font-weight: 500;
      transition: background-color 0.3s;
    }

    .btn-signup:hover {
      background-color: #ff4040;
    }

    .signup-image {
      flex: 1;
      background: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      overflow: hidden;
    }

    .signup-image img {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
      opacity: 0;
      transition: opacity 1s ease-in-out;
    }

    .signup-image img.active {
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

    @media (max-width: 768px) {
      .signup-card {
        flex-direction: column;
        width: 90%;
      }
      .signup-image {
        display: none;
      }
    }
  </style>
</head>
<body>

  <div class="signup-wrapper">
    <div class="signup-card">
      <!-- 🧾 Form đăng ký -->
      <div class="signup-form">
        <h3>Đăng ký tài khoản</h3>
        <form action="RegisterServlet" method="post">
          <div class="row g-3">
            <div class="col-md-6">
              <input type="text" name="fullname" class="form-control" placeholder="Họ tên" required>
            </div>
            <div class="col-md-6">
              <input type="email" name="email" class="form-control" placeholder="Email" required>
            </div>
            <div class="col-md-6">
              <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required>
            </div>
            <div class="col-md-6">
              <input type="password" name="confirmPassword" class="form-control" placeholder="Xác nhận mật khẩu" required>
            </div>
            <div class="col-md-6">
              <input type="text" name="sdt" class="form-control" placeholder="Số điện thoại" required>
            </div>
            <div class="col-md-6">
              <input type="text" name="diachi" class="form-control" placeholder="Địa chỉ">
            </div>
          </div>

          <div class="d-grid mt-4">
            <button type="submit" class="btn btn-signup text-white">Đăng ký</button>
          </div>
        </form>

        <div class="mt-3 text-center">
          <span>Đã có tài khoản? <a href="login.jsp" class="text-danger">Đăng nhập ngay</a></span>
        </div>
      </div>

      <!-- 🖼️ Ảnh slideshow -->
      <div class="signup-image">
        <div class="overlay"></div>
        <img src="${pageContext.request.contextPath}/image/Lead.jpg" class="active">
        <img src="${pageContext.request.contextPath}/image/sh mode.jpg">
        <img src="${pageContext.request.contextPath}/image/vison.jpg">
        <img src="${pageContext.request.contextPath}/image/Winner X.jpg">
           <img src="${pageContext.request.contextPath}/image/CBR150R.jpg">
            <img src="${pageContext.request.contextPath}/image/super cub.jpg">
        <div class="caption">Khám phá thế giới xe Motor Bike cùng chúng tôi!</div>
      </div>
    </div>
  </div>

  <script src="js/bootstrap.bundle.min.js"></script>

  <!-- 🎞️ Hiệu ứng chuyển ảnh -->
  <script>
    let index = 0;
    const images = document.querySelectorAll('.signup-image img');
    setInterval(() => {
      images[index].classList.remove('active');
      index = (index + 1) % images.length;
      images[index].classList.add('active');
    }, 3000);
  </script>

</body>
</html>
