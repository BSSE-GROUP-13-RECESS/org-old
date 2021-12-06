<%@ include file="upper.jsp" %>
<%@ taglib prefix="reg" uri="https://org.com" %>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card mt-5">
          <div class="card-header"><h2>Register Health Centers</h2></div>
          <div class="card-body">
            <form action="health" method="post">
              <input type="hidden" name="reqType" value="regCenters">
              <table class="table table-bordered table-hover">
                <tbody>
                  <tr>
                    <td>Health Center 1</td>
                    <td><input type="text" name="name" placeholder="Name" value="" class="form-control form-control-custom" /></td>
                    <td><input type="text" name="center_id" placeholder="Center_ID" value="" class="form-control form-control-custom" /></td>
                  </tr>
                  <tr>
                    <td>Health Center 2</td>
                    <td><input type="text" name="name" placeholder="Name" value="" class="form-control form-control-custom" /></td>
                    <td><input type="text" name="center_id" placeholder="Center_ID" value="" class="form-control form-control-custom" /></td>
                  </tr>
                  <tr>
                    <td>Health Center 3</td>
                    <td><input type="text" name="name" placeholder="Name" value="" class="form-control form-control-custom" /></td>
                    <td><input type="text" name="center_id" placeholder="Center_ID" value="" class="form-control form-control-custom" /></td>
                  </tr>
                  <tr>
                    <td>Health Center 4</td>
                    <td><input type="text" name="name" placeholder="Name" value="" class="form-control form-control-custom" /></td>
                    <td><input type="text" name="center_id" placeholder="Center_ID" value="" class="form-control form-control-custom" /></td>
                  </tr>
                  <tr>
                    <td>Health Center 5</td>
                    <td><input type="text" name="name" placeholder="Name" value="" class="form-control form-control-custom" /></td>
                    <td><input type="text" name="center_id" placeholder="Center_ID" value="" class="form-control form-control-custom" /></td>
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
