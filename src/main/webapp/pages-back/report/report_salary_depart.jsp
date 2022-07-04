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
			<div class="col-lg-6 col-md-8 col-sm-12">
				<h2>
					<a href="javascript:void(0);"
						class="btn btn-xs btn-link btn-toggle-fullwidth"><i
						class="fa fa-arrow-left"></i></a> รายงาน เงินเดือนแยกตามแผนก
				</h2>
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
							<div class="tab-pane animated fadeIn active" id="Month">
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
											<select id="department" class="form-control">
												<c:forEach var="user" items="${DepartmentId}"
													varStatus="status">
													<option disabled hidden selected="selected">เลือกแผนก</option>
													<option>${user.department_id}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</form>
								<div class="portlet-body">
									<div class="body">
										<div class="table-responsive">
											<table class="table table-hover m-b-0 c_list">
												<thead>
													<tr>
														<th style="text-align: left; width: 30%">เดือน</th>
														<th style="text-align: left; width: 20%">IT</th>
														<th style="text-align: left; width: 10%">สรุปยอดรวม</th>
													</tr>
												</thead>
												<tbody id="get">
													<tr>
														<th id="result"></th>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane animated fadeIn" id="Year">
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
		$(document).ready(function() {
			var multipleCancelButton = new Choices('#department', {
				removeItemButton : true,
				maxItemCount : 4,
				searchResultLimit : 4,
				renderChoiceLimit : 4
			});
			var start = new Date().getFullYear();
			var end = 2000;
			var options = "";
			for (var year = start; end <= year; year--) {
				options += "<option>" + year + "</option>";
			}
			document.getElementById("findYear").innerHTML = options;
			var multipleCancelButton = new Choices('#findYear', {
				removeItemButton : true
			});
			//console.log(user_id);
			$("#department").on('change', function() {
				var find_year = $("#findYear").val();
				var find_department = $("#department").val();
				console.log(find_year);
				console.log(find_department);

				$.ajax({
					url : "findMonth",
					method : "POST",
					type : "JSON",
					data : {
						"findYear" : find_year,
						"department" : find_department,
					},
					success : function(data) {
						var data_list = data;
						console.log(data_list);
						$.each(data_list, function(index, value){
            				$("#result").append(index+1 + ": " + value + '<br>');
        				});
						
					}
				})
			});
		});
	</script>

</body>
</html>
