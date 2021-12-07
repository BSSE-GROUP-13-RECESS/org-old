<%@ include file="upper.jsp" %>
<c:if test="${sessionScope.userType.equals('patient')}">
  <% response.sendRedirect(request.getContextPath() + "/booking.jsp");%>
</c:if>
<c:if test="${sessionScope.userType.equals('centreAdmin')}">
  <c:if test="${sessionScope.checkBooking.length()>0}">
<%--    <div hidden><auth:select table="b.id, b.date, b.time, hc.name as centre, p.name as patient, p.email from booking b inner join health_centre hc on hc.id = b.centre_id inner join patient p on p.id = b.patient_id" displayFormat="table" where="reminded=0 and centre_id=1 and date='${LocalDate.now().plusDays(1)}'"/></div>--%>
<%--    <c:set var="email_query" scope="page" value="(ready, email, message, subject, date_time, sender, sender_email) values "/>--%>
<%--    <c:set var="ids" scope="page" value="("/>--%>

<%--    <c:forEach var="i" begin="0" end="${requestScope.data.size()-1}">--%>
<%--      <c:out value="${requestScope.data.size()}"/>--%>
<%--      <c:set var="ids" scope="page" value="${pageScope.ids}${requestScope.data.get(i).get('id')},"/>--%>
<%--      <c:set var="email_query" scope="page" value="${pageScope.email_query} (1,'${requestScope.data.get(i).get('email')}','Dear ${requestScope.data.get(i).get('patient')}, I am sending this message to remind you that you have an appointment scheduled on ${requestScope.data.get(i).get('date')} at ${requestScope.data.get(i).get('time')}.','Reminder for appointment at ${requestScope.data.get(i).get('centre')}.','${LocalDateTime.now().format(DateTimeFormatter.ofPattern('dd-MM-yyyy HH:mm'))}','${sessionScope.username}','${sessionScope.email}'),"/>--%>
<%--    </c:forEach>--%>

<%--    <auth:insert table="email" values="${pageScope.email_query.substring(0,pageScope.email_query.length()-1)};"/>--%>
<%--    <auth:update table="booking" where="id in ${pageScope.ids.substring(0,pageScope.ids.length()-1)})" newValue="reminded=1"/>--%>
<%--    <c:set var="checkBooking" scope="session" value=""/>--%>
  </c:if>
  <% response.sendRedirect(request.getContextPath() + "/vaccinated_patients.jsp");%>
</c:if>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div hidden><auth:update table="email" where="ready=0" newValue="ready=1"/></div>
  <% response.sendRedirect(request.getContextPath() + "/vaccines_received.jsp");%>
</c:if>
<%@ include file="lower.jsp" %>