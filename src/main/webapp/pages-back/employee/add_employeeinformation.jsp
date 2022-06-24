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

</head>
<!--  Data Employee Page-->
<div class="container" style="margin-top: 20px;">
	<div class="row">
		<div class="col-6">
			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">รหัสพนักงาน</label>
				<input type="text" name="empId" value=""
					class="form-control">
			</div>

			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">ชื่อพนักงาน</label>
				<div class="form-inline">
					<select value="" name="prefixTH"
						size="1" class="form-control" style="width: 30%; height: 35px;">
						<option value="นาย"
							>นาย</option>
						<option value="นาง"
							>นาง</option>
						<option value="นางสาว"
							>นางสาว</option>
					</select> <input type="text" name="name" value=""
						class="form-control" style="width: 70%;">
				</div>
			</div>

			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">ชื่อพนักงาน
					EN</label>
				<div class="form-inline">
					<select value="" name="prefixEN"
						size="1" class="form-control" style="width: 30%; height: 35px;">
						<option value="Mr."
							>Mr.</option>
						<option value="Mrs."
							>Mrs.</option>
						<option value="Ms."
							>Ms.</option>
					</select> <input type="text" name="nameEN" value=""
						class="form-control" style="width: 70%;">
				</div>
			</div>
			<p>เพศ</p>
			<input type="radio" id="contactChoice1" name="gender"
				value="M"> <label for="contactChoice1"
				style="font-weight: lighter; font-size: 14px;">ชาย</label>&nbsp;&nbsp;&nbsp;

			<input type="radio" id="contactChoice2" name="gender"
				value="F"> <label for="contactChoice2"
				style="font-weight: lighter; font-size: 14px;">หญิง</label>

			<div class="form-group" style="margin-top: 15px">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">เลขบัตรประชาชน</label>
				<input type="text" name="IDcard" maxlength="13" minlength="13" value="" required
					class="form-control">
			</div>

			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">อีเมล</label> <input
					type="email" name="email" value="" required
					class="form-control">
			</div>

			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">ชื่อผู้ติดต่อฉุกเฉิน</label>
				<input type="text" name="nameEmer" value=""
					class="form-control">
			</div>

			<input type="hidden" name="logonUser" value="">
			<!-- กำหนดวันที่ Time Create -->
			<div>
				<input type="hidden" name="time" id="time"
					class="form-control input-lg timepicker timepicker-24 test"
					value="" data-time-format=" HH:mm" style="width: 200px;"
					onclick="timechenge()" onkeypress='return false'>
			</div>

			<div class="form-group form-md-line-input">
				<div class="col-md-2">
					<input name="date" id="date"
						value="<fmt:formatDate value=""  type = "both" 
       								timeStyle = "medium" pattern="dd-MM-yyyy "  />"
						onchange="datechenge()"
						class="form-control input-lg form-control-inline input-medium date-picker test"
						size="9" type="hidden" onkeypress='return false'>
				</div>
				<!-- End Time Create -->
			</div>
		</div>

		<div class="col-6">
			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">Username</label>
					<input type="text" name="username" value="" class="form-control" id = "add_emp_username" style = "width: 95%;" />
                    <label id = "validateUser" style="display: none;"></label>
			</div>

			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">ชื่อเล่น</label> <input
					type="text" name="nickname" value=""
					class="form-control" style="width: 95%;">
			</div>

			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">ชื่อเล่น EN</label>
				<input type="text" name="nicknameEN"
					value="" class="form-control"
					style="width: 95%;">
			</div>

			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">วันเกิด</label> <input
					data-provide="datepicker" data-date-autoclose="true"
					data-date-format="dd-mm-yyyy" name="bday"
					value="<fmt:formatDate value="" pattern=" dd-MM-yyyy" />"
					class="form-control" style="width: 95%;">
			</div>

			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">เลขหนังสือเดินทาง</label>
				<input type="text" name="passportID" required
					value="" maxlength="10" class="form-control"
					style="width: 95%;">
			</div>

			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">เบอร์โทร</label> <input
					 type="tel" name="phoneNum" value="" pattern="[0-9]{10}" required
					class="form-control" style="width: 95%;">
			</div>

			<div class="form-group">
				<label for="recipient-name" class="control-label"
					style="font-weight: lighter; font-size: 14px;">เบอร์ผู้ติดต่อฉุกเฉิน</label>
				<input type="tel" name="phoneEmer" value="" pattern="[0-9]{10}" required
					 class="form-control" style="width: 95%;">
			</div>
		</div>
	</div>
</div>
<script>
</script>
</html>