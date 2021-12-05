/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.health;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class vac_administration extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vaccine_id = request.getParameter("vaccine_id");
        String patient_id = request.getParameter("patient_id");
        String doze_id = request.getParameter("doze_id");
        String nin  = request.getParameter("nin");
        String shorts = request.getParameter("shorts");
        String centre_id = request.getParameter("center_id");
        String date = request.getParameter("date");

    }
}
