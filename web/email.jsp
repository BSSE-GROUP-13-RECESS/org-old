<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="email"%>
<c:if test="${!sessionScope.userType.equals('admin')}">
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card mt-5">
        <div hidden><email:select table="count(*) as count from email" where="email='${sessionScope.email}' and ready=1" displayFormat="table"/></div>
        <div class="card-header"><h2>Email<span class="badge badge-primary badge-pill">${requestScope.data.get(0).get('count')}</span></h2></div>
        <div class="card-body">
            <email:select table="sender, sender_email, date_time as 'date & time', subject, message from email" where="email='${sessionScope.email}' and ready=1" displayFormat="list"/>
        </div><!-- card-body -->
      </div><!-- card -->
    </div><!-- column -->
  </div><!-- raw -->
</div><!-- container -->
</c:if>
<%@ include file="lower.jsp" %>
