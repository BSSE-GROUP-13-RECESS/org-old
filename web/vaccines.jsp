<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="vaccine"%>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card mt-5">
          <div class="card-header"><h2>Vaccines</h2></div>
          <div class="card-body">
            <c:if test="${sessionScope.vaccines.length()>0}">
              <vaccine:insert table="vaccine" values="${sessionScope.vaccines}"/>
              <c:set var="vaccines" scope="session" value=""/>
              <c:if test="${requestScope.insertResp>0}">
                Saved ${requestScope.insertResp} records.
              </c:if>
            </c:if>
            <vaccine:select table="vaccine" displayFormat="table"/>
          </div><!-- card-body -->
        </div><!-- card -->
      </div><!-- column -->
    </div><!-- raw -->
  </div><!-- container -->
</c:if>
<%@ include file="lower.jsp" %>

