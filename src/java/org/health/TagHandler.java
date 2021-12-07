package org.health;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.PageContext;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TagHandler extends SimpleTagSupport {
    //attributes
    private String table=null, where=null, displayFormat=null, values=null, newValue=null;

    //setters
    public void setTable(String table){ this.table = table; }
    public void setWhere(String where){ this.where = where;}
    public void setDisplayFormat(String displayFormat){ this.displayFormat = displayFormat;}
    public void setValues(String values){ this.values = values;}
    public void setNewValue(String newValue){this.newValue=newValue;}

    //dbConnection
    public Connection connection(){
        Connection connection = null;
        try {
            Class.forName("org.sqlite.JDBC");
            String dbPath = ((PageContext) getJspContext()).getServletContext().getRealPath("/");
            dbPath = dbPath.substring(0,dbPath.indexOf("org"))+"org/database.sqlite";
            connection =  DriverManager.getConnection("jdbc:sqlite:"+dbPath);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //insert
    public void insert() throws IOException {
        JspWriter out = getJspContext().getOut();
        HttpServletRequest request = (HttpServletRequest) ((PageContext)getJspContext()).getRequest();
        try {
            Connection connection = connection();
            int exec = connection.createStatement().executeUpdate("insert into "+table+" "+values);
            request.setAttribute("insertResp",exec);
            connection.close();
        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }

    //select
    public void select() throws IOException {
        JspWriter out = getJspContext().getOut();
        HttpServletRequest request = (HttpServletRequest) ((PageContext)getJspContext()).getRequest();
        try {
            Connection connection = connection();
            ResultSet resultSet = connection.createStatement().executeQuery("select "+((table.indexOf(" ")>0)?table:"* from "+table)+((where==null)?"":" where "+where)+";");
            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            int colLength = resultSetMetaData.getColumnCount();
            int rows = 0;
            List<Map<String, String>> data = new ArrayList<>();

            String output;

            if(displayFormat.equals("list")){
                output = "";
                while (resultSet.next()){
                    rows++;
                    Map<String, String> map = new HashMap<>();
                    output += "<ul style='list-style-type: none; border:1px solid black; border-radius: 5px; padding:3px;' >";
                    for(int i=1; i<=colLength; i++){
                        output+="<li>"+resultSetMetaData.getColumnName(i)+": "+resultSet.getString(i)+"</li>";
                        map.put(resultSetMetaData.getColumnName(i), resultSet.getString(i));
                    }
                    data.add(map);
                    output+="</ul>";
                }
            }
            else{
                output = "<table class='table table-bordered table-hover table-responsive' style='border-right:0; border-bottom:0; border-top:0;'><thead><tr>";
                for(int i=1; i<=colLength; i++){
                    output+="<th>"+resultSetMetaData.getColumnName(i).toUpperCase()+"</th>";
                }
                output+="</tr></thead><tbody>";

                while (resultSet.next()){
                    rows++;
                    Map<String, String> map = new HashMap<>();
                    output+="<tr>";
                    for(int i=1; i<=colLength; i++){
                        output+="<th class='"+resultSetMetaData.getColumnName(i)+"'>"+resultSet.getString(i)+"</th>";
                        map.put(resultSetMetaData.getColumnName(i), resultSet.getString(i));
                    }
                    data.add(map);
                    output+="</tr>";
                }
                output+="</tbody></table><br/>";
            }
            if(rows>0) {
                out.println(output);
            }
            request.setAttribute("data",data);
            connection.close();
        } catch (SQLException e) {
            out.println("<p style='color:red'>"+e.getMessage()+"</p>");
        }
    }

    //update
    public void update() throws IOException {
        JspWriter out = getJspContext().getOut();
        HttpServletRequest request = (HttpServletRequest) ((PageContext)getJspContext()).getRequest();
        try {
            Connection connection = connection();
            int exec = connection.createStatement().executeUpdate("update "+table+" set "+newValue+" where "+where+" ;");
            request.setAttribute("updateResp",exec);
            connection.close();
        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }

    public void doTag() throws IOException {
        if(displayFormat!=null){
            select();
        }
        else if(values!=null){
            insert();
        }
        else{
            update();
        }
    }
}
