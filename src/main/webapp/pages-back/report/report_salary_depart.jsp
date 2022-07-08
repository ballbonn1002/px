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
						<div class="tab-content padding-0">
							<div class="tab-pane fade show active" id="Month">
								<form action="findMonth" method="POST">
									<div class="row">
										<div class="col-sm">
											<select id="findYear" name="find_year" class="form-control">
												<c:forEach var="user" items="${FindYearSalary}"
													varStatus="status">
													<option disabled hidden selected="selected">select</option>
													<option>${user.year}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-sm">
										<select id="department" placeholder="แผนก" multiple>
											<c:forEach var="user" items="${DepartmentId}"
												varStatus="status">
												<!-- <option disabled hidden selected="selected">เลือกแผนก</option>  -->
												<option>${user.department_id}</option>
											</c:forEach>
										</select>
									</div>
									</div>
								</form>
								<div class="portlet-body">
									<div class="body">
										<div class="table-responsive">
											<table class="table m-b-0" id="get">
												<thead>
													<tr id="columnTable"></tr>
												</thead>
												<tbody id ="bodyTable"></tbody>
												<tfoot id="total">
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="Year">
								<div class="row">
									<div class="col-sm">
										<select id="choices-multiple-remove-button"
											placeholder="เลือกแผนก" multiple>
											<c:forEach var="user" items="${DepartmentId}"
												varStatus="status">
												<option>${user.department_id}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm">
										<select id="department"
											placeholder="เลือกแผนก" multiple>
											<c:forEach var="user" items="${DepartmentId}"
												varStatus="status">
												<option>${user.department_id}</option>
											</c:forEach>
										</select>
									</div>
								</div>
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

function generate_table_month(department_list){
	const tableBody = document.getElementById('bodyTable');
	const tableColumn = document.getElementById('columnTable');
	const tableFoot = document.getElementById('total');
	let bodyHtml ='';
	let columnHtml ='';
	let totalHtml='';
	const month=['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม'];
	var depart_num=['sum'];
	const month_num=['1','2','3','4','5','6','7','8','9','10','11','12','13'];
	
	depart_num = department_list.concat(depart_num);
	
	columnHtml +='<tr><th style="text-align: left; width: 5%">เดือน</th>';
	
	for(let i=0; i<depart_num.length-1; i++){
		columnHtml += '<th style="text-align: left; width: 5%">'+depart_num[i]+'</th>';
	}
	
	columnHtml += '<th style="text-align: left; width: 8%">สรุปยอดรวม</th>';
	
	for(let i=0; i<month.length; i++){
		bodyHtml += '<tr><td>'+month[i]+'';

		
		for(let j = 0; j < depart_num.length; j++){
			bodyHtml += '<td class="'+(j==depart_num.length-1 ? 'text-primary' : '')+'" id="'+month_num[i]+''+depart_num[j]+'">0.00</td>';
		}
		
	}
	totalHtml +='<th>ยอดรวม</th>';
	for(let j = 0; j < depart_num.length; j++){
		totalHtml +='<td class="text-primary" id="'+month_num[12]+''+depart_num[j]+'">0.00</td>';
	}

	tableBody.innerHTML = bodyHtml;
	tableColumn.innerHTML = columnHtml;
	tableFoot.innerHTML = totalHtml;
}

function fill_data(department_data){
	department_data.forEach(function(depart_data){
		
		let id = Number(depart_data.month)+depart_data.department_id.toUpperCase();
		console.log(id);
		$('#'+id).text(numberWithCommas(parseFloat(depart_data.sum_total_pay)));
		
		
		/*if() {
			
		}
		else {
			
		}*/
	});
	
}

function numberWithCommas(x) {
    return ((x.toFixed(2)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}
	
		$(document).ready(function() {
			var multipleCancelButton = new Choices('#department', {
				removeItemButton : true,
				maxItemCount : 10,
				searchResultLimit : 2,
				renderChoiceLimit : 9
			});
			var start = new Date().getFullYear();
			var end = 2010;
			var options = "";
			for (var year = start; end <= year; year--) {
				options += "<option>" + year + "</option>";
			}
			document.getElementById("findYear").innerHTML = options;
			var multipleCancelButton = new Choices('#findYear', {
				removeItemButton : false
			});
			
			
			
			//console.log(user_id);
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
						console.log(data_list);
						generate_table_month(find_department);
						fill_data(data_list);
					}
				})
			});
		});
	</script>

</body>
</html>
