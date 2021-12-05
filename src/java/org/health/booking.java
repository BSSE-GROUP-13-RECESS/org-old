package org.health;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class booking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reqType = request.getParameter("reqType");
        if(reqType.equals("book")){
            HttpSession session = request.getSession();
            String centre = request.getParameter("centre");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String id = (String) session.getAttribute("patientId");
            session.setAttribute("bookQuery"," (centre_id,patient_id,date,time) values ('"+centre+"','"+id+"','"+date+"','"+time+"');");
            response.sendRedirect(request.getContextPath() + "/booking.jsp");
        }
    }
}
