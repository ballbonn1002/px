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
				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">รหัสพนักงาน</label>
					<input type="text" name="empId" value="${selectUser.employeeId}"
						class="form-control" required>
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ชื่อพนักงาน</label>
					<div class="form-inline">
						<select value="${selectUser.title_name_th}" name="prefixTH"
							size="1" class="form-control" style="width: 30%; height: 35px;">
							<option value="นาย"
								<c:if test="${selectUser.title_name_th eq 'นาย'}"> selected </c:if>>นาย</option>
							<option value="นาง"
								<c:if test="${selectUser.title_name_th eq 'นาง'}"> selected </c:if>>นาง</option>
							<option value="นางสาว"
								<c:if test="${selectUser.title_name_th eq 'นางสาว'}"> selected </c:if>>นางสาว</option>
						</select> <input type="text" name="name" value="${selectUser.name}"
							class="form-control" style="width: 70%;">
					</div>
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ชื่อพนักงาน
						EN</label>
					<div class="form-inline">
						<select value="${selectUser.title_name_en}" name="prefixEN"
							size="1" class="form-control" style="width: 30%; height: 35px;">
							<option value="Mr."
								<c:if test="${selectUser.title_name_en eq 'Mr.'}"> selected </c:if>>Mr.</option>
							<option value="Mrs."
								<c:if test="${selectUser.title_name_en eq 'Mrs.'}"> selected </c:if>>Mrs.</option>
							<option value="Ms."
								<c:if test="${selectUser.title_name_en eq 'Ms.'}"> selected </c:if>>Ms.</option>
						</select> <input type="text" name="nameEN" value="${selectUser.nameEN}"
							class="form-control" style="width: 70%;">
					</div>
				</div>
				<p>เพศ</p>
				<input type="radio" id="contactChoice1" name="gender"
					<c:if test="${selectUser.gender eq 'M' }">
                                          		checked
                                     		</c:if>
					value="M"> <label for="contactChoice1"
					style="font-weight: lighter; font-size: 14px;">ชาย</label>&nbsp;&nbsp;&nbsp;

				<input type="radio" id="contactChoice2" name="gender"
					<c:if test="${selectUser.gender eq 'F' }">
                                          		checked
                                     		</c:if>
					value="F"> <label for="contactChoice2"
					style="font-weight: lighter; font-size: 14px;">หญิง</label>

				<div class="form-group" style="margin-top: 15px">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เลขบัตรประชาชน</label>
					<input type="text" maxlength="13" minlength="13" name="IDcard" value="${selectUser.citizen_id}"
						class="form-control">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">อีเมล</label> <input
						type="email" name="email" value="${selectUser.email}"
						class="form-control">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ชื่อผู้ติดต่อฉุกเฉิน</label>
					<input type="text" name="nameEmer" value="${selectUser.nameEmer}"
						class="form-control">
				</div>

				<input type="hidden" name="logonUser" value="${logonUser}">
				<!-- กำหนดวันที่ Time Create -->
				<div>
					<input type="hidden" name="time" id="time"
						class="form-control input-lg timepicker timepicker-24 test"
						value="${time}" data-time-format=" HH:mm" style="width: 200px;"
						onclick="timechenge()" onkeypress='return false'>
				</div>

				<div class="form-group form-md-line-input">
					<div class="col-md-2">
						<input name="date" id="date"
							value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value="${now}"  type = "both" 
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
						style="font-weight: lighter; font-size: 14px;">Username</label> <input
						type="text" name="username" value="${selectUser.id}"
						class="form-control" style="width: 95%;" readonly="readonly" id = "edit-username">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ชื่อเล่น</label> <input
						type="text" name="nickname" value="${selectUser.nickName}"
						class="form-control" style="width: 95%;">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">ชื่อเล่น EN</label>
					<input type="text" name="nicknameEN"
						value="${selectUser.nicknameEN}" class="form-control"
						style="width: 95%;">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">วันเกิด</label> <input
						data-provide="datepicker" data-date-autoclose="true"
						data-date-format="dd-mm-yyyy" name="bday"
						value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value="${selectUser.birthDate}" pattern=" dd-MM-yyyy" />"
						class="form-control" style="width: 95%;">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เลขหนังสือเดินทาง</label>
					<input type="text" name="passportID" maxlength="10"
						value="${selectUser.passport_id}" class="form-control"
						style="width: 95%;">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เบอร์โทร</label> <input
					   type="tel" pattern="[0-9]{10}" name="phoneNum" value="${selectUser.phoneNum}"
						class="form-control" style="width: 95%;">
				</div>

				<div class="form-group">
					<label for="recipient-name" class="control-label"
						style="font-weight: lighter; font-size: 14px;">เบอร์ผู้ติดต่อฉุกเฉิน</label>
					<input type="tel" pattern="[0-9]{10}" name="phoneEmer" value="${selectUser.phoneEmer}"
						class="form-control" style="width: 95%;">
				</div>
			</div>
		</div>
	</div>

</body>
</html>