<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
		
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>

<script src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"type="text/javascript"></script>
			
<script src="../assets/pages/scripts/ui-sweetalert.min.js"type="text/javascript"></script>

<link
		href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
		rel="stylesheet" type="text/css" />
<script>
		
		
<script>
			
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
</script>
<style>
@media only screen and (min-width: 320px) and (max-width: 1200px){
	table{
text-align:center;
}


.view2 {
 margin: auto;
  width: 100%;
  display:flex;
  scroll-x:auto;
}

.wrapper2 {
  position: relative;
  overflow: auto;
  white-space: nowrap;
}
.first-col {
   width: 50px;
  min-width: 50px;
  max-width: 100px;
}

.second-col {
  width: 150px;
}
.foot-first-col {
  
  min-width: 100px;
  text-align:right;
  vertical-align: middle !important;
 
}

.foot-second-col {
  min-width: 100px;
  text-align:right;
  vertical-align: middle !important;
  
}


.foot-third-col {
  min-width: 100px;
  text-align:right;
  vertical-align: middle !important;
 
}

::-webkit-scrollbar {
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
}
@media only screen and (min-width: 1201px) {

table{
text-align:center;
}
table th{
vertical-align: middle !important;
}
.view2 {
  
  width: 100%;
  display:flex;
  scroll-x:auto;
}

.wrapper2 {
  position: relative;
  overflow-x: auto;
  width:auto;
  display:flex;
}
.wid2{
min-width:80px;
text-align:right;
vertical-align: middle !important;
}

.sticky-col {
  position: -webkit-sticky;
  position: sticky;
  background-color: white;
}

.first-col {
  min-width: 90px;
  max-width:90px;
  left: 0px;
  vertical-align: middle !important;
}

.second-col {
  min-width: 100px;
  left: 90px;
  vertical-align: middle !important;
}

.foot-first-col {
  width: 100px;
  min-width: 100px;
  max-width: 100px;
  right: 0px;
  text-align:right;
  vertical-align: middle !important;
  
}

.foot-second-col {
  min-width: 100px;
  right: 100px;
  text-align:right;
  vertical-align: middle !important;
  
}


.foot-third-col {
  min-width: 100px;
  right: 200px;
  text-align:right;
  vertical-align: middle !important;
 
}


/* width */
.wrapper::-webkit-scrollbar {
  width: 5px;
  height:4px
}
.wrapper2::-webkit-scrollbar {
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
.wrapper2::-webkit-scrollbar-track-piece:start {
  margin-left: 250px;
}
.wrapper2::-webkit-scrollbar-track-piece:end {
  margin-right: 400px;
}
}
</style>
<body>
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
					<hr style="border-top: 2px solid #449CFF; margin-bottom: -4px;">
				</div>
			</div>
			<div class="body" style="margin-top:-20px;">
				<div class="portlet light bordered">
					<div class="portlet-body">
						<div class="portlet box white">
							<div class="row" style="display:flex;">
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label" style="padding-left: 12px;">ช่วงวันที่</label>
												<div class="form-control" style="border:none; background-color:transparent;display:flex;align-items: center;">
												 	<fmt:formatDate value="${payment_groupList[0].start_date}" pattern="dd MMM yyyy"></fmt:formatDate>
												 	                                     &nbsp;&nbsp;-&nbsp;&nbsp;
												 	       <fmt:formatDate value="${payment_groupList[0].end_date}" pattern="dd MMM yyyy"></fmt:formatDate>
												</div>
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group" >
												<label for="recipient-name" class="control-label" style="padding-left: 12px;">วันที่ชำระ</label>
												<input type="text" name="payment_date" class="form-control" value="<fmt:formatDate value="${payment_groupList[0].payment_date }" pattern="dd MMM yyyy"></fmt:formatDate>"  style="border:none; background-color:transparent;" readonly />
												 
												
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label for="recipient-name" class="control-label" style="padding-left: 12px;">ประกันสังคม</label>
												<input type="text" name="social" class="form-control"  value="${payment_groupList[0].social_security } %" style="border:none; background-color:transparent;" readonly />
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
										
											<div class="view2">
										  <div class="wrapper2 ">
										    <table class="table table-striped" id="table2" >
										      <thead>
										        <tr >
										          <th class="sticky-col first-col" style="width:90px;">No.</th>
										          <th class="sticky-col second-col">Employee</th>
										          <c:forEach var="test" items="${payment_typeList}">
										          	<th style="padding-left: 15px;width:50px;" class="wid2" >${test.Payment_type_name}</th>
										          </c:forEach>
										          
										          <th class="sticky-col foot-third-col text-success">สรุปรายได้ เพิ่มเติม</th>
										          <th class="sticky-col foot-second-col text-danger">สรุปรายการหัก</th>
										          <th class="sticky-col foot-first-col text-primary">รายได้สุทธิ</th>
										        </tr>
										      </thead>
										      <tbody>
										       <c:forEach var="hi" items="${groupList}">
										     <c:set var="counter" value="${counter + 1}" />
										        <tr class="tbody" style="text-align:right;">
										          <td class="sticky-col first-col wid2" style="text-align:center;width:90px !important; ">${counter}</td>
										          <td class="sticky-col second-col wid2" style="text-align:center;">${hi.user_id}</td>
										          <td class="SL wid2"> 
										          	<fmt:parseNumber var = "SL" type = "number" value = "${hi.SL}" />
										            <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${SL}" />
										          </td>
										          <td class="OT1 wid2">
										          	<fmt:parseNumber var = "OT1" type = "number" value = "${hi.OT1}" />
										            <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${OT1}" />
										          </td>
										          <td class="OT2 wid2">
										          	<fmt:parseNumber var = "OT2" type = "number" value = "${hi.OT2}" />
										            <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${OT2}" />
										          </td>
										          <td class="OT3 wid2">
										          	   <fmt:parseNumber var = "OT3" type = "number" value = "${hi.OT3}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${OT3}" />
										          </td>
										          <td class="VA wid2">
										          	   <fmt:parseNumber var = "VA" type = "number" value = "${hi.VA}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${VA}" />
										          </td>
										          <td class="TRAVEL wid2">
										               <fmt:parseNumber var = "TRAVEL" type = "number" value = "${hi.TRAVEL}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${TRAVEL}" />
										          </td>
										          <td class="BONUS wid2">
										               <fmt:parseNumber var = "BONUS" type = "number" value = "${hi.BONUS}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${BONUS}" />
										          </td>
										          <td class="EQUIPMENT wid2">
										               <fmt:parseNumber var = "EQUIPMENT" type = "number" value = "${hi.EQUIPMENT}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${EQUIPMENT}" />
										          </td>
										          <td class="SSI wid2">
										               <fmt:parseNumber var = "SSI" type = "number" value = "${hi.SSI}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${SSI}" />
										          </td>
										          <td class="TAX wid2">
										               <fmt:parseNumber var = "TAX" type = "number" value = "${hi.TAX}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${TAX}" />
										          </td>
										          <td class="TISCO wid2">
										               <fmt:parseNumber var = "TISCO" type = "number" value = "${hi.TISCO}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${TISCO}" />
										          </td>
										          <td class="LATE wid2">
										               <fmt:parseNumber var = "LATE" type = "number" value = "${hi.LATE}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${LATE}" />
										          </td>
										          <td class="ABSENT wid2">
										               <fmt:parseNumber var = "ABSENT" type = "number" value = "${hi.ABSENT}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${ABSENT}" />
										          </td>
										          <td class="ABSENCE wid2">
										               <fmt:parseNumber var = "ABSENCE" type = "number" value = "${hi.ABSENCE}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${ABSENCE}" />
										          </td>
										          <td class="StudentLoan wid2">
										               <fmt:parseNumber var = "StudentLoan" type = "number" value = "${hi.StudentLoan}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${StudentLoan}" />
										          </td>
										          <td class="sticky-col foot-third-col income_net wid2 text-success" >
										          		<fmt:parseNumber var = "income_net" type = "number" value = "${hi.income_net}" />
										                <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${income_net}" />
										           </td>
										          <td class="sticky-col foot-second-col expend_net wid2 text-danger" >
										               <fmt:parseNumber var = "expend_net" type = "number" value = "${hi.expend_net}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${expend_net}" />
										          </td>
										          <td class="sticky-col foot-first-col total_pay wid2 text-primary" style="text-align:right;">
										               <fmt:parseNumber var = "total_pay" type = "number" value = "${hi.total_pay}" />
										               <fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="#,##0.00" value = "${total_pay}" />
										          </td>
										        </tr>
										        </c:forEach>
										      </tbody>
										     <tfoot style="color:#449CFF" >
										      	<tr style="text-align:right; ">
										      		<th class="sticky-col first-col" style="text-align:center;">สรุปยอดรวม</th>
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
										      		<th class="sticky-col foot-third-col text-success" id="income_net"></th>
										      		<th class="sticky-col foot-second-col text-danger" id="expend_net"></th>
										      		<th class="sticky-col foot-first-col text-primary" id="total_pay"></th>
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

</body>

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
          
          var x = $('#table2').find('tr.tbody').length
          console.log(x);
          $('#employee').val(x+ " ราย");
	

</script>

<script>
const element2 = document.querySelector(".wrapper2");

element2.addEventListener('wheel', (event) => {
  event.preventDefault();

  element2.scrollBy({
    left: event.deltaY < 0 ? -30 : 30,
    
  });
});
</script>

<script>
var table2 = document.getElementById("table2");
var cells2 = table2.getElementsByTagName("td");
for (var i = 0; i < cells2.length; i++) {
  if (parseFloat(cells2[i].textContent, 10) === 0.00) {
    cells2[i].style.color = "#ced4da";
  }
}
</script>
