<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chỉnh sửa sản phẩm</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f3f4f6; /* nền trắng xám như bạn muốn */
                margin: 0;
                padding: 0;
                padding-left: 310px; /* chừa sidebar */
            }

            .edit-wrapper {
                padding: 40px 20px;
            }

            .edit-container {
                max-width: 800px;
                background: #ffffff;
                margin: auto;
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0px 4px 26px rgba(0,0,0,0.15);
            }

            h2 {
                text-align: center;
                color: #1a1a1a;
                margin-bottom: 30px;
                font-size: 30px;
                font-weight: bold;
            }

            label {
                font-weight: 600;
                display: block;
                margin-top: 15px;
            }

            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 12px 14px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 16px;
                margin-top: 5px;
                transition: 0.25s ease;
            }

            input:focus {
                border-color: #22c55e;
                box-shadow: 0 0 6px rgba(34,197,94,0.5);
                outline: none;
            }

            .btn-update {
                width: 100%;
                margin-top: 30px;
                background-color: #22c55e;
                color: white;
                padding: 15px;
                border: none;
                border-radius: 8px;
                font-size: 18px;
                font-weight: bold;
                cursor: pointer;
                transition: 0.25s;
            }

            .btn-update:hover {
                background-color: #16a34a;
            }
            .sidebar-title,
            .sidebar-title * {
                color: white !important;
            }
        </style>
    </head>

    <body>

        <div class="edit-wrapper">
            <div class="edit-container">

                <h2>Chỉnh sửa sản phẩm</h2>

                <c:choose>
                    <c:when test="${not empty sp}">
                        <form action="${pageContext.request.contextPath}/admin/updateProductByName" 
                              method="post" enctype="multipart/form-data">

                            <input type="hidden" name="oldName" value="${sp.tenSp}" />

                            <label for="name">Tên sản phẩm:</label>
                            <input type="text" id="name" name="name" value="${sp.tenSp}" required />

                            <label for="brand">Hãng sản xuất:</label>
                            <input type="text" id="brand" name="brand" value="${sp.hangSX}" required />

                            <label for="price">Giá:</label>
                            <input type="number" id="price" name="price" value="${sp.gia}" required />

                            <label for="image">Hình ảnh mới:</label>
                            <input type="file" id="image" name="imageFile" accept="image/*" />

                            <!-- giữ lại ảnh cũ -->
                            <input type="hidden" name="oldImage" value="${sp.hinhAnh}" />

                            <button type="submit" class="btn-update">Cập nhật sản phẩm</button>
                        </form>


                    </c:when>

                    <c:otherwise>
                        <p>Không tìm thấy sản phẩm để chỉnh sửa.</p>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>

    </body>
</html>
