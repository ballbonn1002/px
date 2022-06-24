<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<c:set var = "userSalary" value = "${userSalary}"/>
<c:set var = "userSalarySize" value="${fn:length(userSalary)}"/>
<c:set var = "date" value = "${userSalary[userSalarySize-1].date}"/>
<c:set var = "substringdate" value = "${fn:substring(date, 2, 15)}" />

	<div class="portlet-body">
		<div class="portlet box white">
			<div class="body" style="margin-left: 20px;">
				<c:forEach var="i" begin="1" end="${userSalarySize}" step="1" varStatus="loop">
					<div class="timeline-item animated fadeIn slower blue">
						<span>${userSalary[loop.end - i].date}</span>
						<h5>${userSalary[loop.end - i].amount}</h5>
						<p>${userSalary[loop.end - i].description}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>