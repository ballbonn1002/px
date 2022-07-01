<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link rel="stylesheet"
	href="pages-back/assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<style type="text/css">
/* class สำหรับแถวแรกของรายละเอียด */
.tr_odd {
	background-color: #F8F8F8;
}
/* class สำหรับแถวสองของรายละเอียด */
.tr_even {
	background-color: #F2F2F2;
}

tr {
	opacity: 0;
	animation-name: fadeIn;
	animation-duration: 2s;
	animation-iteration-count: 1;
	animation-fill-mode: forwards;
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}
}
</style>
<script>
	$("tr:not(:first)").each(function(index) {
		$(this).css('animation-delay', index * 0.01 + 's');
	});
</script>
<div class="block-header">
	<div class="row">
		<div class="col-lg-6 col-md-8 col-sm-12">
			<h2>
				<a href="javascript:void(0);"
					class="btn btn-xs btn-link btn-toggle-fullwidth"><i
					class="fa fa-arrow-left"></i></a>Function
			</h2>
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="page.blank"><i
						class="icon-home"></i></a></li>
				<li class="breadcrumb-item">Function</li>
				<li class="breadcrumb-item active">Actual - วันทำงานจริง</li>
			</ul>
		</div>
	</div>
</div>
<div class="row clearfix">
	<div class="col-lg-12">
		<div class="card">
			<div class="body">
				<div class="portlet light bordered">
					<div class="portlet-title" style="padding-bottom: 10px;">
						<div class="caption">
							<span class="caption-subject font-red sbold uppercase"
								style="font-weight: bold; font-size: 18px">Actual -
								วันทำงานจริง</span>
						</div>
					</div>
					<div class="portlet-body">
						<!-- BEGIN FORM-->
						<div class="panel-body">
							<form id="frmSearch"  method="post">					
								<div class="container">
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">พนักงาน</label>
												<select class="form-control show-tick" name="userId"
													id="userId">
													<option value="test.data1">test.data1</option>
													<option value="test.data2">test.data2</option>
													<option value="test.data3">test.data3</option>
													<option value="test.data4">test.data4</option>
												</select>
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">ช่วงวันที่</label>
												<input data-provide="datepicker" data-date-autoclose="true"
													data-date-format="yyyy-mm-dd" name="startDate"
													id="startDate"
													class="form-control" style="width: 100%;">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">ถึงวันที่</label>
												<input data-provide="datepicker" data-date-autoclose="true"
													data-date-format="yyyy-mm-dd" name="endDate" id="endDate"
													class="form-control" style="width: 100%;">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<button type="button" class="btn btn-sm btn-info"
													id="searchbutton" style="margin-top: 28px;"
													onclick="getWorking()">
													<i class="fa fa-search"></i>&nbsp;Search
												</button>
											</div>
										</div>
									</div>
									<div class="alert alert-primary" role="alert">ดึงข้อมูล</div>
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">ประเภทพนักงาน</label>
												<input type="text" name="emp_type" id="emp_type" class="form-control input-lg" style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">ประเภทการจ่าย</label>
												<input type="text" name="payment" id="payment" class="form-control input-lg" style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">งวดการจ่ายเงิน</label>
												<input type="text" name="term" id="term" class="form-control input-lg" style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">จำนวนวันต่องวด</label>
												<input type="text" name="term_day" id="term_day" class="form-control input-lg" style="width: 100%">
											</div>
										</div>
									</div>
									<div class="alert alert-primary" role="alert">ผลการค้นหา</div>
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">Count_Working วันที่มาทำงาน</label>
												<input type="text" name="sum_emp_working" id="sum_emp_working" class="form-control input-lg" style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">Function_Actual วันทำงานตามประเภท</label>
												<input type="text" name="actual_working_day" id="actual_working_day" class="form-control input-lg" style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">Function_Absent วันขาดงาน</label>
												<input type="text" name="sum_emp_absent" id="sum_emp_absent" class="form-control input-lg" style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">Sum_Working ชั่วโมงทำงาน</label>
												<input type="text" name="sum_emp_working_hr" id="sum_emp_working_hr" class="form-control input-lg" style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">วันทำงานต่อเดือน</label>
												<input type="text" name="actual_working_per_month" id="actual_working_per_month" class="form-control input-lg" style="width: 100%">
											</div>
										</div>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var now = new Date();
		var firstDay = new Date(now.getFullYear(), now.getMonth(), 1);
		var lastDay = new Date(now.getFullYear(), now.getMonth() + 1, 0);
		
		$("#startDate").val(formatDate(firstDay));
		$("#endDate").val(formatDate(lastDay));

	});
	

	function getWorking() {
		var userId = $("#userId").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();

		if (startDate == "") {
			swal("กรุณาระบุวันที่เริ่ม", "Please Try It Again :)", "error");
			return false;
		}
		if (endDate == "") {
			swal("กรุณาระบุวันที่สิ้นสุด", "Please Try It Again :)", "error");
			return false;
		}
			
		clear();
		$.ajax({
			url: "getWorkingList",
			method: "POST",
			type: "JSON",
			data: {
					"userId" : userId ,
					"startDate" : startDate ,
					"endDate" : endDate ,
				},
				success:function(res){
					console.log(JSON.stringify(res[0]))
					var data = res[0];
					$("#emp_type").val(data.name);
					$("#payment").val(data.payment == '1' ? 'รายวัน' : 'รายเดือน' );
					$("#term").val(data.term);
					$("#term_day").val(data.term_day);
					
					$("#sum_emp_working").val(data.sum_emp_working);
					$("#actual_working_day").val(data.actual_working_day);
					$("#sum_emp_absent").val(data.sum_emp_absent);
					$("#sum_emp_working_hr").val(data.sum_emp_working_hr);
					$("#actual_working_per_month").val(data.actual_working_per_month);
				},
				error: function (error) {
					swal("ไม่พบข้อมูล", "Please Try It Agian :)", "error");
				}
		});
	}
	
	function clear(){
		$("#emp_type").val('');
		$("#payment").val('');
		$("#term").val('');
		$("#term_day").val('');
		
		$("#sum_emp_working").val('');
		$("#actual_working_day").val('');
		$("#sum_emp_absent").val('');
		$("#sum_emp_working_hr").val('');
		$("#actual_working_per_month").val('');
	}
	
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) 
	        month = '0' + month;
	    if (day.length < 2) 
	        day = '0' + day;

	    return [year, month, day].join('-');
	}
</script>



<script src="pages-back/assets/js/jquery-latest.min.js"></script>
<script src="pages-back/assets/bundles/vendorscripts.bundle.js"></script>
<script src="pages-back/assets/bundles/mainscripts.bundle.js"></script>
<script
	src="pages-back/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script
	src="pages-back/assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.min.js"
	type="text/javascript"></script>
