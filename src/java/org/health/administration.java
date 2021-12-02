package org.health;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class administration extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String reqType = request.getParameter("reqType");
        if(reqType.equals("register")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm_password");

            if (!password.equals(confirm)) {
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("error","passwords do not match!");
                request.getRequestDispatcher("registration_form.jsp").forward(request, response);
                return;
            }
            HttpSession session = request.getSession();

            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            session.setAttribute("reqType", reqType);
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        }
    }
}
