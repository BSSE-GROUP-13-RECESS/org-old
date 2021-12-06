<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="report"%>
<c:if test="${sessionScope.userType.equals('centreAdmin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div>
        <div class="card">
          <div class="card-header"><h2>Reports</h2></div>
          <div class="card-body">
            <report:select table="'There are '||count(*)||' people vaccinated at '||hc.name||'.' as 'vaccinated patients' from vaccinated_patient vp inner join centre_dozes c on c.id = vp.doze_id inner join health_centre hc on hc.id = c.centre_id" where="c.centre_id=${sessionScope.adminId}" displayFormat="table"/>
          </div><!-- card-body -->
        </div><!-- card -->
      </div><!-- column -->
    </div><!-- raw -->
  </div><!-- container -->
</c:if>
<%@ include file="lower.jsp" %>
