<%-- 
    Document   : booking
    Created on : Dec 3, 2021, 10:10:36 AM
    Author     : hp
--%>
<%@ include file="upper.jsp" %>
    <!-- Content Header (Page header) -->
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
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>Health Center</th>
                      <th>Patients Queued</th>
                      <th>Available Doses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td> 
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td> 
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td> 
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td> 
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td> 
                    </tr>
                  </tbody>
                </table>
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
                  <h3>Place Booking</h3>
              </div><!-- /.card-header -->
              <div class="card-body">
                <form action="health" method="post">  
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
                              <select class="form-control">
                                <option>option 1</option>
                                <option>option 2</option>
                                <option>option 3</option>
                                <option>option 4</option>
                                <option>option 5</option>
                              </select>
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
<%@ include file="lower.jsp" %>
