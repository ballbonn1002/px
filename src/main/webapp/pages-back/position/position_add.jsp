<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${bean.date}" pattern="dd-MM-yyyy" />

<div class="block-header">
	<div class="row">
    	<div class="col-lg-6 col-md-8 col-sm-12">
      		<h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Add Position</h2>
            	<ul class="breadcrumb">
                	<li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item">Position</li>
                    <li class="breadcrumb-item active">Add Position</li>
                    
        		</ul>
		</div>            
	</div>
</div>

<div class="row clearfix">
	<div class="col-lg-12">
    	<div class="card">
        	<div class="body">
				<div class="portlet light bordered">
					<div class="portlet-title" style="margin-left: 2%;">
						<div class="caption">
							<h2 style="font-size: 20px;">Add Position</h2>
						</div>
				
					</div>
					<div class="portlet-body">
						<!-- BEGIN FORM-->
						<div class="body">
				
							<form action="savePosition" method="POST">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Position ID:</label> 
									<input type="text" name="positionId" maxlength="4" required class="form-control">
								</div>
									
								<div class="form-group">
									<label for="recipient-name" class="control-label">Department ID:</label> 
									<select class="bs-select form-control" name="user.departmentId">
											<c:forEach var="department" items="${departmentList}">
												<option value="${department.id}" <c:if test="true">  </c:if>>${department.id}</option>
											</c:forEach>
										</select>
								</div>
											
								<div class="form-group">
									<label for="recipient-name" class="control-label">Name:</label> <input
										type="text" name="name" required class="form-control">
								</div>
								<div class="form-group">
									<label for="recipient-name" class="control-label">Decription:</label>
									<input type="text" name="description" required class="form-control">
								</div>
								<div class="form-group">
									<label for="recipient-name" class="control-label">Prefix
										ID:</label> <input type="text" name="deptpre" required
										class="form-control">
								</div>				
								<input type="hidden" name="logonUser" value="${logonUser}">
								
								<!-- กำหนดวันที่ Time Create -->
								<div>
									<%-- <input type="hidden" name="time" id="time"
										class="form-control input-lg timepicker timepicker-24 test"
										value="${time}" data-time-format=" HH:mm" style="width: 200px;"
										onclick="timechenge()" onkeypress='return false'> --%>
								</div>
				
								<div class="form-group form-md-line-input">
				
									<div class="col-md-2">
										<input name="date" id="date"
											value="<fmt:formatDate value="${now}"  type = "both" 
				        timeStyle = "medium" pattern="dd-MM-yyyy "  />"
											onchange="datechenge()"
											class="form-control input-lg form-control-inline input-medium date-picker test"
											size="9" type="hidden" onkeypress='return false'>
									</div>
									<!-- End Time Create -->
				
								</div>
								<div style="text-align:right;">
									<a type="reset" class="btn btn-outline-secondary" href="position_list"></i>Cancel</a>
									<button type="submit" class="btn btn-success">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- END FORM-->
			</div>
    	</div>
	</div>
</div>

<script>
function datechenge() {
	var fulldate = "${fulldate}".trim();
	var Userdate = $("#mydate").val();
	if(fulldate != Userdate){
		$("#detail").show();
		$("#labeldetail").show();
	}else{
		$("#detail").hide();
		$("#labeldetail").hide();
	}		
}

$(document).ready(function() {

	var value = "${flag}";
	if (value == 1) {

		swal('Please!', 'Check Position ID Duplicate', 'warning');
	}
});

</script>
<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
