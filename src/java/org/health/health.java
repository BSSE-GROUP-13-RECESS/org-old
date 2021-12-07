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
        String reqType = request.getParameter("reqType");
        if(reqType.equals("updateCenters")){
            String[] health_centers = request.getParameterValues("name");
            String[] center_id = request.getParameterValues("center_id");
            String[] id = request.getParameterValues("id");
            String[] query = request.getParameterValues("name");
            String[] where = request.getParameterValues("name");
            int len=0;
            for (int i = 0; i < health_centers.length; i++) {
                query[i] = "";
                where[i] = "";
                if (health_centers[i].length()>0&&center_id[i].length()>0&&id[i].length()>0) {
                    query[len] = "name='"+health_centers[i]+"', center_id='"+center_id[i]+"'";
                    where[len] = "id="+id[i];
                    len++;
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("len",len);
            session.setAttribute("query", query);
            session.setAttribute("where",where);
            response.sendRedirect(request.getContextPath() + "/update_health_center.jsp");
        }
        else if(reqType.equals("regPatient")){
            HttpSession session = request.getSession();
            String[] patients = request.getParameterValues("name");
            String[] date = request.getParameterValues("date");
            String id = (String) session.getAttribute("adminId");
            String query = "(centre_id, name, date) values ";

            for (int i = 0; i <patients.length; i++) {
                if (patients[i].length()>0&&date[i].length()>0) {
                    query += "('"+id+"','"+patients[i]+"','"+date[i]+"'),";
                }
            }

            session.setAttribute("query", query.substring(0, query.length() - 1) + ";");
            response.sendRedirect(request.getContextPath() + "/patient_visits.jsp");
        }
        else {
            String[] health_centers = request.getParameterValues("name");
            String[] center_id = request.getParameterValues("center_id");
            String query = "(name,center_id) values ";
            for (int i = 0; i < health_centers.length; i++) {
                if (health_centers[i].length() != 0) {
                    query += "('" + health_centers[i] + "','" + center_id[i] + "'),";
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("data", query.substring(0, query.length() - 1) + ";");
            response.sendRedirect(request.getContextPath() + "/health_centers.jsp");
        }
    }
}
