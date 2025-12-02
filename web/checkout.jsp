<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html lang="vi">

<jsp:include page="header.jsp" />

<style>
    /* Custom CSS cho giao diện xịn hơn */
    .premium-card {
        border-radius: 12px;
        transition: all 0.2s ease-in-out;
        border: 1px solid rgba(0, 0, 0, 0.05); /* Viền cực nhẹ */
    }
    .premium-card:hover {
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05); /* Bóng đổ tinh tế */
    }
    .form-control-pro:focus {
        border-color: #007bff;
        box-shadow: 0 0 0 0.1rem rgba(0, 123, 255, 0.25);
    }
    .list-item-product {
        border-bottom: 1px dashed rgba(0, 0, 0, 0.1); /* Viền chấm chấm cho sản phẩm */
    }
    .payment-option:hover {
        background-color: #e9ecef !important;
        cursor: pointer;
    }
</style>

<section id="checkout-banner" style="background-color: #f8f9fa; padding: 60px 0;">
    <div class="container text-center text-dark">
        <h1 class="display-5 fw-bolder mb-1">Xác Nhận Đơn Hàng & Thanh Toán</h1>
        <p class="text-muted">
            <a class="text-secondary text-decoration-none" href="index.jsp">TRANG CHỦ</a> 
            <span class="mx-2">/</span> THANH TOÁN
        </p>
    </div>
</section>

<section id="checkout" class="py-5">
    <div class="container">
        <form action="checkout" method="post" accept-charset="UTF-8">
            <div class="row g-5">

                <div class="col-lg-7">
                    
                    <div class="card shadow-sm premium-card p-5 mb-5 border-0">
                        <h4 class="mb-4 pb-3 border-bottom text-primary fw-bold d-flex align-items-center">
                            <i class="bi bi-geo-alt-fill me-2 fs-5"></i> 1. Chi tiết giao hàng
                        </h4>
                        
                        <div class="alert alert-primary p-2 mb-4 small" role="alert">
                           <i class="bi bi-info-circle-fill me-1"></i> Vui lòng điền chính xác thông tin để đơn hàng được giao nhanh nhất.
                        </div>

                        <div class="row g-4">
                            <div class="col-md-6">
                                <label for="hoInput" class="form-label fw-semibold">Họ <span class="text-danger">*</span></label> 
                                <input type="text" name="ho" class="form-control form-control-lg form-control-pro" id="hoInput" placeholder="Họ của bạn"
                                    value="${requestScope.ho != null ? requestScope.ho : ''}" required>
                            </div>
                            <div class="col-md-6">
                                <label for="tenInput" class="form-label fw-semibold">Tên <span class="text-danger">*</span></label>
                                <input type="text" name="ten" class="form-control form-control-lg form-control-pro" id="tenInput" placeholder="Tên của bạn"
                                    value="${requestScope.ten != null ? requestScope.ten : ''}" required>
                            </div>
                            <div class="col-md-6">
                                <label for="emailInput" class="form-label fw-semibold">Email <span class="text-danger">*</span></label>
                                <input type="email" name="email" class="form-control form-control-lg form-control-pro" id="emailInput" placeholder="Địa chỉ email"
                                    value="${nd != null ? nd.email : ''}" required>
                            </div>
                            <div class="col-md-6">
                                <label for="sdtInput" class="form-label fw-semibold">Số điện thoại <span class="text-danger">*</span></label>
                                <input type="tel" name="sdt" class="form-control form-control-lg form-control-pro" id="sdtInput" placeholder="Số điện thoại liên hệ"
                                    value="${nd != null ? nd.SDT : ''}" required>
                            </div>
                            <div class="col-12">
                                <label for="diaChiInput" class="form-label fw-semibold">Địa chỉ nhận hàng chi tiết <span class="text-danger">*</span></label>
                                <input type="text" name="diaChi" class="form-control form-control-lg form-control-pro" id="diaChiInput" placeholder="Số nhà, Tên đường, Phường/Xã, Quận/Huyện, Tỉnh/Thành phố"
                                    value="${nd != null ? nd.diaChi : ''}" required>
                            </div>
                        </div>

                        <div class="mt-4 pt-3 border-top text-center">
                            <small class="text-muted">
                                <i class="bi bi-person-circle"></i> Đã có tài khoản? <a href="login.jsp" class="text-decoration-none fw-bold text-success">Đăng nhập</a> 
                            </small>
                        </div>
                    </div>
                    
                    <div class="card shadow-sm premium-card p-5 mb-4 border-0">
                        <h4 class="mb-4 pb-3 border-bottom text-primary fw-bold d-flex align-items-center">
                            <i class="bi bi-credit-card-fill me-2 fs-5"></i> 3. Phương thức thanh toán
                        </h4>

                        <div class="form-check mb-3 p-3 border rounded-3 payment-option" onclick="document.getElementById('paymentCOD').checked = true;">
                            <input class="form-check-input mt-2" type="radio" name="paymentMethod" id="paymentCOD" value="COD" required checked>
                            <label class="form-check-label fw-bold ms-2" for="paymentCOD">
                                Thanh toán khi nhận hàng (COD)
                                <span class="badge bg-secondary-subtle text-secondary ms-2">Phổ biến</span>
                            </label>
                            <div class="text-muted small ps-4 mt-1">
                                <i class="bi bi-truck-flatbed"></i> Kiểm tra hàng và trả tiền mặt/chuyển khoản cho nhân viên giao hàng.
                            </div>
                        </div>
                        
                        <div class="form-check mb-4 p-3 border rounded-3 payment-option" onclick="document.getElementById('paymentWallet').checked = true;">
                            <input class="form-check-input mt-2" type="radio" name="paymentMethod" id="paymentWallet" value="Wallet">
                            <label class="form-check-label fw-bold ms-2 text-primary" for="paymentWallet">
                                Thanh toán qua Ví điện tử
                            </label>
                            <div class="text-muted small ps-4 mt-1">
                                <i class="bi bi-wallet2"></i> Kết nối an toàn với MoMo, ZaloPay, ViettelPay. Phí giao dịch có thể áp dụng.
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-lg-5">
                    <div class="sticky-top" style="top: 20px;"> 
                        <div class="card shadow-lg premium-card p-4 border-0">
                            <h4 class="mb-4 pb-3 border-bottom text-dark fw-bold d-flex align-items-center">
                                <i class="bi bi-box-seam-fill me-2 fs-5"></i> 2. Đơn hàng của bạn
                            </h4>

                            <ul class="list-group list-group-flush mb-3">
                                <c:if test="${not empty cartItems}">
                                    <c:forEach var="item" items="${cartItems}">
                                        <li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3 list-item-product">
                                            <div class="me-2 text-dark">
                                                <div class="fw-semibold">${item.sanPham.tenSp}</div>
                                                <small class="text-muted">x ${item.quantity}</small>
                                            </div>
                                            <span class="fw-bold text-nowrap text-end">
                                                <fmt:formatNumber value="${item.sanPham.gia * item.quantity}" type="number" groupingUsed="true"/>₫
                                            </span>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>

                            <div class="d-flex justify-content-between fw-bolder mt-3 mb-4 p-3 rounded-3 bg-light">
                                <span class="h5 mb-0 text-dark text-uppercase">TỔNG CỘNG</span>
                                <span class="h3 mb-0 text-danger">
                                    <fmt:formatNumber value="${tongTien}" type="number" groupingUsed="true"/>₫
                                </span>
                            </div>

                            <button type="submit" class="btn btn-primary btn-lg w-100 fw-bold py-3 shadow-lg text-uppercase">
                                <i class="bi bi-check-circle-fill me-2"></i> XÁC NHẬN & THANH TOÁN
                            </button>
                            
                            <div class="text-center mt-3 text-muted small">
                                <i class="bi bi-shield-lock-fill me-1 text-success"></i> Đảm bảo giao dịch an toàn và bảo mật.
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>
</section>

<jsp:include page="footer.jsp" />

<script src="js/bootstrap.bundle.min.js"></script>
</html>