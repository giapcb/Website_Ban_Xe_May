<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - MotorBike</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <link href="https://unpkg.com/swiper/swiper-bundle.min.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="header.jsp" />

    <!-- ============================= -->
    <!-- 🏍️ PHẦN SLIDER BANNER -->
    <!-- ============================= -->
    <section id="center" class="center_home">
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="image/rsz_banner1-ducati.jpg" class="d-block img-fluid" alt="banner1">
                    <div class="carousel-caption d-md-block text-start">
                        <h5 class="text-uppercase">HIỆU NĂNG</h5>
                        <h1 class="mt-3 mb-3">CHẾ TÁC TINH XẢO, <br> <span class="col_red">THIẾT KẾ</span> CHO SỰ TRƯỜNG TỒN.</h1>
                        <p class="w-50">"Sự kết hợp hoàn hảo giữa công nghệ tiên tiến và kỹ thuật chế tác thủ công. Ducati định nghĩa lại giới hạn của hiệu suất."</p>
                    </div>
                </div>

                <div class="carousel-item">
                    <img src="image/rsz_banner2-bmw.jpg" class="d-block img-fluid" alt="banner2">
                    <div class="carousel-caption d-md-block text-end">
                        <h5 class="text-uppercase col_light">CHÀO MỪNG TỚI THẾ GIỚI MOTOR</h5>
                        <h1 class="mt-3 mb-3">CẢM GIÁC LÁI VƯỢT TRỘI,<br><span class="col_red">THIẾT KẾ</span> SANG TRỌNG.</h1>
                    </div>
                </div>

                <div class="carousel-item">
                    <img src="image/rsz_banner3-yamaha.jpg" class="d-block img-fluid" alt="banner3">
                    <div class="carousel-caption d-md-block text-start">
                        <h5 class="text-uppercase col_light">NƠI TINH HOA HỘI TỤ</h5>
                        <h1 class="mt-3 mb-3">ĐỈNH CAO NHẬT BẢN,<br> <span class="col_red">THIẾT KẾ</span> BỀN BỈ.</h1>
                    </div>
                </div>
            </div>

            <!-- Nút điều hướng -->
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </button>
        </div>
    </section>

    <!-- ============================= -->
    <!-- ⚡ DANH SÁCH XE VINFAST -->
    <!-- ============================= -->
    <section id="product-vinfast" class="py-5 bg-vinfast-section">
        <div class="container">
            <h2 class="text-center fw-bold mb-5 text-uppercase">CÁC MẪU XE VINFAST MỚI NHẤT</h2>

            <div class="row g-4">
                <div class="col-md-3">
                    <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                         <span class="badge-hot">nổi bật</span>
                        <img src="image/rsz_1verox1.jpg" alt="Vento S" class="img-fluid mb-3">
                        <h5 class="fw-bold text-primary">VENTO S</h5>
                        <p class="text-secondary mb-1">Xe máy điện 02 pin</p>
                        <p class="fw-bold fs-5 mb-3">20.000.000 ₫</p>
                        <a href="ProductDetailServlet?MaSP=32" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                         <span class="badge-hot">Hot</span>
                        <img src="image/rsz_2feliz.jpg" alt="Feliz S" class="img-fluid mb-3">
                        <h5 class="fw-bold text-primary">FELIZ S</h5>
                        <p class="text-secondary mb-1">Phiên bản 2025 mới</p>
                        <p class="fw-bold fs-5 mb-3">21.000.000 ₫</p>
                        <a href="ProductDetailServlet?MaSP=31" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                         <span class="badge-hot">Hot</span>
                        <img src="image/kalaras.jpg" alt="Klara S" class="img-fluid mb-3">
                        <h5 class="fw-bold text-primary">KLARA S</h5>
                        <p class="text-secondary mb-1">Chinh phục mọi hành trình</p>
                        <p class="fw-bold fs-5 mb-3">18.500.000 ₫</p>
                        <a href="ProductDetailServlet?MaSP=34" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                         <span class="badge-hot">Mới nhất</span>
                        <img src="image/rsz_1evo_neo1.jpg" alt="Felix Neo" class="img-fluid mb-3">
                        <h5 class="fw-bold text-primary">FELIZ NEO</h5>
                        <p class="text-secondary mb-1">Hành trình mới, phong cách mới</p>
                        <p class="fw-bold fs-5 mb-3">21.000.000 ₫</p>
                        <a href="ProductDetailServlet?MaSP=35" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================= -->
    <!-- 🛵 DANH SÁCH XE XĂNG -->
    <!-- ============================= -->
    <section id="product-xexang" class="pt-5 pb-5 bg-xang-section">
        <div class="container">
            <h2 class="text-center fw-bold mb-5 text-uppercase">CÁC MẪU XE XĂNG NỔI BẬT</h2>

            <div class="row g-4">
                <!-- Yamaha -->
                <div class="col-md-3">
                    <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                        <img src="image/Exciter 155.jpg" alt="Exciter 155 VVA" class="img-fluid mb-3">
                        <h5 class="fw-bold text-primary">YAMAHA EXCITER 155</h5>
                        <p class="text-secondary mb-1">Phong cách thể thao</p>
                        <p class="fw-bold fs-5 mb-3">51.000.000 ₫</p>
                        <a href="ProductDetailServlet?MaSP=24" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                    </div>
                </div>

                <!-- Honda SH -->
                <div class="col-md-3">
                    <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                        <img src="image/SH 150i.jpg" alt="Honda SH 150i" class="img-fluid mb-3">
                        <h5 class="fw-bold text-primary">HONDA SH 150i</h5>
                        <p class="text-secondary mb-1">Đẳng cấp sang trọng</p>
                        <p class="fw-bold fs-5 mb-3">99.000.000 ₫</p>
                        <a href="ProductDetailServlet?MaSP=15" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                    </div>
                </div>

                <!-- Vision -->
                <div class="col-md-3">
                    <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                        <img src="image/vison.jpg" alt="Honda Vision" class="img-fluid mb-3">
                        <h5 class="fw-bold text-primary">HONDA VISION</h5>
                        <p class="text-secondary mb-1">Nhỏ gọn, tiết kiệm xăng</p>
                        <p class="fw-bold fs-5 mb-3">33.000.000 ₫</p>
                        <a href="ProductDetailServlet?MaSP=11" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                    </div>
                </div>

                <!-- Sirius -->
                <div class="col-md-3">
                    <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                        <img src="image/sirius.jpg" alt="Yamaha Sirius" class="img-fluid mb-3">
                        <h5 class="fw-bold text-primary">YAMAHA SIRIUS</h5>
                        <p class="text-secondary mb-1">Xe số phổ thông</p>
                        <p class="fw-bold fs-5 mb-3">21.000.000 ₫</p>
                        <a href="ProductDetailServlet?MaSP=4" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================= -->
    <!-- 💬 VÌ SAO CHỌN CHÚNG TÔI -->
    <!-- ============================= -->
    <section id="about_pg" class="pt-5 pb-5 bg-light">
        <div class="container-xl text-center">
            <h1>VÌ SAO <span class="col_red">CHỌN CHÚNG TÔI</span></h1>
            <p class="mb-4">Thành công trở nên dễ dàng hơn với Motor Bike!<br>Chúng tôi chia sẻ tin tức, định hướng và giải pháp thiết thực giúp bạn đạt được mục tiêu của mình.</p>

            <div class="row">
                <div class="col-md-4">
                    <h4><i class="fa fa-comments me-2 col_red"></i>CHUYÊN NGHIỆP</h4>
                    <p>Đội ngũ giàu kinh nghiệm, am hiểu kỹ thuật và thị trường xe máy.</p>
                </div>
                <div class="col-md-4">
                    <h4><i class="fa fa-bolt me-2 col_red"></i>SÁNG TẠO</h4>
                    <p>Luôn đổi mới trong tư duy và phong cách phục vụ khách hàng.</p>
                </div>
                <div class="col-md-4">
                    <h4><i class="fa fa-users me-2 col_red"></i>HỖ TRỢ 24/7</h4>
                    <p>Tư vấn viên luôn sẵn sàng hỗ trợ mọi lúc, mọi nơi.</p>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <!-- ============================= -->
    <!-- 🧭 JS LIÊN KẾT -->
    <!-- ============================= -->
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/theme.min.js"></script>
</body>
</html>
