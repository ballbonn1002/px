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
						style="font-weight: lighter; font-size: 14px;">แผนก</label> <select
						class="form-control" name="depart">
						<c:forEach var="department" items="${departmentList}">
							<option class = "department-option" value="${department.department_id}"
								<c:if test="${selectUser.departmentId eq department.department_id }"> selected </c:if>>${department.description}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">วันที่จ้างงาน</label>
					<input data-provide="datepicker" data-date-autoclose="true"
						data-date-format="dd-mm-yyyy" name="startday"
						value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value="${selectUser.startDate}" pattern=" dd-MM-yyyy" />"
						class="form-control">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">วันทำงาน</label>
					<div class="form-inline">
						<select value="${selectUser.title_name_th}" name="startworkday"
							size="1" class="form-control" style="width: 47%; height: 35px;">
							<option value="0"
								<c:if test="${selectUser.workDayStart eq '0'}"> selected </c:if>>อาทิตย์</option>
							<option value="1"
								<c:if test="${selectUser.workDayStart eq '1'}"> selected </c:if>>จันทร์</option>
							<option value="2"
								<c:if test="${selectUser.workDayStart eq '2'}"> selected </c:if>>อังคาร</option>
							<option value="3"
								<c:if test="${selectUser.workDayStart eq '3'}"> selected </c:if>>พุธ</option>
							<option value="4"
								<c:if test="${selectUser.workDayStart eq '4'}"> selected </c:if>>พฤหัสบดี</option>
							<option value="5"
								<c:if test="${selectUser.workDayStart eq '5'}"> selected </c:if>>ศุกร์</option>
							<option value="6"
								<c:if test="${selectUser.workDayStart eq '6'}"> selected </c:if>>เสาร์</option>
						</select> &nbsp;&nbsp;ถึง&nbsp;&nbsp; <select
							value="${selectUser.title_name_th}" name="endworkday" size="1"
							class="form-control" style="width: 47%; height: 35px;">
							<option value="0"
								<c:if test="${selectUser.workDayEnd	 eq '0'}"> selected </c:if>>อาทิตย์</option>
							<option value="1"
								<c:if test="${selectUser.workDayEnd	 eq '1'}"> selected </c:if>>จันทร์</option>
							<option value="2"
								<c:if test="${selectUser.workDayEnd	 eq '2'}"> selected </c:if>>อังคาร</option>
							<option value="3"
								<c:if test="${selectUser.workDayEnd	 eq '3'}"> selected </c:if>>พุธ</option>
							<option value="4"
								<c:if test="${selectUser.workDayEnd	 eq '4'}"> selected </c:if>>พฤหัสบดี</option>
							<option value="5"
								<c:if test="${selectUser.workDayEnd	 eq '5'}"> selected </c:if>>ศุกร์</option>
							<option value="6"
								<c:if test="${selectUser.workDayEnd	 eq '6'}"> selected </c:if>>เสาร์</option>
						</select>
					</div>
				</div>
			</div>

			<div class="col-6">

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ตำเเหน่ง</label> <select
						class="form-control edit-position" name="positsion" style="width: 95%;">

						<c:forEach var="position" items="${positionList}">
							<option value="${position.positionId}"
								<c:if test="${selectUser.positionId eq position.positionId }"> selected </c:if>>${position.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">วันที่สิ้นสุดการจ้าง</label>
					<input data-provide="datepicker" data-date-autoclose="true"
						data-date-format="dd-mm-yyyy" name="endday"
						value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value="${selectUser.endDate}" pattern=" dd-MM-yyyy" />"
						class="form-control" style="width: 95%;">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เวลาทำงาน</label>
					<div class="form-inline">
						<input type="time" name="starttimework"
							value="${selectUser.workTimeStart}"
							class="form-control timepicker timepicker-24" style="width: 45%;">
						&nbsp;&nbsp;ถึง&nbsp;&nbsp; <input type="time" name="endtimework"
							value="${selectUser.workTimeEnd}" class="form-control"
							style="width: 45%;">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>