package org.health;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class vac_administration extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] nin = request.getParameterValues("nin");
        String[] name = request.getParameterValues("name");
        String[] vaccine = request.getParameterValues("vaccine");
        String[] date = request.getParameterValues("date");
        int len = 0;

        String query = "(patient_name, doze_id, NIN, date) values ";
        String where = "(";
        for(int i=0;i<nin.length;i++){
            if(nin[i].length()>0&&name[i].length()>0&&vaccine[i].length()>0&&date[i].length()>0){
                query+="('"+name[i]+"','"+vaccine[i]+"','"+nin[i]+"','"+date[i]+"'),";
                where+=vaccine[i]+",";
                len++;
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("len",len);
        session.setAttribute("nin",nin);
        session.setAttribute("name", name);
        session.setAttribute("vaccine",vaccine);
        session.setAttribute("date",date);
        session.setAttribute("vacPatient",query.substring(0,query.length()-1));
        session.setAttribute("vacWhere",where.substring(0,where.length()-1)+")");
        response.sendRedirect(request.getContextPath() + "/certificate.jsp");
    }
}
