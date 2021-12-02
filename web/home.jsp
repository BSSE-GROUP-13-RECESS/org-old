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
    <div hidden>
      <c:choose>
        <c:when test="${sessionScope.reqType.equals('register')}">
          <administration:insert table="patient" values="(name,email,password) values ('${sessionScope.name}','${sessionScope.email}','${sessionScope.password}')"/>
          <c:set var="reqType" scope="session" value="login"/>
          <c:set var="userType" scope="session" value="patient"/>
        </c:when>
        <c:when test="${sessionScope.reqType.equals('login')}">
          <c:if test="${sessionScope.userType.equals('patient')}">
            <administration:select table="patient" displayFormat="table" where="email='${sessionScope.email}'"/>
          </c:if>
        </c:when>
        <c:otherwise>
          <% response.sendRedirect(request.getContextPath() + "/login.jsp"); %>
        </c:otherwise>
      </c:choose>
    </div>
    <c:out value="${sessionScope.name}"/>
    <c:out value="${sessionScope.email}"/>
    <c:out value="${sessionScope.userType}"/>
  </body>
</html>
