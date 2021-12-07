<%@ page import="java.util.ArrayList" %>
<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="inventory"%>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div>
        <div class="card">
          <div class="card-header"><h2>Vaccine Inventory</h2></div>
          <div class="card-body">
            <div hidden>
              <c:if test="${sessionScope.reqType.equals('distribute')}">
                <inventory:select table="health_centre" displayFormat="table"/>
                <c:set var="hospitals" scope="page" value="${requestScope.data}"/>
                <inventory:select table="count(*) as count from vaccinated_patient" displayFormat="table"/>
                <c:set var="vaccPatients" scope="page" value="${requestScope.data}"/>
                <c:choose>
                  <c:when test="${pageScope.vaccPatients.get(0).get('count')==0}">
                    <inventory:select table="count(id) as number,centre_id from visited_patients" where=" date like '${LocalDate.now().minusMonths(1).toString().substring(0,7)}%' group by centre_id" displayFormat="table"/>
                    <c:set var="visitPatients" scope="page" value="${requestScope.data}"/>
                    <inventory:select table="count(id) as sum from visited_patients" displayFormat="table" where=" date like '${LocalDate.now().minusMonths(1).toString().substring(0,7)}%'"/>
                    <c:set var="totalPatients" scope="page" value="${requestScope.data.get(0).get('sum')}"/>

                    <c:set var="doze_query" scope="page" value="(doze_id,centre_id,quantity) values "/>
                    <c:set var="email_query" scope="page" value="(email, message, subject, date_time, sender, sender_email) values "/>
                    <inventory:select table="d.id, d.vaccine_id, d.quantity, d.batch_number, v.name from dozes d inner join vaccine v on v.id = d.vaccine_id" displayFormat="table" where="distributed=0"/>
                    <c:set var="dozes" scope="page" value="${requestScope.data}"/>
                    <c:if test="${pageScope.dozes.size()>0}">
                      <c:forEach var="i" begin="0" end="${pageScope.dozes.size()-1}">
                        <c:forEach var="x" begin="0" end="${pageScope.visitPatients.size()-1}">
                          <c:set var="num" scope="page" value="${Math.round(pageScope.visitPatients.get(x).get('number')*pageScope.dozes.get(i).get('quantity')/pageScope.totalPatients)}"/>
                          <c:set var="doze_query" scope="page" value="${pageScope.doze_query} ('${pageScope.dozes.get(i).get('id')}','${pageScope.visitPatients.get(x).get('centre_id')}','${pageScope.num}'),"/>
                          <c:set var="email_query" scope="page" value="${pageScope.email_query} ('${sessionScope.adminEmails[pageScope.visitPatients.get(x).get('centre_id')-1]}','Dear ${sessionScope.adminNames[pageScope.visitPatients.get(x).get('centre_id')-1]}, I request you to come and pick the new batch of ${pageScope.dozes.get(i).get('name')}, batch number ${pageScope.dozes.get(i).get('batch_number')}.','Pick vaccine from headquarters.','${LocalDateTime.now().format(DateTimeFormatter.ofPattern('dd-MM-yyyy HH:mm'))}','${sessionScope.username}','${sessionScope.email}'),"/>
                          <inventory:insert table="vaccine_inventory" values="(center_id, vaccine_id, number) values ('${pageScope.visitPatients.get(x).get('centre_id')}','${pageScope.dozes.get(i).get('vaccine_id')}','${pageScope.num}') on conflict (center_id,vaccine_id) do update set number=number+${pageScope.num}"/>
                        </c:forEach>
                      </c:forEach>

                      <inventory:insert table="centre_dozes" values="${pageScope.doze_query.substring(0,pageScope.doze_query.length()-1)};"/>
                      <inventory:insert table="email" values="${pageScope.email_query.substring(0,pageScope.email_query.length()-1)};"/>
                      <inventory:update table="dozes" where="distributed=0" newValue="distributed=1"/>
                    </c:if>
                  </c:when>
                  <c:when test="${pageScope.vaccPatients.get(0).get('count')>0}">
                    <inventory:select table="count(vp.id) as count,hc.id from vaccinated_patient vp inner join centre_dozes c on c.id = vp.doze_id inner join health_centre hc on hc.id = c.centre_id group by hc.id" displayFormat="table"/>
                    <c:set var="vaccPats" scope="page" value="${requestScope.data}"/>http://localhost:8080/org/distribution.jsp

                    <c:set var="doze_query" scope="page" value="(doze_id,centre_id,quantity) values "/>
                    <c:if test="${pageScope.dozes.size()>0}">
                      <c:forEach var="i" begin="0" end="${pageScope.dozes.size()-1}">
                        <c:forEach var="x" begin="0" end="${pageScope.vaccPats.size()-1}">
                          <c:set var="doze_query" scope="page" value="${pageScope.doze_query} ('${pageScope.dozes.get(i).get('id')}','${pageScope.vaccPats.get(x).get('id')}','${Math.round(pageScope.vaccPats.get(x).get('count')*pageScope.dozes.get(i).get('quantity')/pageScope.vaccPatients.get(0).get('count'))}'),"/>
                        </c:forEach>
                      </c:forEach>
                      <inventory:insert table="centre_dozes" values="${pageScope.doze_query.substring(0,pageScope.doze_query.length()-1)};"/>
                      <inventory:update table="dozes" where="distributed=0" newValue="distributed=1"/>
                    </c:if>
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
                <c:set var="reqType" scope="session" value=""/>
              </c:if>
            </div>
            <p class="bg-success text-danger">
              <c:if test="${requestScope.insertResp>0}">
                Saved ${requestScope.insertResp} records.
              </c:if>
            </p>
            <inventory:select table="hc.name as 'center name', v2.name as 'vaccine name', v.number as doses from vaccine_inventory v inner join health_centre hc on hc.id = v.center_id inner join vaccine v2 on v2.id = v.vaccine_id" displayFormat="table"/>
          </div><!-- card-body -->
        </div><!-- card -->
      </div><!-- column -->
    </div><!-- raw -->
  </div><!-- container -->
</c:if>
<%@ include file="lower.jsp" %>
