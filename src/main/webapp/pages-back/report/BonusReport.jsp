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

<link rel="stylesheet"	href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
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

<style type="text/css">
.content_table_style{
	background-color:white;
}
.sum_table{
	color:#4DA1FF;
	background-color:#F7FBFF;
}

.zero_color{
	color: #ced4da;
}

.stick1
{
  min-width: 12vw;
  position:sticky;
  left:0;

}
.stick2
{
  min-width:15vw;
  position:sticky;
  left: 12vw;
}

.t_child {
    min-width: 8vw;
}

.t_child_year {
    min-width: 8vw;
}

.select2-container{
	width: 100% !important;
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
					            	<div class="col-12 col-sm-12 col-lg-6">
									    <select id="select_year_year" class="form-control mr-3"  multiple>	
									    <option selected = "selected" ><%=new java.util.Date().getYear() + 1900%></option>									 
							            <% for(int i = new java.util.Date().getYear() + 1900 - 1 ; i > 2000; i-=1) { %>
										  <option><%=i%></option>
	            						<% } %>
									    </select>
					            	</div>  
					            	<div class="col-12 col-sm-12 col-lg-6">
							            <select id="select_user_year"  type="text" class="form-control select2 mr-3">
							            	<option disabled hidden selected = "selected" >เลือกพนักงาน</option>
								            <c:forEach var="user" items="${Users}" varStatus="status">
									            <c:if test="${user.flag_search=='1'}">
												  <option value="${user.id}">${user.department_id} - ${user.name}</option>
												</c:if>
											</c:forEach>
										</select>          						            	       	
					            	</div>
							</div>
				            
				            <!-- รายได้เพิ่มเติม -->
					       	<div class="row mt-4">

								<div class="col">
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr class="bg-light" id="looptable_year1">						
												</tr>
											</thead>				
											<tbody id="looptable_value_year1">
											
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- รายได้เพิ่มเติม -->
							
							<!-- รายการหัก -->
					       	<div class="row mt-4">

								<div class="col">
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr class="bg-light" id="looptable_year2">
												</tr>
											</thead>
											
											<tbody id="looptable_value_year2">
								
											</tbody>
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
					            	<div class="col-12 col-sm-12 col-lg-6">            	 
							            <select id="select_year_month" class="form-control select2 ml-1">
							            <option selected = "selected" ><%=new java.util.Date().getYear() + 1900%></option>
							            <% for(int i = new java.util.Date().getYear() + 1900-1 ; i > 2000; i-=1) { %>
										  <option><%=i%></option>
	            						<% } %>
										</select>
					            	</div>
					            	
					            	<div class="col-12 col-sm-12 col-lg-6">
							            <select id="select_user_month" type="text" class="form-control select2 mr-3">
							            	<option disabled hidden selected = "selected" >เลือกพนักงาน</option>
								            <c:forEach var="user" items="${Users}" varStatus="status">
									            <c:if test="${user.flag_search=='1'}">
												  <option value="${user.id}">${user.department_id} - ${user.name}</option>
												</c:if>
											</c:forEach>
										</select>
					            	</div>	
							</div>
				            
				            <!-- รายได้เพิ่มเติม -->
					       	<div class="row mt-4">
								<div class="col">
									<div class="table-responsive">
										<div class="sliding">
										<table class="table ">
											<thead>
												<tr class="bg-light">
													<th class="stick1 bg-light">รายได้เพิ่มเติม</th>
													<th class="stick2 bg-light"></th>
													<th class="text-right">Jan</th>
													<th class="t_child text-right">Feb</th>
													<th class="t_child text-right">Mar</th>
													<th class="t_child text-right">Apr</th>
													<th class="t_child text-right">May</th>
													<th class="t_child text-right">Jun</th>
													<th class="t_child text-right">Jul</th>
													<th class="t_child text-right">Aug</th>
													<th class="t_child text-right">Sep</th>
													<th class="t_child text-right">Oct</th>
													<th class="t_child text-right">Nov</th>
													<th class="t_child text-right">Dec</th>
													<th style="min-width: 3vw;"></th>
												</tr>
											</thead>

												<tbody id="looptable_month1">
	
												</tbody>
											
										</table>
										</div>
									</div>	
								</div>
							</div>
							<!-- รายได้เพิ่มเติม -->
							
							<!-- รายการหัก -->
					       	<div class="row mt-4">
								<div class="col">
									<div class="table-responsive">
										<table class="table ">
											<thead>
												<tr class="bg-light">
													<th class="stick1 bg-light">รายการหัก</th>
													<th class="stick2 bg-light"></th>
													<th class="text-right">Jan</th>
													<th class="t_child text-right">Feb</th>
													<th class="t_child text-right">Mar</th>
													<th class="t_child text-right">Apr</th>
													<th class="t_child text-right">May</th>
													<th class="t_child text-right">Jun</th>
													<th class="t_child text-right">Jul</th>
													<th class="t_child text-right">Aug</th>
													<th class="t_child text-right">Sep</th>
													<th class="t_child text-right">Oct</th>
													<th class="t_child text-right">Nov</th>
													<th class="t_child text-right">Dec</th>
													<th style="min-width: 3vw;"></th>
												</tr>
											</thead>
											<tbody id="looptable_month2">
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
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!---------------------------------------------------- multiselect lib ----------------------------------------------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>
<!---------------------------------------------------- multiselect lib ----------------------------------------------->


<!---------------------------------------------------- select 2 lib ----------------------------------------------->
<!-- <script src="pages-back/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script> -->
<!-- <link rel="stylesheet" href="pages-back/assets/global/plugins/select2/css/select2.min.css" type="text/css" />
<script src="pages-back/assets/global/plugins/select2/js/select2.min.js" type="text/javascript"></script>-->
<!-- <script src="pages-back/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" type="text/css" />
<!---------------------------------------------------- select 2 lib ----------------------------------------------->


<script>

/**************************** Define variable ************************/
//////year
const table_name_year = ['#looptable_year1','#looptable_year2','#looptable_value_year1','#looptable_value_year2']
const table_header_content = ['รายได้เพิ่มเติม','รายการหัก']
const table_content_year = []

////// month
const Bonus_names = ["OT1","OT2","OT3","VA","TRAVEL","BONUS","EQUIPMENT","SSI","TAX","TISCO","LATE","ABSENT","ABSENCE","STUDENTLOAN"];
const Bonus_details = ["ล่วงเวลา 1.5 เท่า","ล่วงเวลา 2 เท่า","ล่วงเวลา 3 เท่า","เบี้ยขยัน","เบิกค่าเดินทาง","โบนัส","เบิกค่าอุปกรณ์","ประกันสังคม","ภาษีหัก ณ ที่จ่าย","กองทุนสำรองเลี้ยงชีพ","มาสาย","ขาดงาน","ลาไม่รับค่าจ้าง","กยศ."];
const table_name = ['#looptable_month1','#looptable_month2'];


/****************************** Method ***********************************/

/************************************************** year *******************************************/
function generate_year_table(){
	
	for (let i = 0 ; i < 14 ; i++){
		table_content_year.push('<td class="stick1 content_table_style">'+Bonus_names[i]+'</td><td class="stick2 content_table_style">'+Bonus_details[i]+'</td>')
	}
	let year_now =  $('#select_year_year').val();
	fetch_year_table();
	append_year_table(year_now);

}

function append_year_table(year_array){
	
		for (let i = 0 ; i < 2 ; i++){	
	
			let header_content = '<th class="stick1 bg-light" style="width:15%">'+table_header_content[i]+'</th><th class="stick2 bg-light" style="width:45%"></th>'
			
			year_array.forEach(function(obj) {
				//console.log()
				header_content += '<th class="t_child_year text-right" style="width:8%">'+obj+'</th>'
			});
			
			header_content += '<th style="width:5%"></th>'
			$(table_name_year[i]).append(header_content)
			
			let content = "";
			for (let j = (0 + 7*i) ; j < (7 + 7*i) ; j++){
				content += '<tr>'+table_content_year[j]
				year_array.forEach(function(obj) {
					content += '<td class="t_child_year text-right zero_color" id='+Bonus_names[j]+obj+'>0.00</td>'
				});
				content += '<td></td></tr>'
			}
			content += generate_sum_year_table(i,year_array);
			$(table_name_year[i+2]).append(content)
		}
}

function generate_sum_year_table(table_number,year_array){ // (month or year , top or bottom)
	let content = '<tr class="sum_table">';
	
	content += '<td class="stick1 sum_table">สรุปยอดรวม</td><td class="stick2 sum_table"></td>'
		for (let i = 0 ; i < year_array.length ; i++){
			content += '<td class="text-right" id="SUM'+table_number+'_year_'+year_array[i]+'">0.00</td>'
		}
	content += '<td></td></tr>'
	return content
}

function fetch_year_table(){
	var all_tag = table_name_year
	all_tag.push("SUM0_year_","SUM1_year_")
	all_tag.forEach(function(tagname) {
		$(tagname).empty();
	});
}

function assign_year_data(data){
	data.forEach(function(data_) {
		let amount = numberWithCommas(parseFloat(data_.amount))
		if (data_.payment_type_id == "SUM0" || data_.payment_type_id == "SUM1"){
			let tag_id = data_.payment_type_id.toUpperCase()+'_'+'year'+'_'+ Number(data_.payment_year)
			$('#'+tag_id).text(amount)//.removeClass(amount==0? '':'zero_color');
		}
		else{
			let tag_id = data_.payment_type_id.toUpperCase() + Number(data_.payment_year)
			$('#' + tag_id).text(amount).removeClass(amount=="0.00"? '':'zero_color');
		}
	});
}

/************************************************** month ***********************************************/

function generate_month_table(){
	for (let k = 0 ; k < 2 ; k++){
		let content = "";
		for (let i = (0 + 7*k) ; i < (7 + 7*k) ; i++){
			content += '<tr>';
			content += '<td class="stick1 content_table_style" style="width:15%">'+Bonus_names[i]+'</td><td class="stick2 content_table_style" style="width:15%">'+Bonus_details[i]+'</td>';
				for (let j = 1 ; j < 13 ; j++){
					content += '<td class="text-right zero_color" id="'+Bonus_names[i]+j.toString()+'">0.00</td>';
				}
			content += '<td></td></tr>';
			
		}
		content += generate_sum_month_table(k);
		$(table_name[k]).append(content);
	}
}

function generate_sum_month_table(table_number){ // (month or year , top or bottom)
	let content = '<tr class="sum_table">';
	
	content += '<td class="stick1 sum_table">สรุปยอดรวม</td><td class="stick2 sum_table"></td>'
		for (let i = 1 ; i < 13 ; i++){
			content += '<td class="text-right" id="SUM'+table_number+'_month_'+i.toString()+'">0.00</td>'
		}
	content += '<td ></td></tr>'
	return content
}

function fetch_month_table(){
	var all_tag = Bonus_names;
	all_tag.push("SUM0_month_","SUM1_month_")
	all_tag.forEach(function(tagname) {
		for (var i = 1 ; i < 13 ; i++){
			tag = tagname+i.toString()
			$('#'+tag).text('0.00')
			if (!(tagname == "SUM0_month_" || tagname == "SUM1_month_")){
				$('#'+tag).addClass('zero_color')
			}
		}
	});
}

function assign_month_data(data){
	data.forEach(function(data_) {
		let amount_ = numberWithCommas(parseFloat(data_.amount))
		if (data_.payment_type_id == "SUM0" || data_.payment_type_id == "SUM1"){
			let tag_id = data_.payment_type_id.toUpperCase()+'_'+'month'+'_'+ Number(data_.payment_month)
			$('#'+tag_id).text(amount_)
		}else{
			let tag_id = data_.payment_type_id.toUpperCase() + Number(data_.payment_month)
			$('#' + tag_id).text(amount_).removeClass(amount_=="0.00"? '':'zero_color')
		}
	});
}


//////////////////////////////// orther method //////////////////////////////

function numberWithCommas(x) {
    return ((x.toFixed(2)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}

/************************************************* ready ********************************************/
$(document).ready(function() {
	
	generate_month_table();  //generate month_table
	generate_year_table();	//generate year_table
	
	$('#select_year_month').select2();
	
	var multipleButton = new Choices('#select_year_year', {
	   removeItemButton: true,
	   maxItemCount:10,
	   searchResultLimit:10,
	   //renderChoiceLimit:30
	 }); 
	
	
	//sync 2 select user box
	$('#select_user_year,#select_user_month').select2().on('change',function(){
		var selected = this.value
		
		if ($('#select_user_year').val() != selected){
			$('#select_user_year').val(selected).change();
		}
		if ($('#select_user_month').val() !=selected){
			$('#select_user_month').val(selected).change();
		}

	});
	
	
	////////////////////////////////////// Year_state ///////////////////////////////////
	$('#select_user_year,#select_year_year').on('change',function(){
		let year = $('#select_year_year').val();
		let user_id = $('#select_user_year').val();
			
		$.ajax({
			url: "findBonusByMultipleYear",
			method: "POST",
			type: "JSON",
			data: {
					"user_id" : user_id ,
					"year" : year.join(','),
				},
				success:function(data){
					console.log(data);
					
					fetch_year_table();
					append_year_table(year);
					assign_year_data(data);
				}
			})
		
	});

	////////////////////////////////////// Month_state ///////////////////////////////////
	$('#select_user_month,#select_year_month').on('change',function(){
		let year = $('#select_year_month').val();
		let user_id = $('#select_user_month').val();
			//console.log('im here')
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
					
					fetch_month_table();
					assign_month_data(data);
				}
			})
	});

});
</script>


</html>