<%-- 
    Document   : register_vaccines
    Created on : Dec 3, 2021, 5:23:30 PM
    Author     : hp
--%>

<%@ include file="upper.jsp" %>
  <div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card mt-5">
                <div class="card-header"><h2>Register Vaccine</h2></div>

                  <div class="card-body">

                    <form action="health" method="post">
                        <table class="table table-bordered table-hover">
                            <thead>
                              <tr>
                                <th>Name of Vaccine</th>
                                <th>Number of Shots</th>
                                <th>Days Between Shots</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                  <td><input type="text" name="name" class="form-control" placeholder="Enter name of vaccine"></td>
                                  <td><input type="number" name="shots" class="form-control" placeholder="0"></td>
                                  <td><input type="number" name="days" class="form-control" placeholder="0"></td> 
                              </tr>
                              <tr>
                                <td><input type="text" name="name" class="form-control" placeholder="Enter name of vaccine"></td>
                                <td><input type="number" name="shots" class="form-control" placeholder="0"></td>
                                <td><input type="number" name="days" class="form-control" placeholder="0"></td> 
                              </tr>
                              <tr>
                                <td><input type="text" name="name" class="form-control" placeholder="Enter name of vaccine"></td>
                                <td><input type="number" name="shots" class="form-control" placeholder="0"></td>
                                <td><input type="number" name="days" class="form-control" placeholder="0"></td> 
                              </tr>
                            </tbody>
                        </table>
                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">Register</button>
                            </div>
                        </div>
                    </form>
                  </div><!-- card-body --> 
            </div><!-- card -->
        </div><!-- column -->
    </div><!-- raw -->
  </div><!-- container -->
<%@ include file="lower.jsp" %>
