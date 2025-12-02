<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="sidebar.jsp" />
<style>
    .form-container {
        width: 450px;
        margin: 40px auto;
        background: #ffffff;
        padding: 25px 30px;
        border-radius: 12px;
        box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        font-family: "Segoe UI", sans-serif;
    }

    .form-container h2 {
        text-align: center;
        color: #1b4d3e;
        margin-bottom: 20px;
        font-size: 26px;
    }

    label {
        font-weight: bold;
        display: block;
        margin: 12px 0 5px;
        color: #333;
    }

    input[type="number"], select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
        transition: 0.2s;
    }

    input[type="number"]:focus,
    select:focus {
        border-color: #1c7c54;
        box-shadow: 0 0 4px rgba(28, 124, 84, 0.4);
        outline: none;
    }

    button {
        width: 100%;
        padding: 12px;
        background-color: #1c7c54;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 18px;
        margin-top: 20px;
        cursor: pointer;
        transition: 0.2s ease-in-out;
    }

    button:hover {
        background-color: #155c40;
        transform: scale(1.02);
    }

    .back-link {
        display: block;
        margin-top: 15px;
        text-align: center;
        color: #1c7c54;
        text-decoration: none;
        font-weight: bold;
    }

    .back-link:hover {
        text-decoration: underline;
    }
</style>

<div class="form-container">
    <h2>Thêm đơn hàng</h2>

    <form action="${pageContext.request.contextPath}/admin/manage-orders" method="post">
        <input type="hidden" name="action" value="add">

        <label>Mã người dùng:</label>
        <input type="number" name="maND" required>

        <label>Tổng tiền:</label>
        <input type="number" name="tongTien" required>

        <label>Trạng thái:</label>
        <select name="trangThai">
            <option>Chờ xử lý</option>
            <option>Đang giao</option>
            <option>Hoàn thành</option>
            <option>Đã hủy</option>
        </select>

        <button type="submit">Thêm đơn hàng</button>
    </form>

    <a class="back-link" href="${pageContext.request.contextPath}/admin/manage-orders">Quay lại</a>
</div>
