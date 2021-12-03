package org.health;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class health extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] health_centers = request.getParameterValues("name");
        String[] center_id = request.getParameterValues("center_id");
        String query = "(name,center_id) values ";
        for(int i=0;i<5;i++){
           if(health_centers[i].length()!=0){
          query+="('"+health_centers[i]+"','"+center_id[i]+"'),";
           }
        }

        HttpSession session = request.getSession();
        session.setAttribute("data",query.substring(0,query.length()-1)+";");
        response.sendRedirect(request.getContextPath() + "/reg_health_center.jsp");
    }
}
