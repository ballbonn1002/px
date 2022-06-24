<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<div class="col-sm-12">
		<div class="form-group">
			<div class="row clearfix" style="margin-top: 20px;">
				<div class="col-md-6 col-sm-12">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ประเภทการจ่ายเงิน</label>
					<select class="form-control show-tick" name="transfer">
						<option value="0"
							<c:if test="${selectUser.transfer_type eq '0'}"> selected </c:if>>โอนเงิน</option>
						<option value="1"
							<c:if test="${selectUser.transfer_type eq '1'}"> selected </c:if>>เงินสด</option>
					</select>
				</div>

				<div class="col-md-6 col-sm-12"></div>

				<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ธนาคาร</label> <select
						class="form-control show-tick" name="bank">
						<option value="กรุงเทพ"
							<c:if test="${selectUser.bank eq 'กรุงเทพ'}"> selected </c:if>>ธนาคารกรุงเทพ</option>
						<option value="กรุงไทย"
							<c:if test="${selectUser.bank eq 'กรุงไทย'}"> selected </c:if>>ธนาคารกรุงไทย</option>
						<option value="กรุงศรีอยุธยา"
							<c:if test="${selectUser.bank eq 'กรุงศรีอยุธยา'}"> selected </c:if>>ธนาคารกรุงศรีอยุธยา</option>
						<option value="กสิกรไทย"
							<c:if test="${selectUser.bank eq 'กสิกรไทย'}"> selected </c:if>>ธนาคารกสิกรไทย</option>
						<option value="ทหารไทยธนชาต"
							<c:if test="${selectUser.bank eq 'ทหารไทยธนชาต'}"> selected </c:if>>ธนาคารทหารไทยธนชาต</option>
						<option value="ซีไอเอ็มบี"
							<c:if test="${selectUser.bank eq 'ซีไอเอ็มบี'}"> selected </c:if>>ธนาคารซีไอเอ็มบีไทย</option>
						<option value="ไทยพาณิชย์ "
							<c:if test="${selectUser.bank eq 'ไทยพาณิชย์ '}"> selected </c:if>>ธนาคารไทยพาณิชย์
						</option>
					</select>
				</div>

				<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
					<p>ประเภทบัญชี</p>
					<input type="radio" id="Choice1" name="banktype"
						<c:if test="${selectUser.bank_type eq '0' }">
                                          				checked
                                     				</c:if>
						value="0"> <label for="Choice1"
						style="font-weight: lighter; font-size: 14px;">บัญชีออมทรัพย์</label>&nbsp;&nbsp;&nbsp;

					<input type="radio" id="Choice2" name="banktype"
						<c:if test="${selectUser.bank_type eq '1' }">
                                          				checked
                                     				</c:if>
						value="1"> <label for="Choice2"
						style="font-weight: lighter; font-size: 14px;">บัญชีกระแสรายวัน</label>
				</div>

				<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เลขที่บัญชี</label>
					<input type="text" name="banknum" value="${selectUser.bank_number}"
						class="form-control">
				</div>

				<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">สาขาธนาคาร</label>
					<input type="text" name="branch" value="${selectUser.bank_branch}"
						class="form-control">
				</div>
			</div>
		</div>
	</div>

</body>
</html>