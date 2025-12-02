<%-- 
    Document   : cart
    Created on : Oct 31, 2025, 7:22:13 AM
    Author     : Asus TUF
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
  <jsp:include page="header.jsp" />
 <section id="center" class="center_cart"
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
	    <h1 class="text-white font_60">Giỏ Hàng</h1>
		<h6 class="col_red mb-0"><a class="text-light" href="index.jsp">TRANG CHỦ</a> <span class="mx-2 text-white-50">/</span> Giỏ Hàng</h6>
	 </div>
  </div>
 </div>
   </div>   
 </section>
 
<section id="cart_page" class="cart pt-5 pb-5">
 <div class="container-xl">
   <div class="cart_2 row">
	 <div class="col-md-6">
	  <h5>Giỏ Hàng Của Tôi </h5>
	 </div>
	 <div class="col-md-6">
      
	 </div>
	</div>
	<div class="cart_3 row mt-3">
<div class="col-md-8">
    <div class="cart_3l">
        <h6>SẢN PHẨM</h6>
    </div>

    <c:if test="${empty cart}">
        <p>Giỏ hàng trống.</p>
    </c:if>

  <c:if test="${not empty cart}">
          <c:forEach var="entry" items="${cart}">
            <c:set var="key" value="${entry.key}" />
            <c:set var="item" value="${entry.value}" />

            <div class="cart_3l1 row align-items-center product-item" data-price="${item.sanPham.gia}">
              <div class="col-md-1 text-center">
                <input type="checkbox" class="form-check-input product-check" checked>
              </div>

              <div class="col-md-3 text-center">
                <img src="${item.colorImage != null ? item.colorImage : item.sanPham.hinhAnh}" class="img-fluid" alt="${item.sanPham.tenSp}">

              </div>

              <div class="col-md-8">
                <h6 class="fw-bold mb-1">${item.sanPham.tenSp}</h6>
                <p class="text-muted mb-1">
                  <b>Màu xe:</b> 
                  <span class="text-capitalize">${item.color != null ? item.color : 'Không chọn'}</span>
                </p>
                <h5 class="col_red mt-1 mb-3">
                  <fmt:formatNumber value="${item.sanPham.gia}" type="number" groupingUsed="true"/> ₫
                </h5>

                <div class="d-flex align-items-center gap-2">
                  <!-- FORM CẬP NHẬT -->
                  <form action="cart" method="post" class="d-flex align-items-center gap-2">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="maSP" value="${key}">
                    <input type="number" name="qty_${key}" class="form-control qty-input"
                           min="1" value="${item.quantity}" style="width:80px;">
                   <!-- <button type="submit" class="button px-3">Cập nhật</button>-->
                  </form>
                   
                   <!-- Nút thay đổi màu -->
  <form action="ChiTietServlet" method="get">
    <input type="hidden" name="MaSP" value="${item.sanPham.maSP}">
    <input type="hidden" name="mode" value="edit"> <!-- thêm dòng này -->
    <button type="submit" class="btn btn-warning px-3">
        Thay đổi
    </button>
</form>
                
                 <!-- FORM XÓA -->
                  <form action="cart" method="post">
                    <input type="hidden" name="action" value="remove">
                    <input type="hidden" name="maSP" value="${key}">
                    <button type="submit" class="button px-3">Xóa</button>
                  </form>
                </div>
              </div>
            </div>
          </c:forEach>
        </c:if>

        <div class="mt-4">
          <a href="shop" class="btn btn-outline-secondary">
            <i class="fa fa-arrow-left me-2"></i> Tiếp tục mua sắm
          </a>
        </div>
      </div>

      <!-- CỘT TỔNG TIỀN -->
      <div class="col-md-4 mt-4 mt-md-0">
        <div class="cart_3r">
          <h6 class="head_1">Tạm tính</h6>
          <h3 id="subtotal" class="text-center mt-3">0 ₫</h3>
          <hr>
          <h6 class="font_14 mb-2">Ghi chú thêm</h6>
          <textarea class="form-control mb-3" rows="3"></textarea>
          <div class="text-center">
            <a class="button" href="checkout">Tiến hành thanh toán</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- SCRIPT TÍNH TỔNG TIỀN -->
  <script>
  document.addEventListener('DOMContentLoaded', function() {
    const subtotalElem = document.getElementById('subtotal');
    const productItems = document.querySelectorAll('.product-item');

    function formatVND(num) {
      return num.toLocaleString('vi-VN') + ' ₫';
    }

    function updateSubtotal() {
      let total = 0;
      productItems.forEach(item => {
        const checkbox = item.querySelector('.product-check');
        const qtyInput = item.querySelector('.qty-input');
        const price = parseFloat(item.dataset.price || 0);
        if (checkbox && checkbox.checked) {
          const qty = parseInt(qtyInput.value || 0);
          total += qty * price;
        }
      });
      subtotalElem.textContent = formatVND(total);
    }

    productItems.forEach(item => {
      const checkbox = item.querySelector('.product-check');
      const qtyInput = item.querySelector('.qty-input');
      if (checkbox) checkbox.addEventListener('change', updateSubtotal);
      if (qtyInput) qtyInput.addEventListener('input', updateSubtotal);
    });

    updateSubtotal();
  });
  </script>
</section>

<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
