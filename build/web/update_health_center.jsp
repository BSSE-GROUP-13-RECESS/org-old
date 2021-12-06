<%@ include file="upper.jsp" %>
<%@ taglib prefix="health" uri="https://org.com" %>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card mt-5">
          <div class="card-header"><h2>Update Health Centers</h2></div>
          <div class="card-body">
            <form action="health" method="post">
              <div class="form-group row">
                <div hidden></div>
                <p class="bg-success text-danger">
                  <c:if test="${sessionScope.data.length()>0}">
                    <health:update table="health_centre" values="${sessionScope.data}"/>
                    <c:set var="data" scope="session" value=""/>
                    <c:if test="${requestScope.insertResp>0}">
                      Saved ${requestScope.insertResp} records.
                    </c:if>
                  </c:if>
                </p>
              </div>
              <div hidden><health:select table="health_centre" displayFormat="table"/></div>
              <table class="table table-bordered table-hover">
                <tbody>
                  <c:forEach var="x" begin="0" end="${requestScope.data.size()-1}" step="1">
                    <tr>
                      <td>Health Center ${x+1}<input type="hidden" name="id" value="${requestScope.data.get(x).get('id')}"/></td>
                      <td><input type="text" name="name" value="${requestScope.data.get(x).get('name')}" class="form-control form-control-custom" /></td>
                      <td><input type="text" name="center_id" value="${requestScope.data.get(x).get('center_id')}" class="form-control form-control-custom" /></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <div class="form-group row mb-0">
                <div class="col-md-6">
                  <button type="submit" class="btn btn-primary">Update</button>
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
