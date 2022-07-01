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
							<form id="frmSearch" action="actual_work" method="post">
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
													value="<fmt:formatDate value="" pattern="yyyy-mm-dd" />"
													class="form-control" style="width: 100%;">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">ถึงวันที่</label>
												<input data-provide="datepicker" data-date-autoclose="true"
													data-date-format="yyyy-mm-dd" name="endDate" id="endDate"
													value="<fmt:formatDate value="" pattern="yyyy-mm-dd" />"
													class="form-control" style="width: 100%;">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<button type="button" class="btn btn-sm btn-info"
													id="searchbutton" style="margin-top: 28px;"
													onclick="search()">
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
												<input type="text" name="emp_type" id="emp_type"
													class="form-control input-lg"
													value="<c:out value="${WorkingSummary[0].name}"/> "
													style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">ประเภทการจ่าย</label>
												<input type="text" name="payment" id="payment"
													class="form-control input-lg"
													value="${WorkingSummary[0].payment}" style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">งวดการจ่ายเงิน</label>
												<input type="text" name="term" id="term"
													class="form-control input-lg"
													value="${WorkingSummary[0].term}" style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">จำนวนวันต่อวงด</label>
												<input type="text" name="term_day" id="term_day"
													class="form-control input-lg"
													value="${WorkingSummary[0].term_day}" style="width: 100%">
											</div>
										</div>
									</div>
									<div class="alert alert-primary" role="alert">ผลการค้นหา</div>
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">Count_Working วันที่มาทำงาน</label>
												<input type="text" name="count_working" id="count_working"
													class="form-control input-lg"
													value="${WorkingSummary[0].sum_emp_working }"
													style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">Function_Actual วันทำงานตามประเภท</label>
												<input type="text" name="count_actual" id="count_actual"
													class="form-control input-lg"
													value="${WorkingSummary[0].actual_working_day }"
													style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">Function_Absent วันขาดงาน</label>
												<input type="text" name="count_absent" id="count_absent"
													class="form-control input-lg"
													value="${WorkingSummary[0].sum_emp_absent }"
													style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">Sum_Working ชั่วโมงทำงาน</label>
												<input type="text" name="count_working_hr"
													id="count_working_hr" class="form-control input-lg"
													value="${WorkingSummary[0].sum_emp_working_hr}"
													style="width: 100%">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label">วันทำงานต่อเดือน</label>
												<input type="text" name="count_working_hr"
													id="count_working_hr" class="form-control input-lg"
													value="${WorkingSummary[0].actual_working_per_month}"
													style="width: 100%">
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
<div class="row clearfix">
	<div class="col-lg-12">
		<div class="card">
			<div class="body">
				<div class="portlet light bordered">
					<div class="portlet-body">
						<!-- BEGIN FORM-->
						<div class="portlet box white">
							<div class="table-responsive">
								<table
									class="table table-hover js-basic-example table-custom m-b-0 no-footer ">
									<thead>
										<tr>
											<th style="text-align: left; width: 10%">พนักงาน</th>
											<th style="text-align: left; width: 15%">Date</th>
											<th style="text-align: left; width: 20%">Event</th>
											<th style="text-align: left; width: 20%">Check in</th>
											<th style="text-align: left; width: 20%">Check out</th>
											<th style="text-align: left; width: 20%">ชั่วโมงการทำงานจริง</th>
											<th style="text-align: center; width: 5%"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${WorkingList}">
											<c:choose>
												<c:when test="${row.isAbsent == '1' }">
													<c:set var="bcolor" value="#f7bebe" />
												</c:when>
												<c:otherwise>
													<c:set var="bcolor" value="" />
												</c:otherwise>
											</c:choose>
											<tr style="background-color: ${bcolor}">
												<td style="text-align: left; padding-left: 20px">${row.user}</td>
												<c:choose>
													<c:when
														test="${row.dayname == 'Saturday' || row.dayname == 'Sunday'}">
														<td
															style="text-align: left; padding-top: 10px; color: red"><fmt:formatDate
																value="${row.cdate}" pattern="EE dd/MM/yyyy" /></td>
													</c:when>
													<c:otherwise>
														<td style="text-align: left; padding-top: 10px;"><fmt:formatDate
																value="${row.cdate}" pattern="EE dd/MM/yyyy" /></td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${row.holiday != null }">
														<td style="text-align: left; padding-top: 10px;">${row.holiday}</td>
													</c:when>
													<c:otherwise>
														<td style="text-align: left; padding-top: 10px;">${row.leave_type}</td>
													</c:otherwise>
												</c:choose>
												<td style="padding-top: 10px;"><fmt:formatDate
														value="${row.cin}" pattern="HH:mm" /></td>
												<td style="padding-top: 10px;"><fmt:formatDate
														value="${row.cout}" pattern="HH:mm" /></td>
												<td style="text-align: left; padding-top: 10px;">${row.wk_hr}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END FORM-->
				</div>
			</div>
		</div>
	</div>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var dstartDate = "2022-06-01";
		var dendDate = "2022-06-30";

		var userId = "${WorkingSummary[0].id}";
		if (userId != null) {
			$("#userId").val(userId);
		}

		var startDate = "${WorkingSummary[0].start_date}";
		if (startDate != null) {
			$("#startDate").val(startDate);
		} else {
			//set defualt
			$("#startDate").val(dstartDate);
		}
		var endDate = "${WorkingSummary[0].end_date}";
		if (endDate != null) {
			$("#endDate").val(endDate);
		} else {
			//set defualt
			$("#endDate").val(dendDate);
		}

	});

	function search() {
		var userId = $("#userId").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();

		if (startDate == "") {
			swal("กรุณาระบุวันที่เริ่ม", "Please Try It Agian :)", "error");
			return false;
		}
		if (endDate == "") {
			swal("กรุณาระบุวันที่สิ้นสุด", "Please Try It Agian :)", "error");
			return false;
		}

		var form = $("#frmSearch").submit();
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
