<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js">
</script>
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"  src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript"  src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />

 <fmt:formatDate pattern = "yyyy"  value = "${now}" var="year_now" />

<style>

tr{    
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 2s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  
  to {
    opacity: 1;
  }
}

</style>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-edit font-red"></i> <span
				class="caption-subject font-red sbold uppercase">&nbsp;
				Duplicate WorkHour List</span>
		</div>
		
		<div class="actions right ">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>

	</div>
		<form action="searchDuplicate" method="post" name="form">
				<div class="portlet-body">
			<div class="form-group form-lg-line-input">
			<div>
				<label class="col-md-1 control-label">Name :</label>
					<div class="col-sm-6">
						<select class="form-control select2me" name="user.roletId" id="user.roletId">
							<optgroup label="Enable">
								<c:forEach var="user" items="${cubeUser}">

									<c:if test="${user.enable == 1 }">
										<c:if test="${logonUser == nulll }">
											<option value="${user.id}" id="${user.id}"
												<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
										</c:if>
										<c:if test="${logonUser != nulll }">
											<option value="${user.id}" id="${user.id}"
												<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
										</c:if>
									</c:if>
								</c:forEach>
							</optgroup>
							<optgroup label="Disable">
								<c:forEach var="user" items="${cubeUser}">
									<c:if test="${user.enable == 0 }">
										<c:if test="${logonUser == nulll }">
											<option value="${user.id}" id="${user.id}"
												<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
										</c:if>
										<c:if test="${logonUser != nulll }">
											<option value="${user.id}" id="${user.id}"
												<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
										</c:if>
									</c:if>
								</c:forEach>
							</optgroup>
						</select>
				</div>
				
				
				<label class="col-md-1 control-label">Year :</label>
				<div class="col-sm-2">
					<select
					class="form-control select2me" name="yearSearch" id=yearSearch required="required">
					<c:choose>
						<c:when test="${yearSearch != null}">
							<c:forEach begin="0" end="4" var="i">
								<option value="${year_now - i}" id="${year_now - i}"
									<c:if test="${yearSearch == (year_now - i)}"><c:out value="selected=selected"/></c:if>>${year_now - i}</option>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach begin="0" end="4" var="i">
								<option value="${year_now - i}" id="${year_now - i}">${year_now - i}</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</select>
				</div>	
				
					<div class="col-md-2 text-center">
					<button type="submit" class="btn btn-sm blue-steel" id="searchbutton"
						onclick="search()">
						<i class="fa fa-search"></i>&nbsp;Search
					</button>
						</div>
				</div>
				</div>
				</div>
				<br><br><br>
				<div class="portlet-body" style="text-align: center;">
				<table class="table table-striped table-condensed table-hover" id="table_id">
				<thead>
					<tr  class="" style="background-color:rgb(59, 63, 81);color:white;height:41">

						<th height="35" class="text-center" width="250px" style="padding-left: 2%">Duplcate Date</th>
						<th class="text-center" width="400px"
							style="background-color: #3B3F51; color: white; padding-left: 2%;">User</th>
						<!-- <th class="text-center " width="200px"
							style="background-color: #3B3F51; color: white;">Function</th> -->
						<th class="text-center" width="350px"
							style="background-color: #3B3F51; color: white; padding-left: 2%;">Work Hours Type</th>
						<th class="text-center" width="350px"
							style="background-color: #3B3F51; color: white; padding-left: 2%;">Time</th>
						<th class="text-center" width="350px"
							style="background-color: #3B3F51; color: white; padding-left: 2%;">Description</th>
						<th class="text-center" width="100px"
							style="background-color: #3B3F51; color: white; padding-left: 2%;">Edit</th>
					</tr>

				</thead>
				<tbody>
				<c:forEach var="list" items="${sendduplicatelist}">
				<fmt:parseDate var="Weekend" value="${list.workday}" pattern="dd/MM/yyyy"/>
				<fmt:formatDate var="Weekendd" value="${Weekend}" pattern="E"/>
						<tr class="text-center">
							<td class="text-center">
									<div class="blue-hoki default text-center">
											<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
										<c:out value="${list.workday }"></c:out>
									</div>
							</td>
							<td class="text-center">
									<div class="blue-hoki default text-center">
										<c:out value="${list.user_create }"></c:out>
									</div>
							</td>
							<td class="text-center">
									<div class="blue-hoki default text-center">
										<c:choose>
											<c:when test="${list.work_hours_type == 1}">												
													<div  class="btn btn-sm blue-steel btn-outline" >															
																<i class="fa fa-sign-in"></i> 														
															check-in													
													</div>
											</c:when>
											<c:otherwise>
													<div  class="btn btn-sm red btn-outline" >
														<i class="fa fa-sign-out"></i> 															
														check-out
													</div>											
											</c:otherwise>
										</c:choose>																													
									</div>
							</td>
							<td class="text-center">
									<div class="blue-hoki default text-center">
										<div  class="btn-sm btn-primary" >
														<i class="fa fa-clock-o"></i> 															
														<c:out value="${list.work_hours_time_work.toString().substring(10,16)}"></c:out>
										</div>	
										
										
									</div>
							</td>
							<td class="text-center">
									<div class="blue-hoki default text-center">
										<c:out value="${list.description }"></c:out>
									</div>
							</td>
							<td class="text-center">
								<c:choose>
									<c:when test="${list.del_stat == true}">
											
											<button type="button" class="btn circle red-intense btn-outline float-left" id=""	
												onclick="delduplicate(${list.id})">
												<i class="fa fa-trash"></i>
											</button>
									</c:when>
									<c:when test="${list.del_stat == false}">
												<i style="color: #26C281;" class="fa fa-check"></i>
									</c:when>
								</c:choose>
								
							</td>
						
						</tr>
				
				</c:forEach>
					

					

				</tbody>
			</table>
			
				</div>
		</form>
</div>
<script>
	$(document).ready(function() {
		$('#table_id').DataTable({
			"aLengthMenu" : [ [ 25, 50, 75, -1 ], [ 25, 50, 75, "All" ] ],
			"iDisplayLength" : 20,
			"ordering": false
		});
	});
</script>
<script>
function delduplicate(id) {	
	swal({
	      title: "Are you sure!",
	      text: "You will be deleting this id!",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-danger',
	      confirmButtonText: 'OK'
	    }, function (inputValue) {
	        if (inputValue == false){
	        	//console.log("canceled");
	        	return false;
	        	}
	        if (inputValue == true) {	        
	        	 $.ajax({
	 				    url : "Duplicate_Workhour_del.action",
	 					data : "id="+ id,
	 					type : "POST",
	 					success : function(response) {
		 						window.location.reload(true);
		 				}
	 			 });
	        	
	        }
	      });
}

</script>
	<script
		src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/global/plugins/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>