<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="pages-back/assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
<style>
input[type=radio] {
	accent-color: #0275d8;
	border: 0px;
	width: 5%;
	height: 1.2em;
}

#div_input {
	text-align: right;
	margin-bottom: 1%;
	margin-top: 2%;
	font-family: "Open Sans", sans-serif;
}

input[type="checkbox"] {
	accent-color: #0275d8;
}

.expenses-box {
	display: none;
}
</style>
</head>

<div class="block-header">
	<div class="row">
		<div class="col-lg-6 col-md-8 col-sm-12">
			<h2>
				<a href="javascript:void(0);"
					class="btn btn-xs btn-link btn-toggle-fullwidth"><i
					class="fa fa-arrow-left"></i></a> รายละเอียดพนักงาน
			</h2>
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="page.blank"><i
						class="icon-home"></i></a></li>
				<li class="breadcrumb-item">Master</li>
				<li class="breadcrumb-item">รายชื่อพนักงาน</li>
				<li class="breadcrumb-item active">รายละเอียดพนักงาน</li>
			</ul>
		</div>
	</div>
</div>

<div class="row clearfix">
	<div class="col-lg-12">
		<div class="card">
			<div class="body">
				<form action="updateInfoEmp" method="POST">
					<div class="portlet light bordered">
						<div class="portlet-title">
							<div class="caption">
								<span style="font-weight: bold; font-size: 20px"
									class="caption-subject font-red sbold uppercase">รายการเงินเดือน</span>
							</div>
							<div class="actions right" id="hidebutton"
								style="text-align: right; margin-bottom: 30px;">
								<button type="reset" class="btn btn-outline-secondary">
									ยกเลิก</button>
								<button type="submit" class="btn btn-info">บันทึก</button>
								<!--  class="btn btn-circle btn-icon-only btn-default fullscreen"
								href="javascript:;" data-original-title="" title=""> </a> -->
								<!--  class="btn green-meadow"-->
								<!-- <i
								class="fa fa-plus"></i> -->
							</div>
						</div>
					</div>
					<div class="body">
						<ul class="nav nav-tabs-new2">
							<li class="nav-item"><a id="showbutton"
								class="nav-link active show" data-toggle="tab" href="#dataemp">ข้อมูลพนักงาน</a></li>
							<li class="nav-item"><a id="showbutton1" class="nav-link"
								data-toggle="tab" href="#dataemployment">ข้อมูลการจ้างงาน</a></li>
							<li class="nav-item"><a id="showbutton2" class="nav-link"
								data-toggle="tab" href="#datasalary">ข้อมูลเงินเดือน/ค่าจ้าง</a></li>
							<li class="nav-item"><a id="showbutton3" class="nav-link"
								data-toggle="tab" href="#dataincome">ข้อมูลรายได้/รายจ่าย
									เพิ่มเติม </a></li>
							<li class="nav-item"><a id="showbutton4" class="nav-link"
								data-toggle="tab" href="#datapayment">ข้อมูลการชำระเงินเดือน/ค่าจ้าง</a></li>
							<li class="nav-item"><a id="History" class="nav-link"
								data-toggle="tab" href="#historypayment">ประวัติการปรับเงินเดือน</a></li>
						</ul>
						<div class="tab-content">
							<!--  Data Employee Page-->
							<div class="tab-pane show active" id="dataemp">
								<jsp:include page="edit_employeeinformation.jsp" />
							</div>

							<!--  Data Employment -->
							<div class="tab-pane" id="dataemployment">
								<jsp:include page="edit_hireinformation.jsp" />
							</div>

							<!--  Data Salary -->
							<div class="tab-pane" id="datasalary">
								<jsp:include page="edit_salaryinformation.jsp" />
							</div>

							<!--  Data income/expend-->
							<div class="tab-pane" id="dataincome">
								<jsp:include page="edit_dataincome.jsp" />
							</div>

							<!--  Data payroll-->
							<div class="tab-pane" id="datapayment">
								<jsp:include page="edit_datapayment.jsp" />
							</div>

							<!--  History-->
							<div class="tab-pane" id="historypayment">
								<jsp:include page="edit_history.jsp" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




<script src="pages-back/assets/js/jquery-latest.min.js"></script>
<script src="pages-back/assets/bundles/vendorscripts.bundle.js"></script>
<script src="pages-back/assets/bundles/mainscripts.bundle.js"></script>
<script
	src="pages-back/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script
	src="pages-back/assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.min.js"
	type="text/javascript"></script>
<script
	src="pages-back/assets/pages/scripts/components-date-time-pickers.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script>




$(document).ready(function(){
	if ($('#salary').val() != ""){
		$('#add_emp_amount').val((Math.round(parseFloat($('#add_emp_amount').val()) * 100) / 100).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"))
		$('#salary').val((Math.round(parseFloat($('#salary').val()) * 100) / 100).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"))
	}

	$(".department-type").on("change",function() {
		$.ajax({
			url: "getPositionByDepartmentId",
			method: "POST" ,
			type: "JSON" ,
			data: {
				"departmentId" : $(".department-type option:selected").val()
			},
			success:function(data){
				$(".edit-position").empty()
				$.each(JSON.parse(data),function(index,value) {
					$(".edit-position").append("<option value=" + value.positionId + ">" + value.name + "</option>");
				})
				} 
			}
		);
	});
	
  $("#History").click(function(){
    $("#hidebutton").hide();
  });
  $("#showbutton").click(function(){
    $("#hidebutton").show();
  });
  $("#showbutton1").click(function(){
	    $("#hidebutton").show();
	  });
  $("#showbutton2").click(function(){
	    $("#hidebutton").show();
	  });
  $("#showbutton3").click(function(){
	    $("#hidebutton").show();
	  });
  $("#showbutton4").click(function(){
	    $("#hidebutton").show();
	  });
  
  $('#add_emp_amount').on("change",function () {
	  var add_emp_amount =  $('#add_emp_amount').val();
	  if ($.isNumeric($('#add_emp_amount').val())){
	  	add_emp_amount = add_emp_amount.replace(',','');
	  	$('#add_emp_amount').val((Math.round(parseFloat(add_emp_amount) * 100) / 100).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"))
	  	}
	  else {
		  $('#add_emp_amount').val("กรอกได้เฉพาะตัวเลข")
	  }
  })
  
  $('#add_emp_save').click(function() {
	  $('#defaultModal').modal('hide');
	  if ($("#add_emp_amount").val()) {
		  $('#salary').val($('#add_emp_amount').val());
		  $.ajax({
			  url: "updateSalaryEmp",
			  method : "POST" ,
			  type: "JSON",
			  data : {
				  "username" : $("#edit-username").val(),
				  "salaryDate" : $("#add_emp_date").val(),
				  "amountsalary" : $("#add_emp_amount").val().replace(',',''),
				  "note" : $("#add_emp_note").val(),
			  },
			  success:function(data) {
				  location.reload();
			  }
		  })
		}
	});
  $('#add_emp_discard').click(function() {
	  $('#defaultModal').modal('hide');
	});
  
  $(".checkme").click(function(event) {
		if ($(this).is(':checked')) {
			$(this).closest("tr").find(".form-control").prop( "disabled", false );
		}
		else{
			$.ajax({
				url: "deleteUser",
				method: "POST" ,
				type: "JSON" ,
				data: {
					"username" : $("#edit-username").val(),
					"payment" : $(this).closest("tr").find(".form-control").attr('name'),
				},
				success:function(data){
					console.log(data)
					} 
				}
			);
			$(this).closest("tr").find(".form-control").prop( "disabled", true );
			$(this).closest("tr").find(".form-control").val('');
		}
	});
  
  $(".data-income").on("change",function() {
	  /*console.log($(this).attr('name'));
	  console.log($("#edit-username").val());
	  console.log($(this).val());*/
	  console.log("Enter");
	  if($(this).val() != ""){
		  console.log("Enter");
	  $.ajax({
			url: "saveorupdateUser",
			method: "POST" ,
			type: "JSON" ,
			data: {
				"username" : $("#edit-username").val(),
				"payment" : $(this).attr('name'),
				"amount" : $(this).val()
			},
			success:function(data){console.log(data)
				} 
			}
		);
  }})

});

	
function EnableDisnableTxttax(chktax)
{
	var txttax = document.getElementById("txttax");
	txttax.disabled = chktax.checked?true:false;
	if(!txttax.disabled){
		txttax.focus();
	}else{
		txttax.value=""
	}
}

</script>
</html>

