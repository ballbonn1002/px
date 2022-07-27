<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<style>
	.highcharts-figure,
.highcharts-data-table table {
  min-width: 310px;
  max-width: 800px;
  margin: 1em auto;
}

#container {
  height: 500px;
}

.highcharts-data-table table {
  font-family: Verdana, sans-serif;
  border-collapse: collapse;
  border: 1px solid #ebebeb;
  margin: 10px auto;
  text-align: center;
  width: 100%;
  max-width: 500px;
}

.highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}

.highcharts-data-table th {
  font-weight: 600;
  padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
  padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}

.highcharts-data-table tr:hover {
  background: #f1f7ff;
}
</style>
<div class="block-header">
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-12">
              <h2 style="font-size:20px; font-weight:600; "><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a>Payment Statistics</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="page.blank"><i class="icon-home"></i></a></li>                            
                    <li class="breadcrumb-item">chart</li>
                    <li class="breadcrumb-item active">Payment Chart</li>
      
                </ul>
        </div>            
    </div>
</div>
	<div class="row clearfix">
		<div class="col-lg-12">
			<div class="card">
				<div class="header">
					<h2>Payment Chart</h2>
					<div class="header">
						<div class="header-dropdown">
							<div class="input-group">
								<input type="text" data-provide="datepicker"
									data-date-format="yyyy" data-date-start-view="years"
									data-date-min-view-mode="years" class="form-control" data-date-orientation="bottom"
									id="year_pick" data-date-autoclose="true" onChange="yearPick()"
									value="<fmt:setLocale value="en_US" scope="session"/><fmt:formatDate value = "${now}"
									type = "both" timeStyle = "medium" pattern="yyyy "/>">
								<div class="input-group-append">
									<span class="input-group-text" style="font-size: 12px"><i
										class="fa fa-calendar-o"></i> </span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="body">
				<br>
					<div id="container"></div>
				</div>
			</div>
		</div>
	</div>
<script>
function yearPick(){
	var year = $("#year_pick").val();
	console.log(year);
	$.ajax({
		url : "paymentchart" ,
		method : "POST",
		type : "JSON",
		data : {
			"year" : year
		},
		success:function(data){
			console.log(JSON.stringify(data));
			setChart(data);
		}
	});
	}
	
$(document).ready(function() {
	yearPick();
});
</script>

<script>
function setChart(data){
	console.log(data);
Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Payment Chart'
    },
    xAxis: {
        type: 'category'
    },
    navigation: {
        buttonOptions: {
            enabled: false
        }
    },
    legend: {
        enabled: false
      },
    tooltip: {
        shared: true,
        crosshairs: true
      },
      plotOptions: {
          series: {
              borderWidth: 0,
              dataLabels: {
                  enabled: false
              }
          }
      },
      
    series: data
    
});
}
    
    
 /*   {
        name: 'รายการหัก',
        data: [{
            name: 'Jan',
            y: 5,
            drilldown: 'democrats-2010'
        }, {
            name: 'Feb',
            y: 2,
            drilldown: 'democrats-2010'
        }, {
            name: 'Mar',
            y: 4,
            drilldown: 'other-2010'
        },   {
            name: 'Apr',
            y: 7,
            drilldown: 'democrats-2010'
        }, {
            name: 'May',
            y: 0,
            drilldown: 'other-2010'
        }, {
            name: 'Jun',
            y: 14,
            drilldown: 'democrats-2010'
        }, {
            name: 'Jul',
            y: 17,
            drilldown: 'other-2010'
        }, {
            name: 'Aug',
            y: 2,
            drilldown: 'democrats-2010'
        }, {
            name: 'Sep',
            y: 3,
            drilldown: 'other-2010'
        }, {
            name: 'Oct',
            y: 9,
            drilldown: 'democrats-2010'
        }, {
            name: 'Nov',
            y: 7,
            drilldown: 'other-2010'
        }, {
            name: 'Dec',
            y: 1,
            drilldown: 'other-2010'
        }]
    }],
    
    
    drilldown: {
        allowPointDrilldown: false,
        series: [{
            id: 'republican-2010',
            name: 'Republican 2010',
            data: [
                ['East', 4],
                ['West', 2],
                ['North', 1],
                ['Northes', 8],
                ['South', 4]
            ]
        }, {
            id: 'democrats-2010',
            name: 'Republican 2010',
            data: [
                ['East', 6],
                ['West', 2],
                ['Westest', 6],
                ['North', 2],
                ['South', 4]
            ]
        }, {
            id: 'other-2010',
            name: 'Other 2010',
            data: [
                ['East', 2],
                ['West', 7],
                ['North', 3],
                ['South', 2]
            ]
        }, {
            id: 'republican-2014',
            name: 'Republican 2014',
            data: [
                ['East', 2],
                ['West', 4],
                ['North', 1],
                ['South', 7]
            ]
        }, {
            id: 'democrats-2014',
            name: 'Democrats 2014',
            data: [
                ['East', 4],
                ['West', 2],
                ['North', 5],
                ['South', 3]
            ]
        }, {
            id: 'other-2014',
            name: 'Other 2014',
            data: [
                ['East', 7],
                ['West', 8],
                ['North', 2],
                ['South', 2]
            ]
        }]
    }  */
    
//});
//}
</script>
