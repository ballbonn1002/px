<!DOCTYPE html>
<html>
<head>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="pages-back/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="pages-back/assets/vendor/table-dragger/table-dragger.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="pages-back/assets/css/main.css">
<link rel="stylesheet" href="pages-back/assets/css/color_skins.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">


</head>

<style>
table, th, td,tr {
  border: 0px solid;
}
span {
  text-align: left;
}
</style>


<div class="block-header">
	<div class="row">
    	<div class="col-lg-6 col-md-8 col-sm-12">
      		<h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Function</h2>
            	<ul class="breadcrumb">
                	<li class="breadcrumb-item"><a href="page-blank.jsp"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">Function</li>
                    <li class="breadcrumb-item active">Salary - เงินเดือน</li>
        		</ul>
		</div>            
	</div>
</div>

<div class="row clearfix">
	<div class="col-lg-6 col-md-12 col-sm-12">
    	<div class="card">
        	<div class="header">
            	<h5>Salary - เงินเดือน</h5>
            </div>
            <div id="salary_left"class="body">
            

            	<table id="salary_data_left" class="table table-borderless">


            		<tr>
	            		<td>
	            			<span class="text-secondary">พนักงาน</span>
							  <select class="form-control" id="select_user_id">
							  <option disabled hidden selected = "selected" >เลือกพนักงาน</option>
							  <c:forEach var="user" items="${cubesoftUserSalaries}" varStatus="status">
							    <option>
							   ${user.id}
							    </option>
							  </c:forEach>
							  </select>
						</td>
						
						<td>
							<span class="text-secondary">OT 1.5 (hr)</span>
							<input type="text" class="form-control" id="ot15" value="0.00">
						</td>
						
					</tr>
					<tr>
						<td>
							<span class="text-secondary">OT 2 (hr)</span>
							<input type="text" class="form-control" id="ot2" value="0.00">
						</td>
						<td>
							<span class="text-secondary">OT 3 (hr)</span>
							<input type="text" class="form-control" id="ot3" value="0.00">
						</td>
					</tr>
					
					
					<tr>
						<td colspan="2" style="text-align:right">							
							<button class="btn btn-info pl-3 pr-3 ml-2" id="calculateOT" disabled>คำนวณ</button>
						</td>
					</tr>
					</table>
					
					
					<!--		 สูตรคำนวณ 		-->
					<table class="table table-borderless">
						<tr>
							<td colspan="2" bgcolor="#f7fbff">
								<div class="text-primary">สูตรคำนวณ</div>
							</td>
						</tr>
					</table>
						
					<table class="table table-borderless">
						
						<tr>
							<td colspan="2">
								<span class="text-primary">[salary_day]</span>
								<span>=  salary / [จำนวนวันต่องวด] x [งวดการจ่ายเงิน]</span>
						</td>
						</tr>
	
						<tr>
							<td colspan="2">
								<span class="text-primary">[salary_hr]</span>
								<span class="text-dark">=  salary_day / 8</span>
							</td>	
						</tr>
					</table>
            
            </div>
            
            
     	</div>
     </div>
     
     <div class="col-lg-6 col-md-12 col-sm-12">
    	<div class="card">
        	<div id="salary_right"class="body">
        		
        		<table class="table table-borderless">
        		<!-- 			ดึงข้อมูล 			-->
	        		<tr>
		        		<td colspan="3" bgcolor="#f7fbff">
							<div class="text-primary">ดึงข้อมูล</div>
						</td>
	        		</tr>
	        	</table>
	        		
				<table class="table table-borderless">
	        		<tr>
		        		<td>
		        			<span class="text-secondary">ประเภทพนักงาน</span>
						</td>
		        		<td style="width:50%;">
							<span id="Salary_type"></span>
						</td>
	        		</tr>
	        		
	        		<tr>
		        		<td>
		        			<span class="text-secondary">ประเภทการจ่ายเงิน</span>
						</td>
		        		<td>
							<span id="Salary_payment_type"></span>
						</td>
	        		</tr>

	        		<tr>
		        		<td>
		        			<span class="text-secondary">งวดการจ่ายเงิน</span>
						</td>
		        		<td>
							<span id="Salary_term"></span>
						</td>
	        		</tr>

	        		<tr>
		        		<td>
		        			<span class="text-secondary">จำนวนวันต่องวด</span>
						</td>
		        		<td>
							<span class="text-secondary" id="Salary_term_day"></span>
						</td>
	        		</tr>

	        		<tr>
		        		<td>
		        			<span class="text-secondary">Salary</span>
						</td>
		        		<td>
		        		
		        		<span class="text-dark" id="Salary_amount">		        		
		        		</span>
		        		
						</td>
	        		</tr>
	        	</table>



        		<!-- 			ผลการคำนวณ 			-->
        		<table class="table table-borderless">
	        		<tr>
		        		<td colspan="3" bgcolor="#f7fbff">
							<div class="text-primary">ผลการคำนวณ</div>
						</td>
	        		</tr>
	        	</table>
	        	
	        	<table class="table table-borderless">
	        		<tr>
		        		<td>
		        			<span class="text-secondary">salary_day</span>
						</td>
		        		<td style="width:50%;">
							<span id="salary_day"></span>
						</td>
	        		</tr>
	        		
	        		<tr>
		        		<td>
		        			<span class="text-secondary">salary_hr</span>
						</td>
		        		<td>
							<span id="salary_hr"></span>
						</td>
	        		</tr>

	        		<tr>
		        		<td>
		        			<span class="text-secondary">OT 1.5</span>
						</td>
		        		<td>
							<span id="salary_ot15"></span>
						</td>
	        		</tr>

	        		<tr>
		        		<td>
		        			<span class="text-secondary">OT 2</span>
						</td>
		        		<td>
							<span class="text-dark" id="salary_ot2"></span>
						</td>
	        		</tr>

	        		<tr>
		        		<td>
		        			<span class="text-secondary">OT 3</span>
						</td>
		        		<td>
							<span class="text-dark" id="salary_ot3"></span>
						</td>
	        		</tr>

        		</table>
        		
            </div>
     	</div>
     </div>       
</div>

<!-- 				 -->

<!-- Javascript --> 

<script src="pages-back/assets/bundles/vendorscripts.bundle.js"></script>
<script src="pages-back/assets/vendor/table-dragger/table-dragger.min.js"></script>
<script src="pages-back/assets/bundles/mainscripts.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function(){

	$("#select_user_id").on('change',function(){
		
		$("#calculateOT").prop('disabled', false);
		
		//get user id value
		var user_id = $("#select_user_id").val();
		
		$.ajax({
			url: "findSalaryDataById",
			method: "POST",
			type: "JSON",
			data: {
					"user_id" : user_id ,
				},
				success:function(data){
					console.log(data);
					
					//set text
					$("#Salary_type").text(data.employee_type_name);
					$("#Salary_payment_type").text(data.payment == 0? "รายเดือน":"รายวัน");
					$("#Salary_term").text(Number(data.term));
					$("#Salary_term_day").text(data.term_day);
					$("#Salary_amount").text(numberWithCommas(Number(data.amount).toFixed(2)));
					
					//set value
					$("#Salary_amount").val(Number(data.amount).toFixed(2));
					$("#Salary_payment_type").val(data.payment);
					$("#Salary_term").val(Number(data.term));
					$("#Salary_term_day").val(data.term_day);

				}
		})
		//////////////
	});
	
	$("#calculateOT").on('click',function(){
		
		//get value
		var user_id = $("#select_user_id").val();
		var OT15 = $("#ot15").val();
		var OT2 = $("#ot2").val();
		var OT3 = $("#ot3").val();
		//var Salary_payment_type = ($('#Salary_payment_type').val());
		//var Salary_term = $('#Salary_term').val();
		//var Salary_term_day = $('#Salary_term_day').val();
		//var Salary_amount = $('#Salary_amount').val();
		
		//send ajax
		$.ajax({
			url: "calculateOTData",
			method: "POST",
			type: "JSON",
			data: {
					"ot15" : OT15 ,
					"ot2" : OT2 ,
					"ot3" : OT3 ,
					"userId" : user_id,
					//"Salary_payment_type" : Salary_payment_type ,
					//"Salary_term" : Salary_term ,
					//"Salary_term_day" : Salary_term_day ,
					//"Salary_amount" : Salary_amount ,
				},
				success:function(data){
					console.log(data);
					
					//set text
					$("#salary_day").text(numberWithCommas(data.salaryDay.toFixed(2)));
					$("#salary_hr").text(numberWithCommas(data.salaryHr.toFixed(2)));
					$("#salary_ot15").text(numberWithCommas(data.salaryOT15.toFixed(2)));
					$("#salary_ot2").text(numberWithCommas(data.salaryOT2.toFixed(2)));
					$("#salary_ot3").text(numberWithCommas(data.salaryOT3.toFixed(2)));

			}
		})
		///////////////
		
	});
	
	
});


</script>
</body>
</html>