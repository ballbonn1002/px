<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<style>
tr{    
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 2s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  
  to {
    opacity: 1;
  }
}

</style>
<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class=" fa fa-users font-red"></i> <span
				class="caption-subject font-red sbold uppercase">ROLE
				MANAGEMENT</span>
		</div>
		<perm:permission object="role.edit">
			<div class="actions right">
				<button type="button" id="addRole" class="btn green-meadow"
					onclick="add()">
					<i class="fa fa-plus"></i>&nbsp;Add Role
				</button>
				<a class="btn btn-circle btn-icon-only btn-default fullscreen"
					href="javascript:;" data-original-title="" title=""> </a>
			</div>
		</perm:permission>
	</div>
	<div class="portlet-body  flip-scroll">

		<div class="table-scrollable">
			<table
				class="table table-striped table-condensed flip-content table-hover text-center">
				<thead >
					<tr class="text-center" style="background-color:rgb(59, 63, 81);color:white">
						<th height="41"><center>#</center></th>
						<th height="41"><center>Role ID</center></th>
						<th height="41"><center>Name</center></th>
						<th height="41"><center>Description</center></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="role" items="${roleList}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td style="word-break: break-all; white-space: normal;"><a
								href="role-edit?roleId=${role.id}">${role.id}</a></td>
							<td style="word-break: break-all; white-space: normal;">${role.name}</td>
							<td style="word-break: break-all; white-space: normal;text-align:left;">${role.description}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- END FORM-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function add() {

		document.location = "role-add";
	}
</script>

<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />