<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "https://org.com" prefix = "auth" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="public/plugins/fontawesome-free/css/all.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="public/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="public/dist/css/adminlte.min.css">
    <style>
        .form-control-custom{
            display: inline;
            width: auto;
            margin-right: 5px;
        }
        thead{
            border-top: 1px solid #dee2e6;
        }
    </style>
    <title>Home</title>
  </head>
  <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
    <div hidden>
      <c:choose>
        <c:when test="${sessionScope.auth.equals('register')}">
          <auth:insert table="patient" values="(name,email,password) values ('${sessionScope.username}','${sessionScope.email}','${sessionScope.password}');"/>
          <c:set var="auth" scope="session" value="login"/>
          <c:set var="userType" scope="session" value="patient"/>
        </c:when>
        <c:when test="${sessionScope.auth.equals('login')}">
          <c:if test="${sessionScope.userType.equals('patient')}">
            <auth:select table="name from patient" displayFormat="table" where="email='${sessionScope.email}' and password='${sessionScope.password}'"/>
            <c:if test="${requestScope.data.size()>0}">
              <c:set var="username" scope="session" value="${requestScope.data.get(0).get('name')}"/>
            </c:if>
          </c:if>
        </c:when>
      </c:choose>
      <c:if test="${sessionScope.auth.length()==0||sessionScope.auth==null||sessionScope.username.length()==0||sessionScope.username==null}">
        <%
          request.setAttribute("error","Invalid password or email!");
          request.getRequestDispatcher("login.jsp").forward(request, response);
        %>
      </c:if>
    </div>
    <div class="wrapper">
      <%@ include file="navbar.jsp" %>
      <%@ include file="sidebar.jsp" %>
      <div class="content-wrapper">