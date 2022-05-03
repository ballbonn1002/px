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


<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> ประเภทพนักงาน</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Master</li>
                    <li class="breadcrumb-item active">ประเภทพนักงาน</li>
                     <li class="breadcrumb-item active">เพิ่มประเภทพนักงาน</li>
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
					<div class="col-6">
						
							<div class="form-group">
								<label for="recipient-name" class="control-label">ID</label> <input
								type="text" name="employee_type_id" required class="form-control">
							</div>
							<div class="form-group">							
							<label for="recipient-name" class="control-label"
								style="margin-top: 10px;" >ประเภทการจ่ายเงิน</label><br>
										<input type="radio" id="contactChoice1" name="PayoutType" style="margin-top: 5px;" value="รายเดือน" >
										<label for="contactChoice1" >รายเดือน</label>&nbsp;&nbsp;&nbsp;
    									<input type="radio" id="contactChoice2" name="PayoutType" value="รายวัน" >
    									<label for="contactChoice2">รายวัน</label>
				
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 15px;">งวดการจ่ายเงิน</label> 
									<select class="form-control show-tick" name="PayPeriod">
												<option value="1 งวด">1 งวด</option>
												<option value="2 งวด">2 งวด</option>
												<option value="3 งวด">3 งวด</option>
												<option value="4 งวด">4 งวด</option>
										   	</select>
							</div>
					</div>
					<div class="col-6">
						<div class="form-group">
								<label for="recipient-name" class="control-label">ชื่อประเภทพนักงาน</label> 
								<input type="text" name="name" required class="form-control">
						</div>
	
			

						<div class="form-group">
								<label for="recipient-name" class="control-label"
								style="margin-top: 6.45rem;">จำนวนวันต่องวด</label> 
									<select class="form-control show-tick" id="numday" name="DayPeriod" >
										
				
				<script>							
		
			var selectEl = document.getElementById("numday");
			
			
			for (let i = 1; i < 32; i++) {
				  let optionEl = document.createElement("option");
				  optionEl.value =  i;
				  optionEl.textContent = i ;
				  selectEl.appendChild(optionEl);
				}
			</script>		
												<option value="ตามวันทำงานจริง">ตามวันทำงานจริง</option>
									</select>
							</div>
					</div>
										
			
				</div> 
				<div class="form-group">
								<label for="recipient-name" class="control-label"
								style="margin-top: 3rem;">คำอธิบาย</label> 
							<input
								type="text" name="deptdes" required class="form-control">
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
