<%-- 
    Document   : cart
    Created on : Oct 31, 2025, 7:22:13 AM
    Author     : Asus TUF
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

  <!-- SẢN PHẨM 1 -->
  <div class="cart_3l1 mt-3 row ms-0 me-0 align-items-center product-item" data-price="175">
   <div class="col-md-1 col-1 text-center">
     <input type="checkbox" class="form-check-input product-check">
   </div>
   <div class="col-md-3 col-3">
     <img src="image/33.jpg" class="img-fluid" alt="abc">
   </div>
   <div class="col-md-8 col-8">
     <h6 class="fw-bold mb-0">Sản phẩm 1</h6>
     <h6 class="fw-normal font_14 mt-2">RED / XS</h6>
     <h6 class="font_14 mt-2">Vendor</h6>
     <h5 class="col_red mt-2 mb-2">$175.00</h5>
     <div class="d-flex align-items-center gap-2">
       <input type="number" class="form-control qty-input" min="1" value="1" style="width:80px;">
       <a href="#" class="button px-4">REMOVE</a>
     </div>
   </div>
  </div>

  <!-- SẢN PHẨM 2 -->
  <div class="cart_3l1 mt-3 row ms-0 me-0 align-items-center product-item" data-price="175">
   <div class="col-md-1 col-1 text-center">
     <input type="checkbox" class="form-check-input product-check">
   </div>
   <div class="col-md-3 col-3">
     <img src="image/32.jpg" class="img-fluid" alt="abc">
   </div>
   <div class="col-md-8 col-8">
     <h6 class="fw-bold mb-0">Sản phẩm 2</h6>
     <h6 class="fw-normal font_14 mt-2">RED / XS</h6>
     <h6 class="font_14 mt-2">Vendor</h6>
     <h5 class="col_red mt-2 mb-2">$175.00</h5>
     <div class="d-flex align-items-center gap-2">
       <input type="number" class="form-control qty-input" min="1" value="1" style="width:80px;">
       <a href="#" class="button px-4">REMOVE</a>
     </div>
   </div>
  </div>

  <!-- SẢN PHẨM 3 -->
  <div class="cart_3l1 mt-3 row ms-0 me-0 align-items-center product-item" data-price="175">
   <div class="col-md-1 col-1 text-center">
     <input type="checkbox" class="form-check-input product-check">
   </div>
   <div class="col-md-3 col-3">
     <img src="image/35.jpg" class="img-fluid" alt="abc">
   </div>
   <div class="col-md-8 col-8">
     <h6 class="fw-bold mb-0">Sản phẩm 3</h6>
     <h6 class="fw-normal font_14 mt-2">RED / XS</h6>
     <h6 class="font_14 mt-2">Vendor</h6>
     <h5 class="col_red mt-2 mb-2">$175.00</h5>
     <div class="d-flex align-items-center gap-2">
       <input type="number" class="form-control qty-input" min="1" value="1" style="width:80px;">
       <a href="#" class="button px-4">REMOVE</a>
     </div>
   </div>
  </div>
 </div>

 <div class="col-md-4">
  <div class="cart_3r">
   <h6 class="head_1">SUBTOTAL</h6>
   <h3 id="subtotal" class="text-center col_red mt-3">$0.00</h3>
   <hr>
   <h6 class="font_14">Additional comments</h6>
   <textarea class="form-control"></textarea>
   <h6 class="text-center mt-3"><a class="button" href="checkout">Tiến Hành Thanh Toán</a></h6><br>
  </div>
 </div>
</div>

<!-- JS tính tổng -->
<script>
document.addEventListener('DOMContentLoaded', function() {
  const checkboxes = document.querySelectorAll('.product-check');
  const subtotalElem = document.getElementById('subtotal');

  function formatMoney(num) {
    return '$' + num.toLocaleString('en-US', {minimumFractionDigits: 2});
  }

  function updateSubtotal() {
    let total = 0;
    document.querySelectorAll('.product-item').forEach(item => {
      const checked = item.querySelector('.product-check').checked;
      const qty = parseInt(item.querySelector('.qty-input').value);
      const price = parseFloat(item.dataset.price);
      if (checked) total += qty * price;
    });
    subtotalElem.textContent = formatMoney(total);
  }

  checkboxes.forEach(chk => chk.addEventListener('change', updateSubtotal));
  document.querySelectorAll('.qty-input').forEach(input => input.addEventListener('input', updateSubtotal));
});
</script>

</section>
 
  <jsp:include page="footer.jsp" />

		
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/theme.min.js"></script>

</body>
</html>