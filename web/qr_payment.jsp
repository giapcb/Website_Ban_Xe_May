<%-- File: qr_payment.jsp --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<html lang="en">

<jsp:include page="header.jsp" />

<section id="qr_payment" class="pt-5 pb-5">
    <div class="container-xl">
        <h2 class="text-warning fw-bold mb-4">⏳ ĐƠN HÀNG CHỜ THANH TOÁN</h2>
        <p class="lead">Vui lòng hoàn tất thanh toán trong vòng 24 giờ để đơn hàng được xử lý.</p>
        
        <div class="row mt-5">
            <div class="col-md-7 mx-auto">
                <div class="card p-4 shadow-sm">
                    <h4 class="text-center text-primary mb-4">THÔNG TIN CHUYỂN KHOẢN</h4>
                    
                    <div class="row">
                        
                      <%-- CỘT TRÁI: HIỂN THỊ MÃ QR ĐỘNG --%>
<div class="col-md-6 text-center border-end">
    <p class="mb-1 text-muted">QUÉT MÃ QR THANH TOÁN</p>
    
    <c:set var="qrDataSafe">
        <c:set var="amount"><fmt:formatNumber value="${tongTien}" type="number" groupingUsed="false"/></c:set>
        
        <%-- Chuỗi dữ liệu gốc --%>
        <c:set var="baseData" value="STK:0987654321000|NH:VIETCOMBANK|AMOUNT:${amount}|NOTE:XM${maDH}"/>
        
        <%-- Thay thế | bằng _ --%>
        <c:set var="tempData" value="${fn:replace(baseData, '|', '_')}"/>
        
        <%-- Thay thế : bằng - --%>
        <c:out value="${fn:replace(tempData, ':', '-')}" />
    </c:set>

    <%-- GỌI SERVLET VỚI DỮ LIỆU ĐÃ MÃ HÓA --%>
    <img src="generateQr?data=${qrDataSafe}" 
         alt="Mã QR Thanh Toán" 
         style="width: 200px; height: 200px; border: 1px solid #ddd; margin-bottom: 10px;"/>
    
    <p class="mt-2 text-warning fw-bold">MOMO/ZALOPAY/NGÂN HÀNG</p>
    <p class="mt-3 text-muted">Vui lòng quét bằng ứng dụng ngân hàng hoặc ví điện tử.</p>
</div>
                        
                        <%-- CỘT PHẢI: CHI TIẾT CHUYỂN KHOẢN --%>
                        <div class="col-md-6">
                            <p class="mb-1 text-muted">NGÂN HÀNG THỤ HƯỞNG</p>
                            <h5 class="fw-bold text-dark">VIETCOMBANK</h5>
                            
                            <p class="mt-3 mb-1 text-muted">SỐ TÀI KHOẢN</p>
                            <h5 class="fw-bold text-dark">098 765 4321 000</h5>
                            
                            <p class="mt-3 mb-1 text-muted">TỔNG TIỀN CẦN CHUYỂN</p>
                            <h3 class="text-success fw-bold">
                                <fmt:formatNumber value="${tongTien}" type="number" groupingUsed="true"/>₫
                            </h3>

                            <p class="mt-3 mb-1 text-muted">NỘI DUNG CHUYỂN KHOẢN (RẤT QUAN TRỌNG)</p>
                            <h4 class="text-danger fw-bold">XM<c:out value="${maDH}"/></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <p class="mt-5 text-muted">Đơn hàng **#<c:out value="${maDH}"/>** đang ở trạng thái **"Chờ thanh toán"**. Hệ thống sẽ tự động chuyển sang **"Chờ xử lý"** ngay khi nhận được thanh toán.</p>
        <a href="index" class="btn btn-secondary px-4 py-2 mt-3">Quay về trang chủ</a>
    </div>
</section>

<jsp:include page="footer.jsp" />
<script src="js/bootstrap.bundle.min.js"></script>
</html>