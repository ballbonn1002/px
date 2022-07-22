<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${bean.date}" pattern="dd-MM-yyyy" />

<style>
</style>

<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> เเผนก</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item active">เเผนก</li>
                     <li class="breadcrumb-item active">เพิ่มเเผนก</li>
                </ul>
        </div>            
    </div>
</div>

<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card">
            <div class="body">   
            
				<div class="portlet light bordered">
					<div class="portlet-title" style = "padding-bottom: 40px;">
						<div class="caption">
							<span class="caption-subject font-red sbold uppercase" style="font-weight: bold; font-size: 18px" >เพิ่มเเผนก</span> 
						</div>
					</div>
				
				<div class="portlet-body">
				<!-- BEGIN FORM-->
				</div>
					<div class="panel-body">
						<form action="javascript:submitAddDepartmentForm()" id="addDepartForm" class="needs-validation" novalidate method="POST">
							<div class="form-group">
								<label for="recipient-name" class="control-label req">ID:<span style="color:red;"> *</span></label> 
								<input	type="text" name="ID" id="depart_id" required class="form-control form_department_control" pattern="[a-zA-Z0-9.]+" autocomplete="no">
								
								<div id="canuse" style="color: #28A745; text-color:#28A745; display:none; width:100%;">
									<i class="icon-check"></i>&nbsp;&nbsp;You can use this id
								</div>
								<div id="cannotuse" style="color: #FAAD14; text-color:#FAAD14; display:none;">
									<i class="icon-check"></i>&nbsp;&nbsp;You can not use this id
								</div>
								
								<div class="invalid-feedback">กรอกได้เฉพาะ ภาษาอังฤกษ ตัวเลข . (จุด) ห้ามซ้ำกับ Id เดิม และห้ามปล่อยฟิลนี้ว่าง</div>
								

													        
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label req">Name:<span style="color:red;"> *</span></label>
								<input type="text" name="name" required class="form-control form_department_control" autocomplete="no">
								<div class="invalid-feedback">required this field</div>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">Decription:</label>
								<input type="text" name="deptdes" class="form-control form_department_control">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">Prefix
								ID:</label> <input type="text" name="deptpre"	class="form-control form_department_control">
							</div>
										
										
										
							<input type="hidden" name="logonUser" value="${logonUser}">
							<!-- กำหนดวันที่ Time Create -->
							<div>
								<input type="hidden" name="time" id="time"
								class="form-control input-lg timepicker timepicker-24 test"
								value="${time}" data-time-format=" HH:mm" style="width: 200px;"
								onclick="timechenge()" onkeypress='return false'>
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
							
							
								<div  style="text-align: right">
									<button type="button" onclick="history.back()" class="btn btn-outline-secondary"> ยกเลิก</button>
									<button type="submit" class="btn btn-success"> บันทึก</button>
								</div>
						</form>
					</div>
				</div>
			</div>	
			</div>
		</div>	
	</div>
</div>


<!-- END FORM-->


<script>
var duplicate_id = false

function datechenge() {
	var fulldate = "${fulldate}".trim();//??????????????
	var Userdate = $("#mydate").val();//???????????
	if(fulldate != Userdate){
		$("#detail").show();
		$("#labeldetail").show();
	}else{
		$("#detail").hide();
		$("#labeldetail").hide();
	}		
}

function checkDupId(){
	//$('#depart_id').on('keyup blur', function() {
		var flag = true;
		var id = $('#depart_id').val();
		
		if(id != ""){
				$.ajax({
					url: "checkDupDepart",
					method: "POST" ,
					type: "JSON" ,
					data: {
						"ID" : id
					},
					success:function(data){
						var input = document.getElementById('depart_id')
						input.classList.remove('is-invalid')
				        input.classList.remove('is-valid')
		        	
						if (data.flag == 0 && input.checkValidity() == true) {
							duplicate_id = true
							$("#canuse").show();
							$("#cannotuse").hide();
							$("#depart_id").addClass('is-valid');
						} else {
							duplicate_id = false
							$("#canuse").hide();
							$("#cannotuse").show();
							$("#depart_id").addClass('is-invalid');
						}
					}
				})
			
			}else{
				duplicate_id = false
				var input = document.getElementById('depart_id')
				input.classList.add('is-invalid')
				$("#canuse").hide();
				$("#cannotuse").hide();
			}
	//})
}

//original code from w3schools & codeply
/************** https://www.w3schools.com/bootstrap4/bootstrap_forms.asp ***************/
/************** https://www.codeply.com/p/mzBNbAlOvQ *****************/
function validate() {
		  'use strict';
		  window.addEventListener('load', function() {
		    var forms = document.getElementsByClassName('needs-validation');
		    var inputs = document.getElementsByClassName('form_department_control')

		    Array.prototype.filter.call(forms, function(form) {
		    
		    
		      form.addEventListener('submit', function(event) { 
		    	
		    	showWasValidate()
		    	//form.classList.add('was-validated');
		        if (form.checkValidity() === false || duplicate_id == false) {
		          event.preventDefault();
		          event.stopPropagation();
		        }		        
		        
		      }, false);
		      
		    });
		    
		    
		    Array.prototype.filter.call(inputs, function(input) {
		    	
			      input.addEventListener('blur', function(event) {
			    	checkDupId()//check duplicate id

					if (input.id != 'depart_id'){
						// reset
				        input.classList.remove('is-invalid')
				        input.classList.remove('is-valid')
				        
				        if (input.checkValidity() === false) {
				        		input.classList.add('is-invalid')
				        }
				        else{
				            input.classList.add('is-valid')
				        }					
					}
			      }, false);
			    });
		    
		 }, false);
};

function showWasValidate(){
	
	var inputs = document.getElementsByClassName('form_department_control')
    Array.prototype.filter.call(inputs, function(input) {
    	
		if (input.id != 'depart_id'){
			// reset
			checkDupId()
		     input.classList.remove('is-invalid')
		     input.classList.remove('is-valid')
		        
		        if (input.checkValidity() === false) {
		        		input.classList.add('is-invalid')
		        }
		        else{
		            input.classList.add('is-valid')
		        }					
		}

	});
}

function submitAddDepartmentForm(){
	let data_ = $("#addDepartForm").serializeArray()
	console.log(data_)

	$.ajax({url: "saveDepart",method: "POST",data: data_,
	success:function(){
		document.location = "department_list";
	}})
}


$(document).ready(function() {
	validate()
	
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
