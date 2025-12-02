<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.SanPham" %>

<%
    SanPham sp = (SanPham) request.getAttribute("sp");
    if (sp == null) {
        out.println("<div style='color:red;text-align:center;margin-top:50px;'>⚠️ Không tìm thấy sản phẩm.</div>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Motor Bike - Chi tiết sản phẩm</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="fonts/css/fontawesome.min.css" rel="stylesheet">
  <link href="fonts/css/brands.min.css" rel="stylesheet">
  <link href="fonts/css/solid.min.css" rel="stylesheet">
  <link href="css/global.css" rel="stylesheet">
  <link href="css/shop.css" rel="stylesheet">

  <style>
    #mainImage {
      width: 100%;
      max-width: 500px;
      height: auto;
      object-fit: contain;
      transition: opacity 0.3s ease-in-out;
    }

    .thumbnail-container {
      display: flex;
      gap: 10px;
      justify-content: center;
      overflow-x: auto;
      padding: 10px 0;
      scroll-behavior: smooth;
    }

    .thumbnail-container::-webkit-scrollbar { height: 6px; }
    .thumbnail-container::-webkit-scrollbar-thumb {
      background: #ccc;
      border-radius: 3px;
    }

    .thumbnail-img {
      width: 80px;
      height: 80px;
      object-fit: cover;
      border: 2px solid transparent;
      border-radius: 5px;
      cursor: pointer;
      transition: transform 0.2s, border-color 0.2s;
    }
    .thumbnail-img:hover { transform: scale(1.1); border-color: #dc3545; }
    .thumbnail-img.active { transform: scale(1.15); border-color: #dc3545; }

    /* ====== SẢN PHẨM LIÊN QUAN ====== */
    .related-box {
      border-left: 3px solid #dc3545;
      padding-left: 15px;
    }
    .related-item {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
      border-bottom: 1px solid #eee;
      padding-bottom: 10px;
    }
    .related-item img {
      width: 80px;
      height: 60px;
      object-fit: cover;
      margin-right: 10px;
      border-radius: 5px;
      transition: transform 0.2s;
    }
    .related-item img:hover { transform: scale(1.05); }
    .related-item a {
      text-decoration: none;
      color: #333;
      font-weight: 600;
    }
    .related-item a:hover { color: #dc3545; }
  </style>
</head>

<body>

<jsp:include page="header.jsp" />

<!-- Banner -->
<section id="center" class="center_detail"
  style="background-image: url('image/rsz_vinfast_banner_1920x1280.jpg');
         background-position: center center;
         background-size: cover;">
  <div class="center_om bg_back">
    <div class="container-xl text-center text-white">
      <h1 class="font_60">CHI TIẾT</h1>
      <h6 class="col_red mb-0">
        <a class="text-light" href="index.jsp">TRANG CHỦ</a>
        <span class="mx-2 text-white-50">/</span> Chi tiết sản phẩm
      </h6>
    </div>
  </div>
</section>

<!-- Chi tiết sản phẩm -->
<section id="blog" class="pt-5 pb-5">
  <div class="container-xl">
    <div class="row align-items-start">

      <!-- CỘT TRÁI -->
      <div class="col-md-9">
        <div class="shop_dt px-3 border-end pe-md-4">
          <div class="shop_dt1 row">
            <div class="col-md-6 text-center">

             <!-- ẢNH CHÍNH -->
<c:set var="defaultImage" value="image/no-image.jpg" />
<c:set var="mainImageUrl" value="${defaultImage}" />

<c:if test="${not empty mauList}">
    <c:set var="mainImageUrl" value="${mauList[0].anhMau}" />
</c:if>

<img id="mainImage"
    src="${mainImageUrl}"
    class="img-fluid rounded shadow mb-3"
    alt="Ảnh sản phẩm"
    style="max-width:500px;">


             <!-- ẢNH THUMBNAIL NHỎ -->
<div class="thumbnail-container" id="thumbnailContainer">
    <c:forEach var="m" items="${mauList}" varStatus="i">
        <img src="${m.anhMau}"
             class="thumbnail-img ${i.first ? 'active' : ''}"
             data-link="${m.anhMau}"
             onclick="doiAnh(this)"
             onerror="this.src='image/no-image.jpg';">
    </c:forEach>
</div>

            </div>

            <!-- Thông tin sản phẩm -->
            <div class="col-md-6">
              <h1 class="mb-1 text-uppercase"><%= sp.getTenSp() %></h1>
              <b class="d-block fs-4 mb-2 text-danger">
                <fmt:formatNumber value="<%= sp.getGia() %>" type="number" groupingUsed="true"/> ₫
              </b>
             <p class="mt-3 text-secondary"><%= sp.getMoTa() %></p>

               <form action="${pageContext.request.contextPath}/cart" method="get" class="mb-3">

        <c:choose><c:when test="${mode == 'edit'}">
            <input type="hidden" name="action" value="updateColor">
            <input type="hidden" name="MaSP" value="<%= sp.getMaSP() %>">
        </c:when><c:otherwise>
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="MaSP" value="<%= sp.getMaSP() %>">
        </c:otherwise></c:choose>

       <input type="hidden" id="colorImage" name="colorImage" 
        value="${not empty mauList ? mauList.get(0).anhMau : 'image/no-image.jpg'}">
    <div class="mb-3">
        <label class="form-label fw-bold">Chọn màu xe:</label>

        <div class="mb-3">
        <label class="form-label fw-bold">Chọn màu xe:</label>

        <c:choose><c:when test="${not empty mauList}">
                <select id="mauXe" name="color" class="form-select w-75" onchange="doiMauXe(this)">
                    <c:forEach var="m" items="${mauList}" varStatus="i">
                        <option value="${m.tenMau}" data-img="${m.anhMau}" ${i.first ? 'selected' : ''}>
                            ${m.tenMau}
                        </option>
                    </c:forEach>
                </select>
            </c:when><c:otherwise>
                <p class="text-danger">Không có tùy chọn màu sắc nào.</p>
            </c:otherwise></c:choose>
    </div>
    </div>

    <div class="d-flex align-items-center mb-3">

                <c:choose><c:when test="${mode == 'edit'}">
                <input type="number" disabled value="1"
                       class="form-control me-3 rounded-0"
                       style="width:80px; height:52px;">
            </c:when><c:otherwise>
                <input type="number" name="qty" min="1" value="1"
                       class="form-control me-3 rounded-0"
                       style="width:80px; height:52px;">
            </c:otherwise></c:choose>

                <c:choose><c:when test="${mode == 'edit'}">
                <button type="submit" class="btn btn-warning px-4">
                    <i class="fa-solid fa-pen-to-square me-2"></i>
                    Cập nhật lựa chọn
                </button>
            </c:when><c:otherwise>
                <button type="submit" class="btn btn-danger px-4">
                    <i class="fa-solid fa-cart-plus me-2"></i>
                    Thêm vào giỏ hàng
                </button>
            </c:otherwise></c:choose>
    </div>

</form>


              <h6><span class="text-muted">Hãng:</span> <b><%= sp.getHangSX() %></b></h6>
              <h6><span class="text-muted">Loại xe:</span> <b><%= sp.getMaLoai() %></b></h6>
              <h6><span class="text-muted">Số lượng:</span> <b><%= sp.getSoLuong() %></b></h6>
            </div>
          </div>

          <!-- TAB MÔ TẢ -->
          <div class="shop_1dt2 mt-5">
            <ul class="nav nav-tabs mb-0">
              <li class="nav-item"><a href="#mota" data-bs-toggle="tab" class="nav-link active">Mô tả</a></li>
             <li class="nav-item">
  <a href="#danhgia" data-bs-toggle="tab" class="nav-link">
    Đánh giá 
    <i class="fa-solid fa-star text-warning"></i>
    <i class="fa-solid fa-star text-warning"></i>
    <i class="fa-solid fa-star text-warning"></i>
    <i class="fa-solid fa-star text-warning"></i>
    <i class="fa-regular fa-star-half-stroke text-warning"></i>
  </a>
</li>

            </ul>

            <div class="tab-content border_light border-top-0 p-4">
              <div class="tab-pane active" id="mota">
                <p><%= sp.getMoTa() %></p>
              </div>

              <div class="tab-pane" id="danhgia">
                <h6 class="fw-bold mt-3">Gửi đánh giá của bạn</h6>
                <form>
                  <input type="text" class="form-control mb-3" placeholder="Tên của bạn...">
                  <textarea class="form-control mb-3" rows="3" placeholder="Nội dung đánh giá..."></textarea>
                  <button type="submit" class="btn btn-danger">Gửi đánh giá</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- CỘT PHẢI: SẢN PHẨM LIÊN QUAN -->
    <div class="col-md-3">
        <div class="related-box">
          <h4 class="text-uppercase mb-3 border-bottom pb-2">Sản phẩm liên quan</h4>

          <c:choose><c:when test="${empty spLienQuan}">
              <p class="text-muted">Không có sản phẩm liên quan.</p>
            </c:when><c:otherwise>
              <c:forEach var="item" items="${spLienQuan}">
                <div class="related-item">
                  <a href="ProductDetailServlet?MaSP=${item.maSP}">
                    <img src="image/${item.hinhAnh}" alt="${item.tenSp}" onerror="this.src='image/no-image.jpg';">
                  </a>
                  <div>
                    <a href="ProductDetailServlet?MaSP=${item.maSP}">${item.tenSp}</a><br>
                    <span class="text-danger fw-bold">
                      <fmt:formatNumber value="${item.gia}" type="number" groupingUsed="true"/> ₫
                    </span>
                  </div>
                </div>
              </c:forEach>
            </c:otherwise></c:choose>
        </div>
      </div>
    </div>
  </div>
</section>

<jsp:include page="footer.jsp" />

<script src="js/bootstrap.bundle.min.js"></script>

<!-- JS đổi ảnh -->
<script>
function doiAnh(img) {
    let link = img.dataset.link;

    // đổi ảnh lớn
    document.getElementById("mainImage").src = link;

    // active thumbnail
    document.querySelectorAll(".thumbnail-img").forEach(e =>
        e.classList.remove("active")
    );
    img.classList.add("active");

    // cập nhật dropdown theo ảnh
    const options = document.getElementById("mauXe").options;
    for (let opt of options) {
        if (opt.dataset.img === link) {
            opt.selected = true;
        }
    }

    // cập nhật ảnh thực
    document.getElementById("colorImage").value = link;
}

function doiMauXe(select) {
    const img = select.options[select.selectedIndex].dataset.img;

    // đổi ảnh lớn
    document.getElementById("mainImage").src = img;

    // active thumbnail
    document.querySelectorAll(".thumbnail-img").forEach(i => {
        i.classList.remove("active");
        if (i.dataset.link === img) i.classList.add("active");
    });

    // cập nhật ảnh thực
    document.getElementById("colorImage").value = img;
}


</script>
</body>
</html>
