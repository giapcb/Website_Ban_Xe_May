<%-- 
    Document   : header
    Created on : Nov 3, 2025, 9:05:03 PM
    Author     : Asus TUF
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.NguoiDung" %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Motor Bike</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="fonts/css/fontawesome.min.css" rel="stylesheet" >
        <link href="fonts/css/brands.min.css" rel="stylesheet" />
        <link href="fonts/css/solid.min.css" rel="stylesheet" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
        <!-- Font đẹp từ Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!-- Swiper CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <link href="css/global.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">

        <link rel="stylesheet" href="product.css">
    </head>
    <body>

        <section id="header">
            <nav class="navbar navbar-expand-lg navbar-light w-100">
                <div class="container-xl">
                    <a class="d-flex p-2" href="index.jsp">
                        <b class="fs-3 d-block mt-1 text-uppercase text-white">
                            <i class="fa fa-biking col_red me-1"></i> Motor Bike
                        </b>
                    </a>
                    <button class="navbar-toggler offcanvas-nav-btn ms-auto me-3" type="button">
                        <img src="image/icons-svg/list.svg" width="40" height="40" alt="Open TemplateOnweb website menu"/>
                    </button>

                    <div class="offcanvas offcanvas-start offcanvas-nav" style="width: 20rem">
                        <div class="offcanvas-header shadow">
                            <a class="d-flex p-2" href="index.jsp">
                                <b class="fs-3 d-block mt-1 text-uppercase text-white">
                                    <i class="fa fa-biking col_red me-1"></i> Motor Bike
                                </b>
                            </a>
                            <img src="image/icons-svg/x.svg" width="40" height="40" class="ms-auto" data-bs-dismiss="offcanvas" aria-label="Close" alt="Close TemplateOnweb website menu"/>
                        </div>

                        <div class="offcanvas-body pt-0 align-items-center">
                            <ul class="navbar-nav align-items-lg-center ms-auto">

                                <!-- HOME -->
                                <li class="nav-item"> 
                                    <a class="nav-link dropdown-toggle active" href="index.jsp" title="Visit home page">
                                        TRANG CHỦ
                                    </a>
                                </li>


                                <li class="nav-item dropdown drop_border">
          <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Shop<img src="image/icons-svg/chevron-down.svg" width="15" height="15" alt="Submenu open/close icon">
          </a>
          <ul class="dropdown-menu drop_1 shadow" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="shop"> Shop</a></li>
			
			<li><a class="dropdown-item" href="cart"> Giỏ Hàng</a></li>
			<li><a class="dropdown-item border-0" href="checkout"> Thanh Toán</a></li>
          </ul>
        </li>

                                <!-- CONTACT -->
                                <li class="nav-item"> 
                                    <a class="nav-link dropdown-toggle" href="contact.jsp" title="Visit home page">
                                        LIÊN HỆ
                                    </a>
                                </li>
<%
    NguoiDung user = (NguoiDung) session.getAttribute("user");
%>

<% if (user != null) { %>
    <!-- Khi đã đăng nhập -->
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            👋 Xin chào, <b><%= user.getHoTen() %></b>
        </a>
        <ul class="dropdown-menu dropdown-menu-end shadow">
            <li><a class="dropdown-item" href="profile.jsp">Thông tin cá nhân</a></li>
            <li><a class="dropdown-item" href="logout.jsp">Đăng xuất</a></li>
        </ul>
    </li>
<% } else { %>
    <!-- Khi chưa đăng nhập -->
    <li class="nav-item">
        <a class="nav-link dropdown-toggle" href="login.jsp" title="Đăng nhập">Đăng nhập</a>
    </li>
    <li class="nav-item">
        <a class="nav-link dropdown-toggle" href="signup.jsp" title="Đăng ký">Đăng ký</a>
    </li>
<% } %>



                            </ul>

                            <ul class="navbar-nav align-items-lg-center ms-auto">
                                <!-- CART -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle drop_togn nav_hide fs-4 mt-1" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="fa fa-shopping-cart"></i>
                                    </a>
                                    <ul class="dropdown-menu drop_cart shadow rounded-0 border-0" aria-labelledby="navbarDropdown">
                                        <li>
                                            <div class="drop_1i row">
                                                <div class="col-md-6 col-6">
                                                    <div class="drop_1il"><h5>2 ITEMS</h5></div>
                                                </div>
                                                <div class="col-md-6 col-6">
                                                    <div class="drop_1il text-end"><h5><a href="cart.jsp">Giỏ Hàng</a></h5></div>
                                                </div>
                                            </div>
                                            <div class="drop_1i1 row">
                                                <div class="col-md-6 col-6">
                                                    <div class="drop_1i1l"><h6><a href="#">Nulla Quis</a> <br> <span class="d-inline-block mt-1 font_14">1x - $89.00</span></h6></div>
                                                </div>
                                                <div class="col-md-4 col-4">
                                                    <div class="drop_1i1r"><a href="#"><img src="image/15.jpg" class="img-fluid" alt="abc"></a></div>
                                                </div>
                                                <div class="col-md-2 col-2">
                                                    <div class="drop_1i1l text-end"><h6><span><i class="fa fa-trash"></i></span></h6></div>
                                                </div>
                                            </div>
                                            <div class="drop_1i1 row">
                                                <div class="col-md-6 col-6">
                                                    <div class="drop_1i1l"><h6><a href="#">Eget Nulla</a> <br> <span class="d-inline-block mt-1 font_14">1x - $49.00</span></h6></div>
                                                </div>
                                                <div class="col-md-4 col-4">
                                                    <div class="drop_1i1r"><a href="#"><img src="image/16.jpg" class="img-fluid" alt="abc"></a></div>
                                                </div>
                                                <div class="col-md-2 col-2">
                                                    <div class="drop_1i1l text-end"><h6><span><i class="fa fa-trash"></i></span></h6></div>
                                                </div>
                                            </div>
                                            <div class="drop_1i2 row">
                                                <div class="col-md-6 col-6">
                                                    <div class="drop_1il"><h5>Tổng tiền </h5></div>
                                                </div>
                                                <div class="col-md-6 col-6">
                                                    <div class="drop_1il text-end"><h5>$142.00</h5></div>
                                                </div>
                                            </div>
                                            <div class="drop_1i3 text-center row">
                                                <div class="col-md-12 col-12">
                                                    <ul class="mb-0">
                                                        <li class="d-inline-block mx-1"><a class="button px-3 pt-2 pb-2" href="cart.jsp">Xem Đơn Hàng</a></li>
                                                        <li class="d-inline-block mx-1"><a class="button button_black px-3 pb-2 pt-2" href="checkout.jsp">Thanh Toán</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>

                                <!-- SEARCH -->
                                <li class="nav-item dropdown">
                                    <a class="dropdown-toggle nav_hide nav-link fs-4 mt-1" href="#" id="navbarDropdownSearch" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="fa fa-search"></i>
                                    </a>
                                    <ul class="dropdown-menu drop_search p-3 shadow" aria-labelledby="navbarDropdownSearch">
                                        <form class="navbar-form" role="search">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Search Keyword">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-primary bg_red border-0 rounded-0 p-2 px-3" type="button">
                                                        <i class="fa fa-search"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </form>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </section>


