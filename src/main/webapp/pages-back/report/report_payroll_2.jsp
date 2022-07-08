<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
		
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>

<script src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"type="text/javascript"></script>



<script src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"type="text/javascript"></script>
			
<script src="../assets/pages/scripts/ui-sweetalert.min.js"type="text/javascript"></script>

<link
		href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
		rel="stylesheet" type="text/css" />
		
		
<script src="https://code.jquery.com/jquery-3.5.1.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/fixedcolumns/4.1.0/js/dataTables.fixedColumns.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/4.1.0/css/fixedColumns.dataTables.min.css">




		
<script>
			
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
</script>
<style>
table{
text-align:center;
}
 .view {
  margin: auto;
  width: 1230px;
}

.wrapper {
  position: relative;
  overflow-x: scroll;
  scrollbar-width: 50px;
  
  white-space: nowrap;
}

.sticky-col {
  position: -webkit-sticky;
  position: sticky;
  background-color: white;
}

.first-col {
  width: 100px;
  min-width: 100px;
  max-width: 100px;
  left: 0px;
}

.second-col {
  width: 150px;
  min-width: 150px;
  max-width: 150px;
  left: 100px;
}
.last-first-col {
  width: 100px;
  min-width: 100px;
  max-width: 100px;
  right: 0px;
}
.last-second-col {
  width: 150px;
  min-width: 150px;
  max-width: 150px;
  right: 100px;
}
.last-third-col {
  width: 150px;
  min-width: 150px;
  max-width: 150px;
  right: 250px;
}
/* width */
.wrapper::-webkit-scrollbar {
  width: 5px;
  height:4px
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888;
  border-radius: 10px; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
.wrapper::-webkit-scrollbar-track-piece:start {
  margin-left: 250px;
}
.wrapper::-webkit-scrollbar-track-piece:end {
  margin-right: 400px;
}
</style>
<div class="block-header">
    <div class="row">
        <div class="col-lg-12 col-md-8 col-sm-12">
              <h2 style="font-size:20px; font-weight:600; "><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>รายงาน รายการจ่ายเงินเดือน
              <span style="float:right;"> <button class="btn btn-outline-secondary"  data-toggle="dropdown"><i class="fa fa-print"></i></button></span></h2>
              
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item" style="font-size:14px;">รายงาน</li>
                    <li class="breadcrumb-item active" style="font-weight:Semibold;font-size:14px">รายงาน รายการจ่ายเงินเดือน</li>
      
                </ul>
                
        </div> 
                   
    </div>
</div>
<div class="row clearfix">
	<div class="col-lg-12">
		<div class="card">
			<div class="header">
				<div style="color:#449CFF">
					<h6 class="card-title" >${payment_groupList[0].name}<span style="float:right;">#${payment_groupList[0].payment_group_id}</span></h6>
					<hr style="border-top: 2px solid #449CFF;">
				</div>
			</div>
			<div class="body">
				<div class="portlet light bordered">
					<div class="portlet-body">
						<div class="portlet box white">
							<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label" style="padding-left: 12px;">ช่วงวันที่</label>
												<div class="form-control" style="border:none; background-color:transparent;">
												 	<fmt:formatDate value="${payment_groupList[0].start_date}" pattern="dd/MM/yyyy"></fmt:formatDate>
												 	                                     &nbsp;&nbsp;-&nbsp;&nbsp;
												 	       <fmt:formatDate value="${payment_groupList[0].end_date}" pattern="dd/MM/yyyy"></fmt:formatDate>
												</div>
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group" >
												<label for="recipient-name" class="control-label" style="padding-left: 12px;">วันที่ชำระ</label>
												<input type="text" name="payment_date" class="form-control" value="<fmt:formatDate value="${payment_groupList[0].payment_date }" pattern="dd/MM/yyyy"></fmt:formatDate>"  style="border:none; background-color:transparent;" readonly />
												 
												
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label" style="padding-left: 12px;">ประกันสังคม</label>
												<input type="text" name="social" class="form-control"  value="${payment_groupList[0].social_security }" style="border:none; background-color:transparent;" readonly />
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label" style="padding-left: 12px;">พนักงาน</label>
												<input type="text" name="employee" class="form-control" id="employee" value="" style="border:none; background-color:transparent;" readonly />
											</div>
										</div>
									</div>
									<div class="">
										
											<div class="view">
										  <div class="wrapper">
										    <table class="table" id="table">
										      <thead>
										        <tr>
										          <th class="sticky-col first-col">Number</th>
										          <th class="sticky-col second-col">Employer</th>
										          <c:forEach var="test" items="${payment_typeList}">
										          	<th style="padding-left: 25px;">${test.Payment_type_name}</th>
										          </c:forEach>
										          
										          <th class="sticky-col last-third-col">สรุปรายได้ เพิ่มเติม</th>
										          <th class="sticky-col last-second-col">สรุปรายการหัก</th>
										          <th class="sticky-col last-first-col">รายได้สุทธิ</th>
										        </tr>
										      </thead>
										      <tbody>
										       <c:forEach var="hi" items="${groupList}">
										     <c:set var="counter" value="${counter + 1}" />
										        <tr class="tbody" style="text-align:right;">
										          <td class="sticky-col first-col" style="text-align:center;">${counter}</td>
										          <td class="sticky-col second-col" style="text-align:center;">${hi.user_id}</td>
										          <td class="SL"> 
										          	<fmt:parseNumber var = "SL" type = "number" value = "${hi.SL}" />
										            <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${SL}" />
										          </td>
										          <td class="OT1">
										          	<fmt:parseNumber var = "OT1" type = "number" value = "${hi.OT1}" />
										            <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${OT1}" />
										          </td>
										          <td class="OT2">
										          	<fmt:parseNumber var = "OT2" type = "number" value = "${hi.OT2}" />
										            <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${OT2}" />
										          </td>
										          <td class="OT3">
										          	   <fmt:parseNumber var = "OT3" type = "number" value = "${hi.OT3}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${OT3}" />
										          </td>
										          <td class="VA">
										          	   <fmt:parseNumber var = "VA" type = "number" value = "${hi.VA}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${VA}" />
										          </td>
										          <td class="TRAVEL">
										               <fmt:parseNumber var = "TRAVEL" type = "number" value = "${hi.TRAVEL}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${TRAVEL}" />
										          </td>
										          <td class="BONUS">
										               <fmt:parseNumber var = "BONUS" type = "number" value = "${hi.BONUS}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${BONUS}" />
										          </td>
										          <td class="EQUIPMENT">
										               <fmt:parseNumber var = "EQUIPMENT" type = "number" value = "${hi.EQUIPMENT}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${EQUIPMENT}" />
										          </td>
										          <td class="SSI">
										               <fmt:parseNumber var = "SSI" type = "number" value = "${hi.SSI}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${SSI}" />
										          </td>
										          <td class="TAX">
										               <fmt:parseNumber var = "TAX" type = "number" value = "${hi.TAX}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${TAX}" />
										          </td>
										          <td class="TISCO">
										               <fmt:parseNumber var = "TISCO" type = "number" value = "${hi.TISCO}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${TISCO}" />
										          </td>
										          <td class="LATE">
										               <fmt:parseNumber var = "LATE" type = "number" value = "${hi.LATE}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${LATE}" />
										          </td>
										          <td class="ABSENT">
										               <fmt:parseNumber var = "ABSENT" type = "number" value = "${hi.ABSENT}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${ABSENT}" />
										          </td>
										          <td class="ABSENCE">
										               <fmt:parseNumber var = "ABSENCE" type = "number" value = "${hi.ABSENCE}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${ABSENCE}" />
										          </td>
										          <td class="StudentLoan">
										               <fmt:parseNumber var = "StudentLoan" type = "number" value = "${hi.StudentLoan}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${StudentLoan}" />
										          </td>
										          <td class="sticky-col last-third-col income_net" style="color:#449CFF">
										          		<fmt:parseNumber var = "income_net" type = "number" value = "${hi.income_net}" />
										                <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${income_net}" />
										           </td>
										          <td class="sticky-col last-second-col expend_net" style="color:#449CFF">
										               <fmt:parseNumber var = "expend_net" type = "number" value = "${hi.expend_net}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${expend_net}" />
										          </td>
										          <td class="sticky-col last-first-col total_pay" style="color:#449CFF;text-align:right;">
										               <fmt:parseNumber var = "total_pay" type = "number" value = "${hi.total_pay}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${total_pay}" />
										          </td>
										        </tr>
										        </c:forEach>
										      </tbody>
										      <tfoot style="color:#449CFF" >
										      	<tr style="text-align:right;">
										      		<th class="sticky-col first-col">สรุปยอดรวม</th>
										      		<th class="sticky-col second-col"></th>
										      		<th id="SL"></th>
										      		<th id="OT1"></th>
										      		<th id="OT2"></th>
										      		<th id="OT3"></th>
										      		<th id=VA></th>
										      		<th id="TRAVEL"></th>
										      		<th id="BONUS"></th>
										      		<th id="EQUIPMENT"></th>
										      		<th id="SSI"></th>
										      		<th id="TAX"></th>
										      		<th id="TISCO"></th>
										      		<th id="LATE"></th>
										      		<th id="ABSENT"></th>
										      		<th id="ABSENCE"></th>
										      		<th id="StudentLoan"></th>
										      		<th class="sticky-col last-third-col" id="income_net"></th>
										      		<th class="sticky-col last-second-col" id="expend_net"></th>
										      		<th class="sticky-col last-first-col" id="total_pay"></th>
										      	</tr>
										      </tfoot>
										     
										    </table>
										  </div>
										</div>
										
									</div>
									
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--  <script>
$(document).ready(function() {
    var table = $('#example').DataTable( {
        scrollY:        "300px",
        scrollX:        true,
        scrollCollapse: true,
        paging:         false,
        fixedColumns:   {
            left: 2
        }
    } );
} );
</script>-->
<!-- <script>
var table = document.getElementByClassName("test1"), sumVal = 0;
console.log(table);
for(var i = 1; i < table.rows.length; i++)
{
    sumVal = sumVal + parseFloat(table.rows[i].cells[2].innerHTML);
}

document.getElementById("val").innerHTML = sumVal;
console.log(sumVal);

</script> -->
<!--<script type="text/javascript">
$(document).ready(function(){
	var sum = 0;
	$('.test1').each(function(){
		 sum += parseFloat($(this).text());
	});
	console.log(sum);
	$('#val').text(sum);
});
</script>  -->
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


	
$(document).ready(function(){
	  var sumofSL = 0;
	  var sumofOT1 = 0;
	  var sumofOT2 = 0;
	  var sumofOT3 = 0;
	  var sumofVA = 0;
	  var sumofTRAVEL = 0;
	  var sumofBONUS = 0;
	  var sumofEQUIPMENT = 0;
	  var sumofSSI = 0;
	  var sumofTAX = 0;
	  var sumofTISCO = 0;
	  var sumofLATE = 0;
	  var sumofABSENT = 0;
	  var sumofABSENCE = 0;
	  var sumofStudentLoan = 0;
	  var sumofincome_net = 0;
	  var sumofexpend_net = 0;
	  var sumoftotal_pay = 0;
	  
	  $(".SL").each(function() {
	      if ($(this).text() !== '') {
	      sumofSL = sumofSL + parseFloat($(this).html().replace(',',''));
	      $('#SL').text(numberWithCommas(Number(sumofSL).toFixed(2)));
	    }
	  });
	  $(".OT1").each(function() {
	      if ($(this).text() !== '') {
	      sumofOT1 = sumofOT1 + parseFloat($(this).html().replace(',',''));
	      $('#OT1').text(numberWithCommas(Number(sumofOT1).toFixed(2)));
	    }
	  });
	  $(".OT2").each(function() {
	      if ($(this).text() !== '') {
	      sumofOT2 = sumofOT2 + parseFloat($(this).html().replace(',',''));
	      $('#OT2').text(numberWithCommas(Number(sumofOT2).toFixed(2)));
	    }
	  });
	  $(".OT3").each(function() {
	      if ($(this).text() !== '') {
	      sumofOT3 = sumofOT3 + parseFloat($(this).html().replace(',',''));
	      $('#OT3').text(numberWithCommas(Number(sumofOT3).toFixed(2)));
	    }
	  });
	  $(".VA").each(function() {
	      if ($(this).text() !== '') {
	      sumofVA = sumofVA + parseFloat($(this).html().replace(',',''));
	      $('#VA').text(numberWithCommas(Number(sumofVA).toFixed(2)));
	    }
	  });
	  $(".TRAVEL").each(function() {
	      if ($(this).text() !== '') {
	      sumofTRAVEL = sumofTRAVEL + parseFloat($(this).html().replace(',',''));
	      $('#TRAVEL').text(numberWithCommas(Number(sumofTRAVEL).toFixed(2)));
	    }
	  });
	  $(".BONUS").each(function() {
	      if ($(this).text() !== '') {
	      sumofBONUS = sumofBONUS + parseFloat($(this).html().replace(',',''));
	      $('#BONUS').text(numberWithCommas(Number(sumofBONUS).toFixed(2)));
	    }
	  });
	  $(".EQUIPMENT").each(function() {
	      if ($(this).text() !== '') {
	      sumofEQUIPMENT = sumofEQUIPMENT + parseFloat($(this).html().replace(',',''));
	      $('#EQUIPMENT').text(numberWithCommas(Number(sumofEQUIPMENT).toFixed(2)));
	    }
	  });
	  $(".SSI").each(function() {
	      if ($(this).text() !== '') {
	      sumofSSI = sumofSSI + parseFloat($(this).html().replace(',',''));
	      $('#SSI').text(numberWithCommas(Number(sumofSSI).toFixed(2)));
	    }
	  });
	  $(".TAX").each(function() {
	      if ($(this).text() !== '') {
	      sumofTAX = sumofTAX + parseFloat($(this).html().replace(',',''));
	      $('#TAX').text(numberWithCommas(Number(sumofTAX).toFixed(2)));
	    }
	  });
	  $(".TISCO").each(function() {
	      if ($(this).text() !== '') {
	      sumofTISCO = sumofTISCO + parseFloat($(this).html().replace(',',''));
	      $('#TISCO').text(numberWithCommas(Number(sumofTISCO).toFixed(2)));
	    }
	  });
	  $(".LATE").each(function() {
	      if ($(this).text() !== '') {
	      sumofLATE = sumofLATE + parseFloat($(this).html().replace(',',''));
	      $('#LATE').text(numberWithCommas(Number(sumofLATE).toFixed(2)));
	    }
	  });
	  $(".ABSENT").each(function() {
	      if ($(this).text() !== '') {
	      sumofABSENT = sumofABSENT + parseFloat($(this).html().replace(',',''));
	      $('#ABSENT').text(numberWithCommas(Number(sumofABSENT).toFixed(2)));
	    }
	  });
	  $(".ABSENCE").each(function() {
	      if ($(this).text() !== '') {
	      sumofABSENCE = sumofABSENCE + parseFloat($(this).html().replace(',',''));
	      $('#ABSENCE').text(numberWithCommas(Number(sumofABSENCE).toFixed(2)));
	    }
	  });
	  $(".StudentLoan").each(function() {
	      if ($(this).text() !== '') {
	      sumofStudentLoan = sumofStudentLoan + parseFloat($(this).html().replace(',',''));
	      $('#StudentLoan').text(numberWithCommas(Number(sumofStudentLoan).toFixed(2)));
	    }
	  });
	  $(".income_net").each(function() {
	      if ($(this).text() !== '') {
	      sumofincome_net = sumofincome_net + parseFloat($(this).html().replace(',',''));
	      $('#income_net').text(numberWithCommas(Number(sumofincome_net).toFixed(2)));
	    }
	  });
	  
	  $(".expend_net").each(function() {
	      if ($(this).text() !== '') {
	      sumofexpend_net = sumofexpend_net + parseFloat($(this).html().replace(',',''));
	      $('#expend_net').text(numberWithCommas(Number(sumofexpend_net).toFixed(2)));
	    }
	  });
	  $(".total_pay").each(function() {
	      if ($(this).text() !== '') {
	      sumoftotal_pay = sumoftotal_pay + parseFloat($(this).html().replace(',',''));
	      $('#total_pay').text(numberWithCommas(Number(sumoftotal_pay).toFixed(2)));
	    }
	  });
});
	
          var x = $('#table').find('tr.tbody').length
          console.log(x);
          $('#employee').val(x);
	

	

</script>
<script>
const element = document.querySelector(".wrapper");

element.addEventListener('wheel', (event) => {
  event.preventDefault();

  element.scrollBy({
    left: event.deltaY < 0 ? -30 : 30,
    
  });
});
</script>

