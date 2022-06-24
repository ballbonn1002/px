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
					<label class="control-label"
						style="font-size: 16px; color: #5C9BD1;">รายได้</label>
					<table class="table">
						<thead>
							<tr>
								<th height="41" style="text-align: center; width: 20%;">ตั้งค่า</th>
								<th height="41">ID</th>
								<th height="41">รายได้</th>
								<th height="41"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="test" items="${incomeList}">
								<c:set var="counter" value="${counter + 1}" />
								<tr class="checkbox-card">
									<td style="text-align: center;"><input type="checkbox"
										class="checkme" <c:if test="${test.flag == 1}">checked</c:if>>
									</td>
									<td>${test.id}</td>
									<td>${test.name}</td>
									<td><input style = "text-align : right;"
										<c:if test = "${test.flag == 0}"> disabled </c:if> type="text"
										class="form-control data-income" name="${test.id}" value="${test.value}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="col-md-6 col-sm-12">
					<label class="control-label"
						style="font-size: 16px; color: #5C9BD1;">รายการหัก</label>
					<table class="table">
						<thead>
							<tr>
								<th height="41" style="text-align: center; width: 20%;">ตั้งค่า</th>
								<th height="41">ID</th>
								<th height="41">รายการหัก</th>
								<th height="41"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="test" items="${expendList}">
								<c:set var="counter" value="${counter + 1}" />
								<tr class="checkbox-card">
									<td style="text-align: center;"><input type="checkbox"
										name="paymentconfigId" value="${test.id}" class="checkme"
										<c:if test="${test.flag == 1}">checked</c:if> /></td>
									<td>${test.id}</td>
									<td>${test.name}</td>
									<td><input style = "text-align : right;"
										<c:if test = "${test.flag == 0}"> disabled </c:if> type="text"
										class="form-control data-income" name="${test.id}" value="${test.value}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>