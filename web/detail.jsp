<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Motor Bike - Chi tiết sản phẩm</title>

  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="fonts/css/fontawesome.min.css" rel="stylesheet">
  <link href="fonts/css/brands.min.css" rel="stylesheet">
  <link href="fonts/css/solid.min.css" rel="stylesheet">
  <link href="css/global.css" rel="stylesheet">
  <link href="css/shop.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
</head>
<body>

<!-- HEADER -->
<section id="header">
  <nav class="navbar navbar-expand-lg navbar-light w-100">
    <div class="container-xl">
      <a class="d-flex p-2" href="index.jsp">
        <b class="fs-3 d-block mt-1 text-uppercase text-white">
          <i class="fa fa-biking col_red me-1"></i> Motor Bike
        </b>
      </a>
      <button class="navbar-toggler offcanvas-nav-btn ms-auto me-3" type="button">
        <img src="image/icons-svg/list.svg" width="40" height="40" alt="Menu"/>
      </button>

      <div class="offcanvas offcanvas-start offcanvas-nav" style="width: 20rem">
        <div class="offcanvas-header shadow">
          <a class="d-flex p-2" href="index.jsp">
            <b class="fs-3 d-block mt-1 text-uppercase text-white">
              <i class="fa fa-biking col_red me-1"></i> Motor Bike
            </b>
          </a>
          <img src="image/icons-svg/x.svg" width="40" height="40" class="ms-auto" data-bs-dismiss="offcanvas" alt="Close"/>
        </div>

        <div class="offcanvas-body pt-0 align-items-center">
          <ul class="navbar-nav align-items-lg-center ms-auto">
            <li class="nav-item"><a class="nav-link active" href="index.jsp">TRANG CHỦ</a></li>
            <li class="nav-item"><a class="nav-link" href="shop.jsp">SHOP</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">LIÊN HỆ</a></li>
            <li class="nav-item"><a class="nav-link" href="login.jsp">ĐĂNG NHẬP</a></li>
            <li class="nav-item"><a class="nav-link" href="signup.jsp">ĐĂNG KÝ</a></li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
</section>

<!-- BANNER -->
<section id="center" class="center_detail"
  style="
    background-image: url('image/rsz_vinfast_banner_1920x1280.jpg');
    background-position: center center;
    background-size: cover;
    background-repeat: no-repeat;
  ">


   <div class="center_om bg_back">
     <div class="container-xl">
  <div class="row center_o1">
     <div class="col-md-12">
	    <h1 class="text-white font_60">CHI TIẾT</h1>
		<h6 class="col_red mb-0"><a class="text-light" href="index.jsp">TRANG CHỦ</a> <span class="mx-2 text-white-50">/</span> Shop</h6>
	 </div>
  </div>
 </div>
   </div> 
</section>

<!-- CHI TIẾT SẢN PHẨM -->
<section id="blog" class="pt-5 pb-5">
  <div class="container-xl">
    <div class="row blog_1">
      <!-- Chi tiết sản phẩm -->
      <div class="col-md-9">
        <div class="shop_dt px-3 border-end">
          <div class="shop_dt1 row">
            <div class="col-md-6">
              <div class="shop_dt1_left">
                <img src="image/15.jpg" alt="Yamaha R15" class="img-fluid rounded">
              </div>
            </div>

            <div class="col-md-6">
              <div class="shop_dt1_right">
                <h1 class="mb-1 text-uppercase">Yamaha R15</h1>
                <b class="d-block fs-4 mb-2 text-danger">75,000,000 ₫</b>
                <p class="mt-3 text-secondary">
                  Xe thể thao mạnh mẽ, thiết kế khí động học, phù hợp với người yêu tốc độ.
                </p>
                <div class="d-flex align-items-center mb-3">
                  <input type="number" min="1" value="1" class="form-control me-3 rounded-0" style="width:80px; height:52px;">
                  <a class="button px-4" href="#">Thêm vào giỏ hàng</a>
                </div>
                <h6 class="mt-4"><span class="text-muted">Hãng:</span> <b>Yamaha</b></h6>
                <h6><span class="text-muted">Năm sản xuất:</span> <b>2024</b></h6>
              </div>
            </div>
          </div>

          <div class="shop_1dt2 mt-5">
            <ul class="nav nav-tabs mb-0">
              <li class="nav-item"><a href="#mota" data-bs-toggle="tab" class="nav-link active">Mô tả</a></li>
              <li class="nav-item"><a href="#danhgia" data-bs-toggle="tab" class="nav-link">Đánh giá</a></li>
            </ul>

            <div class="tab-content border_light border-top-0 p-4">
              <div class="tab-pane active" id="mota">
                <p>
                  Yamaha R15 trang bị động cơ 155cc, công nghệ VVA, khung sườn Deltabox cứng cáp, 
                  giúp vận hành ổn định ở tốc độ cao. Xe có hệ thống phanh ABS an toàn.
                </p>
              </div>
              <div class="tab-pane" id="danhgia">
                <p>Chưa có đánh giá nào cho sản phẩm này.</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Sidebar -->
      <div class="col-md-3">
        <h4 class="text-uppercase mb-3">Sản phẩm liên quan</h4>
        <ul class="list-unstyled">
          <li class="mb-3"><a href="#">Honda CBR150R</a></li>
          <li class="mb-3"><a href="#">Suzuki GSX R150</a></li>
          <li class="mb-3"><a href="#">Yamaha MT-15</a></li>
        </ul>
      </div>
    </div>
  </div>
</section>

<!-- FOOTER -->
<jsp:include page="footer.jsp" />
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/theme.min.js"></script>
</body>
</html>
