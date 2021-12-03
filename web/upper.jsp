<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "https://org.com" prefix = "auth" %>
<%@ page import="java.sql.*" %>
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
    </style>
    <title>Home</title>
  </head>
  <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
    <div>
      <c:choose>
        <c:when test="${sessionScope.auth.equals('register')}">
          <auth:insert table="patient" values="(name,email,password) values ('${sessionScope.username}','${sessionScope.email}','${sessionScope.password}');"/>
          <c:set var="auth" scope="session" value="login"/>
          <c:set var="userType" scope="session" value="patient"/>
        </c:when>
        <c:when test="${sessionScope.auth.equals('login')}">
          <c:if test="${sessionScope.userType.equals('patient')}">
            <auth:select table="patient" displayFormat="table" where="email='${sessionScope.email}'"/>
            <c:set var="rs" scope="page" value="${requestScope.data}"/>
            <c:if test="${rs.next()}">
              <c:set var="username" scope="session" value="${rs.getString('name')}"/>
            </c:if>
          </c:if>
        </c:when>
      </c:choose>
      <c:if test="${sessionScope.auth.length()==0||sessionScope.auth==null||sessionScope.username.length()==0||sessionScope.username==null}">
        <% response.sendRedirect(request.getContextPath() + "/login.jsp"); %>
      </c:if>
    </div>
    <div class="wrapper">
      <%@ include file="navbar.jsp" %>
      <%@ include file="sidebar.jsp" %>
      <div class="content-wrapper">