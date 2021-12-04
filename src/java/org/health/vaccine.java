package org.health;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class vaccine extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reqType = request.getParameter("reqType");
        if(reqType.equals("getVaccine")){
            HttpSession session = request.getSession();
            session.setAttribute("reqType",reqType);
            response.sendRedirect(request.getContextPath() + "/vaccine.jsp");
        }
        else if(reqType.equals("getNonDist")){
            HttpSession session = request.getSession();
            session.setAttribute("reqType",reqType);
            response.sendRedirect(request.getContextPath() + "/vaccine.jsp");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reqType = request.getParameter("reqType");
        if(reqType.equals("regVaccine")) {
            String[] names = request.getParameterValues("name");
            String[] shots = request.getParameterValues("shots");
            String[] days = request.getParameterValues("days");
            String query = "(name,required_shots,next_doze_time) values ";

            for (int i = 0; i < names.length; i++) {
                if (names[i].length()>0&&shots[i].length()>0&&days[i].length()>0) {
                    query += "('" + names[i] + "','" + shots[i] + "','" + days[i] + "'),";
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("reqType",reqType);
            session.setAttribute("vaccines", query.substring(0, query.length() - 1) + ";");
            response.sendRedirect(request.getContextPath() + "/register_vaccines.jsp");
        }
        else if(reqType.equals("regReceivedVaccine")){
            String[] vaccines = request.getParameterValues("vaccine");
            String[] quantity = request.getParameterValues("quantity");
            String[] batchNo = request.getParameterValues("batchNo");
            String[] date = request.getParameterValues("date");
            String query = "(vaccine_id,quantity,batch_number,arrival_date) values ";

            for (int i = 0; i < vaccines.length; i++) {
                if (vaccines[i].length()>0&&quantity[i].length()>0&&batchNo[i].length()>0&&date[i].length()>0) {
                    query += "('" + vaccines[i] + "','" + quantity[i] + "','" + batchNo[i] + "','" + date[i] + "'),";
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("reqType",reqType);
            session.setAttribute("dozes", query.substring(0, query.length() - 1) + ";");
            response.sendRedirect(request.getContextPath() + "/vaccines_received.jsp");
        }
    }
}
