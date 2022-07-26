<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:setLocale value="en_US" scope="session" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

.dataTables_filter {
	display: none;
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

 <c:set var = "inprogress_count" scope = "session" value = "${0}"/>
 <c:set var = "waiting" scope = "session" value = "${0}"/>
 <c:set var = "confirm" scope = "session" value = "${0}"/>
  <c:set var="statusSize" value="${fn:length(status)}" />
<c:forEach var = "i" begin = "0" end = "${statusSize}">
       <c:choose>
         
         <c:when test = "${status[i].status == 0}">
         	<c:set var="inprogress_count" value="${inprogress_count + 1}" />
         </c:when>
         <c:when test = "${status[i].status == 1}">
          	<c:set var="waiting" value="${waiting + 1}" />
         </c:when>
         <c:when test = "${status[i].status == 2}">
         	<c:set var="confirm" value="${confirm + 1}" />
         </c:when>
      </c:choose>
</c:forEach>

      
      
<div class="container">
	<div class="block-header">
		<div class="row">
			<div class="col-lg-6 col-md-8 col-sm-8 col-8">
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
			<div class="col-lg-6 col-md-4 col-sm-3 col-3">
				<div style="text-align: right">
					<c:choose>
						<c:when test="${paymentGroup.status == 1}">
							<span class="tag badge badge-info"
								style="color: #449cff; border-color: #449cff; padding: 10px 18px; font-size: 14px; background-color: white;">inprogress
							</span>
						</c:when>
						<c:when test="${paymentGroup.status == 2}">
							<span class="tag badge badge-info"
								style="color: #88c426; border-color: #88c426; padding: 10px 18px; font-size: 14px; background-color: white;">confirm</span>
						</c:when>
						<c:when test="${paymentGroup.status == 3}">
							<span class="tag badge badge-info"
								style="color: #9772FB; border-color: #9772FB; padding: 10px 18px; font-size: 14px; background-color: white;">partial
								payment</span>
						</c:when>
						<c:when test="${paymentGroup.status == 4}">
							<span class="tag badge badge-info"
								style="color: #22AF46; border-color: #22AF46; padding: 10px 18px; font-size: 14px; background-color: white;">completed</span>
						</c:when>
						<c:when test="${paymentGroup.status == 0}">
							<span class="tag badge badge-info"
								style="color: #7F8487; border-color: #7F8487; padding: 10px 18px; font-size: 14px; background-color: white;">inactive</span>
						</c:when>
					</c:choose>
				</div>

			</div>
		</div>
	</div>
</div>





<div class="container">
	<div class="card">
		<div class="header">
			<div class="row">
				<div class="col-12 col-sm-12 col-lg-4">
					<h4 class="card-title">
						Payroll ID<span style="padding-left: 8px; color: #449CFF;">${paymentGroup.payment_group_id}</span>
					</h4>
				</div>
				<div
					class="col-12 col-sm-12 col-lg-8 d-flex justify-content-end justify-content-sm-end justify-content-lg-end ">
					<div
						class="d-inline-flex flex-column flex-sm-column flex-lg-row align-items-center">
						<div class="d-flex ">
							<button id="cancelPayrollGroup"
								class="tag badge badge-info mx-2 my-1 my-sm-1 mx-sm-2  mx-lg-1 my-lg-1"
								style="color: #E7505A; border-color: #E7505A; font-size: 14px; padding: 10px 18px">ยกเลิกรายการ</button>
							<select id = "payroll-group-status" class="form-control mx-2 my-1 mx-sm-2 my-sm-1 mx-lg-1" <c:if test = "${!(paymentGroup.status == 2 || paymentGroup.status == 3 || paymentGroup.status == 4)}">disabled</c:if>>
								<option disabled selected> สถานะทั้งหมด </option>
								<option value="3">ชำระเงินบางส่วน</option>
								<option value="4">ชำระเงินทั้งหมด</option>
							</select>
						</div>
						<div>
							<button id = "savePayrollGroup" <c:if test = "${inprogress_count > 0}">disabled</c:if>
								class="tag badge badge-info mx-2 my-1 my-sm-1 mx-sm-2  mx-lg-1 my-lg-1" 
								style="color: #9A9999; border-color: #9A9999; font-size: 14px; padding: 10px 18px;">ยืนยันรายการเงินเดือน</button>
							<button
								class="tag badge badge-info mx-2 my-1 my-sm-1 mx-sm-2 mx-lg-1 my-lg-1"
								style="color: #9A9999; border-color: #9A9999; font-size: 14px; padding: 10px 18px;">ปริ้น</button>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="body">
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
											<h2 id = "totalincome" style="color: #333333;">${payment[0].income_net + payment[0].salary}</h2>
										</div>
										<div class="d-none d-sm-none d-lg-block"
											style="width: 1px; height: 60px; background: #EBEDF3; margin: 16px"></div>
										<div
											class="d-flex flex-column align-items-center align-items-sm-center align-items-lg-end">
											<p class="mb-0">รวมจ่ายสุทธิ</p>
											<h2 id = "totalpay" style="color: #2898CB;">${payment[0].total_pay}</h2>
										</div>
										<div class="d-none d-sm-none d-lg-block"
											style="width: 1px; height: 60px; background: #EBEDF3; margin: 16px"></div>
										<div
											class="d-flex flex-column align-items-center align-items-sm-center align-items-lg-end">
											<p class="mb-0">รวมรายการหัก</p>
											<h2 id = "expendnet" style="color: #E7505A;">${payment[0].expend_net}</h2>
										</div>
									</div>
									<div class="mt-auto">
										<p>
											Created:
											<fmt:formatDate pattern="dd MMMM yyyy"
												value="${paymentGroup.timeCreate}" />
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<input id="payroll_name" class="form-control"
										value="${paymentGroup.name}" style="color: #449CFF;" required />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 col-sm-6 col-lg-3 ">
								<label>ช่วงวันที่</label>
								<div class="form-group">
									<input id="payroll_start_date" data-provide="datepicker"
										data-date-autoclose="true" data-date-format="dd-mm-yyyy"
										name="startDate" id="startDate" class="form-control" required
										value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value="${paymentGroup.start_date}"  type = "both" 
       								timeStyle = "medium" pattern="dd-MM-yyyy "  />">
								</div>
							</div>
							<div class="col-6 col-sm-6 col-lg-3 ">
								<label>ถึงวันที่</label>
								<div class="form-group">
									<input id="payroll_end_date" data-provide="datepicker"
										data-date-autoclose="true" data-date-format="dd-mm-yyyy"
										name="endDate" id="endDate" class="form-control" required
										value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value="${paymentGroup.end_date}"  type = "both" 
       								timeStyle = "medium" pattern="dd-MM-yyyy "  />">
								</div>
							</div>
							<div class="col-6 col-sm-6 col-lg-3 ">
								<label>วันที่ชำระ</label>
								<div class="form-group">
									<input id="payroll_pay_date" data-provide="datepicker"
										data-date-autoclose="true"
										value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value="${paymentGroup.payment_date}"  type = "both" 
       								timeStyle = "medium" pattern="dd-MM-yyyy "  />"
										data-date-format="dd-mm-yyyy" name="bday" class="form-control"
										required>
								</div>
							</div>
							<div class="col-6 col-sm-6 col-lg-3 ">
								<label>ประกันสังคม</label>
								<div class="input-group mb-3">
									<input id="payroll_ss" type="text" class="form-control"
										value="${paymentGroup.social_security}" required
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
									<input id="information" class="form-control"
										value="${paymentGroup.description}" />
								</div>
							</div>
						</div>
						<div class="clearfix mt-1 mb-1">
							<button id="payroll_save" type="button"
								class="btn btn-success  float-lg-right m-2">บันทึกรายการ</button>
							<button id = "payroll_cancel" type="button" class="btn btn-light  float-lg-right m-2">ยกเลิก</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="card">
		<div class="body">
			<div class="table-responsive">
				<div class="row">
					<div class="col-12 col-sm-12 col-lg-6">
						<div class="d-inline-flex mb-5 mb-sm-5 my-lg-3">

							<button class="tag badge badge-info mx-1" onclick="call_user()"
								style="color: #333333; border-color: #333333; font-size: 14px; padding: 10px 18px">แก้ไขพนักงาน</button>

							<select id="payment-filter" class="form-control mx-1">
								<option value="all">all</option>
								<option value="inprogress">inprogress</option>
								<option value="waiting to pay">waiting to pay</option>
								<option value="confirm">confirm</option>
							</select>
						</div>

					</div>
					<div class="col-12 col-sm-12 col-lg-6">
						<div
							class="d-flex flex-column flex-sm-column flex-lg-row align-items-center justify-content-end">
							<div
								class="d-flex flex-column flex-sm-column flex-lg-row align-items-center">
								<p style="margin-bottom: 0px;">รอดำเนินการ&nbsp;&nbsp;</p>
								<h3 style="color: #333333;">${inprogress_count}</h3>
							</div>
							<div class="d-none d-sm-none d-lg-block"
								style="right: 0px; top: -20px; width: 1px; height: 40px; background: #EBEDF3 0% 0% no-repeat padding-box; margin: 16px"></div>
							<div
								class="d-flex flex-column flex-sm-column flex-lg-row align-items-center">
								<p style="margin-bottom: 0px;">รอชำระเงิน&nbsp;&nbsp;</p>
								<h3 style="color: #333333;">${waiting}</h3>
							</div>
							<div class="d-none d-sm-none d-lg-block"
								style="right: 0px; top: -20px; width: 1px; height: 40px; background: #EBEDF3 0% 0% no-repeat padding-box; margin: 16px"></div>
							<div
								class="d-flex flex-column flex-sm-column flex-lg-row align-items-center">
								<p style="margin-bottom: 0px;">ยืนยัน&nbsp;&nbsp;</p>
								<h3 style="color: #333333;">${confirm}</h3>
							</div>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-12">

						<table class="table table-bordered dataTable" id="list_example">
							<thead>
								<tr>
									<th class="details-control"></th>
									<th class="sorting_asc" style="text-align: left">ลำดับ</th>
									<th class="sorting" style="text-align: left;">พนักงาน</th>
									<th class="sorting" style="text-align: left;">Employee
										type</th>
									<th class="sorting" style="text-align: left;">วันทำงาน</th>
									<th class="sorting" style="text-align: right;">เงินเดือน</th>
									<th class="sorting" style="text-align: right;">รายได้
										เพิ่มเติม</th>
									<th class="sorting" style="text-align: right;">รายการหัก</th>
									<th class="sorting" style="text-align: right;">รายได้สุทธิ</th>
									<th class="sorting" style="text-align: left;">สถานะ</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<!--<td style="display:none">${paymentgl.time_create}</td>-->
									<td class="dt-control" style="padding-top: 10px;"></td>
									<td style="text-align: center; padding-top: 10px;">1</td>
									<td style="text-align: center; padding-top: 10px;">โหลดข้อมูลล้มเหลว</td>
									<td style="text-align: center; padding-top: 10px;">ได้โปรด
										ทำตามขั้นตอน</td>
									<td style="text-align: center; padding-top: 10px;">NULL</td>
									<td style="text-align: center; padding-top: 10px;">NULL</td>
									<td style="text-align: center; padding-top: 10px;">NULL</td>
									<td style="text-align: center; padding-top: 10px;">NULL</td>
									<td style="text-align: center; padding-top: 10px;">NULL</td>
									<td style="text-align: center; padding-top: 10px;">NULL</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="container">
	<div class="card">
		<div class="header">
			<h4 class="card-title">payment summary</h4>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-lg-6 col-sm-12">
					<div class="table-responsive">
						<table class="table payment-table">
							<thead>
								<tr>
									<th class="" style="text-align: left; width: 30%">รายได้</th>
									<th class="" style="text-align: left; width: 50%"></th>
									<th class=""
										style="text-align: right; width: 20%; color: #449CFF;">45,500.00</th>
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
									<th style="text-align: left; width: 30%">รายการหัก</th>
									<th style="text-align: left; width: 50%"></th>
									<th style="text-align: right; width: 20%; color: #E7505A;">1,500.00</th>
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
									<td style="text-align: left; padding-top: 10px;">ภาษีหัก ญ
										ที่จ่าย</td>
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


<!-- Modal -->
<div class="modal fade" id="selectUser" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-xl"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4>รายชื่อพนักงาน</h4>
				<button class="close fa fa-times" data-dismiss="modal"></button>
			</div>
			<div class="modal-body" style="text-align: left;">
				<div class="row"
					style="margin: 10px; height: 450px; overflow: auto;">
					<div class="table-responsive">
						<table class="table table-hover m-b-0 c_list">
							<thead>
								<tr>
									<th style="width: 10%"><label class="fancy-checkbox"><input
											class="select-all" type="checkbox" name="checkboxAll"><span></span></label>
									<th style="text-align: left; width: 15%">รหัสพนักงาน</th>
									<th style="text-align: left; width: 20%">ชื่อพนักงาน</th>
									<th style="text-align: left; width: 20%">แผนก</th>
									<th style="text-align: left; width: 20%">ตำแหน่ง</th>
									<th style="text-align: left; width: 20%">ประเภทพนักงาน</th>
								</tr>
							</thead>
							<tbody id="getUser">
								<c:forEach var="user" items="${userList}">
									<tr>
										<td style="text-align: left; padding-top: 10px;"><label
											class="fancy-checkbox"><input class="checkbox-tick"
												<c:if test = "${user.checkbox == 1}">checked</c:if>
												type="checkbox" name="checkbox"><span></span></label>
										<td style="text-align: left; padding-top: 10px; display: none"
											class="getId">${user.userid}</td>
										<td style="text-align: left; padding-top: 10px;"
											class="getEmpId">${user.employee_id}</td>
										<td style="text-align: left; padding-top: 10px;">${user.name}</td>
										<td style="text-align: left; padding-top: 10px;">${user.dep}</td>
										<td style="text-align: left; padding-top: 10px;">${user.pos}</td>
										<td style="text-align: left; padding-top: 10px;">${user.emp_type}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn dark btn-outline"
					data-dismiss="modal">Cancel</button>
				<button type="button" class="btn dark btn-outline"
					data-dismiss="modal" id="edit-user-payroll">Submit</button>

			</div>
		</div>
	</div>
	<!-- End of Modal -->
</div>
<script>
	$(document).ready(function() {
		$("#totalincome").text(formatValue($("#totalincome").text()))
		$("#totalpay").text(formatValue($("#totalpay").text()))
		$("#expendnet").text(formatValue($("#expendnet").text()))
		
		var table = $('#list_example').DataTable({
			"ajax" : {
				url : "getPayrollTable",
				type : "POST",
				data : {"paymentGroupId" : ${paymentGroup.payment_group_id}}
				},
				"columns": [
		            {
		                className: 'dt-control',
		                orderable: false,
		                data: null,
		                defaultContent: '',
		            },
		            {
		              orderable: false,
		              data: null,
		              defaultContent: '',},
		            { data: 'name' },
		            { data: 'employeeType' },
		            { data: 'term' },
		            { data: 'salary',
		              "render" : function(data,type,row,meta) {
		            	 	  return formatValue(data);
		              },
		              className: "text-right",
		            },
		            { data: 'totalincome',
			              "render" : function(data,type,row,meta) {
			            	  return formatValue(data);
			              },
			              className: "text-right"
		            },
		            { data: 'totalexpense',
			              "render" : function(data,type,row,meta) {
			            	  return formatValue(data);
			              },
			              className: "text-right",
		            },
		            { data: 'totalamount',
			              "render" : function(data,type,row,meta) {
			            	  return formatValue(data);
			              },
			              className: "text-right",
			              
		            },
		            { data: 'status' }
		        ],
			//"ordering": false,
			"order" : [],
			"lengthChange" : false,
			createdRow: function( row, data, dataIndex ) {
		        // Set the data-status attribute, and add a class
		        $( row ).find('td:eq(1)').addClass('number');
		    },

		});
		
		$("#list_example").on('draw.dt', function(){
		    let n = 0;
		    $(".number").each(function () {
		            $(this).html(++n);
		        })
		    
		    console.log(table.ajax.json())
		})
		
		$('#payroll_save').on("click" , function() {
			$.ajax({
		    	type: 'POST',
		    	url: "savePayroll",
		    	data : {
					"paymentGroupId" : ${paymentGroup.payment_group_id}, 
					"payroll_name" : $("#payroll_name").val(),
					"payroll_start_date" : $("#payroll_start_date").val(),
					"payroll_end_date" : $("#payroll_end_date").val(),
					"payroll_pay_date" : $("#payroll_pay_date").val(),
					"payroll_ss" : $("#payroll_ss").val(),
					"information" : $("#information").val(),
					"function" : "save",
		    	},
		    	
		    	dataType: "JSON", // data type expected from server
		    	success: function (data) {
		    		if (data.status === "1") {
		    			Swal.fire('บันทึกสำเร็จ', '', 'success')
					}
		    	},
		});
		})
		
		$('#savePayrollGroup').on('click',function() {
			Swal.fire({
				  title: 'ต้องการที่จะยืนยันรายการหรือไม่',
				  showDenyButton: true,
				  confirmButtonText: 'ยืนยัน',
				  denyButtonText: `ไม่ยืนยัน`,
				}).then((result) => {
				  /* Read more about isConfirmed, isDenied below */
				  if (result.isConfirmed) {
						var classname = $(this).attr("class").split(" ")[0];
						var tr = $(this).closest('.row-data').parent();
						var baseTr = tr.prev();
						var row = table.row(baseTr);
						$.ajax({
							method : "POST",
							url: "savePayrollGroup",
							type: "JSON",
							traditional: true,
							data : {
								"paymentGroupId" : ${paymentGroup.payment_group_id}, 
								"function" : "confirm",
							},
							success : function(data){
								data = JSON.parse(data);
								if (data.status === "1") {
									location.reload();
								}
								else{
									Swal.fire('มีข้อผิดพลาดบางอย่างเกิดขึ้น', '', 'info')
								}
							}
						})
				  } else if (result.isDenied) {
					  Swal.fire('ยกเลิกการทำรายการ', '', 'info')
				  }
				})
		})
		$("#payroll-group-status").on("change",function() {
			let type = "";
			if ($(this).val() === "3") {
				type = "partial"
			}
			else {
				type = "full"
			}
			$.ajax({
				method : "POST",
				url: "savePayrollGroup",
				type: "JSON",
				traditional: true,
				data : {
					"paymentGroupId" : ${paymentGroup.payment_group_id}, 
					"function" : type,
				},
				success : function(data){
					data = JSON.parse(data);
					if (data.status === "1") {
						location.reload();
					}
					else{
						Swal.fire('มีข้อผิดพลาดบางอย่างเกิดขึ้น', '', 'info')
					}
				}
			})
		})
		
		$('#payroll_cancel').on("click" , function() {
			Swal.fire({
				  title: 'ต้องการกลับไปหน้าก่อนหน้าหรือไม่',
				  showDenyButton: true,
				  confirmButtonText: 'ต้องการ',
				  denyButtonText: `ไม่ต้องการ`,
				}).then((result) => {
				  /* Read more about isConfirmed, isDenied below */
				  if (result.isConfirmed) {
					  window.location.href = "payroll_list"
				  }
				})
		})
		
		$("#edit-user-payroll").click(() =>{
			let getUserList = [];
			$('#getUser tr').each(function() {
				$(this).find(".checkbox-tick:checked").each(function() {
					let values = { 'name' :  $(this).closest("tr").find('td.getId').text()};
					getUserList.push(values);
				});
			});
			
			$.ajax({
				method : "POST",
				url: "editPayroll",
				type: "JSON",
				traditional: true,
				data : {
					"userList" : JSON.stringify(getUserList),
					"paymentGroupId" : ${paymentGroup.payment_group_id}, 
				},
				success : function(data){
					data = JSON.parse(data);
					if (data.status === "1") {
						table.ajax.reload();
					}
				}
			})
		})
		
		$('#list_example tbody').on('change','.remark-detail',function() {
			var value = $(this).val();
			var control = $(this).attr("class").split(" ")[0];
			var classname = null;
			var tr = $(this).closest('.row-data').parent();
			var baseTr = tr.prev();
			var row = table.row(baseTr);
			var row_data = row.data();
			row_data.remark = value;
		})
	

		$('#list_example tbody').on('click', 'td.dt-control', function() {
			var tr = $(this).closest('tr');
			var row = table.row(tr);

			if (row.child.isShown()) {
				// This row is already open - close it
				row.child.hide();
				tr.removeClass('shown');
			} else {
				// Open this row
				var tb = $(this).closest('tbody');
				var child = tb.children();
				for(i = 0; i < child.length; ++i) {
					table.row(child.eq(i)).child.hide();
					tb.find("shown").eq(i).removeClass('shown');
				}
				row.child(payroll_format(row.data()),"row-data").show();
				tr.addClass('shown');
				changePayment(tr);
			}
			$("#list_example").trigger("draw.dt");
		});
		
		$('#list_example tbody').on('change','.workingdays,.absent-control,.absence-control,.ot1-control,.ot2-control,.ot3-control',function() {
			var value = $(this).val();
			var control = $(this).attr("class").split(" ")[0];
			var classname = null;
			var tr = $(this).closest('.row-data').parent();
			var baseTr = tr.prev();
			var row = table.row(baseTr);
			var row_data = row.data();
			var payment = null;
			
			switch(control) {
			  case "workingdays":
				classname = "SL";
				row_data.workingDays = value;
				row_data.term = value + "/" + row_data.term.split("/")[1]
				payment = row_data.income[findPayment(row_data.income,classname)];
				break;
			  case "absent-control":
			    classname = "ABSENT";
			    row_data.absent = value;
			    payment = row_data.expense[findPayment(row_data.expense,classname)];
			    break;
			  case "absence-control":
				classname = "ABSENCE";
				row_data.absence = value;
				payment = row_data.expense[findPayment(row_data.expense,classname)];
			    break;
			  case "ot1-control":
				classname = "OT1";
				this.val(value);
				row_data.ot1 = value;
				payment = row_data.income[findPayment(row_data.income,classname)];
				break;
			  case "ot2-control":
				classname = "OT2";
				this.val(value);
				row_data.ot2 = value;
				payment = row_data.income[findPayment(row_data.income,classname)];
				break;
			  case "ot3-control":
				classname = "OT3";
				this.val(value);
				row_data.ot3 = value;
				payment = row_data.income[findPayment(row_data.income,classname)];
				break;
			}
		
			var result = $(tr).find("."+classname);
			
			$.ajax({
				url: "payrollCalculator",
				method: "POST" ,
				type: "JSON" ,
				data: {
					"function" : classname,
					"id" : row_data.id,
					"value" : value,
					},
				success:function(data){
					data = jQuery.parseJSON(data);
					payment.amount = data.amount;
					row.data(row_data).invalidate();
					result.val(formatValue(data.amount));
					changePayment(baseTr);
				}
			});
		})
		
		$('#list_example tbody').on('change','.payment-table-income input',function() {
			var value = $(this).val();
			$(this).val(formatValue(value))
			var classname = $(this).attr("class").split(" ")[0];;
			var tr = $(this).closest('.row-data').parent();
			var baseTr = tr.prev();
			var row = table.row(baseTr);
			var row_data = row.data();
			var payment = row_data.income[findPayment(row_data.income,classname)];
			var result = $(tr).find("."+classname);
			
			payment.amount = value;
			row.data(row_data).invalidate();
			
			changePayment(baseTr);
			
		})
		
		$('#list_example tbody').on('change','.payment-table-expense input',function() {
			var value = $(this).val();
			$(this).val(formatValue($(this).val()))
			var classname = $(this).attr("class").split(" ")[0];
			var tr = $(this).closest('.row-data').parent();
			var baseTr = tr.prev();
			var row = table.row(baseTr);
			var row_data = row.data();
			var payment = row_data.expense[findPayment(row_data.expense,classname)];
			var result = $(tr).find("."+classname);
			
			
			
			
			payment.amount = value;
			row.data(row_data).invalidate();
			result.val(value);
			
			changePayment(baseTr);
			
		})
		
		$('#list_example tbody').on('click','.save-payment,.confirm-payment,.waiting-payment',function() {
			var classname = $(this).attr("class").split(" ")[0];
			var tr = $(this).closest('.row-data').parent();
			var baseTr = tr.prev();
			var row = table.row(baseTr);
			$.ajax({
				method : "POST",
				url: "userPayment",
				type: "JSON",
				traditional: true,
				data : {
					"function" : classname,
					"data" : JSON.stringify(row.data()), 
				},
				success : function(data){
					data = JSON.parse(data);
					if (data.status === "1") {
						location.reload();
					}
				}
			})
			
			
		})
		
		$('#list_example tbody').on('click','.cancel-payment',function() {
			Swal.fire({
				  title: 'ต้องการที่จะบันทึกหรือไม่',
				  showDenyButton: true,
				  confirmButtonText: 'บันทึก',
				  denyButtonText: `ไม่บันทึก`,
				}).then((result) => {
				  /* Read more about isConfirmed, isDenied below */
				  if (result.isConfirmed) {
						var classname = $(this).attr("class").split(" ")[0];
						var tr = $(this).closest('.row-data').parent();
						var baseTr = tr.prev();
						var row = table.row(baseTr);
						$.ajax({
							method : "POST",
							url: "userPayment",
							type: "JSON",
							traditional: true,
							data : {
								"function" : "save-payment",
								"data" : JSON.stringify(row.data()), 
							},
							success : function(data){
								data = JSON.parse(data);
								if (data.status === "1") {
									location.reload();
								}
								else{
									Swal.fire('มีข้อผิดพลาดบางอย่างเกิดขึ้น', '', 'info')
								}
							}
						})
				  } else if (result.isDenied) {
				    location.reload();
				  }
				})
			
			
		})
		
		$('#payment-filter').on('change',() => {
			$.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
				var target = $("#payment-filter").val();
			    var value = data[9];
			    if (target === "all"){
			    	return true
			    }
			    else if (target === value) {
			    	return true
			    }
			    return false;
			});
			table.draw();
			$.fn.dataTable.ext.search.pop()
		})
		$('#cancelPayrollGroup').click(() => {
			Swal.fire({
				  title: 'ต้องการยกเลิกรายการหรือไม่?',
				  showDenyButton: true,
				  confirmButtonText: 'ต้องการ',
				  denyButtonText: `ไม่ต้องการ`,
				}).then((result) => {
				  /* Read more about isConfirmed, isDenied below */
				  if (result.isConfirmed) {
					  $.ajax({
							method : "POST",
							url: "cancelPayrollGroup",
							type: "JSON",
							traditional: true,
							data : {
								"paymentGroupId" : ${paymentGroup.payment_group_id}, 
							},
							success : function(data){
								data = JSON.parse(data);
								if (data.status === "1") {
									window.location.href = "payroll_list"
								}
							}
						})
				  } else if (result.isDenied) {
				    Swal.fire('ยกเลิกการทำรายการ', '', 'info')
				  }
				})
		})
		/*function formatTime(text){
				if(text.includes('.')){
					var str1 = text.split('.')[0];
					var str2 = text.split('.')[1];
					if(str1.length <= 3){
						if(str2.length >= 2){	
							if (str2 > 59) {
								return str1 + ":00"
							}
							return str1 + ":" + str2
						} else if(str2.length < 2){
							if (str2 > 5) {
								return str1+":00"
							}
							return  str1 + ":" + str2 + "0"		
						}
					} else {
						return "00:00";
					}
				} else {
					if(!text.includes(':')){
						$(this).val(text + ":00");
						var str3 = text.split(':')[0];
						var str4 = text.split(':')[1];
						if(str3.length <= 3){
							if(str4.length >= 2){
								if (str4 > 59) {
									return str3 + ":00"
								}
								return str3+":"+str4		
							} else if(str4.length < 2){
								if (str4 > 5) {
									return str3+":00"
								}
								return str3 + ":" + str4 + "0"		
							}
						} else {
							return "00:00";
						}
					} else {
						var str3 = text.split(':')[0];
						var str4 = text.split(':')[1];
						if(str3.length <= 3){
							if(str4.length >= 2){
								if (str4 > 59) {
									return str3 + ":00"
								}
								return str3 + ":" + str4
							} else if(str4.length < 2){
								if (str4 > 5) {
									return str3 + ":00"
								}
								return str3 + ":" + str4 + "0"
							}
						} else {
							return "00:00";
						}
					}
				}
		}*/
		
		
		function changePayment(element) {
			var baseElement = element.children()
			var child = element.next().find(".payment-wrapper");
			var value = calculatePayment(child);
		
			var row = table.row(element);
			var row_data = row.data();
			
			row_data.salary = value[0];
			row_data.totalincome = value[1]-value[0];
			row_data.totalexpense = value[2];
			row_data.totalamount = value[1]-value[2];
		
			//row.data(row_data).invalidate();
			
			baseElement.eq(5).text((formatValue(value[0])));
			baseElement.eq(6).text(formatValue(value[1]-value[0]));
			baseElement.eq(7).text(formatValue(value[2]));
			baseElement.eq(8).text(formatValue(value[1]-value[2]));
		
			child.find(".payment-table-income thead tr th").last().text(formatValue(value[1]))
			child.find(".payment-table-expense thead tr th").last().text(formatValue(value[2]))
			
			$("#list_example").trigger("draw.dt");
		
	}
		
		
		
		
		
		
		
	})
	
	function call_user() {
			$('#selectUser').modal();
		};
		
	
	
	
	
	
	function findPayment(data,val) {
		var filteredObj = data.find(function(item, i){
			  if(item.payment_type_id === val){
			    index = i;
			    return i;
			  }
			});
		return index;
	}
	
	
	function calculatePayment(element){
		let salary = 0.0;
		let totalincome = 0.0;
		let totaloutcome = 0.0;
		let income = element.find(".payment-table-income tbody input");
		let outcome = element.find(".payment-table-expense tbody input");
		for(i = 0; i < income.length; ++i) {
			totalincome = totalincome + parseFloat(income.eq(i).val().replace(/[^\d\.]/g,''));
			if (income.eq(i).attr("class").split(" ")[0] === "SL"){
				salary = parseFloat(income.eq(i).val().replace(/[^\d\.]/g,''));
			}
		}
		for(i = 0; i < outcome.length; ++i) {
			totaloutcome = totaloutcome + parseFloat(outcome.eq(i).val().replace(/[^\d\.]/g,''));
		}
		return [salary,totalincome,totaloutcome]
	}
	function formatValue(value) {
		return (Math.round(parseFloat(value) * 100) / 100).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
	}
	
	

	function payroll_format(d) {
		// `d` is the original data object for the row
		let expense = "";
		let income = "";
		d.income.forEach((d,i) => {
			income = income.concat(`<tr>
							<td style="text-align: left; padding-top: 10px;">`+d.payment_type_id+`</td>
							<td style="text-align: left; padding-top: 10px;">`+d.payment_type_name+`</td>
							<td style="text-align: right; padding-top: 10px;"><input class = "`+d.payment_type_id+` form-control text-right" value = "`+formatValue(d.amount)+`"></td>
			</tr>`);
		})
		
		d.expense.forEach((d,i) => {
			expense = expense.concat(`<tr>
							<td style="text-align: left; padding-top: 10px;">`+d.payment_type_id+`</td>
							<td style="text-align: left; padding-top: 10px;">`+d.payment_type_name+`</td>
							<td style="text-align: right; padding-top: 10px;"><input class = "`+d.payment_type_id+` form-control text-right" value = "`+formatValue(d.amount)+`"></td>
			</tr>`);
		})
		
		let saveButton = "";
		if (d.status === "inprogress") {
			saveButton = `<button type="button" style = "border: 1px solid #C2CAD8;" class="save-payment btn btn-light  float-lg-right m-2">บันทึก</button>`;
		}
		else {
			saveButton = `<button type="button" style = "border: 1px solid #C2CAD8;" class="save-payment btn btn-light  float-lg-right m-2">แก้ไข</button>`
		}
		
		
		
		return `
		<div class = "p-2 m-2">
			<span style = "color: #737373;">สรุปการทำงานตามช่วงเวลา <a href="javascript:void(0);">เพิ่มเติม</a></span>
		</div>
		<table class = "mb-2">
			<thead>
				<tr>
					<th style="text-align: center">วันทำงาน</th>
					<th style="text-align: center;">ชั่วโมงทำงานจริง</th>
					<th style="text-align: center;">สาย/ออกก่อนเวลา<br /> หัก60 นาที(ชม.)</th>
					<th style="text-align: center;">ขาดงาน(วัน)</th>
					<th style="text-align: center;">ลางานไม่รับค่าจ้าง (วัน)</th>
					<th style="text-align: center;">ล่วงเวลา 1.5 เท่า(ชม.)</th>
					<th style="text-align: center;">ล่วงเวลา 2 เท่า(ชม.)</th>
					<th style="text-align: center;">ล่วงเวลา 3 เท่า(ชม.)</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<!--<td style="display:none">${paymentgl.time_create}</td>-->
					<td style="text-align: center; padding-top: 10px;"><input class = "workingdays form-control"  style = "text-align: center" value = "`+d.workingDays+`"></td>
					<td style="text-align: center; padding-top: 10px;">`+d.workingHours+`</td>
					<td style="text-align: center; padding-top: 10px;">0:00</td>
					<td style="text-align: center; padding-top: 10px;"><input class = "absent-control form-control" style = "text-align: center" value = "`+d.absent+`"></td>
					<td style="text-align: center; padding-top: 10px;"><input class = "absence-control form-control"  style = "text-align: center" value = "`+d.absence+`"></td>
					<td style="text-align: center; padding-top: 10px;"><input class = "ot1-control form-control"  style = "text-align: center" value = "`+d.ot1+`"></td>
					<td style="text-align: center; padding-top: 10px;"><input class = "ot2-control form-control" style = "text-align: center" value = "`+d.ot2+`"></td>
					<td style="text-align: center; padding-top: 10px;"><input class = "ot3-control form-control"  style = "text-align: center" value = "`+d.ot3+`"></td>
				</tr>
			</tbody>
		</table>
		<div class="row payment-wrapper">
			<div class="col-lg-6 col-sm-12">
				<div class="table-responsive">
					<table class="table payment-table payment-table-income">
						<thead>
							<tr>
								<th class="" style="text-align: left; width: 30% ; color: #449CFF;">รายได้</th>
								<th class="" style="text-align: left; width: 30%"></th>
								<th class=""
									style="text-align: right; width: 40%; color: #449CFF;">45,500.00</th>
							</tr>
						</thead>
						<tbody>
							`+income+`
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-lg-6 col-sm-12">
				<div class="table-responsive">
					<table class="table payment-table payment-table-expense">
						<thead>
							<tr>
								<th style="text-align: left; width: 30% ;color: #449CFF;">รายการหัก</th>
								<th style="text-align: left; width: 30%"></th>
								<th style="text-align: right; width: 40%; color: #449CFF;">1,500.00</th>
							</tr>
						</thead>
						<tbody>
							`+expense+`
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class = "col-12">
			<p>หมายเหตุ :</p>
				<input class="remark-detail form-control" value ="`+d.remark+`">
			<p style = "color: #E7505A;">หมายเหตุ จากงวดที่แล้ว : -</p>
		</div>
		<div class="clearfix my-3">
			<button class="confirm-payment btn btn-success  float-lg-right m-2">ยืนยันรายการ</button>
			<button type="button" style = "color : white;" class="waiting-payment btn btn-warning  float-lg-right m-2">รอชำระเงิน</button>`
			+saveButton+
			`<button type="button" style = "border: 1px solid #C2CAD8;" class="cancel-payment btn btn-light  float-lg-right m-2">ยกเลิก</button>
		</div>
	</div>
		`
	}
</script>