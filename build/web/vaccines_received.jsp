<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="vaccine"%>
<c:if test="${sessionScope.userType.equals('admin')}">
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card mt-5">
        <div class="card-header"><h2>Doses</h2></div>
        <div class="card-body">
          <c:if test="${sessionScope.dozes.length()>0}">
            <vaccine:insert table="dozes" values="${sessionScope.dozes}"/>
            <c:set var="dozes" scope="session" value=""/>
            <c:if test="${requestScope.insertResp>0}">
              Saved ${requestScope.insertResp} records.
            </c:if>
          </c:if>
          <vaccine:select table="dozes" displayFormat="table" where="distributed=0"/>
          <c:set scope="page" var="dozes" value="${requestScope.data}"/>
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
              <div class="col-md-6">
                <button type="submit" class="btn btn-primary">Add</button>
              </div>
            </div>
          </form>
          <div hidden>
            <c:if test="${sessionScope.reqType.equals('distribute')}">
              <vaccine:select table="health_centre" displayFormat="table"/>
              <c:set var="hospitals" scope="page" value="${requestScope.data}"/>
              <vaccine:select table="count(*) as count from vaccinated_patient" displayFormat="table"/>
              <c:set var="vaccPatients" scope="page" value="${requestScope.data}"/>
              <c:choose>
                <c:when test="${pageScope.vaccPatients.get(0).get('count')==0}">
                  <vaccine:select table="id, centre_id, sum(number) as number from visited_patients " where=" date like '${LocalDate.now().minusMonths(1).toString().substring(0,7)}%' group by centre_id" displayFormat="table"/>
                  <c:set var="visitPatients" scope="page" value="${requestScope.data}"/>
                  <vaccine:select table="sum(number) as sum from visited_patients" displayFormat="table" where=" date like '${LocalDate.now().minusMonths(1).toString().substring(0,7)}%'"/>
                  <c:set var="totalPatients" scope="page" value="${requestScope.data.get(0).get('sum')}"/>
                  <c:set var="doze_query" scope="page" value="(doze_id,centre_id,quantity) values "/>
                  <c:if test="${pageScope.dozes.size()>0}">
                    <c:forEach var="i" begin="0" end="${pageScope.dozes.size()-1}">
                      <c:forEach var="x" begin="0" end="${pageScope.visitPatients.size()-1}">
                        <c:set var="doze_query" scope="page" value="${pageScope.doze_query} ('${pageScope.dozes.get(i).get('id')}','${pageScope.visitPatients.get(x).get('centre_id')}','${Math.round(pageScope.visitPatients.get(x).get('number')*pageScope.dozes.get(i).get('quantity')/pageScope.totalPatients)}'),"/>
                      </c:forEach>
                    </c:forEach>
                    <vaccine:insert table="centre_dozes" values="${pageScope.doze_query.substring(0,pageScope.doze_query.length()-1)};"/>
                    <vaccine:update table="dozes" where="distributed=0" newValue="distributed=1"/>
                  </c:if>
                </c:when>
                <c:when test="">

                </c:when>
              </c:choose>
<%--              <c:if test="${requestScope.data.size()>0}">--%>
<%--                <c:if test="${requestScope.data.get(0).get('count')==0}">--%>
<%--                  <c:set var="query" value="" scope="page"/>--%>
<%--                  <c:out value="${pageScope.dozes}"/>--%>
<%--                  <c:forEach var="i" begin="0" end="${pageScope.dozes.size()-1}" step="1">--%>
<%--                    <c:set var="query" scope="page" value=""/>--%>
<%--                  </c:forEach>--%>
<%--                </c:if>--%>
<%--              </c:if>--%>
            </c:if>
          </div><br/>
          <form action="vaccine" method="post">
            <input type="hidden" name="reqType" value="distribute"/>
            <button type="submit" class="btn btn-primary">Distribute vaccines</button>
          </form>
        </div><!-- card-body -->
      </div><!-- card -->
    </div><!-- column -->
  </div><!-- raw -->
</div><!-- container -->
</c:if>
<%@ include file="lower.jsp" %>
