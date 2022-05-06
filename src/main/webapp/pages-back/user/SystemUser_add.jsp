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

input[type="checkbox"] {
	accent-color: #0275d8;
}
</style>

<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>เพิ่มผู้ใช้งานระบบ</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Authority</li>
                    <li class="breadcrumb-item active">ผูู้ใช้งานระบบ</li>
                    <li class="breadcrumb-item active">เพิ่มผู้ใช้งานระบบ</li>
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
							<span class="caption-subject font-red sbold uppercase" style="font-weight: bold; font-size: 18px" >เพิ่มประเภทพนักงาน</span> 
						</div>
					</div>
				
	<div class="portlet-body">
				<!-- BEGIN FORM-->
		<div class="panel-body">
		<form action="saveEmployeeType" method="POST">
			<div class="container">
				<div class="row">
					<div class="col-6 ">
						
							<div class="form-group">
								<label for="recipient-name" class="control-label">User Name</label> <input
								type="text" name="" required class="form-control">
							</div>
							<div class="form-group">							
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">Employee</label>
									<select class="form-control show-tick" name="">
												<option >sirung.t</option>
									</select>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">Email</label> 
								 <input type="email" name="" required class="form-control">
							</div>
							
							  <input type="checkbox"  
							  name="" value="" checked style="margin-top: 15px; margin-left: 5px; ">
							  
  							 <label for="vehicle1" style="margin-left: 10px; margin-top: 12px;"> Is Active </label>
  							
					</div>
					

					<div class="col-6">
						<div class="form-group">
								<label for="recipient-name" class="control-label">Role</label> 
								<select class="form-control show-tick" name="">
												<option >Admin</option>
									</select>
						</div>
						<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">ชื่อ ภาษาไทย</label> 
								<input type="text" name="" required class="form-control">
						</div>
						<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">Phone</label> 
								<input type="text" name="" required class="form-control">
						</div>
					</div>
				</div>
			</div>
			<hr>
			<p style="color: red;">รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัวอักษร ประกอบไปด้วย ตัวอักษรพิมพ์ใหญ่(A-Z) อย่างน้อย 1 ตัว,
									ตัวอักษรพิมพ์เล็ก(a-z) อย่างน้อย 1 ตัว เเละตัวเลข(0-9) อย่างน้อย 1 ตัว
									
			</p>
		<div class="container">
				<div class="row">
				<div class="col-6">
				   <div class="form-group">
                        <label for="" class="control-label">Password</label>
                             <input type="password" class="form-control" 
                                    name="" placeholder="Password">
                   </div>
                      </div>
 				 <div class="col-6">
				   <div class="form-group">
                        <label for="" class="control-label">Confirm Password</label>
                             <input type="password" class="form-control" 
                                    name="" placeholder="Password">
                   </div>
                      </div>
                 
			
							<!-- <div class="form-group">
								<label for="recipient-name" class="control-label">Decription:</label>
								<input type="text" name="deptdes" required class="form-control">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">Prefix
								ID:</label> <input type="text" name="deptpre" required
								class="form-control">
							</div> -->				
							
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
							
								    </div>
								   </div>
							   
							     	<div  style="text-align: right; margin-top: 3rem; margin-bottom: 1.5rem;">
									<button type="reset" class="btn btn-outline-secondary"  style="width: 8%;"> ยกเลิก</button>
									<button type="submit" class="btn btn-success" style="width: 8%;"> บันทึก</button>
								
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

$(document).ready(function() {

	var value = "${flag}";
	if (value == 1) {

		swal('Please!', 'Check Employee Type ID Duplicate', 'warning');
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
