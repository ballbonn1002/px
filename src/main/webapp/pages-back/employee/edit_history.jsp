<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:set var="userSalary" value="${userSalary}" />
	<c:set var="userSalarySize" value="${fn:length(userSalary)}" />
	<c:set var="date" value="${userSalary[userSalarySize-1].date}" />
	<c:set var="substringdate" value="${fn:substring(date, 2, 15)}" />

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="body" style="margin-left: 20px;">
					<c:forEach var="i" begin="1" end="${userSalarySize}" step="1"
						varStatus="loop">
						<div class="timeline-item animated fadeIn slower blue">
							<span class="date"><fmt:setLocale value="en_US"
									scope="session" /> <fmt:formatDate
									value="${userSalary[loop.end - i].date}" type="both"
									timeStyle="medium" pattern="dd-MMMM-yyyy " /></span>
							<h5 class="usersalary-amount"><fmt:formatNumber type = "number" 
         minFractionDigits = "2" value = "${userSalary[loop.end - i].amount}" /></h5>
							<span><a href="javascript:void(0);">${userSalary[loop.end - i].position_id}</a>
								${userSalary[loop.end - i].description}</span>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>