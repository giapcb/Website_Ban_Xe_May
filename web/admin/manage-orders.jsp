<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quản lý đơn hàng</title>

        <!-- BOOTSTRAP -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

        <style>
            body {
                background-color: #f6f8fb;
                font-family: "Segoe UI", sans-serif;
            }

            .content {
                margin-left: 260px; /* Đẩy sang phải đúng bằng sidebar */
                padding: 30px;
            }

            .card {
                border-radius: 12px;
                box-shadow: 0 3px 8px rgba(0,0,0,0.05);
            }

            .table thead {
                background-color: #007bff;
                color: white;
                text-align: center;
            }

            .table tbody tr:hover {
                background-color: #f1f5ff;
            }

            .btn-add {
                background-color: #28a745;
                color: white;
                border-radius: 6px;
                font-weight: 500;
            }

            .btn-add:hover {
                background-color: #218838;
            }

            .action-btn a {
                text-decoration: none;
                color: white;
                padding: 5px 10px;
                border-radius: 6px;
                font-size: 14px;
                margin-right: 5px;
            }

            .btn-edit {
                background-color: #ffc107;
            }
            .btn-edit:hover {
                background-color: #e0a800;
            }

            .btn-delete {
                background-color: #dc3545;
            }
            .btn-delete:hover {
                background-color: #c82333;
            }
        </style>
    </head>

    <body>

        <%@ include file="sidebar.jsp" %>

        <div class="content">
            <div class="card p-4">
                <h2 class="fw-bold mb-4">Quản lý đơn hàng</h2>

                <a href="${pageContext.request.contextPath}/admin/add-order.jsp" 
                   class="btn btn-success">+ Thêm đơn hàng</a>


                <div class="table-responsive">
                    <table class="table table-hover table-bordered align-middle">
                        <thead>
                            <tr class="text-center">
                                <th>Mã đơn hàng</th>
                                <th>Mã người dùng</th>
                                <th>Ngày đặt</th>
                                <th>Tổng tiền (VNĐ)</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="dh" items="${dsDonHang}">
                                <tr>
                                    <td class="text-center">${dh.ma_DH}</td>
                                    <td class="text-center">${dh.ma_ND}</td>
                                    <td>${dh.ngay_Dat}</td>
                                    <td>
                                        <%        model.DonHang don = (model.DonHang) pageContext.getAttribute("dh");
                                            java.text.DecimalFormat df = new java.text.DecimalFormat("#,###");
                                            out.print(df.format(don.getTong_Tien()));
                                        %> ₫
                                    </td>




                                    <td>${dh.trang_Thai}</td>

                                    <td class="text-center action-btn">
                                        <a class="btn-edit"
                                           href="${pageContext.request.contextPath}/admin/manage-orders?action=edit&id=${dh.ma_DH}">
                                            Sửa
                                        </a>

                                        <a class="btn-delete"
                                           href="${pageContext.request.contextPath}/admin/manage-orders?action=delete&id=${dh.ma_DH}"
                                           onclick="return confirm('Bạn có chắc muốn xóa không?')">
                                            Xóa
                                        </a>



                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>

    </body>
</html>
