<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="model.NguoiDung" %>
<html lang="en">
<jsp:include page="header.jsp" />


<%
    NguoiDung nd = (NguoiDung) request.getAttribute("nd");
    String ho = "";
    String ten = "";

    if (nd != null && nd.getHoTen() != null) {
        String[] parts = nd.getHoTen().split(" ", 2);
        ho = parts[0];
        ten = parts.length > 1 ? parts[1] : "";
    }
%>

<!-- ================= BANNER ================= -->
<section id="center" class="center_check"
	style="background-image: url('image/rsz_vinfast_banner_1920x1280.jpg');
	background-position: center center;
	background-size: cover;
	background-repeat: no-repeat;">
	<div class="center_om bg_back">
		<div class="container-xl">
			<div class="row center_o1">
				<div class="col-md-12">
					<h1 class="text-white font_60">Thanh Toán</h1>
					<h6 class="col_red mb-0">
						<a class="text-light" href="index.jsp">TRANG CHỦ</a>
						<span class="mx-2 text-white-50">/</span> Thanh Toán
					</h6>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- ================= CHECKOUT FORM ================= -->
<section id="checkout" class="pt-5 pb-5">
	<div class="container-xl">
		<div class="checkout_1 row">

			<!-- Form bên trái -->
			<div class="col-md-8">
				<form action="Checkout" method="post">
					<div class="checkout_1l">
						<h5>Hoàn Tất Thanh Toán</h5>
						<p>Vui lòng kiểm tra thông tin của bạn trước khi đặt hàng</p>
					</div>

					<div class="checkout_1l1 row">
						<input class="form-control" type="text" name="ho" value="<%= ho %>" required>
<input class="form-control" type="text" name="ten" value="<%= ten %>" required>
<input class="form-control" type="email" name="email" value="<%= nd != null ? nd.getEmail() : "" %>" required>
<input class="form-control" type="text" name="sdt" value="<%= nd != null ? nd.getSDT() : "" %>" required>
<input class="form-control" type="text" name="diaChi" value="<%= nd != null ? nd.getDiaChi() : "" %>" required>

					</div>

					<div class="checkout_1l1 row">
						<div class="col-md-12 ps-0">
							<h6>Địa Chỉ Nhận Hàng <span>*</span></h6>
							<input class="form-control" type="text" name="diaChi" value="<%= nd.getDiaChi() %>" required>
						</div>
					</div>

					<div class="checkout_1l mt-3">
						<div class="form-check">
							<label class="form-check-label">
								<a href="signup.jsp">Tạo tài khoản mới?</a>
							</label>
						</div>
					</div>
			</div>

			<!-- Bảng tổng tiền bên phải -->
			<div class="col-md-4">
				<div class="checkout_1r">
					<h5 class="border_thick ps-3 mb-4">Tổng tiền đơn hàng</h5>

					<c:if test="${not empty cartItems}">
						<c:forEach var="item" items="${cartItems}">
							<h6>${item.tenSp} <span class="pull-right">${item.gia}₫</span></h6>
						</c:forEach>
					</c:if>

					<hr>
					<h6 class="fw-bold font_13">
						Tổng cộng
						<span class="pull-right text-danger fw-bold">
							${tongTien}₫
						</span>
					</h6><br>

					<h5 class="border_thick ps-3 mb-4">Phương thức thanh toán</h5>
					<div class="form-check mt-2">
						<input type="radio" class="form-check-input" id="paymentCOD" name="paymentMethod" value="COD" required>
						<label class="form-check-label" for="paymentCOD">Thanh toán khi nhận hàng</label>
					</div>
					<div class="form-check mt-2">
						<input type="radio" class="form-check-input" id="paymentWallet" name="paymentMethod" value="Wallet">
						<label class="form-check-label" for="paymentWallet">Ví điện tử</label>
					</div>

					<h6 class="mt-3 mb-0">
						<button type="submit" class="button d-block text-center w-100 border-0">
							Tiến hành thanh toán
						</button>
					</h6>
				</div>
			</div>

			</form>
		</div>
	</div>
</section>

<jsp:include page="footer.jsp" />
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/theme.min.js"></script>

</body>
</html>
