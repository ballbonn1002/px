<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:set var = "userSalary" value = "${userSalary}"/>
	<c:set var = "userSalarySize" value="${fn:length(userSalary)}"/>
	<c:set var = "date" value = "${userSalary[userSalarySize-1].date}"/>
	<div class="col-sm-12">
		<div class="form-group">
			<div class="row clearfix" style="padding-top: 20px;">
				<div class="col-md-6 col-sm-12">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ประเภทพนักงาน</label>
					<select class="form-control show-tick" name="emp_type">
						<c:forEach var="employee_type" items="${emptypeList}">
							<option value="${employee_type.employee_type_id}"
								<c:if test="${selectUser.employee_type_id eq employee_type.employee_type_id }"> selected </c:if>>${employee_type.name} - <c:if test="${employee_type.payment eq 0 }"> รายเดือน </c:if><c:if test="${employee_type.payment eq 1 }"> รายวัน </c:if></option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-6 col-sm-12">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เงินเดือน</label>
					<div class="input-group mb-3">
						<input type="text" id="salary" name="salary" class="form-control"
							aria-describedby="basic-addon2" disabled="disabled" value = ${userSalary[userSalarySize-1].amount}>
						<div class="input-group-append">
							<button data-toggle="modal" data-target="#defaultModal"
								class="btn btn-outline-secondary editsalary" type="button">ปรับเงินเดือน</button>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-12" style="padding-top: 16px;">
					<p>สิทธิ์ประกันสังคม</p>

					<input type="radio" name="chkright"
						<c:if test="${selectUser.social_security eq '1' }">
                                          				checked
                                     				</c:if>
						value="1" style="accent-color: #0275d8;"> <span><i></i>ยื่นสิทธิ์ประกันสังคม</span>


					<input type="radio" name="chkright"
						<c:if test="${selectUser.social_security eq '0' }">
                                          				checked
                                     				</c:if>
						value="0" style="accent-color: #0275d8;"> <span><i></i>ไม่ยื่นสิทธิ์ประกันสังคม</span>

				</div>
				<div class="col-md-6 col-sm-12" style="padding-top: 10px;"></div>
				<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
					<label class="control-label"
						style="font-weight: lighter; font-size: 14px;">หัก ณ
						ที่จ่าย</label>
					<c:if test="${selectUser.withholding_auto eq '1'}">
						<input type="text" id="txttax" name="withholding"
							class="form-control" disabled="disabled">
					</c:if>
					<c:if
						test="${selectUser.withholding_auto eq '0' || selectUser.withholding_auto == null}">
						<input type="text" id="txttax" name="withholding"
							value="${selectUser.withholding}" class="form-control" required>
					</c:if>
				</div>
				<div class="col-md-6 col-sm-12" style="padding-top: 10px;">
					<br>
					<br> <label> <input type="checkbox" id="chktax"
						name="tax"
						<c:if test="${selectUser.withholding_auto eq '1' }">
                                          				checked
                                     				</c:if>
						onclick="EnableDisnableTxttax(this)"> <span>คำนวนภาษีหัก
							ณ ที่จ่ายอัตโนมัติ</span>
					</label>
				</div>
				<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เงื่อนไขการหักภาษี</label>
					<select class="form-control show-tick" name="tax_deduction">
						<option value="0"
							<c:if test="${selectUser.tax_deduction eq '0'}"> selected </c:if>>หัก
							ณ ที่จ่าย</option>
						<option value="1"
							<c:if test="${selectUser.tax_deduction eq '1'}"> selected </c:if>>ออกให้ตลอดไป</option>
						<option value="2"
							<c:if test="${selectUser.tax_deduction eq '2'}"> selected </c:if>>ออกให้ครั้งเดียว</option>
					</select>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal  -->
	<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="title" id="defaultModalLabel">เงินเดือน</h4>
				</div>
				<div class="col-md-12" style="padding-top: 10px;">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">วันที่เงินเดือนปรับใช้</label>
						<input  data-provide="datepicker" data-date-autoclose="true"
						data-date-format="dd-mm-yyyy" id= "add_emp_date" type="text" name="salaryDate" class="form-control" value="<fmt:formatDate value="${date}" pattern=" dd-MM-yyyy" />">
				</div>
				<div class="col-md-12" style="padding-top: 10px;">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">จำนวนเงินเดือน</label>
					<input id = "add_emp_amount" type="text" name="amountsalary" value = "${userSalary[userSalarySize-1].amount}" class="form-control">
				</div>
				<div class="col-md-12"
					style="padding-top: 10px; padding-bottom: 20px;">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">หมายเหตุ</label> <input
						type="text" name="note" value = "${userSalary[userSalarySize-1].description}" class="form-control">
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-outline-secondary"
						data-dismiss="modal">ยกเลิก</button>
					<button id = "add_emp_save" type="button" class="btn btn-success">บันทึก</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>