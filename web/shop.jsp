<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<jsp:include page="header.jsp" />

<!-- Banner -->
<section id="center" class="center_shop"
  style="background-image: url('image/rsz_vinfast_banner_1920x1280.jpg');
         background-position: center center;
         background-size: cover;
         background-repeat: no-repeat;">
  <div class="center_om bg_back">
    <div class="container-xl">
      <div class="row center_o1">
        <div class="col-md-12 text-center">
          <h1 class="text-white font_60">SHOP</h1>
          <h6 class="col_red mb-0">
            <a class="text-light" href="index.jsp">TRANG CHỦ</a>
            <span class="mx-2 text-white-50">/</span> Shop
          </h6>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- DANH SÁCH SẢN PHẨM -->
<section id="shop" class="pt-5 pb-5">
  <div class="container-xl">
    <div class="row blog_1">

      <!-- CỘT TRÁI: DANH SÁCH SẢN PHẨM -->
      <div class="col-md-9">
        <div class="blog_1_left border-end px-3">

          <!-- THÔNG TIN TRANG -->
          <div class="shop_1lt row mb-4 align-items-center">
            <div class="col-md-12">
              <p class="mb-0 text-black">
                Trang ${page}/${totalPages} - Tổng Sản Phẩm: ${totalCount}
              </p>
            </div>
          </div>

          <p style="color:red">Số Lượng Sản Phẩm Trang Này: ${dsXe.size()}</p>

          <!-- ✅ DANH SÁCH XE -->
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
            <c:forEach var="x" items="${dsXe}">
              <div class="col">
                <div class="shop_left bg-white rounded shadow-sm p-2 h-100">
                  <div class="shop_left1 position-relative">

                   <a href="ProductDetailServlet?MaSP=${x.maSP}">
  <img src="image/${x.hinhAnh}"
       alt="${x.tenSp}"
       class="img-fluid rounded"
       style="width:100%; height:180px; object-fit:cover;"
       onerror="this.onerror=null; this.src='image/no-image.jpg';">
</a>
                    <div class="position-absolute top-0 start-0 p-2">
                      <b class="d-inline-block bg_red text-white px-3 py-1 rounded">MỚI</b>
                    </div>

                    <div class="shop_left1_inner2 position-absolute top-0 w-100 h-100
                                bg_back text-center d-flex justify-content-center align-items-center opacity-0 hover-opacity-100 transition">
                      <a class="btn btn-danger px-4 py-2" href="cart.jsp?add=${x.maSP}">
                        Thêm vào giỏ hàng <i class="fa fa-long-arrow-right ms-2"></i>
                      </a>
                    </div>
                  </div>

                  <div class="shop_left2 mt-3 text-center">
                    <h6 class="fs-6 col_red mb-1">${x.hangSX}</h6>

                    <!-- ✅ LINK CHI TIẾT -->
                    <a href="ProductDetailServlet?MaSP=${x.maSP}"
                       class="text-dark text-decoration-none fw-bold d-block mb-1">
                      ${x.tenSp}
                    </a>

                    <span class="fw-bold fs-5">
                      <fmt:formatNumber value="${x.gia}" type="number" groupingUsed="true"/> ₫
                    </span>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>

          <!-- ✅ PHÂN TRANG -->
          <div class="blog_1_left2 mt-5 text-center">
            <ul class="mt-3 mb-0 paginate fw-bold list-unstyled">

              <!-- Nút Trước -->
              <c:if test="${page > 1}">
                <li class="d-inline-block">
                  <a class="border d-block px-3 py-2"
                     href="shop?page=${page - 1}">
                    <i class="fa fa-chevron-left"></i>
                  </a>
                </li>
              </c:if>

              <!-- Số trang -->
              <c:forEach var="p" begin="1" end="${totalPages}">
                <li class="d-inline-block">
                  <a class="border d-block px-3 py-2 ${p == page ? 'active bg-danger text-white' : ''}"
                     href="shop?page=${p}">
                    ${p}
                  </a>
                </li>
              </c:forEach>

              <!-- Nút Sau -->
              <c:if test="${page < totalPages}">
                <li class="d-inline-block">
                  <a class="border d-block px-3 py-2"
                     href="shop?page=${page + 1}">
                    <i class="fa fa-chevron-right"></i>
                  </a>
                </li>
              </c:if>

            </ul>
          </div>

        </div>
      </div>

      <!-- CỘT PHẢI: BỘ LỌC NHANH -->
      <div class="col-md-3">
        <div class="blog_1_right">
          <h5 class="fw-bold mb-3 text-center text-uppercase">Bộ Lọc Nhanh</h5>
          <div class="filter-box bg-light shadow-sm p-3 rounded">
            <form action="ShopFilterServlet" method="get">
              <label>Loại Xe:</label>
              <select name="type" class="form-select mb-2">               
                <option value="" ${empty type ? "selected" : ""}>--Chọn Loại Xe--</option>
                <option value="xe số" ${type == "xe số" ? "selected" : ""}>Xe Số</option>
                <option value="xe tay ga" ${type == "xe tay ga" ? "selected" : ""}>Xe Tay Ga</option>
                <option value="xe côn tay" ${type == "xe côn tay" ? "selected" : ""}>Xe Côn Tay</option>
                <option value="xe điện" ${type == "xe điện" ? "selected" : ""}>Xe điện</option>
              </select>

              <label>Mức giá:</label>
              <select name="price" class="form-select mb-2">
                <option value="" ${empty price ? "selected" : ""}>--Chọn mức giá--</option>
                <option value="1" ${price == "1" ? "selected" : ""}>Dưới 20 triệu</option>
                <option value="2" ${price == "2" ? "selected" : ""}>20 - 30 triệu</option>
                <option value="3" ${price == "3" ? "selected" : ""}>Trên 30 triệu</option>
              </select>

              <label>Hãng xe:</label>
              <select name="brand" class="form-select mb-3">
                <option value="" ${empty brand ? "selected" : ""}>--Chọn Hãng Xe--</option>
                <option value="Honda" ${brand == "Honda" ? "selected" : ""}>Honda</option>
                <option value="Yamaha" ${brand == "Yamaha" ? "selected" : ""}>Yamaha</option>
                <option value="Suzuki" ${brand == "Suzuki" ? "selected" : ""}>Suzuki</option>
                <option value="Kawasaki" ${brand == "Kawasaki" ? "selected" : ""}>Kawasaki</option>
                <option value="Vespa" ${brand == "Vespa" ? "selected" : ""}>Vespa</option>
                <option value="Piaggio" ${brand == "Piaggio" ? "selected" : ""}>Piaggio</option>
                <option value="Vinfast" ${brand == "Vinfast" ? "selected" : ""}>Vinfast</option>
              </select>

              <button type="submit" class="btn btn-danger w-100">Lọc</button>
            </form>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>

<jsp:include page="footer.jsp" />

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/theme.min.js"></script>

<style>
  .shop_left1_inner2 { transition: all 0.4s ease; }
  .shop_left1:hover .shop_left1_inner2 {
    background-color: rgba(0,0,0,0.5);
    opacity: 1;
  }
  .paginate a {
    color: black; text-decoration: none;
  }
  .paginate a.active {
    background-color: #dc3545 !important;
    color: white !important;
  }
  .filter-select { min-width: 120px; }
</style>
</html>
