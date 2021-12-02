<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="administration" uri="https://org.com" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p hidden>
            <c:if test="${sessionScope.reqType.equals('register')}">
                <administration:insert table="patient" values="(name,email,password) values ('${sessionScope.name}','${sessionScope.email}','${sessionScope.password}')"/>
                <c:set var="reqType" scope="session" value="login"/>
            </c:if>
        </p>
        <h1>Hello World home jsp!</h1>
    </body>
</html>
