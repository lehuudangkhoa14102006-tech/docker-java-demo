package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.InetAddress;
import java.sql.SQLException;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {

    private final StudentDAO dao = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            req.setAttribute("students", dao.findAll());
            req.setAttribute("host", InetAddress.getLocalHost().getHostName());
            req.getRequestDispatcher("/students.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        try {
            if ("add".equals(action)) {
                dao.add(req.getParameter("fullName"),
                        req.getParameter("email"),
                        req.getParameter("major"));
            } else if ("delete".equals(action)) {
                dao.delete(Integer.parseInt(req.getParameter("id")));
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        resp.sendRedirect(req.getContextPath() + "/students"); // Post-Redirect-Get
    }
}