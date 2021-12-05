<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="vaccine"%>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card mt-5">
          <div class="card-header"><h2>Register Vaccine</h2></div>
          <div class="card-body">
            <c:if test="${sessionScope.vaccines.length()>0}">
              <vaccine:insert table="vaccine" values="${sessionScope.vaccines}"/>
              <c:set var="vaccines" scope="session" value=""/>
              <c:if test="${requestScope.insertResp>0}">
                Saved ${requestScope.insertResp} records.
              </c:if>
            </c:if>
            <vaccine:select table="vaccine" displayFormat="table"/>
            <form action="vaccine" method="post">
              <input type="hidden" name="reqType" value="regVaccine"/>
              <table class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Name of Vaccine</th>
                  <th>Number of Shots</th>
                  <th>Days Between Shots</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td><input type="text" name="name" class="form-control" placeholder="Enter name of vaccine"></td>
                  <td><input type="number" name="shots" class="form-control" placeholder="0"></td>
                  <td><input type="number" name="days" class="form-control" placeholder="0"></td>
                </tr>
                <tr>
                  <td><input type="text" name="name" class="form-control" placeholder="Enter name of vaccine"></td>
                  <td><input type="number" name="shots" class="form-control" placeholder="0"></td>
                  <td><input type="number" name="days" class="form-control" placeholder="0"></td>
                </tr>
                <tr>
                  <td><input type="text" name="name" class="form-control" placeholder="Enter name of vaccine"></td>
                  <td><input type="number" name="shots" class="form-control" placeholder="0"></td>
                  <td><input type="number" name="days" class="form-control" placeholder="0"></td>
                </tr>
                </tbody>
              </table>
              <div class="form-group row mb-0">
                <div class="col-md-6 offset-md-4">
                  <button type="submit" class="btn btn-primary">Register</button>
                </div>
              </div>
            </form>
          </div><!-- card-body -->
        </div><!-- card -->
      </div><!-- column -->
    </div><!-- raw -->
  </div><!-- container -->
</c:if>
<%@ include file="lower.jsp" %>
