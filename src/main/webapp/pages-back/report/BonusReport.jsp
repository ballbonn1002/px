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

<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.min.js" integrity="sha512-9UR1ynHntZdqHnwXKTaOm1s6V9fExqejKvg5XMawEMToW4sSw+3jtLrYfZPijvnwnnE8Uol1O9BcAskoxgec+g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.css" integrity="sha512-xmGTNt20S0t62wHLmQec2DauG9T+owP9e6VU8GigI0anN7OXLip9i7IwEhelasml2osdxX71XcYm6BQunTQeQg==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>



<style type="text/css">
.bootstrap-tagsinput .tag {
  background: blue;
  border: 1px solid black;
  padding: 0 6px;
  margin-right: 2px;
  color: white;
  border-radius: 4px;
}

</style>



<body>
	
	<div class="block-header">
		<div class="row">
			<div class="col-lg-6 col-md-8 col-sm-12">
				<h2 class="font-weight-bold">
					<a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
						<i class="fa fa-arrow-left"></i></a> รายงาน รายได้เพิ่มเติม/รายการหัก
				</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="page-blank.jsp"><i	class="icon-home"></i></a></li>
					<li class="breadcrumb-item">รายงาน</li>
					<li class="breadcrumb-item active">รายงาน	รายได้เพิ่มเติม/รายการหัก</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row clearfix">
			<div class="col-lg">
				<div class="card tab-card">
				
		        	<div class="header pt-5 pl-4">
			        	<div class="row">
			        		<div class="col-sm">
			        			<h6>รายงาน รายได้เพิ่มเติม/รายการหัก</h6>
			        		</div>
			        		

			        		
			        	<ul class="nav nav-pills">
				            <li class="nav-item">
				                <a class="nav-link active mr-3" id="month-tab" data-toggle="tab" href="#MonthTab">Month</a>
				            </li>
				            <li class="nav-item">
				                <a class="nav-link mr-3"  id="year-tab" data-toggle="tab" href="#YearTab">Year</a>
				            </li>
				          </ul>
			        		
			        		
			        	</div>
		            </div>
		            
  					<!-- body -->
		            <div class="body">
		            
		            <div class="tab-content">
		            
		            <!-- YearTab -->
		            <div class="tab-pane fade" id="YearTab">
		            
			            	<div class="row">
					            	<div class="col">
									    <select id="select_year_year" class="form-control mr-3"  multiple>
								            <c:forEach begin="2000" end="2022" varStatus="loop">
											  <option>${loop.index}</option>
											 </c:forEach>
									    </select>
									<!--  <input type="text" value="Amsterdam,Washington,Sydney,Beijing,Cairo" data-role="tagsinput"/>-->	
					            	</div>            
		
					            	<div class="col">
							            <select id="select_user_year" type="text" class="form-control mr-3">
							            	<option disabled hidden selected = "selected" >เลือกพนักงาน</option>
								            <c:forEach var="user" items="${Users}" varStatus="status">
									            <c:if test="${user.flag_search=='1'}">
												  <option>${user.id}</option>
												</c:if>
											</c:forEach>
										</select>           	
					            	</div>

							</div>
				            
				            <!-- รายได้เพิ่มเติม -->
					       	<div class="row mt-4">

								<div class="col">
									<div class="table-responsive-sm">
										<table class="table">
											<thead>
												<tr class="bg-light" >
													<th>รายได้เพิ่มเติม</th>
													<th></th>
													<th>2021</th>
													<th>2022</th>

												</tr>
											</thead>
										<tbody>
										</tbody>
											<tr>
												<td style="text-align: left; padding-top: 10px;">OT1</td>
												<td style="text-align: left; padding-top: 10px;">ล่วงเวลา 1.5 เท่า</td>
												<td style="text-align: left; padding-top: 10px;">asd</td>
												<td style="text-align: left; padding-top: 10px;">asd</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							<!-- รายได้เพิ่มเติม -->
							
							<!-- รายการหัก -->
					       	<div class="row mt-4">

								<div class="col">
									<div class="table-responsive-sm">
										<table class="table">
											<thead>
												<tr class="bg-light">
													<th>รายการหัก</th>
													<th></th>
													<th>2021</th>
													<th>2022</th>

												</tr>
											</thead>
										<tbody>
										</tbody>
											<tr>
												<td style="text-align: left; padding-top: 10px;">OT1</td>
												<td style="text-align: left; padding-top: 10px;">ล่วงเวลา 1.5 เท่า</td>
												<td style="text-align: left; padding-top: 10px;">asd</td>
												<td style="text-align: left; padding-top: 10px;">asd</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							<!-- รายการหัก -->
							
							
					</div>
					<!-- end YearTab -->
						
						
					<!-- Month Tab -->
					<div class="tab-pane fade show active" id="MonthTab">
					    
					    	<div class="row">
			            	
					            	<div class="col">
							            <select id="select_year_month" class="form-control ml-1">
							            <c:forEach begin="2000" end="2022" varStatus="loop">
							            <option disabled hidden selected = "selected" >เลือกปี</option>
										  <option>${loop.index}</option>
										 </c:forEach>
										</select>           	
					            	</div>
					            				            
		
					            	<div class="col">
							            <select id="select_user_month" type="text" class="form-control mr-3">
							            	<option disabled hidden selected = "selected" >เลือกพนักงาน</option>
								            <c:forEach var="user" items="${Users}" varStatus="status">
									            <c:if test="${user.flag_search=='1'}">
												  <option>${user.id}</option>
												</c:if>
											</c:forEach>
										</select>           	
					            	</div>
					            	
							</div>
				            
				            <!-- รายได้เพิ่มเติม -->
					       	<div class="row mt-4">
								<div class="col">
									<div class="table-responsive-sm">
										<table class="table">
											<thead>
												<tr class="bg-light">
													<th>รายได้เพิ่มเติม</th>
													<th></th>
													<th>Jan</th>
													<th>Feb</th>
													<th>Apr</th>
													<th>May</th>
													<th>Jun</th>
													<th>Jul</th>
													<th>Aug</th>
													<th>Sep</th>
													<th>Oct</th>
													<th>Nov</th>
													<th>Dec</th>
												</tr>
											</thead>
											<tbody id="looptable_month1">
												<tr><td>OT1</td><td>ล่วงเวลา 1.5 เท่า</td></tr>
												<tr><td>OT2</td><td>ล่วงเวลา 2 เท่า</td></tr>
												<tr><td>OT3</td><td>ล่วงเวลา 3 เท่า</td></tr>
												<tr><td>VA</td><td>เบี้ยขยัน</td></tr>
												<tr><td>TRAVEL</td><td>เบิกค่าเดินทาง</td></tr>
												<tr><td>BONUS</td><td>โบนัส</td></tr>
												<tr><td>EQUIPMENT</td><td>เบิกค่าอุปกรณ์</td></tr>
												
											</tbody>
										</table>
									</div>	
								</div>
							</div>
							<!-- รายได้เพิ่มเติม -->
							
							<!-- รายการหัก -->
					       	<div class="row mt-4">
								<div class="col">
									<div class="table-responsive-sm">
										<table class="table">
											<thead>
												<tr class="bg-light">
													<th>รายการหัก</th>
													<th></th>
													<th>Jan</th>
													<th>Feb</th>
													<th>Apr</th>
													<th>May</th>
													<th>Jun</th>
													<th>Jul</th>
													<th>Aug</th>
													<th>Sep</th>
													<th>Oct</th>
													<th>Nov</th>
													<th>Dec</th>
												</tr>
											</thead>
											<tbody>
												<tr><td>SSI</td><td>ล่วงเวลา 1.5 เท่า</td></tr>
												<tr><td>TAX</td><td>ล่วงเวลา 2 เท่า</td></tr>
												<tr><td>TISCO</td><td>ล่วงเวลา 3 เท่า</td></tr>
												<tr><td>LATE</td><td>เบี้ยขยัน</td></tr>
												<tr><td>ABSENT</td><td>เบิกค่าเดินทาง</td></tr>
												<tr><td>ABSENCE</td><td>โบนัส</td></tr>
												<tr><td>STUDENTLOAN</td><td>เบิกค่าอุปกรณ์</td></tr>
											</tbody>
										</table>
									</div>	
								</div>
							</div>
							<!-- รายการหัก -->
					    
					</div>
					<!-- end MonthTab -->
					       
			        </div>
			        <!-- tab-content  -->
			        	
			        	
			        	
			        	
			        	
			        </div>
					<!-- end body -->
					
				
				</div>
				
			</div>
		</div>
	</div>

	
</body>

<script src="pages-back/assets/bundles/vendorscripts.bundle.js"></script>
<script src="pages-back/assets/vendor/table-dragger/table-dragger.min.js"></script>
<script src="pages-back/assets/bundles/mainscripts.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
function looptable(tagid,data){
	var content = "";
	
	data.forEach(function(month) {
	    //console.log(month);
	    content += '<tr>'
		content += '<td style="text-align: left; padding-top: 10px;">'+ month.payment_type_id +'</td>'
		console.log(month.payment_type)
		content += '<td style="text-align: left; padding-top: 10px;">'+ month.payment_date +'</td>'
		
		//for (let i = 0; i < 12; i++){
			
		//}
		content += '</tr>'
		
	});
	
	//content += '</tr>';
	$(tagid).append(content);
}

$(document).ready(function() {

	var multipleCancelButton = new Choices('#select_year_year', {
	   removeItemButton: true,
	   maxItemCount:5,
	   searchResultLimit:5,
	   renderChoiceLimit:5
	 }); 

	//select user
	$('#select_user_year,#select_user_month').on('change',function(){
		var selected = this.value
		if ($('#select_user_year').val() != selected){
			$('#select_user_year').val(selected).change();
		}
		if ($('#select_user_month').val() !=selected){
			$('#select_user_month').val(selected).change();
		}
	});
	
	
	//Year_state
	
	//Month_state
	$('#select_year_month').on('change',function(){
		var year = this.value
		var user_id = $('#select_user_month').val();
		console.log(year)
		
		$.ajax({
			url: "findBonusByYear",
			method: "POST",
			type: "JSON",
			data: {
					"user_id" : user_id ,
					"year" : year
				},
				success:function(data){
					console.log(data);
					
					//looptable('#looptable_month1',data)
					
					//data.forEach(function(month) {
					//    console.log(month);
					//});

				}
		})
		
	});


});
</script>


</html>