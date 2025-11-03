
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<%
    // Kiểm tra xem có dữ liệu không
    if (request.getAttribute("dsXe") == null) {
        out.print("<div style='color:red'>⚠️ Không có danh sách xe (dsXe=null). Hãy truy cập qua /shop servlet!</div>");
    }
%>
<!DOCTYPE html>
<html lang="en">
  <jsp:include page="header.jsp" />

 
 <section id="center" class="center_shop"
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
	    <h1 class="text-white font_60">SHOP</h1>
		<h6 class="col_red mb-0"><a class="text-light" href="index.jsp">TRANG CHỦ</a> <span class="mx-2 text-white-50">/</span> Shop</h6>
	 </div>
      
  </div>
 </div>
   </div>   
 </section>
 
<section id="shop" class="pt-5 pb-5">
  <div class="container-xl">
    <div class="row blog_1">
      <div class="col-md-9">
        <div class="blog_1_left border-end px-3">

          <!-- Thanh tiêu đề + Select loại xe -->
          <div class="shop_1lt row">
            <div class="col-md-8">
              <div class="shop_1ltl pt-2">
                <p class="mb-0 text-black">Trang 1/10</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="shop_1ltr">
                <select id="typeSelect" class="form-select" aria-label="Default select example">
                  <option value="all" selected>Tất Cả</option>
                  <option value="xe_so">Xe Số</option>
                  <option value="xe_ga">Xe Ga</option>
                  <option value="xe_dien">Xe Điện</option>
                </select>
              </div>
            </div>
          </div>
<p style="color:red">
  Số lượng sản phẩm: 
  <%= ((java.util.List)request.getAttribute("dsXe")).size() %>
</p>

<!-- ✅ Danh sách xe sẽ hiển thị ở đây -->
<div id="bikeList" class="row row-cols-1 row-cols-sm-2 row-cols-md-3 shop mt-4">
  <c:forEach var="x" items="${dsXe}">
    <div class="col mb-4">
      <div class="shop_left">
        <div class="shop_left1 position-relative">
          <div class="shop_left1_inner">
            <a href="detail.jsp?id=${x.maSP}">
              <img src="${x.hinhAnh}" alt="${x.tenSp}" class="img-fluid" />
            </a>
          </div>

          <div class="shop_left1_inner1 position-absolute top-0 p-3">
            <b class="d-inline-block bg_red text-white p-1 px-3 font_14">Mới</b>
          </div>

          <div class="shop_left1_inner2 position-absolute w-100 h-100 bg_back top-0 text-center">
            <h5>
              <a class="button px-3" href="cart.jsp?add=${x.maSP}">
                Thêm vào giỏ hàng <i class="fa fa-long-arrow-right ms-2"></i>
              </a>
            </h5>
          </div>
        </div>

        <div class="shop_left2 mt-3">
          <h6 class="fs-6 col_red">${x.hangSX}</h6>
          <ul class="mb-0 fs-5">
            <li>
              <a class="justify-content-between d-flex" href="detail.jsp?id=${x.maSP}">
                ${x.tenSp}
                <span>
                  <fmt:formatNumber value="${x.gia}" type="number" groupingUsed="true"/> ₫
                </span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </c:forEach>
</div>


          </div>
                          
          <!-- Phân trang -->
          <div class="blog_1_left2 mt-5">
            <ul class="mt-3 mb-0 paginate text-center fw-bold">
              <li class="d-inline-block"><a class="border d-block" href="detail.jsp"><i class="fa fa-chevron-left"></i></a></li>
              <li class="d-inline-block"><a class="border d-block active" href="detail.jsp">1</a></li>
              <li class="d-inline-block"><a class="border d-block" href="detail.jsp">2</a></li>
              <li class="d-inline-block"><a class="border d-block" href="detail.jsp">3</a></li>
              <li class="d-inline-block"><a class="border d-block" href="detail.jsp">4</a></li>
              <li class="d-inline-block"><a class="border d-block" href="detail.jsp">5</a></li>
              <li class="d-inline-block"><a class="border d-block" href="detail.jsp">6</a></li>
              <li class="d-inline-block"><a class="border d-block" href="detail.jsp"><i class="fa fa-chevron-right"></i></a></li>
            </ul>
          </div>

        </div>
      </div>

      <div class="col-md-3">
        <div class="blog_1_right">
          <div class="blog_1_right1">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search Keyword">
              <span class="input-group-btn">
                <button class="btn btn-primary bg_red border-0 rounded-0 p-3 px-4" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>

 
 
 <jsp:include page="footer.jsp" />
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/theme.min.js"></script>
<!-- Khi truyền dữ liệu xóa script bên dưới -->



</body>
</html>