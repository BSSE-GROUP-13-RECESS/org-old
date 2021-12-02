package org.health;

import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.PageContext;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

import java.io.IOException;
import java.sql.*;

public class TagHandler extends SimpleTagSupport {
    //attributes
    private String table=null, where=null, displayFormat=null, values=null, newValue=null, redirectUrl=null;

    //setters
    public void setTable(String table){ this.table = table; }
    public void setWhere(String where){ this.where = where;}
    public void setDisplayFormat(String displayFormat){ this.displayFormat = displayFormat;}
    public void setValues(String values){ this.values = values;}
    public void setNewValue(String newValue){this.newValue=newValue;}
    public void setRedirectUrl(String redirectUrl){this.redirectUrl=redirectUrl;}

    //dbConnection
    public Connection connection(){
        Connection connection = null;
        try {
            Class.forName("org.sqlite.JDBC");
            String dbPath = ((PageContext) getJspContext()).getServletContext().getRealPath("/WEB-INF/web.xml");
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
        try {
            Connection connection = connection();
            int exec = connection.createStatement().executeUpdate("insert into "+table+" "+values+";");
            out.println(exec);
            connection.close();
        } catch (SQLException e) {
            out.println(-1);
        }
    }

    //select
    public void select() throws IOException {
        JspWriter out = getJspContext().getOut();
        try {
            Connection connection = connection();
            ResultSet resultSet = connection.createStatement().executeQuery("select * from "+table+((where==null)?"":" where "+where)+";");
            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            int colLength = resultSetMetaData.getColumnCount();
            String output;
            if(displayFormat.equals("list")){
                output = "<ol>";
            }
            else{
                output = "<table><thead><tr>";
                for(int i=1; i<=colLength; i++){
                    output+="<th>"+resultSetMetaData.getColumnName(i)+"</th>";
                }
                output+="</tr></thead><tbody>";

                while (resultSet.next()){
                    output+="<tr>";
                    for(int i=1; i<=colLength; i++){
                        output+="<th>"+resultSet.getString(i)+"</th>";
                    }
                    output+="</tr>";
                }
                output+="</tbody></table>";
            }
            out.println(output);
            connection.close();
        } catch (SQLException e) {
            out.println("<p style='color:red'>"+e.getMessage()+"</p>");
        }
    }

    //update
    public void update() throws IOException {
        JspWriter out = getJspContext().getOut();
        try {
            Connection connection = connection();
            int exec = connection.createStatement().executeUpdate("select * from "+table+((where==null)?"":" where "+where)+";");
            out.println("<p style='color:"+((exec>0)?"green'>Operation successful":"red'>Operation failed!")+"</p>");
            connection.close();
        } catch (SQLException e) {
            out.println("<p style='color:red'>"+e.getMessage()+"</p>");
        }
    }

    //redirect
    public void redirect() throws IOException{

    }

    public void doTag() throws IOException {
        if(displayFormat!=null){
            select();
        }
        else if(values!=null){
            insert();
        }
        else if(newValue!=null){
            update();
        } else if(redirectUrl!=null){
            redirect();
        }
    }
}
