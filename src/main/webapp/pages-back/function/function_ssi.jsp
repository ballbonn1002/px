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
.text {
	background: #f7fbff;
}
.right {
	display: flex;
  	justify-content: right;
  	align-items: center;
}
</style>
<body>

	<div class="block-header">
		<div class="row">
			<div class="col-lg-6 col-md-8 col-sm-12">
				<h2>
					<a href="javascript:void(0);"
						class="btn btn-xs btn-link btn-toggle-fullwidth"><i
						class="fa fa-arrow-left"></i></a> Function
				</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="page-blank.jsp"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item">Function</li>
					<li class="breadcrumb-item active">SSI - ประกันสังคม</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-lg-6 col-md-12 col-sm">
			<div class="card">
				<div class="header">
					<form action="findData" method="POST">
						<h2>SSI - ประกันสังคม</h2>
						<br> <br>
						<!-- choose inform -->
						<div class="container">
							<div class="row">
								<div class="col-sm">
									<label>พนักงาน</label> <select class="form-control"
										id="user_id_ssi">
										<option disabled hidden selected = "selected" >เลือก</option>
										<c:forEach var="user" items="${UserSocialSecurity}"
											varStatus="status">
											<option>${user.id}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm">
									<label>ประกันสังคม (%)</label> <input type="text"
										placeholder="0" class="form-control" id="input_percent"></input>
								</div>
							</div>
						</div>
						<br> <br>
						<!-- button -->
						<div class="container">
							<div class="row">
								<div class="right col-sm">
									<button class="btn btn-info" hidden type=button id=cal_user_ssi>คำนวณ</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- show social security -->
				<div class="container">
					<div class="header">
						<p class="text text-primary pl-3 py-2">ดึงข้อมูล</p>

						<div class="row">
							<div class="col-sm">
								<p class="pl-3">สิทธิ์ประกันสังคม</p>
							</div>
							<div class="col-sm">
								<p class="pl-3" id="social_secure">-</p>
							</div>
						</div>
						<!-- show salary -->
						<div class="row">
							<div class="col-sm">
								<p class="pl-3">salary</p>
							</div>
							<div class="col-sm">
								<p id="ssi_value" class="pl-3">-</p>
							</div>
							<div style="display: none;" id="hiddenText">
										<p id="ssi_value2" class="pl-3">-</p>
									</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="header">
						<p class="text text-primary pl-3 py-2">ผลการคำนวณ</p>

						<div class="row">
							<div class="col-sm">
								<p class="pl-3">คำนวณประกันสังคม</p>
							</div>
							<!-- show calculate -->
							<div class="col-sm">
									<p id="cal_ssi" class="text-primary pl-3">-</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	
	function numberWithCommas(x) {
    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	<!--ให้ user_id ยังอยู่-->
	$(document).ready(function(){
		$("#user_id_ssi").on('change',function(){
			var user_id = $("#user_id_ssi").val();
			//console.log(user_id);
 	
        	$.ajax({
                url: "findData",
                method: "POST",
                type: "JSON",
                data: {
                        "user_id_ssi" : user_id ,
                    },
                    success:function(data){
                    	if(data.social_security == 1){
                    		$("#social_secure").text("ขึ้นสิทธิ์ประกันสังคม");
                    		$("#ssi_value").text(numberWithCommas(data.amount));
                    		$("#ssi_value2").text(data.amount);
                    		$("#cal_user_ssi").prop("hidden",false);
                        	//console.log(data.social_security);
                    	}
                    	else {
                    		$("#social_secure").text("ไม่ขึ้นสิทธิ์ประกันสังคม");
                    		$("#ssi_value").text("-");
                    		$("#cal_ssi").text("-");
                    		$("#cal_user_ssi").prop("hidden",true);
                    	}
                    }
            })
		});
		
		$("#cal_user_ssi").click(function(){
			
			var percent = $("#input_percent").val();
			var salary = $("#ssi_value2").text().trim();
			console.log(percent);
			console.log(salary);
			
			$.ajax({
                url: "calData",
                method: "POST",
                type: "JSON",
                data: {
                        "input_percent" : percent ,
                        "ssi_value2" : salary ,
                    },
                    success:function(data){
                    	$("#cal_ssi").text(numberWithCommas(data));
                    }
            })
		});
	});
	</script>
</body>
</html>
