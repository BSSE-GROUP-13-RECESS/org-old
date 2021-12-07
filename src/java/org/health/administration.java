package org.health;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class administration extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String auth = request.getParameter("auth");
        switch (auth) {
            case "register": {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirm = request.getParameter("confirm_password");

                if (!password.equals(confirm)) {
                    request.setAttribute("name", name);
                    request.setAttribute("email", email);
                    request.setAttribute("error", "passwords do not match!");

                    request.getRequestDispatcher("registration_form.jsp").forward(request, response);
                    return;
                }
                HttpSession session = request.getSession();

                session.setAttribute("username", name);
                session.setAttribute("email", email);
                session.setAttribute("password", password);
                session.setAttribute("auth", auth);
                session.setAttribute("userType", "patient");
                response.sendRedirect(request.getContextPath() + "/home.jsp");
                break;
            }
            case "login": {
                HttpSession session = request.getSession();
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String userType = "patient";
                ServletContext context = getServletContext();
                String[] names = context.getInitParameter("adminNames").split(",");
                String[] emails = context.getInitParameter("adminEmails").split(",");
                String[] passwords = context.getInitParameter("adminPasswords").split(",");
                String[] centres = context.getInitParameter("adminHealthCentres").split(",");
                String adminEmail =  context.getInitParameter("appAdminEmail");
                String adminPassword = context.getInitParameter("appAdminPassword");

                if(email.equals(adminEmail)&&password.equals(adminPassword)){
                    userType = "admin";
                    session.setAttribute("username", "Admin");
                    session.setAttribute("adminEmails",emails);
                    session.setAttribute("adminNames", names);
                }
                else {
                    for (int i = 0; i < emails.length; i++) {
                        if (emails[i].equals(email)) {
                            if (passwords[i].equals(password)) {
                                userType = "centreAdmin";
                                session.setAttribute("username", names[i]);
                                session.setAttribute("adminId",centres[i]);
                                session.setAttribute("checkBooking","true");
                            } else {
                                request.setAttribute("email", email);
                                request.setAttribute("error", "Invalid password or email!");
                                request.getRequestDispatcher("login.jsp").forward(request, response);
                            }
                            break;
                        }
                    }
                }

                session.setAttribute("email", email);
                session.setAttribute("password", password);
                session.setAttribute("auth", auth);
                session.setAttribute("userType", userType);
                response.sendRedirect(request.getContextPath() + "/home.jsp");
                break;
            }
            case "logout": {
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                break;
            }
        }

    }
}
