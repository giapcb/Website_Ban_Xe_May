<%-- 
    Document   : profile
    Created on : Nov 28, 2025, 11:22:18 AM
    Author     : Asus TUF
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Chỉnh sửa Hồ sơ cá nhân</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body { background-color: #f8f9fa; }
        .profile-card {
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            border: none;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.15rem rgba(0, 123, 255, 0.25);
        }
        .info-locked {
            background-color: #e9ecef;
            cursor: not-allowed;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="profile-card card shadow-lg p-md-5 p-4">
                
                <h3 class="card-title text-center text-primary fw-bolder mb-5">
                    <i class="fas fa-user-edit me-2"></i> CẬP NHẬT HỒ SƠ CÁ NHÂN
                </h3>

                <c:if test="${not empty message}">
                    <div class="alert alert-${status == 'success' ? 'success' : 'danger'} alert-dismissible fade show" role="alert">
                        ${message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <form action="profile" method="post">
                    <input type="hidden" name="action" value="update"/> 
                    <input type="hidden" name="MaND" value="${sessionScope.user.getMaND()}"/> 
                    
                    <div class="row g-4">
                        
                        <div class="col-md-6">
                            <label for="hoTen" class="form-label fw-semibold">Họ và Tên</label>
                            <input type="text" class="form-control form-control-lg" id="hoTen" name="hoTen" 
                                   value="${sessionScope.user.getHoTen()}" required>
                        </div>

                        <div class="col-md-6">
                            <label for="tenDN" class="form-label fw-semibold">Tên đăng nhập</label>
                            <input type="text" class="form-control form-control-lg info-locked" id="tenDN" name="tenDN" 
                                   value="${sessionScope.user.getTenDN()}" disabled>
                            <input type="hidden" name="tenDN" value="${sessionScope.user.getTenDN()}">
                        </div>

                        <div class="col-md-6">
                            <label for="email" class="form-label fw-semibold">Email</label>
                            <input type="email" class="form-control form-control-lg info-locked" id="email" name="email" 
                                   value="${sessionScope.user.getEmail()}" disabled>
                            <input type="hidden" name="email" value="${sessionScope.user.getEmail()}">
                            <div class="form-text">Liên hệ hỗ trợ để thay đổi Email.</div>
                        </div>

                        <div class="col-md-6">
                            <label for="sdt" class="form-label fw-semibold">Số điện thoại</label>
                            <input type="tel" class="form-control form-control-lg" id="sdt" name="sdt" 
                                   value="${sessionScope.user.getSDT()}">
                        </div>
                        
                        <div class="col-12">
                            <label for="diaChi" class="form-label fw-semibold">Địa chỉ nhận hàng</label>
                            <input type="text" class="form-control form-control-lg" id="diaChi" name="diaChi" 
                                   value="${sessionScope.user.getDiaChi()}">
                        </div>

                    </div>
                    
                    <hr class="my-5">
                    
                    <button type="submit" class="btn btn-primary btn-lg w-100 fw-bold py-2 mb-3">
                        <i class="fas fa-save me-2"></i> LƯU THAY ĐỔI
                    </button>
                    
                    <a href="changePassword.jsp" class="btn btn-outline-secondary w-100">
                        <i class="fas fa-lock me-2"></i> Đổi mật khẩu
                    </a>

                </form>
            </div>
            
            <div class="text-center mt-4">
                <a href="index.jsp" class="text-decoration-none text-muted">
                    <i class="fas fa-arrow-left me-1"></i> Quay về Trang chủ
                </a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>