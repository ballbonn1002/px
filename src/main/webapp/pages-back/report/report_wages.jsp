<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" type="text/css" />
<!-- VENDOR CSS -->
<link rel="stylesheet" href="pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="pages-back/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="pages-back/assets/vendor/table-dragger/table-dragger.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="pages-back/assets/css/main.css">
<link rel="stylesheet" href="pages-back/assets/css/color_skins.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<style>
	.select2-container .select2-selection--single {
        height: 34px;
    }
</style>
<div class="block-header">
    <div class="row">
        <div class="col-12">
               <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>รายงาน เงินเดือน/ค่าจ้างสะสม
              <span style="float:right;"> <button class="btn btn-outline-secondary"  data-toggle="dropdown"><i class="fa fa-print"></i></button></span></h2>
   
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">รายงาน</li>
                    <li class="breadcrumb-item active">รายงาน เงินเดือน/ค่าจ้างสะสม</li>
                </ul>
                
        </div>            
    </div>
</div>
<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card">
            <div class="body">
            	<div class="portlet light bordered">
					<div class="portlet-title" style = "padding-bottom: 40px;">
						<div class="caption" style="padding-left: 13px;" >
							<h6>รายงาน เงินเดือน/ค่าจ้างสะสม</h6>
						</div>
					</div>
					</div>
		<div class="container">
			<div class="row">	
				<div class="col-md-4">     
                         <div class="input-group input-large date-picker input-daterange"  data-date-format="dd-mm-yyyy">
                           <input type="text" onMouseOver="(this.type='date')"  class="form-control" name="Date-Start" id="F-date" placeholder="Start Date">
                           <span class="" style="margin-right:5px;margin-left:5px;font-size:25px"> - </span>
                           <input type="text" onMouseOver="(this.type='date')"  class="form-control" name="Date-End" id="E-date" placeholder="End Date"> 
                        </div> 
                    </div>
				<div class="col-md-3">	
					<div class="form-group">
					<div class="input-group">
						<select id="user" class="js-example-basic-multiple-limit" name="user">
						 	<option></option>
							<c:forEach var="user" items="${userList}">
							<option value="${user.id}">${user.department_id} - ${user.name}</option>
							</c:forEach>
						</select> 
					</div>
					</div>
				</div>
		 	<div class="col-sm-3">
					<div class="form-group">
						<button  class="btn btn-info" onclick="search()" id="searchbutton" >
							<i class="fa fa-search"></i>&nbsp;Search
						</button>
					</div>  
				</div> 	
				</div>
				</div>
				<div class="portlet-body">
				<div class="panel-body">
					<div class="table-responsive">
                    <table id="myTable1" class="table table-striped" style="margin-top:30px;">
                       <thead>
                            <tr>
                                 <th colspan="2">รายได้เพิ่มเติม</th>
                             </tr>  
                         </thead>
                         <tbody id="body">
                         	<c:forEach var="test" items="${paymentTypeList}">
                       		<c:set var="counter" value="${counter+1}"/>
                         	<tr>
                         		<c:if test="${test.type == 1}">	
									<td style="min-width:140px">${test.payment_type_id}</td>
                         			<td style="min-width:170px">${test.payment_type_name}</td>
                         		</c:if>
                         	</tr>
                         	</c:forEach>
                         </tbody>
                     </table>
                     <br>
					<table id="myTable2" class="table table-striped" style="margin-top:30px;">
                       <thead>
                            <tr>
                           		<th colspan="2">รายการหัก</th>
                             </tr>
                         </thead>
                         <tbody>
                         	<c:forEach var="test" items="${paymentTypeList}">
                       		<c:set var="counter" value="${counter+1}"/>
                         	<tr>
                         		<c:if test="${test.type == 0}">	
									<td style="min-width:140px">${test.payment_type_id}</td>
                         			<td style="min-width:170px">${test.payment_type_name}</td>
                         		</c:if>
                         	</tr>
                         	</c:forEach>
                         </tbody>
                     </table> 
                     </div>
				</div>
                </div>
      		</div>
   		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	$(".js-example-basic-multiple-limit").select2({
	    placeholder: "เลือก",
	    allowClear: true
	});
});
</script>
<script>	
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
		function search(){
		var user = $("#user").val();
		var fdate = $("#F-date").val();
		var edate = $("#E-date").val();
		
		$.ajax({
			url: "checkIdDate",
			method: "POST",
			type: "JSON",
			data: { "user" : user,
					"Date-Start" : fdate,
					"Date-End" : edate
			},
			success:function(data){
			console.log(data);
			$('.data').remove();
			var tble = document.getElementById('myTable1');
            var row = tble.rows;
			var tblHeadObj1 = document.getElementById("myTable1").tHead;
			var tblBodyObj1 = document.getElementById("myTable1").tBodies[0];
			var tblHeadObj2 = document.getElementById("myTable2").tHead;
			var tblBodyObj2 = document.getElementById("myTable2").tBodies[0];
			var sum = [];
			for(var i = 0; i < data.length; i++){
			    var objects = data[i];
			    for(var n = 0; n < objects.length; n++){
			        var existed = false;
			        for(var z = 0; z < sum.length; z++){
			            if(sum[z].payment_type_id === objects[n].payment_type_id){
			            	sum[z].amount += objects[n].amount;
			                existed = true;
			            }
			        }
			        if(!existed){
			        	sum.push({payment_type_id : objects[n].payment_type_id, amount: objects[n].amount});                
			        }
			    }
			}
			console.log(sum);
			for(var n=0; n<data.length; n++){
					
				var total1 = 0;
				var total2 = 0;
				var sumtotal1 = 0;
				var sumtotal2 = 0;
				
				for(var i=0; i<data[n].length; i++){
					
					if(data[n][i].type == 1){
						title1 = data[n][i].payment_date;
						amount1 = (numberWithCommas(Number(data[n][i].amount).toFixed(2)));
						
						var newCell1 = tblBodyObj1.rows[i].insertCell(-1);
						newCell1.className = 'data test';
						newCell1.style.textAlign = "right";
			 			newCell1.innerHTML = amount1;
			 			total1 += data[n][i].amount;
			 			sumtotal1 += sum[i].amount;
			 			if(n == data.length -1){
			 				sum1 = (numberWithCommas(Number(sum[i].amount).toFixed(2)));
							var newSum1 = tblBodyObj1.rows[i].insertCell();
							newSum1.className = 'data';
			 				newSum1.style.color = "#449CFF";
			 				newSum1.style.textAlign = "right";
			 				newSum1.innerHTML = sum1;
			 			}
					}
					if(data[n][i].type == 0){
						title2 = data[n][i].payment_date;
						amount2 = (numberWithCommas(Number(data[n][i].amount).toFixed(2)));
						var newCell2 = tblBodyObj2.rows[i].insertCell(-1);
						newCell2.className = 'data test';
						newCell2.style.textAlign = "right";
				 		newCell2.innerHTML = amount2;
				 		
				 		sumtotal2 += sum[i].amount;
				 		total2 += data[n][i].amount;
				 		
				 		if(n == data.length -1){
				 			sum2 = (numberWithCommas(Number(sum[i].amount).toFixed(2)));
			 				var newSum2 = tblBodyObj2.rows[i].insertCell(-1);
			 				newSum2.className = 'data';
			 				newSum2.style.color = "#449CFF";
			 				newSum2.style.textAlign = "right";
			 				newSum2.innerHTML = sum2;
				 		}
					}
				}
				
				var newTH1 = document.createElement('th');
				tblHeadObj1.rows[0].appendChild(newTH1);
				newTH1.innerHTML = title1;
				newTH1.className = 'data';
				newTH1.style.textAlign = "right";
				
				var newTH2 = document.createElement('th');
				tblHeadObj2.rows[0].appendChild(newTH2);
				newTH2.innerHTML = title2;
				newTH2.className = 'data';
				newTH2.style.textAlign = "right";
				
				var tr1;
				var tr2;
				if(n == data.length - 1){
		 			var newTH1 = document.createElement('th');
		 			var newTH2 = document.createElement('th');
		 			tblHeadObj1.rows[0].appendChild(newTH1);
		 			tblHeadObj2.rows[0].appendChild(newTH2);
		 			newTH1.className = 'data test';
		 			newTH2.className = 'data test';
		 			newTH1.innerHTML = 'สรุปยอดรวม'
		 			newTH2.innerHTML = 'สรุปยอดรวม'
		 			newTH1.style.textAlign = "right";
		 			newTH2.style.textAlign = "right";
		 		}
				if(n == 0){
					tr1 = document.createElement('tr');
					tr2 = document.createElement('tr');
					tr1.className = 'data';
					tr2.className = 'data';
					var td1 = document.createElement('td');
					var td2 = document.createElement('td');
					td1.style.backgroundColor = "#F7FBFF";
					td1.style.color = "#449CFF";
					td1.colSpan = 2;
					td2.style.backgroundColor = "#F7FBFF";
					td2.style.color = "#449CFF";
					td2.colSpan = 2;
					var text1 = document.createTextNode('สรุปยอดรวม');
					var text2 = document.createTextNode('สรุปยอดรวม');
					td1.appendChild(text1);
					tr1.appendChild(td1);
					td2.appendChild(text2);
					tr2.appendChild(td2);
					
				}
				var newtotal1 = tr1.insertCell();
				newtotal1.innerHTML = (numberWithCommas(Number(total1).toFixed(2)));
				newtotal1.style.textAlign = "right";
				newtotal1.style.backgroundColor = "#F7FBFF";
				newtotal1.style.color = "#449CFF";
				
				//console.log(total1);
				
				var newtotal2 = tr2.insertCell();
				newtotal2.innerHTML = (numberWithCommas(Number(total2).toFixed(2)));
				newtotal2.style.textAlign = "right";
				newtotal2.style.backgroundColor = "#F7FBFF";
				newtotal2.style.color = "#449CFF";
				
				if(n == data.length -1){	
					var newsum1 = tr1.insertCell();
					newsum1.innerHTML = (numberWithCommas(Number(sumtotal1).toFixed(2)));
					newsum1.style.textAlign = "right";
					newsum1.style.backgroundColor = "#F7FBFF";
					newsum1.style.color = "#449CFF";
					newsum1.className = 'data';
					
					var newsum2 = tr2.insertCell();
					newsum2.innerHTML = (numberWithCommas(Number(sumtotal2).toFixed(2)));
					newsum2.style.textAlign = "right";
					newsum2.style.backgroundColor = "#F7FBFF";
					newsum2.style.color = "#449CFF";
					newsum2.className = 'data';
				}
				
				tblBodyObj1.appendChild(tr1);
				tblBodyObj2.appendChild(tr2);
	 		}
			
			var table1 = document.getElementById("myTable1");
			var table2 = document.getElementById("myTable2");
			var cells1 = table1.getElementsByClassName("test");
			var cells2 = table2.getElementsByClassName("test");
			for (var i = 0; i < cells1.length; i++) {
				  if (parseInt(cells1[i].textContent, 10) === 0) {
				    cells1[i].style.color = "#ced4da";
				  }
				}
				  for (var n = 0; n < cells2.length; n++) {
					  if (parseInt(cells2[n].textContent, 10) === 0) {
				    cells2[n].style.color = "#ced4da";
				  }
				}
				  
			}
		});
		};
</script> 