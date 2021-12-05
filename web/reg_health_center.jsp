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
            <form action="health" method="post">
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
              <table class="table table-bordered table-hover">
                <tbody>
                  <tr>
                    <td>Health Center 1</td>
                    <td><input type="text" name="name" placeholder="name" value="" class="form-control form-control-custom" /></td>
                    <td><input type="text" name="center_id" placeholder="center_id" value="" class="form-control form-control-custom" /></td>
                  </tr>
                  <tr>
                    <td>Health Center 2</td>
                    <td><input type="text" name="name" placeholder="name" value="" class="form-control form-control-custom" /></td>
                    <td><input type="text" name="center_id" placeholder="center_id" value="" class="form-control form-control-custom" /></td>
                  </tr>
                  <tr>
                    <td>Health Center 3</td>
                    <td><input type="text" name="name" placeholder="name" value="" class="form-control form-control-custom" /></td>
                    <td><input type="text" name="center_id" placeholder="center_id" value="" class="form-control form-control-custom" /></td>
                  </tr>
                  <tr>
                    <td>Health Center 4</td>
                    <td><input type="text" name="name" placeholder="name" value="" class="form-control form-control-custom" /></td>
                    <td><input type="text" name="center_id" placeholder="center_id" value="" class="form-control form-control-custom" /></td>
                  </tr>
                  <tr>
                    <td>Health Center 5</td>
                    <td><input type="text" name="name" placeholder="name" value="" class="form-control form-control-custom" /></td>
                    <td><input type="text" name="center_id" placeholder="center_id" value="" class="form-control form-control-custom" /></td>
                  </tr>
                </tbody>
              </table>
              <div class="form-group row mb-0">
                <div class="col-md-6">
                  <button type="submit" class="btn btn-primary">Add</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</c:if>
<%@ include file="lower.jsp" %>
