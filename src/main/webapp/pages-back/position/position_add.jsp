<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${bean.date}" pattern="dd-MM-yyyy" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" type="text/css" />

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
							<form id="form_send" action="javascript:sendData()" method="POST" class="needs-validation">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Position ID<span style="color:red;"> *</span></label>
										<div id="canuse" style="color: #28A745; text-color:#28A745; display:none; width:100%;">
											<i class="icon-check"></i>&nbsp;&nbsp;You can use this id
										</div>
										<div id="cannotuse" style="color: #FAAD14; text-color:#FAAD14; display:none;">
											<i class="icon-check"></i>&nbsp;&nbsp;You can not use this id
										</div>
										<div id="nofill" style="color: #FAAD14; text-color:#FAAD14; display:none;">
											<i class="icon-check"></i>&nbsp;&nbsp;Please, Enter userID
										</div>
									<input type="text" id="position_id" name="positionId" maxlength="4" pattern="[A-Za-z0-9.]{1,}" required class="form-control">
									
										<div class="valid-feedback"></div>
      									<div class="invalid-feedback">กรอกได้ 4 ตัว เฉพาะ ภาษาอังกฤษ ตัวเลข และ จุด(.) เท่านั้น และข้อมูลห้ามซ้ำ</div>
										
								</div>
									
								<div class="form-group">
									<label for="recipient-name" class="control-label">Department<span style="color:red;"> *</span></label> 
									<select id="depart_id" class="form-control" name="user.departmentId" required>
										<option disabled selected hidden selected = "selected"> </option>
											<c:forEach var="department" items="${departmentList}">
												<option value="${department.department_id}" <c:if test="true">  </c:if>>${department.department_id}</option>
											</c:forEach>
										</select>
								</div>
											
								<div class="form-group">
									<label for="recipient-name" class="control-label">Name<span style="color:red;"> *</span></label> <input
										type="text" name="name" id="name_position" required class="form-control">
								</div>
								<div class="form-group">
									<label for="recipient-name" class="control-label">Decription:</label>
									<input type="text" name="description" class="form-control">
								</div>
								<div class="form-group">
									<label for="recipient-name" class="control-label">Prefix
										ID:</label> <input type="text" name="prefix" 
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
									<a type="reset" class="btn btn-outline-secondary" href="position_list">Cancel</a>
									<button id="submit_position" type="submit" class="btn btn-success" >Save</button>
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
</script>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

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

function sendData(){
	var form_data = $("#form_send").serializeArray();
	$.ajax({
		url : "savePosition",
		method : "POST",
		type: "JSON" ,
		data : form_data,
		
		success : function() {
			document.location = "position_list";
			/*var value = "${flag}";
			console.log(value);
			if (value == 1) {
				console.log(value);
				swal('Please!', 'Check Position ID Duplicate', 'warning');
			}*/
			
		}
	})
}

function checkPattern(data){
	let text = data;
	let pattern = /^[a-zA-Z\s\d.]+$/;
	
	console.log(pattern.test(text));
	if(pattern.test(text) == true){
		return true;
	}
	else{
		return false;
	}
}

$(document).ready(function() {
	$('#position_id').on('keyup', function() {
		var id = $('#position_id').val();
		
		if(id != ""){
			$.ajax({
				url: "CheckPositionID",
				method: "POST" ,
				type: "JSON" ,
				data: {
					"position_id" : id
				},
				success:function(data){
					$("#position_id").removeClass("is-invalid");
					$("#position_id").removeClass("is-valid");
					//console.log(data.toString().indexOf("1"));
					
					if (data.toString().indexOf("1") == -1 && checkPattern(id) == true) {
						$("#position_id").addClass("is-valid");
						$("#canuse").show();
						$("#cannotuse").hide();
						$("#nofill").hide();	
						
					} else {	
						$("#position_id").addClass("is-invalid");
						$("#canuse").hide();
						$("#cannotuse").show();
						$("#nofill").hide();
				} 
				}
			})
			}else{
				$("#position_id").addClass("is-invalid");
				$("#canuse").hide();
				$("#cannotuse").hide();
				$("#nofill").show();
			}
	})
	
	/*$("#submit_position").on('click', function() {
				var positionId = $("#position_id").val();
				var departId = $("#depart_id").val();
				var namePosition = $("#name_position").val();
				var description = $("#name_description").val();
				var prefix = $("#prefix").val();
				//console.log(positionId);
				//console.log(departId);
				$.ajax({
					url : "savePosition",
					method : "POST",
					data : {
						"position_id" : positionId,
						type : "JSON",
					"depart_id" : departId,
						"name_position" : namePosition,
						"name_description" : description,
						"prefix" : prefix,
					},
					success : function(data) {
						//console.log(data)
					}
				})
			});*/
	
	document.getElementById("position_id").addEventListener("invalid", warnFunction);
	function warnFunction(){
		$("#position_id").addClass("is-invalid");
	}
	
	/*function warnDepart(){
		swal({
			title: 'Department',
			text: 'โปรดส่งใครมารักฉันที'
		});
	}*/
	
	$(".placeholder").select2({
		dropdownAutoWidth : true,
	    placeholder: "เลือก",
	    allowClear: false
	});
	
});

</script>
<!-- <link
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
	rel="stylesheet" type="text/css" /> -->
