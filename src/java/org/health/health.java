package org.health;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class health extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            String[] health_centers = request.getParameterValues("name");
            String[] center_id = request.getParameterValues("center_id");
            String query = "(name,center_id) values ";
            for(int i=0;i<5;i++){
               if(health_centers[i].length()!=0){
              query+="('"+health_centers[i]+"','"+center_id[i]+"'),";
               }
            }
            out.println(query.substring(0,query.length()-1)+";");
            request.setAttribute("data",query.substring(0,query.length()-1)+";");
             
            
  
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
