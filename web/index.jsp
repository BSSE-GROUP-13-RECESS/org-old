<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="WEB-INF/custom.tld" prefix="try" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="booking">Hello Servlet</a>
<try:select table="shop" displayFormat="table"/>
</body>
</html>