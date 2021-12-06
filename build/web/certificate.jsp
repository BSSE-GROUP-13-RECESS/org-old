<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="certificate"%>
<c:if test="${sessionScope.userType.equals('centreAdmin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div>
        <div class="card">
          <div class="card-header"><h2>Certificates</h2></div>
          <div class="card-body">
            <div hidden>
              <c:if test="${sessionScope.vacPatient.length()>0}">
                <certificate:insert table="vaccinated_patient" values="${sessionScope.vacPatient}"/>
                <c:set scope="page" var="vacPatInt" value="${requestScope.insertResp}"/>
                <c:set scope="session" var="vacPatient" value=""/>
              </c:if>
              <certificate:select table="c.id, d.batch_number, hc.name, v.name as vaccine, v.next_doze_time from centre_dozes c inner join dozes d on d.id = c.doze_id inner join health_centre hc on hc.id = c.centre_id inner join vaccine v on v.id = d.vaccine_id" where=" c.id in ${sessionScope.vacWhere}" displayFormat="table"/>
            </div>
            <p class="bg-success text-danger"><c:if test="${pageScope.vacPatInt>0}"><c:out value="Patients registered successfully."/></c:if></p>
            <c:if test="${requestScope.data.size()>0}">
              <c:set var="options" scope="page" value=""/>
              <c:forEach var="i" begin="0" end="${requestScope.data.size()-1}" step="1">
                <c:set var="options" scope="page" value="${pageScope.options}<option value='${requestScope.data.get(i).get('id')}'>${requestScope.data.get(i).get('details')}</option>"/>
              </c:forEach>
            </c:if>

            <c:if test="${sessionScope.len>0}">
              <c:set var="printAreas" scope="page" value=""/>
              <c:forEach var="x" begin="0" end="${sessionScope.len-1}" step="1">
                <div id='printableArea${x+1}'>
                  <table class='table table-bordered table-hover'>
                    <thead>
                    <tr>
                      <td>NIN</td>
                      <td>Name</td>
                      <td>Health Centre</td>
                      <td>date</td>
                      <td>batchNo</td>
                      <td>Vaccine</td>
                      <td>Next shot date</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td>${sessionScope.nin[x]}</td>
                      <td>${sessionScope.name[x]}</td>
                      <td>
                        <c:if test="${requestScope.data.size()>0}">
                          <c:forEach var="i" begin="0" end="${requestScope.data.size()-1}" step="1">
                            <c:if test="${requestScope.data.get(i).get('id').equals(sessionScope.vaccine[x])}">
                              <c:out value="${requestScope.data.get(i).get('name')}"/>
                            </c:if>
                          </c:forEach>
                        </c:if>
                      </td>
                      <td>${sessionScope.date[x]}</td>
                      <td>
                        <c:if test="${requestScope.data.size()>0}">
                          <c:forEach var="i" begin="0" end="${requestScope.data.size()-1}" step="1">
                            <c:if test="${requestScope.data.get(i).get('id').equals(sessionScope.vaccine[x])}">
                              <c:out value="${requestScope.data.get(i).get('batch_number')}"/>
                            </c:if>
                          </c:forEach>
                        </c:if>
                      </td>
                      <td>
                        <c:if test="${requestScope.data.size()>0}">
                          <c:forEach var="i" begin="0" end="${requestScope.data.size()-1}" step="1">
                            <c:if test="${requestScope.data.get(i).get('id').equals(sessionScope.vaccine[x])}">
                              <c:out value="${requestScope.data.get(i).get('vaccine')}"/>
                            </c:if>
                          </c:forEach>
                        </c:if>
                      </td>
                      <td>
                        <c:if test="${requestScope.data.size()>0}">
                          <c:forEach var="i" begin="0" end="${requestScope.data.size()-1}" step="1">
                            <c:if test="${requestScope.data.get(i).get('id').equals(sessionScope.vaccine[x])}">
                              <c:out value="${LocalDate.of(sessionScope.date[x].substring(0,4),sessionScope.date[x].substring(5,7),sessionScope.date[x].substring(8)).plusDays(requestScope.data.get(i).get('next_doze_time'))}"/>
                            </c:if>
                          </c:forEach>
                        </c:if>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </div>
                <input type='button' class="btn btn-secondary" onclick="printDiv('printableArea${x+1}')" value='print certificate ${x+1}'/><br/><br/>
              </c:forEach>
            </c:if>
          </div><!-- card-body -->
        </div><!-- card -->
        <script>
            function printDiv(divName) {
                let printContents = document.getElementById(divName).innerHTML;
                let originalContents = document.body.innerHTML;
                document.body.innerHTML = printContents;
                window.print();
                document.body.innerHTML = originalContents;
            }
        </script>
      </div><!-- column -->
    </div><!-- raw -->
  </div><!-- container -->
</c:if>
<%@ include file="lower.jsp" %>
