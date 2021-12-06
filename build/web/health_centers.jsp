<%-- 
    Document   : health_centers
    Created on : Dec 6, 2021, 12:40:36 PM
    Author     : hp
--%>

<%@ include file="upper.jsp" %>
<%@ taglib prefix="reg" uri="https://org.com" %>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card mt-5">
          <div class="card-header"><h2>Health Centers</h2></div>
          <div class="card-body">
            <reg:select table="health_centre" displayFormat="table"/>
          </div>
        </div>
      </div>
    </div>
  </div>
</c:if>
<%@ include file="lower.jsp" %>

