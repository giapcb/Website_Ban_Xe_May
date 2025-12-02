<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Lịch sử đơn hàng</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700;900&display=swap" rel="stylesheet">

    <style>
        body { 
            font-family: 'Roboto', sans-serif; 
            background: #f0f2f5; 
            margin: 0; 
            padding: 0; 
            color: #1c1e21; 
        }
        .container { 
            width: 95%; 
            max-width: 1000px; 
            margin: 30px auto; 
        }
        h2 { 
            text-align: center; 
            margin-bottom: 30px; 
            color: #007bff; 
            font-weight: 900;
            text-transform: uppercase;
        }

        /* HEADER & BUTTON */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .home-btn {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: .3s;
            box-shadow: 0 4px 6px rgba(40, 167, 69, 0.2);
        }
        .home-btn:hover {
            background-color: #218838;
            box-shadow: 0 6px 10px rgba(40, 167, 69, 0.3);
        }

        /* ORDER CARD */
        .order-card {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            transition: .2s;
        }
        .order-card:hover {
            transform: translateY(-2px);
        }

        /* ORDER HEADER */
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 15px;
            margin-bottom: 15px;
            border-bottom: 2px solid #e9ecef;
        }

        .order-left {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .order-id {
            font-size: 16px;
            font-weight: 700;
            color: #007bff;
        }

        .order-date {
            font-size: 14px;
            color: #6c757d;
        }

        .order-status {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 700;
            color: #fff;
            font-size: 13px;
            text-transform: uppercase;
        }

        .pending { background: #ffc107; color: #333; }
        .done { background: #28a745; }
        .cancel { background: #dc3545; }

        /* ITEMS */
        .item {
            display: flex;
            padding: 15px 0;
            align-items: flex-start;
        }
        .item:not(:last-child) {
            border-bottom: 1px dashed #eee;
        }

        .item img {
    width: 140px;
    height: 100px;
    object-fit: cover;
    border-radius: 8px;
    margin-right: 20px;
    border: 1px solid #ddd;
}


        .item-info { flex: 1; }
        .item-name { font-size: 17px; font-weight: 700; margin-bottom: 5px; }
        .item-details { font-size: 14px; color: #6c757d; }

        .item-price { 
            font-weight: bold; 
            font-size: 16px; 
            color: #dc3545;
        }

        /* TOTAL */
        .total {
            text-align: right;
            font-size: 18px;
            margin-top: 20px;
            font-weight: 900;
            color: #343a40;
            border-top: 2px solid #e9ecef;
            padding-top: 15px;
        }

        .total-amount {
            color: #007bff;
            font-size: 20px;
        }

    </style>
</head>

<body>
<div class="container">
    
    <div class="page-header">
        <h2><i class="fas fa-history me-2"></i> LỊCH SỬ ĐƠN HÀNG</h2>
        <a href="index.jsp" class="home-btn">
            <i class="fas fa-home me-1"></i> Trang chủ
        </a>
    </div>

    <c:if test="${empty orders}">
        <div class="order-card" style="text-align:center;">
            <i class="fas fa-box-open fa-3x" style="color: #6c757d; margin-bottom: 15px;"></i>
            <p style="font-size: 18px; font-weight: 500;">Bạn chưa có đơn hàng nào.</p>
            <p style="color: #6c757d;">Hãy mua sắm ngay!</p>
        </div>
    </c:if>

    <c:forEach var="o" items="${orders}">
        <div class="order-card">

           <div class="order-header">

    <div>
        <span class="order-id">Mã đơn: <span style="color: #343a40;">#${o.maDH}</span></span>
        <div style="font-size: 13px; color:#6c757d; margin-top:5px;">
            <i class="fas fa-calendar-alt"></i>
            <fmt:formatDate value="${o.ngayDat}" pattern="dd/MM/yyyy HH:mm"/>
        </div>
    </div>

    <c:set var="statusClass"
       value="${o.trangThai == 'Chờ xử lý' ? 'pending' :
               (o.trangThai == 'Hoàn thành' ? 'done' : 'cancel')}"/>

    <span class="order-status ${statusClass}">
       <c:choose>
    <c:when test='${o.trangThai == "Chờ xử lý"}'>
        <i class="fas fa-hourglass-half"></i> Đang xử lý
    </c:when>
    <c:when test='${o.trangThai == "Hoàn thành"}'>
        <i class="fas fa-check-circle"></i> Hoàn thành
    </c:when>
    <c:otherwise>
        <i class="fas fa-times-circle"></i> Đã hủy
    </c:otherwise>
</c:choose>

    </span>

</div>

            <c:forEach var="i" items="${o.chiTiet}">
                <div class="item">

                   <img src="${pageContext.request.contextPath}/image/${i.anhSP}" 
     alt="${i.tenSP}" />



                    <div class="item-info">
                        <div class="item-name">${i.tenSP}</div>
                        <div class="item-details">
                            Màu: <b>${i.tenMau}</b> &nbsp; • &nbsp; Số lượng: <b>${i.soLuong}</b>
                        </div>
                    </div>

                    <div class="item-price">
                        <fmt:formatNumber value="${i.thanhTien}" type="currency" currencySymbol="₫"/>
                    </div>

                </div>
            </c:forEach>

            <div class="total">
                Tổng thanh toán:
                <span class="total-amount">
                    <fmt:formatNumber value="${o.tongTien}" type="currency" currencySymbol="₫" />
                </span>
            </div>

        </div>
    </c:forEach>

</div>
</body>
</html>
