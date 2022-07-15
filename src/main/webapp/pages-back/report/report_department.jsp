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
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />
</head>
<body>

	<div class="block-header">
		<div class="row">
			<div class="col-12">
				<h2>
					<a href="javascript:void(0);"
						class="btn btn-xs btn-link btn-toggle-fullwidth"><i
						class="fa fa-arrow-left"></i></a> Department Statistics
				</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="page-blank.jsp"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item">รายงาน</li>
					<li class="breadcrumb-item active">Department Statistics</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-lg-12">
			<div class="card">
				<div class="header">
					<h2>Department Statistics</h2>
					<div class="header">
						<div class="header-dropdown">
							<div class="input-group">
								<input type="text" data-provide="datepicker"
									data-date-format="yyyy" data-date-start-view="years"
									data-date-min-view-mode="years" class="form-control" data-date-orientation="bottom"
									id="year_pick" data-date-autoclose="true" onChange="yearPick()"
									value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value = "${now}"
									type = "both" timeStyle = "medium" pattern="yyyy "/>">
								<div class="input-group-append">
									<span class="input-group-text" style="font-size: 12px"><i
										class="fa fa-calendar-o"></i> </span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="body">
					<canvas id="myChart" width="1500" height="600"></canvas>
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

	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	
<script>
var pick_year = $("#year_pick").val();
console.log(pick_year);
$.ajax({
	url : "pickDataMonth",
	method : "POST",
	type : "JSON",
	data : {
		"year_pick" : pick_year,
	},
	success : function(data) {
	}
})

function yearPick(){
	var pick_year = $("#year_pick").val();
	console.log(pick_year);
	$.ajax({
		url : "pickDataMonth",
		method : "POST",
		type : "JSON",
		data : {
			"year_pick" : pick_year,
		},
		success : function(data) {
		}
	})
}

$(document).ready(function() {
	var xValues = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
	new Chart("myChart", {
  	type: "line",
  	data: {
    		labels: xValues,
    		datasets: [{ 
    		label: "AE",
      		data: [2500,4423,5260,22000,22200,4123,7897,24589,43232,35234,9900,12300],
      		borderColor: "#77A7FF",
      		backgroundColor: "#77A7FF",
      		fill: false
    	}, { 
    		label: "IT",
      		data: [3000,50000,32342,40000,42000,30000,76890,40000,48789,49898,42341,46756],
      		borderColor: "#38B8EA",
      		backgroundColor: "#38B8EA",
      		fill: false
    	}, { 
    		label: "IN",
      		data: [0,0,0,5000,7200,0,0,0,0,0,0,0],
      		borderColor: "#007BFF",
      		backgroundColor: "#007BFF",
      		fill: false
    	}]
  	},
  	options: {
    	legend: {display: true}
  	}
	});
	
});
</script>

</body>
</html>
