<%@ include file="upper.jsp" %>
<%@ taglib prefix="health" uri="https://org.com" %>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card mt-5">
          <div class="card-header"><h2>Update Health Centers</h2></div>
          <div class="card-body">
            <div>
              <p hidden>
                <c:if test="${sessionScope.len>0}">
                  <c:forEach var="i" begin="0" end="${sessionScope.len-1}">
                    <health:update table="health_centre" newValue="${sessionScope.query[i]}" where="${sessionScope.where[i]}"/>
                  </c:forEach>
                </c:if>
              </p>
              <p class="bg-success text-danger">
                <c:if test="${requestScope.updateResp>0}">
                  Updated ${sessionScope.len} records.
                  <c:set var="len" scope="session" value="0"/>
                </c:if>
              </p>
            </div>
            <form action="health" method="post">
              <input type="hidden" name="reqType" value="updateCenters">
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
