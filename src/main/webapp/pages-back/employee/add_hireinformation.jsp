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
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-6">

				<div class="form-group department-type">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เเผนก</label> <select
						class="form-control" name="depart">
						<option disabled selected value> -- select a department -- </option>
						<c:forEach var="department" items="${departmentList}">
							<option value="${department.department_id}">${department.description}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">วันที่จ้างงาน</label>
					<input data-provide="datepicker" data-date-autoclose="true"
						data-date-format="dd-mm-yyyy" name="startday"
						value="<fmt:formatDate value = "${null}" pattern=" dd-MM-yyyy" />"
						class="form-control">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">วันทำงาน</label>
					<div class="form-inline">
						<select value="" name="startworkday"
							size="1" class="form-control" style="width: 47%; height: 35px;">
							<option value="0"
							>อาทิตย์</option>
							<option value="1"
								>จันทร์</option>
							<option value="2"
								>อังคาร</option>
							<option value="3"
								>พุธ</option>
							<option value="4"
								>พฤหัสบดี</option>
							<option value="5"
							>ศุกร์</option>
							<option value="6"
								>เสาร์</option>
						</select> &nbsp;&nbsp;ถึง&nbsp;&nbsp; <select
							value="" name="endworkday" size="1"
							class="form-control" style="width: 47%; height: 35px;">
							<option value="0"
								>อาทิตย์</option>
							<option value="1"
								>จันทร์</option>
							<option value="2"
								>อังคาร</option>
							<option value="3"
								>พุธ</option>
							<option value="4"
								>พฤหัสบดี</option>
							<option value="5"
								>ศุกร์</option>
							<option value="6"
								>เสาร์</option>
						</select>
					</div>
				</div>
			</div>

			<div class="col-6">

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ตำเเหน่ง</label> <select
						class="form-control edit-position" name="positsion" style="width: 95%;">

					</select>
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">วันที่สิ้นสุดการจ้าง</label>
					<input data-provide="datepicker" data-date-autoclose="true"
						data-date-format="dd-mm-yyyy" name="endday"
						value="<fmt:formatDate value = "${null}" pattern=" dd-MM-yyyy" />"
						class="form-control" style="width: 95%;">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เวลาทำงาน</label>
					<div class="form-inline">
						<input type="time" name="starttimework"
							value=""
							class="form-control timepicker timepicker-24" style="width: 45%;">
						&nbsp;&nbsp;ถึง&nbsp;&nbsp; <input type="time" name="endtimework"
							value="" class="form-control"
							style="width: 45%;">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>