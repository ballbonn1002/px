<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
		
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>

<script src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"type="text/javascript"></script>
			
<script src="../assets/pages/scripts/ui-sweetalert.min.js"type="text/javascript"></script>

<link
		href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
		rel="stylesheet" type="text/css" />
<script>
			
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
</script>
<style>
	#myTable tr{
	cursor: pointer;
}
</style>
<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2 style="font-size:20px; font-weight:600; "><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>รายงาน รายการจ่ายเงินเดือน</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item" style="font-size:14px;">รายงาน</li>
                    <li class="breadcrumb-item active" style="font-weight:Semibold;font-size:14px">รายงาน รายการจ่ายเงินเดือน</li>
      
                </ul>
        </div>            
    </div>
</div>
<div class="row clearfix">
	<div class="col-lg-12">
		<div class="card">
			<div class="header">
				<div>
					<h6 class="card-title">รายงาน รายการจ่ายเงินเดือน</h6>
				</div>
					<div class="col-md-3 pull-right">
                       	<div class="input-group input-large date-picker input-daterange"  data-date-format="dd-mm-yyyy">
                           <input type="date" class="form-control " name="Date-Start" id="F-date" value="">
                           <span class="" style="margin-top:7px;margin-right:5px;margin-left:5px;"><i class="fa fa-minus"></i></span>
                           <input type="date" class="form-control " name="Date-End" id="E-date" value="">
                        </div>
                    </div>
			</div><br><hr>
			<div class="body">
				<div class="portlet light bordered">
					<div class="portlet-body">
						<div class="portlet box white">
							<div class="table-responsive">
								<table id="myTable" class="table table-hover js-basic-example table-custom m-b-0 no-footer ">
									<thead>
										<tr>
											<th>Payroll ID</th>
											<th>รายการการเงิน</th>
											<th>ช่วงวันที่</th>
											<th>วันที่ชำระ</th>
											<th>ยอดรวมสุทธิ</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="test" items="${groupList}">
										<tr class="high" onclick="myFunction('${test.payment_group_id}')">
											<td>${test.payment_group_id}</td>
											<td>${test.name }</td>
											<td>ช่วงวันที่ ${test.start_date} - ${test.end_date} </td>
											<td>${test.payment_date}</td>
											<td>${test.total_pay }</td>
										</tr>
<script>
function myFunction() {
        window.location.href = "report_payroll_2?payment_group_id=${test.payment_group_id}";
    };

</script>						
									</c:forEach>
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
<script>
function myFunction(id) {
        window.location.href = "report_payroll_2?payment_group_id="+id;
    };

</script>
