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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
</head>
<style>
.color-grey 
{
	color: #ced4da;
}
</style>
<body>

	<div class="block-header">
		<div class="row">
			<div class="col-12">
				<h2>
					<a href="javascript:void(0);"
						class="btn btn-xs btn-link btn-toggle-fullwidth"><i
						class="fa fa-arrow-left"></i></a> รายงาน เงินเดือนแยกตามแผนก
				</h2>
				<div style="float:right;">
  					<button class="btn btn-light" type="button"><i class="icon-printer" data-toggle="dropdown"></i></button>
				</div> 
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="page-blank.jsp"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item">รายงาน</li>
					<li class="breadcrumb-item active">รายงาน เงินเดือนแยกตามแผนก</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-lg-12">
			<div class="card">
				<div class="header">
					<h2>รายการสลิปเงินเดือน</h2>
					<div class="portlet-title">
						<div class="header">
							<ul class="header-dropdown nav nav-pills">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#Month">Month</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#Year">Year</a></li>
							</ul>
						</div>
					</div>
					<div class="header">
					<!-- TabMonth and TabYear -->
						<div class="tab-content padding-0">
						<!-- TabMonth -->
							<div class="tab-pane fade show active" id="Month">
									<div class="row">
										<div class="col-sm">
											<select id="findYear" name="find_year" class="form-control">
											</select>
										</div>
										<div class="col-sm">
											<select id="department" placeholder=" " multiple>
												<c:forEach var="user" items="${DepartmentId}"
													varStatus="status">
													<!-- <option disabled hidden selected="selected">เลือกแผนก</option>  -->
													<option selected>${user.department_id}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								<!-- tableMonth -->
								<div class="portlet-body">
									<div class="body">
										<div class="table-responsive">
											<table class="table table-striped" id="getMonth">
												<thead>
													<tr id="columnTableMonth"></tr>
												</thead>
												<tbody id ="bodyTableMonth"></tbody>
												<tfoot id="totalMonth">
												</tfoot>
											</table>
										</div>
									</div>
								</div>
								<!-- EndTableMonth -->
							</div>
							<!-- EndTabMonth -->
							
							<!-- TabYear -->
							<div class="tab-pane fade" id="Year">
								<div class="row">
									<div class="col-sm">
										<select id="multiple_findYear" placeholder=" " multiple>
										</select>
									</div>
									<div class="col-sm">
										<select id="multiple_department" placeholder=" " multiple>
											<c:forEach var="user" items="${DepartmentId}"
												varStatus="status">
												<option selected>${user.department_id}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<!-- tableYear -->
								<div class="portlet-body">
									<div class="body">
										<div class="table-responsive">
											<table class="table table-striped" id="getYear">
												<thead>
													<tr id="columnTableYear"></tr>
												</thead>
												<tbody id ="bodyTableYear"></tbody>
												<tfoot id="totalYear">
												</tfoot>
											</table>
										</div>
									</div>
								</div>
								<!-- EndTableYear -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>

	<!-- Javascript -->
	<script src="pages-back/assets/bundles/vendorscripts.bundle.js"></script>
	<script
		src="pages-back/assets/vendor/table-dragger/table-dragger.min.js"></script>
	<script src="pages-back/assets/bundles/mainscripts.bundle.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script>
		
	</script>
	<script>
	
///////////// generate table month /////////////////
function generate_table_month(department_list){
	const tableBody = document.getElementById('bodyTableMonth');
	const tableColumn = document.getElementById('columnTableMonth');
	const tableFoot = document.getElementById('totalMonth');
	let bodyHtml ='';
	let columnHtml ='';
	let totalHtml='';
	const month=['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม'];
	var depart_num=['SUM'];
	const month_num=['1','2','3','4','5','6','7','8','9','10','11','12','13'];
	
	depart_num = department_list.concat(depart_num);
	
	columnHtml +='<tr><th style="text-align: left; width: 5%">เดือน</th>';
	
	for(let i=0; i<depart_num.length-1; i++){
		columnHtml += '<th style="text-align: right; width: 5%">'+depart_num[i]+'</th>';
	}
	
	columnHtml += '<th style="text-align: right; width: 8%">สรุปยอดรวม</th>';
	
	for(let i=0; i<month.length; i++){
		bodyHtml += '<tr style="text-align: left; width: 5%"><td>'+month[i]+'';

		
		for(let j = 0; j < depart_num.length; j++){
			bodyHtml += '<td class="color-grey '+(j==depart_num.length-1 ? 'text-primary' : '')+' text-right" id="'+month_num[i]+''+depart_num[j]+'">0.00</td>';
		}
		
	}
	totalHtml +='<th style="background: #f7fbff" class="text-primary">ยอดรวม</th>';
	for(let j = 0; j < depart_num.length; j++){
		totalHtml +='<td style="background: #f7fbff" class="text-primary text-right" id="'+month_num[12]+''+depart_num[j]+'">0.00</td>';
	}

	tableBody.innerHTML = bodyHtml;
	tableColumn.innerHTML = columnHtml;
	tableFoot.innerHTML = totalHtml;
}
///////////// generate table month /////////////////

///////////// fill data month /////////////////
function fill_data_month(department_data){
	department_data.forEach(function(depart_data){
		
		let id = Number(depart_data.month)+depart_data.department_id.toUpperCase();
		//console.log(id);
		$('#'+id).removeClass("color-grey");
		$('#'+id).text(numberWithCommas(parseFloat(depart_data.sum_total_pay)));
		
		
		/*if() {
			
		}
		else {
			
		}*/
	});
	
}
///////////// fill data month /////////////////

/*function calAllSalaryDepart(data_amount) {
	data_amount.forEach(function(salary_amount){
		let amount = salary_amount.sum_total_pay;
		console.log(amount);
		
	});
}*/

///////////// generate table year /////////////////
function generate_table_year(year_list,department_list){
	const tableBody = document.getElementById('bodyTableYear');
	const tableColumn = document.getElementById('columnTableYear');
	const tableFoot = document.getElementById('totalYear');
	let bodyHtml ='';
	let columnHtml ='';
	let totalHtml='';
	var depart_num=['SUM'];
	var year_num=[];
	
	depart_num = department_list.concat(depart_num);
	year_num = year_list;
	
	columnHtml +='<tr><th style="text-align: left; width: 5%">ปี</th>';
	
	for(let i=0; i<depart_num.length-1; i++){
		columnHtml += '<th style="text-align: right; width: 5%">'+depart_num[i]+'</th>';
	}
	
	columnHtml += '<th style="text-align: right; width: 8%">สรุปยอดรวม</th>';
	
	for(let i=0; i<year_num.length; i++){
		bodyHtml += '<tr style="text-align: left; width: 5%"><td>'+year_num[i]+'';

		
		for(let j = 0; j < depart_num.length; j++){
			bodyHtml += '<td class="color-grey '+(j==depart_num.length-1 ? 'text-primary' : '')+' text-right" id="'+year_num[i]+''+depart_num[j]+'">0.00</td>';
		}
		
	}
	totalHtml +='<th style="background: #f7fbff" class="text-primary">ยอดรวม</th>';
	for(let j = 0; j < depart_num.length; j++){
		totalHtml +='<td style="background: #f7fbff" class="text-primary text-right" id="9999'+depart_num[j]+'">0.00</td>';
	}

	tableBody.innerHTML = bodyHtml;
	tableColumn.innerHTML = columnHtml;
	tableFoot.innerHTML = totalHtml;
}
///////////// generate table year /////////////////

///////////// fill data year /////////////////
function fill_data_year(department_data){
	department_data.forEach(function(depart_year_data){
		
		let id = Number(depart_year_data.year)+depart_year_data.department_id.toUpperCase();
		//console.log(id);
		$('#'+id).removeClass("color-grey");
		$('#'+id).text(numberWithCommas(parseFloat(depart_year_data.sum_total_pay)));
		
		
		/*if() {
			
		}
		else {
			
		}*/
	});
	
}
///////////// fill data year /////////////////


<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate pattern = "dd MMM yyyy" value = "${data.date}" />

///////////// comma /////////////////
function numberWithCommas(x) {
    return ((x.toFixed(2)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}
///////////// comma /////////////////
	
		$(document).ready(function() {
			var start = new Date().getFullYear();
			var end = 2010;
			var options = '<option selected="selected"><fmt:setLocale value="en_US" scope="session"/><fmt:formatDate pattern = "yyyy" value = "${now}" /></option>';
			for (var year = end; year <= start-1; year++) {
				options += "<option>" + year + "</option>";
			}
			document.getElementById("findYear").innerHTML = options;
			document.getElementById("multiple_findYear").innerHTML = options;
			
			var multipleCancelButton = new Choices('#department', {
				removeItemButton : true,
				maxItemCount : 10,
				searchResultLimit : 5,
			});
			
			var multipleCancelButton = new Choices('#findYear', {
				removeItemButton : false
			});
			
			var multipleCancelButton = new Choices('#multiple_findYear', {
				removeItemButton : true,
				maxItemCount : 20,
				searchResultLimit : 5,
			});
			
			var multipleCancelButton = new Choices('#multiple_department', {
				removeItemButton : true,
				maxItemCount : 20,
				searchResultLimit : 5,
			});

			//console.log(user_id);
			
			///////////// month /////////////////
			var find_year = $("#findYear").val();
			var find_department = $("#department").val();
			//console.log(find_year);
			//console.log(find_department);
			$.ajax({
				url : "findMonth",
				method : "POST",
				type : "JSON",
				data : {
					"findYear" : find_year,
					"department" : find_department.toString(),
				},
				success : function(data) {
					let data_list = data;
					//console.log(data_list);
					generate_table_month(find_department);
					fill_data_month(data_list);
					//calAllSalaryDepart(data_list);
				}
			})
			
			$("#department,#findYear").on('change', function() {
				var find_year = $("#findYear").val();
				var find_department = $("#department").val();
				//console.log(find_year);
				//console.log(find_department);
				$.ajax({
					url : "findMonth",
					method : "POST",
					type : "JSON",
					data : {
						"findYear" : find_year,
						"department" : find_department.toString(),
					},
					success : function(data) {
						let data_list = data;
						//console.log(data_list);
						generate_table_month(find_department);
						fill_data_month(data_list);
						//calAllSalaryDepart(data_list);
					}
				})
			});
			///////////// month /////////////////
			
				///////////// year /////////////////
			var multi_find_year = $("#multiple_findYear").val();
			var multi_find_department = $("#multiple_department").val();
			//console.log(find_year);
			//console.log(find_department);
			$.ajax({
				url : "findYear",
				method : "POST",
				type : "JSON",
				data : {
					"multiple_findYear" : multi_find_year.toString(),
					"multiple_department" : multi_find_department.toString(),
				},
				success : function(data) {
					let data_list = data;
					//console.log(data_list);
					generate_table_year(multi_find_year,multi_find_department);
					fill_data_year(data_list);
					//calAllSalaryDepart(data_list);
				}
			})
				
			$("#multiple_department,#multiple_findYear").on('change', function() {
				var multi_find_year = $("#multiple_findYear").val();
				var multi_find_department = $("#multiple_department").val();
				//console.log(find_year);
				//console.log(find_department);
				$.ajax({
					url : "findYear",
					method : "POST",
					type : "JSON",
					data : {
						"multiple_findYear" : multi_find_year.toString(),
						"multiple_department" : multi_find_department.toString(),
					},
					success : function(data) {
						let data_list = data;
						//console.log(data_list);
						generate_table_year(multi_find_year,multi_find_department);
						fill_data_year(data_list);
						//calAllSalaryDepart(data_list);
					}
				})
			});
				///////////// year /////////////////
		});
	</script>

</body>
</html>
