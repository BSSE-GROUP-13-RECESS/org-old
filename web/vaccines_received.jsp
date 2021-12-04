<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="vaccine"%>
<c:if test="${sessionScope.userType.equals('admin')}">
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card mt-5">
        <div class="card-header"><h2>Register Vaccine</h2></div>
        <div class="card-body">
          <c:if test="${sessionScope.dozes.length()>0}">
            <vaccine:insert table="dozes" values="${sessionScope.dozes}"/>
            <c:set var="dozes" scope="session" value=""/>
            <c:if test="${requestScope.insertResp>0}">
              Saved ${requestScope.insertResp} records.
            </c:if>
          </c:if>
          <vaccine:select table="dozes" displayFormat="table"/>
          <div hidden>
            <vaccine:select table="vaccine" displayFormat="table"/>
            <c:if test="${requestScope.data.size()>0}">
              <c:set var="options" scope="page" value=""/>
              <c:forEach var="i" begin="0" end="${requestScope.data.size()-1}" step="1">
                <c:set var="options" scope="page" value="${pageScope.options}<option value='${requestScope.data.get(i).get('id')}'>${requestScope.data.get(i).get('name')}</option>"/>
              </c:forEach>
            </c:if>
          </div>

          <form action="vaccine" method="post">
            <input type="hidden" name="reqType" value="regReceivedVaccine"/>
            <table class="table table-bordered table-hover">
              <thead>
              <tr>
                <th>Name of Vaccine</th>
                <th>Quantity</th>
                <th>Batch Number</th>
                <th>Arrival Date</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td><select name="vaccine" class="form-control"><c:out value="${pageScope.options}" escapeXml="false"/></select></td>
                <td><input type="number" name="quantity" class="form-control" placeholder="0"></td>
                <td><input type="text" name="batchNo" class="form-control" placeholder="Enter batch number"></td>
                <td><input type="date" name="date" class="form-control"></td>
              </tr>
              <tr>
                <td><select name="vaccine" class="form-control"><c:out value="${pageScope.options}" escapeXml="false"/></select></td>
                <td><input type="number" name="quantity" class="form-control" placeholder="0"></td>
                <td><input type="text" name="batchNo" class="form-control" placeholder="Enter batch number"></td>
                <td><input type="date" name="date" class="form-control"></td>
              </tr>
              <tr>
                <td><select name="vaccine" class="form-control"><c:out value="${pageScope.options}" escapeXml="false"/></select></td>
                <td><input type="number" name="quantity" class="form-control" placeholder="0"></td>
                <td><input type="text" name="batchNo" class="form-control" placeholder="Enter batch number"></td>
                <td><input type="date" name="date" class="form-control"></td>
              </tr>
              </tbody>
            </table>
            <div class="form-group row mb-0">
              <div class="col-md-6 offset-md-4">
                <button type="submit" class="btn btn-primary">Add</button>
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
