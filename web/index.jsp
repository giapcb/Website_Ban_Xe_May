
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
   <jsp:include page="header.jsp" />



        <section id="center" class="center_home">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">

                    <!-- Slide 1 -->
                    <div class="carousel-item active">
                        <img src="image/rsz_banner1-ducati.jpg" class="d-block img-fluid" alt="...">
                        <div class="carousel-caption d-md-block text-start">
                            <h5 class="text-uppercase">HIỆU NĂNG</h5>
                            <h1 class="mt-3 mb-3">CHẾ TÁC TINH XẢO, <br> <span class="col_red">THIẾT KẾ</span> CHO SỰ TRƯỜNG TỒN.</h1>
                            <p class="w-50">
                                "Sự kết hợp hoàn hảo giữa công nghệ tiên tiến và kỹ thuật chế tác thủ công. 
                                Ducati định nghĩa lại giới hạn của hiệu suất, mang đến sức mạnh thuần khiết 
                                và cảm giác lái phấn khích tột độ."
                            </p>
                            <ul class="mb-0 mt-4">
                                
                            </ul>
                        </div>
                    </div>

                    <!-- Slide 2 -->
                    <div class="carousel-item">
                        <img src="image/rsz_banner2-bmw.jpg" class="d-block img-fluid" alt="...">
                        <div class="carousel-caption d-md-block text-end">
                            <h5 class="text-uppercase col_light">CHÀO MỪNG TỚI THẾ GIỚI MOTOR</h5>
                            <h1 class="mt-3 mb-3">CẢM GIÁC LÁI VƯỢT TRỘI, <br><span class="col_red">THIẾT KẾ</span> SANG TRỌNG.</h1>
                            <p class="w-50 ms-auto">
                                "Biểu tượng của kỹ thuật Đức, được thiết kế để truyền cảm hứng. 
                                BMW định nghĩa sự sang trọng qua hiệu suất năng động và công nghệ tiên phong, 
                                luôn dẫn đầu mọi xu hướng."
                            </p>
                            <ul class="mb-0 mt-4">
                                
                                
                            </ul>
                        </div>
                    </div>

                    <!-- Slide 3 -->
                    <div class="carousel-item">
                        <img src="image/rsz_banner3-yamaha.jpg" class="d-block img-fluid" alt="...">
                        <div class="carousel-caption d-md-block text-start">
                            <h5 class="text-uppercase col_light">NƠI TINH HOA HỘI TỤ</h5>
                            <h1 class="mt-3 mb-3">ĐỈNH CAO NHẬT BẢN, <br> <span class="col_red">THIẾT KẾ</span> BỀN BỈ.</h1>
                            <p class="w-50">
                                "Tinh thần Nhật Bản, DNA đường đua. Yamaha định nghĩa lại sự cân bằng hoàn hảo 
                                giữa sức mạnh bùng nổ và khả năng kiểm soát chính xác. 
                                Đây không chỉ là một cỗ máy – đây là lời mời gọi sự phấn khích."
                            </p>
                            <ul class="mb-0 mt-4">
                                
                                
                            </ul>
                        </div>
                    </div>

                </div>

                <!-- Nút điều hướng -->
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>

            </div>
        </section>



        <!-- 🔥 CÁC MẪU XE MỚI NHẤT -->
        <section id="product-list" class="py-5 bg-light position-relative">
            <div class="container">
                <h2 class="text-center fw-bold mb-5">CÁC MẪU XE VINFAST MỚI NHẤT</h2>

                <!-- Swiper -->
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">

                        <!-- Sản phẩm 1 -->
                        <div class="swiper-slide">
                            <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                                <span class="badge-hot">Bán chạy</span>
                                <img src="image/rsz_1verox1.jpg" alt="Vero X" class="img-fluid mb-3">
                                <h5 class="fw-bold text-primary">VERO X</h5>
                                <p class="text-secondary mb-2">Xe máy điện 02 pin</p>
                                <p class="fw-bold fs-5 mb-3">34.900.000 ₫</p>
                                <a href="detail.jsp" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                            </div>
                        </div>

                        <!-- Sản phẩm 2 -->
                        <div class="swiper-slide">
                            <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                                <span class="badge-new">Mới</span>
                                <img src="image/rsz_2feliz.jpg" alt="Feliz 2025" class="img-fluid mb-3">
                                <h5 class="fw-bold text-primary">FELIZ</h5>
                                <p class="text-secondary mb-2">Phiên bản 2025 mới</p>
                                <p class="fw-bold fs-5 mb-3">25.900.000 ₫</p>
                                <a href="detail.jsp" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                            </div>
                        </div>

                        <!-- Sản phẩm 3 -->
                        <div class="swiper-slide">
                            <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                                <span class="badge-new">Mới</span>
                                <img src="image/evogrand.jpg" alt="EvoGrand" class="img-fluid mb-3">
                                <h5 class="fw-bold text-primary">EVOGRAND</h5>
                                <p class="text-secondary mb-2">Chinh phục mọi hành trình</p>
                                <p class="fw-bold fs-5 mb-3">21.000.000 ₫</p>
                                <a href="detail.jsp" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                            </div>
                        </div>

                        <!-- Sản phẩm 4 -->
                        <div class="swiper-slide">
                            <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                                <span class="badge-hot">Bán chạy</span>
                                <img src="image/rsz_1evo_neo1.jpg" alt="Evo Neo" class="img-fluid mb-3">
                                <h5 class="fw-bold text-primary">EVO NEO</h5>
                                <p class="text-secondary mb-2">Hành trình mới, phong cách mới</p>
                                <p class="fw-bold fs-5 mb-3">17.800.000 ₫</p>
                                <a href="detail.jsp" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                            </div>
                        </div>

                        <!-- Thêm sản phẩm khác tại đây -->
                    </div>

                </div>
            </div>
        </section>

        <section id="product-xexang" class="pt-5 pb-5 bg_light">
            <div class="container">
                <h2 class="text-center fw-bold mb-5">CÁC MẪU XE XĂNG MỚI NHẤT</h2>

                <!-- Swiper -->
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">

                        <!-- Sản phẩm 1 -->
                        <div class="swiper-slide">
                            <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                                <span class="badge-hot">Bán chạy</span>
                                <img src="image/rsz_1verox1.jpg" alt="Vero X" class="img-fluid mb-3">
                                <h5 class="fw-bold text-primary">VERO X</h5>
                                <p class="text-secondary mb-2">Xe máy điện 02 pin</p>
                                <p class="fw-bold fs-5 mb-3">34.900.000 ₫</p>
                                <a href="detail.jsp" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                            </div>
                        </div>

                        <!-- Sản phẩm 2 -->
                        <div class="swiper-slide">
                            <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                                <span class="badge-new">Mới</span>
                                <img src="image/rsz_2feliz.jpg" alt="Feliz 2025" class="img-fluid mb-3">
                                <h5 class="fw-bold text-primary">FELIZ</h5>
                                <p class="text-secondary mb-2">Phiên bản 2025 mới</p>
                                <p class="fw-bold fs-5 mb-3">25.900.000 ₫</p>
                                <a href="detail.jsp" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                            </div>
                        </div>

                        <!-- Sản phẩm 3 -->
                        <div class="swiper-slide">
                            <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                                <span class="badge-new">Mới</span>
                                <img src="image/evogrand.jpg" alt="EvoGrand" class="img-fluid mb-3">
                                <h5 class="fw-bold text-primary">EVOGRAND</h5>
                                <p class="text-secondary mb-2">Chinh phục mọi hành trình</p>
                                <p class="fw-bold fs-5 mb-3">21.000.000 ₫</p>
                                <a href="detail.jsp" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                            </div>
                        </div>

                        <!-- Sản phẩm 4 -->
                        <div class="swiper-slide">
                            <div class="product-card text-center p-3 bg-white rounded-4 shadow-sm">
                                <span class="badge-hot">Bán chạy</span>
                                <img src="image/rsz_1evo_neo1.jpg" alt="Evo Neo" class="img-fluid mb-3">
                                <h5 class="fw-bold text-primary">EVO NEO</h5>
                                <p class="text-secondary mb-2">Hành trình mới, phong cách mới</p>
                                <p class="fw-bold fs-5 mb-3">17.800.000 ₫</p>
                                <a href="detail.jsp" class="btn btn-primary rounded-pill px-4">MUA NGAY</a>
                            </div>
                        </div>

                        <!-- Thêm sản phẩm khác tại đây -->
                    </div>

                </div>
            </div>
        </section>

        <section id="about_pg" class="pt-5 pb-5">
            <div class="container-xl">
                <div class="goal_1 row mb-4 text-center">
                    <div class="col-md-12">
                        <h1>VÌ SAO <span class="col_red">CHỌN CHÚNG TÔI</span></h1>
                        <p class="mb-0">Thành công trở nên dễ dàng hơn với Motor Bike! <br> Chúng tôi chia sẻ tin tức, định hướng và mang đến những giải pháp thiết thực giúp bạn đạt được mục tiêu của mình.</p>
                    </div>
                </div>
                <div class="about_pg1 row">
                    <div class="col-md-6">
                        <div class="about_pg1l">
                            <a href="#"><img src="image/28.jpg" class="img-fluid" alt="abc"></a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="about_pg1r">
                            <h4><i class="fa fa-comments me-1 col_red"></i> CHÚNG TÔI CHUYÊN NGHIỆP</h4>
                            <p class="mb-4">Chúng tôi đào tạo, hướng dẫn và đồng hành cùng các nhà lãnh đạo, chủ doanh nghiệp và chuyên viên để họ đạt hiệu quả cao nhất trong công việc.</p>
                            <h4><i class="fa fa-bolt me-1 col_red"></i> CHÚNG TÔI SÁNG TẠO</h4>
                            <p class="mb-4">Luôn đổi mới trong tư duy và phong cách làm việc<br> mang đến những giải pháp độc đáo và hiệu quả cho khách hàng.</p>
                            <h4><i class="fa fa-users me-1 col_red"></i> HỖ TRỢ 24/7</h4>
                            <p class="mb-0">Đội ngũ tư vấn của chúng tôi luôn sẵn sàng hỗ trợ bạn mọi lúc, mọi nơi — đảm bảo sự hài lòng tuyệt đối.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>





        <jsp:include page="footer.jsp" />

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/theme.min.js"></script>
        <!-- Swiper JS -->

        <script src="js/thanhtruotslide.js"></script>
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
        <script>
            var swiper = new Swiper(".mySwiper", {
                slidesPerView: 4,
                spaceBetween: 30,
                loop: true,
                autoplay: {
                    delay: 3500,
                    disableOnInteraction: false,
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                breakpoints: {
                    0: {slidesPerView: 1},
                    576: {slidesPerView: 2},
                    768: {slidesPerView: 3},
                    1200: {slidesPerView: 4},
                },
            });
        </script>

    </body>
</html>