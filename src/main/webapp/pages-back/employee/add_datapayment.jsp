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
							>โอนเงิน</option>
						<option value="1"
							>เงินสด</option>
					</select>
				</div>

				<div class="col-md-6 col-sm-12"></div>

				<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ธนาคาร</label> <select
						class="form-control show-tick" name="bank">
						<option value="กรุงเทพ"
							>ธนาคารกรุงเทพ</option>
						<option value="กรุงไทย"
							>ธนาคารกรุงไทย</option>
						<option value="กรุงศรีอยุธยา"
							>ธนาคารกรุงศรีอยุธยา</option>
						<option value="กสิกรไทย"
							>ธนาคารกสิกรไทย</option>
						<option value="ทหารไทยธนชาต"
							>ธนาคารทหารไทยธนชาต</option>
						<option value="ซีไอเอ็มบี"
							>ธนาคารซีไอเอ็มบีไทย</option>
						<option value="ไทยพาณิชย์ "
							>ธนาคารไทยพาณิชย์
						</option>
					</select>
				</div>

				<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
					<p>ประเภทบัญชี</p>
					<input type="radio" id="Choice1" name="banktype"
						value="0"> <label for="Choice1"
						style="font-weight: lighter; font-size: 14px;">บัญชีออมทรัพย์</label>&nbsp;&nbsp;&nbsp;

					<input type="radio" id="Choice2" name="banktype"
						value="1"> <label for="Choice2"
						style="font-weight: lighter; font-size: 14px;">บัญชีกระแสรายวัน</label>
				</div>

				<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เลขที่บัญชี</label>
					<input type="text" name="banknum" value=""
						class="form-control">
				</div>

				<div class="col-md-6 col-sm-12" style="padding-top: 20px;">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">สาขาธนาคาร</label>
					<input type="text" name="branch" value=""
						class="form-control">
				</div>
			</div>
		</div>
	</div>
</body>
</html>