<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="index3.html" class="brand-link">
    <img src="public/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
         style="opacity: .8">
    <span class="brand-text font-weight-light">AdminLTE 3</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        <img src="public/dist/img/user.svg" class="img-circle elevation-2" alt="User Image">
      </div>
      <div class="info">
        <span class="d-block" style="color: white">${sessionScope.username}</span>
        <span class="d-block" style="color: white">${sessionScope.email}</span>
        <form method="POST" action="administration" class="d-block">
          <input type="hidden" name="auth" value="logout"/>
          <a href="administration" onclick="event.preventDefault(); this.closest('form').submit();">
            <i class="fa fa-sign-out"></i>Log out
          </a>
        </form>
      </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <c:if test="${sessionScope.userType.equals('admin')}">
          <li class="nav-item">
            <a href="./home.jsp" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Dashboard</p>
            </a>
          </li>

          <li class="nav-item">
            <a href="./reg_health_center.jsp" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>Health Center Registration</p>
            </a>
          </li>

          <li class="nav-item">
            <a href="./register_vaccines.jsp" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>Register Vaccines</p>
            </a>
          </li>

          <li class="nav-item">
            <a href="./vaccines_received.jsp" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>Received Doses</p>
            </a>
          </li>
        </c:if>
        <c:if test="${sessionScope.userType.equals('patient')}">
          <li class="nav-item">
            <a href="./booking.jsp" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>Booking</p>
            </a>
          </li>
        </c:if>

        <li class="nav-item">
          <a href="./email.jsp" class="nav-link">
            <i class="nav-icon fas fa-edit"></i>
            <p>Email</p>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>
<!-- /.Main Sidebar Container -->