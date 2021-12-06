<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="vaccination"%>
<c:if test="${sessionScope.userType.equals('centreAdmin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div>
        <div class="card">
          <div class="card-header"><h2>Vaccinated Patients</h2></div>
          <div hidden><vaccination:select table="count(*) as count from vaccinated_patient" displayFormat="table"/></div>
          <p class="bg-success text-danger">Remaining with ${23000000-requestScope.data.get(0).get('count')} people to reach target.</p>
          <div class="card-body">
            <div hidden>
              <vaccination:select table="c.id, 'bNo:'||d.batch_number||' hosp:'||hc.name||' med:'||v.name as details from centre_dozes c inner join dozes d on d.id = c.doze_id inner join health_centre hc on hc.id = c.centre_id inner join vaccine v on v.id = d.vaccine_id" where="hc.id=${sessionScope.adminId}" displayFormat="table"/>
              <c:if test="${requestScope.data.size()>0}">
                <c:set var="options" scope="page" value=""/>
                <c:forEach var="i" begin="0" end="${requestScope.data.size()-1}" step="1">
                  <c:set var="options" scope="page" value="${pageScope.options}<option value='${requestScope.data.get(i).get('id')}'>${requestScope.data.get(i).get('details')}</option>"/>
                </c:forEach>
              </c:if>
            </div>
            <form action="vac_administration" method="post">
              <input type="hidden" name="reqType" value="regVaccinated"/>
              <table class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>NIN</th>
                  <th>Name</th>
                  <th>Vaccine</th>
                  <th>Date</th>
                </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><input type="text" name="nin" class="form-control" placeholder="NIN"></td>
                    <td><input type="text" name="name" class="form-control" placeholder="Name"></td>
                    <td><select name="vaccine"><c:out value="${pageScope.options}" escapeXml="false"/></select></td>
                    <td><input type="date" name="date" class="form-control"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="nin" class="form-control" placeholder="NIN"></td>
                    <td><input type="text" name="name" class="form-control" placeholder="Name"></td>
                    <td><select name="vaccine"><c:out value="${pageScope.options}" escapeXml="false"/></select></td>
                    <td><input type="date" name="date" class="form-control"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="nin" class="form-control" placeholder="NIN"></td>
                    <td><input type="text" name="name" class="form-control" placeholder="Name"></td>
                    <td><select name="vaccine"><c:out value="${pageScope.options}" escapeXml="false"/></select></td>
                    <td><input type="date" name="date" class="form-control"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="nin" class="form-control" placeholder="NIN"></td>
                    <td><input type="text" name="name" class="form-control" placeholder="Name"></td>
                    <td><select name="vaccine"><c:out value="${pageScope.options}" escapeXml="false"/></select></td>
                    <td><input type="date" name="date" class="form-control"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="nin" class="form-control" placeholder="NIN"></td>
                    <td><input type="text" name="name" class="form-control" placeholder="Name"></td>
                    <td><select name="vaccine"><c:out value="${pageScope.options}" escapeXml="false"/></select></td>
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
