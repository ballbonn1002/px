<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
/* width */
::-webkit-scrollbar {
	width: 5px;
}

/* Track */
::-webkit-scrollbar-track {
	background: #f1f1f1;
	border-radius: 2px;
}

/* Handle */
::-webkit-scrollbar-thumb {
	background: #888;
	border-radius: 2px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
	background: #555;
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
					class="fa fa-arrow-left"></i></a>รายการจ่ายเงินเดือน
			</h2>
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="page.blank"><i
						class="icon-home"></i></a></li>
				<li class="breadcrumb-item active">รายการจ่ายเงินเดือน</li>
			</ul>
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
								class="caption-subject font-red sbold uppercase">รายการเงินเดือน</span>
							<span class="caption-helper font-red"> <%-- ${role.name} --%>
							</span>
						</div>

						<div class="actions right" style="text-align: right;">
							<a onclick="call_user()" class="btn btn-info"
								style="margin-bottom: 30px;">&nbsp;สร้าง Payroll</a>
							<!--  <a
								class="btn btn-circle btn-icon-only btn-default fullscreen"
								href="javascript:;" data-original-title="" title=""> </a> -->
							<!--  class="btn green-meadow"-->
							<!-- <i
								class="fa fa-plus"></i> -->
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
														<c:forEach var="user" items="${userList }">
															<tr>
																<td style="text-align: left; padding-top: 10px;"><label
																	class="fancy-checkbox"><input
																		class="checkbox-tick" type="checkbox" name="checkbox"><span></span></label>
																<td
																	style="text-align: left; padding-top: 10px; display: none"
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
											data-dismiss="modal" onclick="call_submit()">Submit</button>

									</div>
								</div>
							</div>
							<!-- End of Modal -->
						</div>

						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<div class="portlet box white">
								<!-- <div class="portlet-title"> -->
								<div class="caption"></div>
								<div class="tools">
									<a href="javascript:;" class="collapse" data-original-title=""
										title=""> </a> <a href="#portlet-config" data-toggle="modal"
										class="config" data-original-title="" title=""> </a> <a
										href="javascript:;" class="reload" data-original-title=""
										title=""> </a> <a href="javascript:;" class="remove"
										data-original-title="" title=""> </a>
								</div>
								<!-- </div> -->
								<div class="table-responsive">
									<table class="table table-hover table-custom m-b-0 no-footer"
										id="list_example">
										<thead>
											<tr>
												<!--  <th class="sorting_desc" style="display:none" aria-sort="descending">Time_create</th>-->
												<th class="sorting_desc"
													style="text-align: left; width: 10%">Payroll ID</th>
												<th style="text-align: left; width: 15%">รายการ</th>
												<th style="text-align: left; width: 15%">กำหนดชำระ</th>
												<th style="text-align: right; width: 20%">รวมค่าใช้จ่ายพนักงาน</th>
												<th style="text-align: right; width: 15%">ยอดรวมสุทธิ</th>
												<th style="text-align: left; width: 10%">ดำเนินการ</th>
												<th style="text-align: left; width: 20%">สถานะ</th>
												<th style="text-align: left; width: 20%">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="paymentgroupList" items="${payment}"
												varStatus="c">
												<tr>
													<!--<td style="display:none">${paymentgl.time_create}</td>-->
													<td style="text-align: left; padding-top: 10px;">${paymentgroupList.payment_group_id}</td>
													<td style="text-align: left; padding-top: 10px;">${paymentgroupList.name}</td>
													<td style="text-align: left; padding-top: 10px;"><fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value="${paymentgroupList.payment_date}"  type = "both" 
       								timeStyle = "medium" pattern="dd MMMM yyyy"  /></td>
													<td class = "price-value" style="text-align: right; padding-top: 10px;">${paymentgroupList.salary + paymentgroupList.income_net}</td>
													<td class = "price-value" style="text-align: right; padding-top: 10px;">${paymentgroupList.expend_net}</td>
													<td style="text-align: left; padding-top: 10px;">${status[c.index].payment_count}/${paymentgroupList.payment_count}</td>
													<td style="text-align: left; padding-top: 10px;"><c:choose>

															<c:when test="${paymentgroupList.status == 1}">
																<span class="tag badge badge-info"
																	style="color: #449cff; border-color: #449cff;">inprogress</span>
															</c:when>
															<c:when test="${paymentgroupList.status == 2}">
																<span class="tag badge badge-info"
																	style="color: #88c426; border-color: #88c426;">confirm</span>
															</c:when>
															<c:when test="${paymentgroupList.status == 3}">
																<span class="tag badge badge-info"
																	style="color: #9772FB; border-color: #9772FB;">partial
																	payment</span>
															</c:when>
															<c:when test="${paymentgroupList.status == 4}">
																<span class="tag badge badge-info"
																	style="color: #22AF46; border-color: #22AF46;">completed</span>
															</c:when>
															<c:when test="${paymentgroupList.status == 0}">
																<span class="tag badge badge-info"
																	style="color: #7F8487; border-color: #7F8487;">inactive</span>
															</c:when>
														</c:choose></td>
													<td style="text-align: right;"><a
														class="btn btn-outline-success" title="Edit"
														href="payroll_form?paymentGroupId=${paymentgroupList.payment_group_id}">
															<i class="fa fa-pencil"></i>
													</a> <a
														class="btn btn-outline-danger sred-intense sweet-${paymentgroupList.payment_group_id}"
														onclick="cancelPayrollGroup(${paymentgroupList.payment_group_id})">
															<i class="fa fa-trash-o"></i>
													</a></td>
												</tr>
												<script>
												/*document.querySelector('.sweet-${test.employee_type_id}').onclick = function(){
												 swal({
												 title: "Are you sure!",
												 text: "You will be deleting this id!",
												 type: "info",
												 showCancelButton: true,
												 confirmButtonClass: 'btn-primary',
												 confirmButtonText: 'OK'
												 }, function (inputValue) {
												 if (inputValue === false) return false;
												 if (inputValue === "") {
												 return false
												 }
												 document.location = "employeeType_delete?employee_type_id=${test.employee_type_id}";   //?id คือ parameter
												 });
												 };*/
											</script>
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
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
		$('#list_example').DataTable({
			"order": []
		});
		$('.price-value').each(function(i,obj) {
			$('.price-value').eq(i).text(formatValue($('.price-value').eq(i).text()))
		})
		
		}
)
function cancelPayrollGroup(id) {
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
								"paymentGroupId" : id, 
							},
							success : function(data){
								data = JSON.parse(data);
								console.log(data);
								if (data.status === "1") {
									location.reload();
								}
								else {
									Swal.fire('ไม่สามารถทำรายการได้', '', 'error')
								}
							}
						})
				  } else if (result.isDenied) {
				    Swal.fire('ยกเลิกการทำรายการ', '', 'info')
				  }
				})
		}
	/*$(document).ready(function(){	

	 var value="${myselect}" ; 
	 var d = new Date();
	 if(value == 0 ){
	 document.getElementById(d.getFullYear()).selected = "true";	
	 }else if(value == 2 ){  
	 document.getElementById("all").selected = "true";
	 }else{
	 document.getElementById(value).selected = "true";
	 }
	 });*/
</script>
<script>
	function call_user() {
		$('#selectUser').modal();
	};
	function formatValue(value) {
		return (Math.round(parseFloat(value) * 100) / 100).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
	}

function call_submit() {
	let getUserList = [];
	$('#getUser tr').each(function() {
		$(this).find(".checkbox-tick:checked").each(function() {
			let values = { 'name' :  $(this).closest("tr").find('td.getId').text()};
			getUserList.push(values);
		});
	});
	
	$.ajax({
		method : "POST",
		url: "addPayroll",
		type: "JSON",
		traditional: true,
		data : {
			"userList" : JSON.stringify(getUserList)
		},
		success : function(data){
			data = JSON.parse(data);
			window.location.href = "payroll_form?paymentGroupId=" + data.id;
		}
	})
	
};
</script>


