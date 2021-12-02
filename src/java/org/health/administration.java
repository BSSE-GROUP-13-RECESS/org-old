package org.health;

import jakarta.servlet.ServletContext;
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
            session.setAttribute("userType","patient");
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        }
        else{
            HttpSession session = request.getSession();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String userType = "patient";
            ServletContext context = getServletContext();
            String[] names = context.getInitParameter("adminNames").split(",");
            String[] emails = context.getInitParameter("adminEmails").split(",");
            String[] passwords = context.getInitParameter("adminPasswords").split(",");

            for (int i=0; i<emails.length; i++){
                if(emails[i].equals(email)){
                    if(passwords[i].equals(password)){
                        userType="admin";
                        session.setAttribute("name", names[i]);
                    } else{
                        request.setAttribute("email", email);
                        request.setAttribute("error","Invalid password or email!");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                    break;
                }
            }

            session.setAttribute("email", email);
            session.setAttribute("password", password);
            session.setAttribute("reqType", reqType);
            session.setAttribute("userType",userType);
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        }
    }
}
