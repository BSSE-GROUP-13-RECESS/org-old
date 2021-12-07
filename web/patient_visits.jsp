<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="visits"%>
<c:if test="${sessionScope.userType.equals('centreAdmin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div>
        <div class="card">
          <div class="card-header"><h2>Patient Register</h2></div>
          <div class="card-body">
            <div hidden>
              <c:if test="${sessionScope.query.length()>0}">
                <visits:insert table="visited_patients" values="${sessionScope.query}"/>
                <c:set var="query" scope="session" value=""/>
              </c:if>
            </div>
            <p class="bg-success text-danger">
              <c:if test="${requestScope.insertResp>0}">
                Saved ${requestScope.insertResp} records.
              </c:if>
            </p>
            <form action="health" method="post">
              <input type="hidden" name="reqType" value="regPatient"/>
              <table class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Name</th>
                  <th>Date</th>
                </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><input type="text" name="name" class="form-control" placeholder="Name"></td>
                    <td><input type="date" name="date" class="form-control"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="name" class="form-control" placeholder="Name"></td>
                    <td><input type="date" name="date" class="form-control"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="name" class="form-control" placeholder="Name"></td>
                    <td><input type="date" name="date" class="form-control"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="name" class="form-control" placeholder="Name"></td>
                    <td><input type="date" name="date" class="form-control"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="name" class="form-control" placeholder="Name"></td>
                    <td><input type="date" name="date" class="form-control"></td>
                  </tr>
                </tbody>
              </table>
              <div class="form-group row mb-0">
                <div class="col-md-6">
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

