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
table{
text-align:center;
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
					<h6 class="card-title">รายงาน รายการจ่ายเงินเดือน 
						<span class="col-md-3 pull-right">
							<span class="input-group input-large date-picker input-daterange"  data-date-format="dd-mm-yyyy">
								<input name="Date-Start" placeholder="Start Date" type="text" onMouseOver="(this.type='date')" onMouseOut="(this.type='text')"  id="datefilterfrom" class="form-control" data-date-split-input="true">
                           		<span class="" style="margin-top:7px;margin-right:10px;margin-left:10px;"> to </span>
                          		<input name="Date-End" placeholder="End Date" type="text" onMouseOver="(this.type='date')" onMouseOut="(this.type='text')"  id="datefilterto" class="form-control" data-date-split-input="true">
       
							</span>
						</span>
					</h6>
					<div></div>
				</div>
					
			</div><hr style="margin-top: -0.125rem;">
			<div class="body" style="margin-top: -10px;">
				<div class="portlet light bordered">
					<div class="portlet-body">
						<div class="portlet box white">
							<div class="table-responsive">
								<table id="myTable" class="table table-hover js-basic-example table-custom m-b-0 no-footer table-striped">
									<thead>
										<tr>
											<th>Payroll ID</th>
											<th>รายการการเงิน</th>
											<th>ช่วงวันที่</th>
											<th>วันที่ชำระ</th>
											<th style="text-align:right;">ยอดรวมสุทธิ</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="test" items="${groupList}">
										<tr class="high" onclick="myFunction('${test.payment_group_id}')">
											<td>${test.payment_group_id}</td>
											<td>${test.name }</td>
											
											<td><fmt:formatDate value="${test.start_date}" pattern="dd MMM yyyy"></fmt:formatDate>
													 &nbsp;&nbsp;-&nbsp;&nbsp;
												 <fmt:formatDate value="${test.end_date}" pattern="dd MMM yyyy"></fmt:formatDate>
										    </td>
										    
											<td>
												<fmt:formatDate value="${test.payment_date}" pattern="dd MMM yyyy"></fmt:formatDate>
											</td>
													
											<td style="text-align:right;" class="fix">
												 <fmt:parseNumber var = "total" type = "number" value = "${test.total_pay}" />
										            <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${total}" />
											</td>
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
<script>
function filterRows() {
	  var from = $('#datefilterfrom').val();
	  var to = $('#datefilterto').val();
      console.log(from);
      console.log(to);
	  if (!from && !to) { // no value for from and to
	    return;
	  }

	  from = from || '1970-01-01'; // default from to a old date if it is not set
	  to = to || '2999-12-31';

	  var dateFrom = moment(from);
	  console.log(dateFrom);
	  var dateTo = moment(to);
	  console.log(dateTo);
	  $('#myTable tr.high').each(function(i, tr) {
	    var val = $(tr).find("td:nth-child(3)").text();
	    var dateVal = moment(val, "DD MMM yyyy");
	    var visible = (dateVal.isBetween(dateFrom, dateTo, null, [])) ? "" : "none"; // [] for inclusive
	    $(tr).css('display', visible);
	  });
	}

	$('#datefilterfrom').on("change", filterRows);
	$('#datefilterto').on("change", filterRows);

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!--  <script>
document.querySelectorAll('td.fix').forEach((e)=>{
	  e.innerText = Number(e.innerText).toFixed(2);
	})
</script>-->
<script>
$(document).ready(function(){
	$('#myTable').dataTable( {
		 language: {
		        search: "_INPUT_",
		        searchPlaceholder: "Search..."
		    }
	} );
});
</script>

