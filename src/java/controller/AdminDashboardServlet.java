package controller;

import dao.DashboardDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Calendar;
import java.util.Date;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/AdminDashboardServlet"})
public class AdminDashboardServlet extends HttpServlet {

    DashboardDAO dao = new DashboardDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String range = req.getParameter("range");
        if (range == null) range = "day";

        double doanhSo = 0;
        int tongDon = 0;
        int slBan = 0;

        int tonKho = dao.getTonKho();

        if (range.equals("day")) {

            doanhSo = dao.getDoanhSoHomNay();
            tongDon = dao.getTongDonHomNay();
            slBan = dao.getSoLuongBanHomNay();

        } else if (range.equals("week")) {

            Calendar cal = Calendar.getInstance();
            cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
            Date from = cal.getTime();
            Date to = new Date();

            java.sql.Date sqlFrom = new java.sql.Date(from.getTime());
            java.sql.Date sqlTo = new java.sql.Date(to.getTime());

            doanhSo = dao.getDoanhSo(sqlFrom, sqlTo);
            tongDon = dao.getTongDon(sqlFrom, sqlTo);
            slBan = dao.getSoLuongBan(sqlFrom, sqlTo);

        } else if (range.equals("month")) {

            Calendar cal = Calendar.getInstance();
            cal.set(Calendar.DAY_OF_MONTH, 1);
            Date from = cal.getTime();
            Date to = new Date();

            java.sql.Date sqlFrom = new java.sql.Date(from.getTime());
            java.sql.Date sqlTo = new java.sql.Date(to.getTime());

            doanhSo = dao.getDoanhSo(sqlFrom, sqlTo);
            tongDon = dao.getTongDon(sqlFrom, sqlTo);
            slBan = dao.getSoLuongBan(sqlFrom, sqlTo);
        }

        req.setAttribute("doanhSo", doanhSo);
        req.setAttribute("tongDon", tongDon);
        req.setAttribute("slBan", slBan);
        req.setAttribute("tonKho", tonKho);
        req.setAttribute("range", range);

        req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
    }

}
