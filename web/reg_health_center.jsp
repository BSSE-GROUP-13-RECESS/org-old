<%@ include file="upper.jsp" %>
<%@ taglib prefix="reg" uri="https://org.com" %>
    <div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card mt-5">
                <div class="card-header"><h2>Register Health Center</h2></div>

                <div class="card-body">

                    <form action="health" method="post">
                        <div class="form-group row">
                          <p class="bg-success text-danger">
                            <c:if test="${sessionScope.data.length()>0}">
                              <reg:insert table="health_centre" values="${sessionScope.data}"/>
                              <c:set var="data" scope="session" value=""/>
                              <c:if test="${requestScope.insertResp>0}">
                                Saved ${requestScope.insertResp} records.
                              </c:if>
                            </c:if>
                          </p>
                        </div>
                          <div class="form-group row">
                            <label class="col-md-4 col-form-label text-md-right">Health Center 1</label>
                            <div>
                                <input type="text" name="name" placeholder="name" value="" class="form-control form-control-custom" />
                                <input type="text" name="center_id" placeholder="center_id" value="" class="form-control form-control-custom" />
                            </div>
                          </div>
                            
                          <div class="form-group row"> 
                            <label class="col-md-4 col-form-label text-md-right">Health Center 2</label>
                               <div>
                                <input type="text" name="name" placeholder="name" value="" class="form-control form-control-custom" />
                                <input type="text" name="center_id" placeholder="center_id" value="" class="form-control form-control-custom" />
                               </div>
                          </div>
                        
                          <div class="form-group row"> 
                            <label class="col-md-4 col-form-label text-md-right">Health Center 3</label>
                            <div>
                                <input type="text" name="name" placeholder="name" value="" class="form-control form-control-custom" />
                                <input type="text" name="center_id" placeholder="center_id" value="" class="form-control form-control-custom" />
                            </div>
                          </div>  
                                
                          <div class="form-group row"> 
                            <label class="col-md-4 col-form-label text-md-right">Health Center 4</label>
                            <div>
                                <input type="text" name="name" placeholder="name" value="" class="form-control form-control-custom" />
                                <input type="text" name="center_id" placeholder="center_id" value="" class="form-control form-control-custom" />
                            </div>
                          </div>
                        
                          <div class="form-group row"> 
                            <label class="col-md-4 col-form-label text-md-right">Health Center 5</label>
                            <div>
                                <input type="text" name="name" placeholder="name" value="" class="form-control form-control-custom" />
                                <input type="text" name="center_id" placeholder="center_id" value="" class="form-control form-control-custom" />
                            </div>
                          </div>
                        
                          <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                          </div>    
                    </form>
                   </div>
                </div>
            </div>
        </div>
    </div>
 <%@ include file="lower.jsp" %>
