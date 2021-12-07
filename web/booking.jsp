<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="booking"%>
  <c:if test="${sessionScope.userType.equals('patient')}">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Booking</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                  <h3>Health Center Data</h3>
              </div><!-- /.card-header -->
              <div class="card-body">
                <h4>Queues</h4>
                <booking:select table="hc.name as centre, count(b.id) as queues from booking b inner join health_centre hc on hc.id = b.centre_id group by hc.name" displayFormat="table"/>

                <h4>Available Doses</h4>
                <booking:select table="hc.name as centre, v.name as vaccine, vi.number as quantity from vaccine_inventory vi inner join health_centre hc on hc.id = vi.center_id inner join vaccine v on v.id = vi.vaccine_id order by hc.name" displayFormat="table"/>
              </div><!-- /.card-body -->
            </div><!-- /.card -->
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </section><!-- /.content -->
    
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                  <h3>View & Place Booking</h3>
              </div><!-- /.card-header -->
              <div class="card-body">
                <booking:select table="hc.name as centre, b.date, b.time from booking b inner join health_centre hc on hc.id = b.centre_id" displayFormat="table" where="patient_id=${sessionScope.patientId}"/>
                <div hidden>
                  <c:if test="${sessionScope.bookQuery.length()>0}">
                    <booking:insert table="booking" values="${sessionScope.bookQuery}"/>
                    <c:set scope="page" var="bookInt" value="${requestScope.insertResp}"/>
                    <c:set scope="session" var="bookQuery" value=""/>
                  </c:if>
                  <booking:select table="health_centre" displayFormat="table"/>
                  <c:if test="${requestScope.data.size()>0}">
                    <c:set var="options" scope="page" value=""/>
                    <c:forEach var="i" begin="0" end="${requestScope.data.size()-1}" step="1">
                      <c:set var="options" scope="page" value="${pageScope.options}<option value='${requestScope.data.get(i).get('id')}'>${requestScope.data.get(i).get('name')}</option>"/>
                    </c:forEach>
                  </c:if>
                </div>
                <p class="bg-success text-danger"><c:if test="${pageScope.bookInt>0}"><c:out value="Booking successfully made."/></c:if></p>
                <form action="booking" method="post">
                  <input type="hidden" name="reqType" value="book">
                  <table class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th>Health Center</th>
                        <th>Date</th>
                        <th>Time</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <select class="form-control" name="centre"><c:out value="${pageScope.options}" escapeXml="false"/></select>
                        </td>
                        <td>
                            <input type="date" name="date" required><!-- datepicker -->
                        </td>
                        <td>
                            <input type="time" name="time" required><!-- timepicker -->
                        </td>
                      </tr>
                    </tbody>
                  </table>
                <div class="form-group row mb-0">
                  <div class="col-md-6 offset-md-4">
                      <button type="submit" class="btn btn-primary">Book</button>
                  </div>
                </div>
              </form>  
              </div><!-- /.card-body -->
            </div><!-- /.card -->
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </section><!-- /.content -->
  </c:if>
<%@ include file="lower.jsp" %>
