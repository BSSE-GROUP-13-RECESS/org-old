<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="email"%>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card mt-5">
        <div class="card-header"><h2>Email</h2></div>
        <div class="card-body">
            <email:select table="message from email" where="email='${sessionScope.email}'" displayFormat="table"/>
        </div><!-- card-body -->
      </div><!-- card -->
    </div><!-- column -->
  </div><!-- raw -->
</div><!-- container -->
<%@ include file="lower.jsp" %>
