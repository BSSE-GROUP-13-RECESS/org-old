<%@ include file="upper.jsp" %>
<%@ taglib prefix="reg" uri="https://org.com" %>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card mt-5">
          <div class="card-header"><h2>Health Centers</h2></div>
          <div class="card-body">
            <div class="form-group row">
              <p class="bg-success text-danger">
                <c:if test="${sessionScope.data.length()>0}">
                  <reg:insert table="health_centre" values="${sessionScope.data}"/>
                  <c:set var="data" scope="session" value=""/>
                  <c:if test="${requestScope.insertResp>0}">
                    Saved ${requestScope.insertResp} records.
                  </c:if>
                </c:if>
              </p>
            </div>
            <reg:select table="health_centre" displayFormat="table"/>
          </div>
        </div>
      </div>
    </div>
  </div>
</c:if>
<%@ include file="lower.jsp" %>

