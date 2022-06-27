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

<script src="assets/bundles/libscripts.bundle.js"></script>

<script src="assets/plugin/editable-table/mindmup-editabletable.js"></script>

<script src="assets/bundles/mainscripts.bundle.js"></script>		

 <link rel="stylesheet" href="assets/css/main.css">
<style>
	table td:empty::before {content: "0";}
</style>
 
<div class="container">
	<div class="block-header">
	<div class="row">
		<div class="col lg-6 col-md-8 col-sm-12">
		<h3 class="title"><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>Function</h3>
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>
				<li class="breadcrumb-item">Function</li>
				<li class="breadcrumb-item">Tax-ภาษี</li>
			</ul>
		</div>
	</div>
	</div>
	
	<div class="row clearfix" >
		<div class="col-lg-6 col-md-12">
			<div class="card">
				<div class="header">
						<h6 class="title">Tax-ภาษี</h6>
				</div>
				<div class="body">
					<form action="taxcalculate">
					<div class="row">
						<div class="col-6">
							<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">พนักงาน</label>
									
									<select id="username"  name="user_name" class="form-control show-tick ms search-select">
												<option disabled hidden selected  >เลือก</option>
											 	<c:forEach var="user" items="${salaryList}">	
													<option value="${user.user_id}" <c:if test="${test[0].user_id eq user.user_id }">selected</c:if>>${user.user_id}</option>
														
														
												</c:forEach>
									</select>
									
								
							</div>
						</div>
						<div class="col-6">
							<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">เงินเดือน</label> 
								<input id="salary" type="text" name="salary" class="form-control" value="${test[0].amount }">
							</div>
						</div>
						<div class="col-6">
							<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">หักค่าใช้จ่าย</label> 
								<input id="" type="text" name="pay" class="form-control" value="100000.00">
							</div>
						</div>
						<div class="col-6">
							<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">หักลดหย่อนส่วนตัว</label> 
								<input id="" type="text" name="money" class="form-control" value="60000.00">
							</div>
						</div>
						<div class="col-6">
							<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">หักประกันสังคม</label> 
								<input id="" type="text" name="social" class="form-control" value="9000.00">
							</div>
						</div>
						<div class="col-6" style="display:none;">
							<div class="form-group">
								<label for="recipient-name" class="control-label" style="margin-top: 5px;">flag</label> 
								<input id="flag" type="text" name="flag" class="form-control" value="${test[0].withholding_auto}">
							</div>
						</div>
						<div class="col-4 " style="align-items:flex-end;display:flex">
							<div class="form-group">
								
								<button id="" type="submit" style="width:96px;" class="btn btn-info" name="social" class="form-control" >คำนวน</button>
							</div>
						</div>
						
						</div>
					</form>
				</div>
			</div>
				
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="card">
				<div class="header">
					<h6 class="title">ผลการคำนวน</h6>
					
					
				</div>
				<div class="body">
				<p style="margin-left:67px;">เงินเดือน x 12 = รายได้ทั้งปี<br>รายได้ทั้งปี - ค่าใช้จ่าย - ค่าลดหย่อนส่วนตัว - เงินประกันสังคม = ยอดคงเหลือสุทธิ</p><br>
				<div class="row">
					<div class="col">
						<div>
							<input type="text" name="total" class="form-control"  value="ยอดคงเหลือสุทธิ" style="border:none; background-color:transparent;text-align: center" readonly />
						</div>
					</div>
					<div class="col">
						<div class="form-control" style="border:none; background-color:transparent;text-align: center;color:#FAAD14;font-weight:bold" >
							    <c:if test = "${fn:contains(flag, '0')}">
        							 ไม่คำนวนภาษี
      							</c:if>
								<fmt:parseNumber var = "w0" type = "number" value = "${w0}" />
                                   <fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w0}" /> 
							
						</div>
					</div>
					
				</div><hr>	
					<table id="mainTable" class="table table-borderless">
                                    <thead>
                                        <tr>
                                            <th style="color:#E7505A">คำนวนตามเงื่อนไข</th>
                                            <th style="color:#E7505A">%</th>
                                            <th style="color:#E7505A"></th>
                                            <th style="color:#E7505A">ยอดเงิน</th>
                                            <th style="color:#E7505A">คำนวนได้</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>0-150,000</td>
                                            <td>0 %</td>
                                            <td style="color:#E7505A">x</td>
                                            <td style="color:#FAAD14">
                                            	<fmt:parseNumber var = "w1" type = "number" value = "${w1}" />
                                            	 <fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w1}" />
                                            	<c:if test = "${w1 == null}">0 </c:if>
                                            </td>
                                            <td style="color:#449CFF" class="tax">  
                                            	<fmt:parseNumber var = "w2" type = "number" value = "${w2}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2"  value = "${w2}" />
                                            	<c:if test = "${w2 == null}">0 </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>150001-300000</td>
                                            <td>5 %</td>
                                            <td style="color:#E7505A">x</td>
                                            <td style="color:#FAAD14">
                                            	<fmt:parseNumber var = "w3" type = "number" value = "${w3}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w3}" />
                                            	<c:if test = "${w3 == null}">0 </c:if>
                                            </td>
                                            <td style="color:#449CFF" class="tax"> 
                                            	<fmt:parseNumber var = "w4" type = "number" value = "${w4}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w4}" />
                                            	<c:if test = "${w4 == null}">0 </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                             <td>300001-500000</td>
                                            <td>10 %</td>
                                            <td style="color:#E7505A">x</td>
                                            <td style="color:#FAAD14">
                                            	<fmt:parseNumber var = "w5" type = "number" value = "${w5}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w5}" />
                                            	<c:if test = "${w5 == null}">0 </c:if>
                                            </td>
                                            <td style="color:#449CFF" class="tax">
                                            	<fmt:parseNumber var = "w6" type = "number" value = "${w6}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w6}" />
                                            	<c:if test = "${w6 == null}">0 </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>500001-750000</td>
                                            <td>15 %</td>
                                            <td style="color:#E7505A">x</td>
                                            <td style="color:#FAAD14">
                                            	<fmt:parseNumber var = "w7" type = "number" value = "${w7}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w7}" />
                                            	<c:if test = "${w7 == null}">0 </c:if>
                                            </td>
                                            <td style="color:#449CFF" class="tax">
                                            	<fmt:parseNumber var = "w8" type = "number" value = "${w8}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w8}" />
                                            	<c:if test = "${w8 == null}">0 </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                             <td>750001-1000000</td>
                                            <td>20 %</td>
                                            <td style="color:#E7505A">x</td>
                                            <td style="color:#FAAD14">
                                            	<fmt:parseNumber var = "w9" type = "number" value = "${w9}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w9}" />
                                            	 <c:if test = "${w9 == null}">0 </c:if>
                                            </td>
                                            <td style="color:#449CFF" class="tax">
                                            	<fmt:parseNumber var = "w10" type = "number" value = "${w10}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w10}" />
                                            	<c:if test = "${w10 == null}">0 </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                             <td>1000001-2000000</td>
                                            <td>25 %</td>
                                            <td style="color:#E7505A">x</td>
                                            <td style="color:#FAAD14">
                                            	<fmt:parseNumber var = "w11" type = "number" value = "${w11}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w11}" />
                                            	<c:if test = "${w11 == null}">0 </c:if>
                                            </td>
                                            <td style="color:#449CFF" class="tax">
                                            	<fmt:parseNumber var = "w12" type = "number" value = "${w12}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w12}" />
                                            	<c:if test = "${w12 == null}">0 </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                             <td>2000001-5000000</td>
                                            <td>30 %</td>
                                            <td style="color:#E7505A">x</td>
                                            <td style="color:#FAAD14">
                                            	<fmt:parseNumber var = "w13" type = "number" value = "${w13}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w13}" />
                                            	<c:if test = "${w13 == null}">0 </c:if>
                                            </td>
                                            <td style="color:#449CFF" class="tax">
                                            	<fmt:parseNumber var = "w14" type = "number" value = "${w14}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w14}" />
                                            	<c:if test = "${w14 == null}">0 </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                             <td>5000001 ขึ้นไป</td>
                                            <td>35 %</td>
                                            <td style="color:#E7505A">x</td>
                                            <td style="color:#FAAD14">
                                            	<fmt:parseNumber var = "w15" type = "number" value = "${w15}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w15}" />
                                            	<c:if test = "${w15 == null}">0 </c:if>
                                            </td>
                                            <td style="color:#449CFF" class="tax">
                                            	<fmt:parseNumber var = "w16" type = "number" value = "${w16}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w16}" />
                                            	<c:if test = "${w15 == null}">0 </c:if>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th><strong>ยอดรวมภาษีทั้งปี</strong></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th style="color:#449CFF" id="total">
                                            	<fmt:parseNumber var = "total" type = "number" value = "${total}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${total}" /> 
                                            </th>
                                        </tr>
                                        <tr>
                                        	<th><strong>ภาษีหัก ณ ที่จ่ายต่อเดือน</strong></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th style="color:#449CFF">
                                            	<fmt:parseNumber var = "perMonth" type = "number" value = "${perMonth}" />
                                            	<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${perMonth}" />
                                            </th>
                                        </tr>
                                    </tfoot>
                                </table>
                               
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function () {
	console.log('${flag}');
	$('#username').on('change', function() {
		var value = $('#username').val();
		
		//var role = $('#userRole').val();
		//console.log(role);
		console.log(value);
		
		if(value==null){
			$('#salary').empty();
			$('#flag').empty();
			
		} 
		
		$.ajax({
			url: "autoFillSalary"	,
			method: "POST" ,
			type: "JSON" ,
			data: {
					"userid" : value 
				},
				success:function(data){
					console.log(data[0]);
					console.log(data[0].amount);
					//console.log(data[0].withholding_auto);
					   $('#salary').val(data[0].amount);
					   $('#flag').val(data[0].withholding_auto);
					   
				}
		})
	});
		return false;
});

</script>
<!--  <script>
$(document).ready(function () {
	$('#flag').on('change', function() {
		var p = $('#flag').val();
		console.log(p);
	});
});
</script>
-->