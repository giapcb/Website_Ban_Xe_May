<%-- 
    Document   : success
    Created on : Nov 7, 2025, 11:00:29 AM
    Author     : Asus TUF
--%>

<%-- File: cod_success.jsp --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html lang="en">

<jsp:include page="header.jsp" /> 

<section id="success" class="pt-5 pb-5 text-center">
    <div class="container-xl">
        <h2 class="text-success fw-bold">✅ ĐẶT HÀNG THÀNH CÔNG!</h2>
        <p class="lead">Cảm ơn bạn đã tin tưởng. Đơn hàng của bạn đã được tiếp nhận và đang chờ xử lý.</p>
        
        <div class="alert alert-success mt-5 mx-auto p-4" style="max-width: 550px; text-align: left;">
            <h4 class="alert-heading text-success">THÔNG TIN ĐƠN HÀNG</h4>
            <hr>
            <p class="mb-2"><strong>Mã đơn hàng:</strong> <span class="text-primary fw-bold">${maDH}</span></p>
            <p class="mb-2"><strong>Tổng tiền thanh toán:</strong> 
                <span class="text-danger fw-bold fs-5">
                    <fmt:formatNumber value="${tongTien}" type="number" groupingUsed="true"/>₫
                </span>
            </p>
            <p class="mb-2"><strong>Phương thức:</strong> Thanh toán khi nhận hàng (COD)</p>
            <p class="mb-2"><strong>Địa chỉ nhận hàng:</strong> ${diaChiNguoiNhan}</p>
            
            <%-- Giả định logic tính ngày giao hàng: Hôm nay + 5 ngày --%>
            <p class="mt-3 text-muted">Dự kiến giao hàng trong vòng **3-5 ngày làm việc**.</p>
        </div>
        
        <h4 class="mt-5 mb-3">CHI TIẾT SẢN PHẨM</h4>
        <div class="table-responsive mx-auto" style="max-width: 600px;">
            <table class="table table-bordered">
                <thead class="bg-light">
                    <tr>
                        <th>Sản phẩm</th>
                        <th>SL</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cartItems}">
                        <tr>
                            <td>${item.sanPham.tenSp}</td>
                            <td>${item.quantity}</td>
                            <td><fmt:formatNumber value="${item.total}" type="number" groupingUsed="true"/>₫</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <p class="mt-4">Chi tiết đơn hàng đã được gửi đến email của bạn (${nd.email}).</p>
        <a href="index" class="btn btn-primary px-4 py-2 mt-3">Tiếp tục mua sắm</a>
        <a href="order_history" class="btn btn-secondary px-4 py-2 mt-3">Xem lịch sử đơn hàng</a>
    </div>
</section>

<jsp:include page="footer.jsp" />
<script src="js/bootstrap.bundle.min.js"></script>
</html>