<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href="pages-back/assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

<style type="text/css">
/* class สำหรับแถวแรกของรายละเอียด */
.tr_odd {
	background-color: #F8F8F8;
}
/* class สำหรับแถวสองของรายละเอียด */
.tr_even {
	background-color: #F2F2F2;
}

.payment-table th {
	border-bottom: #2898CB solid 1px !important;
	border-top: none !important;
}

.payment-table td {
	border-bottom: #EBEDF3 solid 1px !important;
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
					class="btn btn-xs btn-link btn-toggle-fullwidth"> <i
					class="fa fa-arrow-left"> </i>
				</a>รายจ่ายเงินเดือน
			</h2>
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="page.blank"><i
						class="icon-home"></i> </a></li>
				<li class="breadcrumb-item">รายจ่ายเงินเดือน</li>
				<li class="breadcrumb-item active">แก้ไขรายการจ่ายเงินเดือน</li>
			</ul>
		</div>
		<div
			class="col d-flex flex-column flex-sm-column flex-lg-row align-items-lg-center justify-content-lg-end">
			<span class="tag badge badge-info"
				style="color: #449cff; border-color: #449cff; padding: 10px 18px; font-size: 14px; background-color: white;">inprogress
			</span>

		</div>
	</div>
</div>

<div class="row clearfix">
	<div class="col-lg-12">
		<div class="card">
			<div class="body">

				<div class="portlet light bordered">
					<div class="portlet-title" style="padding-bottom: 10px;">
						<div class="col-12">
							<div
								class="caption d-flex flex-column flex-sm-column flex-lg-row justify-content-lg-between">
								<div class = "d-flex justify-content-center">
								<span style="font-weight: bold; font-size: 20px"
									class="caption-subject font-red sbold uppercase float-left m-auto">Payroll
									ID</span> <span class="caption-helper font-red"> <%-- ${role.name} --%>
								</span>
								</div>
								<div
									class="float-right d-inline-flex flex-column justify-content-center flex-sm-column flex-lg-row">
									<button
										class="tag badge badge-info mx-0 my-1 my-sm-1 mx-sm-0 mx-sm-0 mx-lg-1 my-lg-1"
										style="color: #E7505A; border-color: #E7505A; font-size: 14px; padding: 10px 18px">ยกเลิกรายการ</button>
									<select
										class="form-control mx-0 my-1 mx-sm-0 my-sm-1 mx-sm-0 mx-lg-1">
										<option value="Mr.">สถานะทั้งหมด</option>
										<option value="Mrs.">....</option>
										<option value="Ms.">....</option>
									</select>
									<button
										class="tag badge badge-info mx-0 my-1 my-sm-1 mx-sm-0 mx-sm-0 mx-lg-1 my-lg-1"
										style="color: #9A9999; border-color: #9A9999; font-size: 14px; padding: 10px 18px;">ยืนยันรายการเงินเดือน</button>
									<button
										class="tag badge badge-info mx-0 my-1 my-sm-1 mx-sm-0 mx-sm-0 mx-lg-1 my-lg-1"
										style="color: #9A9999; border-color: #9A9999; font-size: 14px; padding: 10px 18px;">ปริ้น</button>
								</div>
							</div>
						</div>
					</div>
					<div class="portlet-body" style="margin-top: 20px">
						<form>
							<div class="container">
								<div class="row">
									<div class="col-12">
										<div
											class="d-flex flex-column flex-sm-column flex-lg-row justify-content-between">
											<div
												class="d-flex flex-column flex-sm-column flex-lg-row align-items-center">
												<div
													class="d-flex flex-column align-items-center align-items-sm-center align-items-lg-end">
													<p class="mb-0">รวมค่าใช้จ่ายพนักงาน</p>
													<h2 style="color: #333333;">45,500.00</h2>
												</div>
												<div class="d-none d-sm-none d-lg-block"
													style="width: 1px; height: 60px; background: #EBEDF3; margin: 16px"></div>
												<div
													class="d-flex flex-column align-items-center align-items-sm-center align-items-lg-end">
													<p class="mb-0">รวมจ่ายสุทธิ</p>
													<h2 style="color: #2898CB";>43,591.70</h2>
												</div>
												<div class="d-none d-sm-none d-lg-block"
													style="width: 1px; height: 60px; background: #EBEDF3; margin: 16px"></div>
												<div
													class="d-flex flex-column align-items-center align-items-sm-center align-items-lg-end">
													<p class="mb-0">รวมรายการหัก</p>
													<h2 style="color: #E7505A;">1,500.00</h2>
												</div>
											</div>
											<div class="mt-auto">
												<p>Created: 25 April 2022</p>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<input class="form-control" value="Payroll April 2022"
												style="color: #449CFF;" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-6 col-sm-6 col-lg-3 ">
										<label>ช่วงวันที่</label>
										<div class="form-group">
											<input data-provide="datepicker" data-date-autoclose="true"
												data-date-format="dd-mm-yyyy" name="bday"
												value="<fmt:formatDate value="" pattern=" dd-MM-yyyy" />"
												class="form-control">
										</div>
									</div>
									<div class="col-6 col-sm-6 col-lg-3 ">
										<label>ถึงวันที่</label>
										<div class="form-group">
											<input data-provide="datepicker" data-date-autoclose="true"
												data-date-format="dd-mm-yyyy" name="bday"
												value="<fmt:formatDate value="" pattern=" dd-MM-yyyy" />"
												class="form-control">
										</div>
									</div>
									<div class="col-6 col-sm-6 col-lg-3 ">
										<label>วันที่ชำระ</label>
										<div class="form-group">
											<input data-provide="datepicker" data-date-autoclose="true"
												data-date-format="dd-mm-yyyy" name="bday"
												value="<fmt:formatDate value="" pattern=" dd-MM-yyyy" />"
												class="form-control">
										</div>
									</div>
									<div class="col-6 col-sm-6 col-lg-3 ">
										<label>ประกันสังคม</label>
										<div class="input-group mb-3">
											<input type="text" class="form-control" value="5"
												aria-describedby="basic-addon2">
											<div class="input-group-append">
												<span class="input-group-text" id="basic-addon2"
													style="font-size: 14px; background-color: white">%</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<label>หมายเหตุ</label>
										<div class="form-group">
											<input class="form-control"
												value="ทำเงินเดือนวันที่ 25/4/2022" />
										</div>
									</div>
								</div>
								<div class="clearfix mt-1 mb-1">
									<button type="button" class="btn btn-success  float-lg-right m-2">บันทึกรายการ</button>
									<button type="button" class="btn btn-light  float-lg-right m-2">ยกเลิก</button>
								</div>
							</div>
						</form>
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
				<div class="table-responsive">
					<div class="dataTables_wrapper dt-bootstrap4">
						<div class="row">
							<div class="col-12 col-sm-12 col-lg-6">
								
								<div
									class="d-flex flex-column justify-content-center flex-sm-column flex-lg-row">
									<button
										class="tag badge badge-info mx-0 my-1 my-sm-1 mx-sm-0 mx-sm-0 mx-lg-1 my-lg-1"
										style="color: #333333; border-color: #333333; font-size: 14px; padding: 10px 18px">แก้ไขพนักงาน</button>
									<select
										class="form-control mx-0 my-1 mx-sm-0 my-sm-1 mx-sm-0 mx-lg-1">
										<option value="Mr.">สถานะทั้งหมด</option>
										<option value="Mrs.">....</option>
										<option value="Ms.">....</option>
									</select>
								</div>
								
							</div>
							<div class="col-12 col-sm-12 col-lg-6 my-3">
								<div
									class="d-flex flex-column flex-sm-column flex-lg-row justify-content-center justify-content-sm-center justify-content-lg-end align-items-center align-items-sm-center align-items-lg-center">
									<div
										class="d-flex align-items-center flex-column flex-sm-column flex-lg-row">
										<p style="margin-bottom: 0px;">รอดำเนินการ&nbsp;&nbsp;</p>
										<h3 style="color: #333333;">2</h3>
									</div>
									<div class="d-none d-sm-none d-lg-block"
										style="width: 1px; height: 40px; background: #EBEDF3 0% 0% no-repeat padding-box; margin: 16px"></div>
									<div
										class="d-flex align-items-center flex-column flex-sm-column flex-lg-row">
										<p style="margin-bottom: 0px;">รอชำระเงิน&nbsp;&nbsp;</p>
										<h3 style="color: #333333;">0</h3>
									</div>
									<div class="d-none d-sm-none d-lg-block"
										style="width: 1px; height: 40px; background: #EBEDF3 0% 0% no-repeat padding-box; margin: 16px"></div>
									<div
										class="d-flex align-items-center flex-column flex-sm-column flex-lg-row">
										<p style="margin-bottom: 0px;">ยืนยัน&nbsp;&nbsp;</p>
										<h3 style="color: #333333;">1</h3>
									</div>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col-12">
								<table
									class="table table-bordered table-hover table-striped dataTable"
									id="list_example">
									<thead class="thead-dark">
										<tr>
											<th class="details-control"></th>
											<th class="sorting_asc" style="text-align: right">ลำดับ</th>
											<th class="sorting" style="text-align: left; width: 17%">พนักงาน</th>
											<th class="sorting" style="text-align: center; width: 14%">Employee
												type</th>
											<th class="sorting" style="text-align: left; width: 10%">วันทำงาน</th>
											<th class="sorting" style="text-align: right; width: 10%">เงินเดือน</th>
											<th class="sorting" style="text-align: left; width: 13%">รายได้
												เพิ่มเติม</th>
											<th class="sorting" style="text-align: center; width: 10%">รายการหัก</th>
											<th class="sorting" style="text-align: right; width: 10%">รายได้สุทธิ</th>
											<th class="sorting" style="text-align: right; width: 7%">สถานะ</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<!--<td style="display:none">${paymentgl.time_create}</td>-->
											<td class="dt-control" style="padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;">1</td>
											<td style="text-align: left; padding-top: 10px;">A101
												นางสาวสีรุ้ง ไทยสา</td>
											<td style="text-align: center; padding-top: 10px;">พนักงานประจำ</td>
											<td style="text-align: center; padding-top: 10px;">30/30</td>
											<td style="text-align: center; padding-top: 10px;">15,000.00</td>
											<td style="text-align: center; padding-top: 10px;">0.00</td>
											<td style="text-align: center; padding-top: 10px;">750.00</td>
											<td style="text-align: center; padding-top: 10px;">14,250.00</td>
											<td style="text-align: center; padding-top: 10px;">ยืนยัน</td>
										</tr>
										<tr>
											<!--<td style="display:none">${paymentgl.time_create}</td>-->
											<td class="dt-control" style="padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;">2</td>
											<td style="text-align: left; padding-top: 10px;">A102
												นาย ภูริวัฒน์ แท่งทิพย์</td>
											<td style="text-align: center; padding-top: 10px;">พนักงานอัตราจ้าง</td>
											<td style="text-align: center; padding-top: 10px;">22/22</td>
											<td style="text-align: center; padding-top: 10px;">25,000.00</td>
											<td style="text-align: center; padding-top: 10px;">1,500.00</td>
											<td style="text-align: center; padding-top: 10px;">750.00</td>
											<td style="text-align: center; padding-top: 10px;">25,750.00</td>
											<td style="text-align: center; padding-top: 10px;">รอตรวจสอบ</td>
										</tr>
									</tbody>
								</table>
							</div>
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
					<div class="portlet-title">
						<div class="caption">
							<span style="font-weight: bold; font-size: 20px"
								class="caption-subject font-red sbold uppercase">payment
								summary</span> <span class="caption-helper font-red"> </span>
						</div>
					</div>
					<div class="portlet-body">
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6 col-sm-12">
									<div class="table-responsive">
										<table class="table payment-table">
											<thead>
												<tr>
													<th class style="text-align: left; width: 25%">รายได้</th>
													<th class style="text-align: left; width: 50%"></th>
													<th class
														style="text-align: right; width: 25%; color: #449CFF;">45,500.00</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td style="text-align: left; padding-top: 10px;">SL</td>
													<td style="text-align: left; padding-top: 10px;">เงินเดือน</td>
													<td style="text-align: right; padding-top: 10px;">45,000.00</td>
												</tr>
												<tr>
													<td style="text-align: left; padding-top: 10px;">OT1</td>
													<td style="text-align: left; padding-top: 10px;">ล่วงเวลา
														1.5 เท่า</td>
													<td style="text-align: right; padding-top: 10px;">0.00</td>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
								<div class="col-lg-6 col-sm-12">
									<div class="table-responsive">
										<table class="table payment-table">
											<thead>
												<tr>
													<th style="text-align: left; width: 25%">รายการหัก</th>
													<th style="text-align: left; width: 50%"></th>
													<th style="text-align: right; width: 25%; color: #E7505A;">1,500.00</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td style="text-align: left; padding-top: 10px;">SSI</td>
													<td style="text-align: left; padding-top: 10px;">ประกันสังคม</td>
													<td style="text-align: right; padding-top: 10px;">1,500.00</td>
												</tr>
												<tr>
													<td style="text-align: left; padding-top: 10px;">TAX</td>
													<td style="text-align: left; padding-top: 10px;">ภาษีหัก
														ญ ที่จ่าย</td>
													<td style="text-align: right; padding-top: 10px;">0.00</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		var table = $('#list_example').DataTable({
			//"ordering": false,
			"order" : [],
			"bFilter" : false,
			"lengthChange" : false,

		});
		
		
		$('#list_example tbody').on('click', 'td.dt-control', function () {
	        var tr = $(this).closest('tr');
	        var row = table.row(tr);
	 
	        if (row.child.isShown()) {
	            // This row is already open - close it
	            row.child.hide();
	            tr.removeClass('shown');
	        } else {
	            // Open this row
	            row.child(format(row.data())).show();
	            tr.addClass('shown');
	        }
	    });
	})
	
	function format(d) {
    // `d` is the original data object for the row
    return (
        '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
        '<tr>' +
        '<td>Full name:</td>' +
        '<td>' +
        d.name +
        '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Extension number:</td>' +
        '<td>' +
        d.extn +
        '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Extra info:</td>' +
        '<td>And any further details here (images etc)...</td>' +
        '</tr>' +
        '</table>'
    );
		}
</script>
<script
	src="pages-back/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script
	src="pages-back/assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.min.js"
	type="text/javascript"></script>
<script
	src="pages-back/assets/pages/scripts/components-date-time-pickers.min.js"
	type="text/javascript"></script>