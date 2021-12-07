<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="vaccine"%>
<c:if test="${sessionScope.userType.equals('admin')}">
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card mt-5">
        <div class="card-header"><h2>Available Doses</h2></div>
        <div class="card-body">
          <c:if test="${sessionScope.dozes.length()>0}">
            <vaccine:insert table="dozes" values="${sessionScope.dozes}"/>
            <c:set var="dozes" scope="session" value=""/>
            <c:if test="${requestScope.insertResp>0}">
              Saved ${requestScope.insertResp} records.
            </c:if>
          </c:if>
          <vaccine:select table="v.name, d.quantity, d.batch_number, d.arrival_date from dozes d inner join vaccine v on v.id = d.vaccine_id" displayFormat="table" where="distributed=0"/>
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
            <input type="hidden" name="reqType" value="distribute"/>
            <button type="submit" class="btn btn-primary">Distribute doses</button>
          </form>
        </div><!-- card-body -->
      </div><!-- card -->
    </div><!-- column -->
  </div><!-- raw -->
</div><!-- container -->
</c:if>
<%@ include file="lower.jsp" %>
