<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${onlineUser == null}">
	<%
		response.sendRedirect("index.jsp");
	%>
</c:if>

<!doctype html>
<html lang="en">

<head>
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="Lucid Bootstrap 4x Admin Template">
<meta name="author" content="WrapTheme, design by: ThemeMakker.com">

<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- VENDOR CSS -->
<link rel="stylesheet" href="/pages-back/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/pages-back/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/pages-back/assets/vendor/sweetalert/sweetalert.css"/>
<link rel="stylesheet" href="/pages-back/assets/vendor/jquery-datatable/dataTables.bootstrap4.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="/pages-back/assets/css/main.css">
<link rel="stylesheet" href="/pages-back/assets/css/color_skins.css">
</head>
<body class="theme-orange">

<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img src="/pages-back/_base/logo2.png" alt="Cube SoftTech"></div>
        <p>Please wait...</p>        
    </div>
</div>
<!-- Overlay For Sidebars -->

<div id="wrapper">

    <nav class="navbar navbar-fixed-top">
        <div class="container">
            <div class="navbar-brand">
                <a href="index.html"><img src="/pages-back/_base/logo2.png" alt="Cube SoftTech Logo" class="img-responsive logo"></a>                
            </div>
            
            <div class="navbar-right">
                <form id="navbar-search" class="navbar-form search-form">
                    <input value="" class="form-control" placeholder="Search here..." type="text">
                    <button type="button" class="btn btn-default"><i class="icon-magnifier"></i></button>
                </form>               

                <div id="navbar-menu">
                    <ul class="nav navbar-nav">                        
                        <li><a href="#" class="icon-menu d-none d-sm-block d-md-none d-lg-block"><i class="icon-calendar"></i></a></li>
                        <li><a href="#" class="icon-menu d-none d-sm-block"><i class="icon-bubbles"></i></a></li>
                        <li><a href="#" class="icon-menu d-none d-sm-block"><i class="icon-envelope"></i><span class="notification-dot"></span></a></li>
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle icon-menu" data-toggle="dropdown">
                                <i class="icon-bell"></i>
                                <span class="notification-dot"></span>
                            </a>
                            <ul class="dropdown-menu notifications animated shake">
                                <li class="header"><strong>You have 4 new Notifications</strong></li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="icon-info text-warning"></i>
                                            </div>
                                            <div class="media-body">
                                                <p class="text">Campaign <strong>Holiday Sale</strong> is nearly reach budget limit.</p>
                                                <span class="timestamp">10:00 AM Today</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>                               
                                <li>
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="icon-like text-success"></i>
                                            </div>
                                            <div class="media-body">
                                                <p class="text">Your New Campaign <strong>Holiday Sale</strong> is approved.</p>
                                                <span class="timestamp">11:30 AM Today</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                 <li>
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="icon-pie-chart text-info"></i>
                                            </div>
                                            <div class="media-body">
                                                <p class="text">Website visits from Twitter is 27% higher than last week.</p>
                                                <span class="timestamp">04:00 PM Today</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="icon-info text-danger"></i>
                                            </div>
                                            <div class="media-body">
                                                <p class="text">Error on website analytics configurations</p>
                                                <span class="timestamp">Yesterday</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="footer"><a href="javascript:void(0);" class="more">See all notifications</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle icon-menu" data-toggle="dropdown"><i class="icon-settings"></i></a>
                            <ul class="dropdown-menu user-menu menu-icon animated bounceIn">
                                <li class="menu-heading">ACCOUNT SETTINGS</li>
                                <li><a href="javascript:void(0);"><i class="icon-note"></i> <span>Basic</span></a></li>
                                <li><a href="javascript:void(0);"><i class="icon-equalizer"></i> <span>Preferences</span></a></li>
                                <li><a href="javascript:void(0);"><i class="icon-lock"></i> <span>Privacy</span></a></li>
                                <li><a href="javascript:void(0);"><i class="icon-bell"></i> <span>Notifications</span></a></li>
                                <li class="menu-heading">BILLING</li>
                                <li><a href="javascript:void(0);"><i class="icon-credit-card"></i> <span>Payments</span></a></li>
                                <li><a href="javascript:void(0);"><i class="icon-printer"></i> <span>Invoices</span></a></li>                                
                                <li><a href="javascript:void(0);"><i class="icon-refresh"></i> <span>Renewals</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="icon-menu d-none d-sm-block rightbar_btn"><i class="icon-equalizer"></i></a>
                        </li>
                        <li><a href="/logout" class="icon-menu d-none d-sm-none d-md-none d-lg-block"><i class="icon-login"></i></a></li>
                    </ul>
                </div>
            </div>

            <div class="navbar-btn">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
                    <i class="lnr lnr-menu fa fa-bars"></i>
                </button>
            </div>
        </div>
    </nav>
            
    <div id="rightbar" class="rightbar">
        <div class="sidebar-scroll">            
            <!-- Nav tabs -->
            <ul class="nav nav-tabs-new">                
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#Chat"><i class="icon-book-open"></i></a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#setting"><i class="icon-settings"></i></a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#question"><i class="icon-question"></i></a></li>                
            </ul>
                
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane animated fadeIn active" id="Chat">
                    <form>
                        <div class="input-group m-b-20">
                            <div class="input-group-prepend">
                                <span class="input-group-text" ><i class="icon-magnifier"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="Search...">
                        </div>
                    </form>
                    <ul class="right_chat list-unstyled">
                        <li class="online">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="/pages-back/assets/images/xs/avatar4.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Chris Fox</span>
                                        <span class="message">Designer, Blogger</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>                            
                        </li>
                        <li class="online">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="/pages-back/assets/images/xs/avatar5.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Joge Lucky</span>
                                        <span class="message">Java Developer</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>                            
                        </li>
                        <li class="offline">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="/pages-back/assets/images/xs/avatar2.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Isabella</span>
                                        <span class="message">CEO, Thememakker</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>                            
                        </li>
                        <li class="offline">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="/pages-back/assets/images/xs/avatar1.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Folisise Chosielie</span>
                                        <span class="message">Art director, Movie Cut</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>                            
                        </li>
                        <li class="online">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="/pages-back/assets/images/xs/avatar3.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Alexander</span>
                                        <span class="message">Writter, Mag Editor</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>                            
                        </li>                        
                    </ul>
                </div>
                <div class="tab-pane animated fadeIn" id="setting">
                    <h6>Choose Skin</h6>
                    <ul class="choose-skin list-unstyled">
                        <li data-theme="purple">
                            <div class="purple"></div>
                            <span>Purple</span>
                        </li>                   
                        <li data-theme="blue">
                            <div class="blue"></div>
                            <span>Blue</span>
                        </li>
                        <li data-theme="cyan">
                            <div class="cyan"></div>
                            <span>Cyan</span>
                        </li>
                        <li data-theme="green">
                            <div class="green"></div>
                            <span>Green</span>
                        </li>
                        <li data-theme="orange" class="active">
                            <div class="orange"></div>
                            <span>Orange</span>
                        </li>
                        <li data-theme="blush">
                            <div class="blush"></div>
                            <span>Blush</span>
                        </li>
                    </ul>
                    <hr>
                    <h6>General Settings</h6>
                    <ul class="setting-list list-unstyled">
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox">
                                <span>Report Panel Usag</span>
                            </label>
                        </li>
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox" checked>
                                <span>Email Redirect</span>
                            </label>
                        </li>
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox" checked>
                                <span>Notifications</span>
                            </label>                      
                        </li>
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox">
                                <span>Auto Updates</span>
                            </label>
                        </li>
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox">
                                <span>Offline</span>
                            </label>
                        </li>
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox">
                                <span>Location Permission</span>
                            </label>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane animated fadeIn" id="question">
                    <form>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" ><i class="icon-magnifier"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="Search...">
                        </div>
                    </form>
                    <ul class="list-unstyled question">
                        <li class="menu-heading">HOW-TO</li>
                        <li><a href="javascript:void(0);">How to Create Campaign</a></li>
                        <li><a href="javascript:void(0);">Boost Your Sales</a></li>
                        <li><a href="javascript:void(0);">Website Analytics</a></li>
                        <li class="menu-heading">ACCOUNT</li>
                        <li><a href="javascript:void(0);">Cearet New Account</a></li>
                        <li><a href="javascript:void(0);">Change Password?</a></li>
                        <li><a href="javascript:void(0);">Privacy &amp; Policy</a></li>
                        <li class="menu-heading">BILLING</li>
                        <li><a href="javascript:void(0);">Payment info</a></li>
                        <li><a href="javascript:void(0);">Auto-Renewal</a></li>                        
                        <li class="menu-button m-t-30">
                            <a href="javascript:void(0);" class="btn btn-primary"><i class="icon-question"></i> Need Help?</a>
                        </li>
                    </ul>
                </div>                
            </div>          
        </div>
    </div>

	<!--  START -->
	<tiles:insertAttribute name="menu" ignore="true" />
    <!--  END Main Menu -->
    
    <div id="main-content">
        <div class="container">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-6 col-md-8 col-sm-12">
                        <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a><tiles:insertAttribute name="title" ignore="true" /></h2>
                    </div>            
                    <div class="col-lg-6 col-md-4 col-sm-12 text-right">
                        <div class="bh_chart hidden-xs">
                            <div class="float-left m-r-15">
                                <small>Employee</small>
                                <h6 class="mb-0 mt-1"><i class="icon-user"></i> 1,784</h6>
                            </div>
                            <span class="bh_visitors float-right">2,5,1,8,3,6,7,5</span>
                        </div>
                        <div class="bh_chart hidden-sm">
                            <div class="float-left m-r-15">
                                <small>Expense</small>
                                <h6 class="mb-0 mt-1"><i class="icon-globe"></i> 47.5M </h6>
                            </div>
                            <span class="bh_visits float-right">10,8,9,3,5,8,5</span>
                        </div>
                        <div class="bh_chart hidden-sm">
                            <div class="float-left m-r-15">
                                <small>YTD</small>
                                <h6 class="mb-0 mt-1"><i class="icon-bubbles"></i> 13</h6>
                            </div>
                            <span class="bh_chats float-right">1,8,5,6,2,4,3,2</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="body">
                            <tiles:insertAttribute name="body" ignore="true" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>

<!-- Javascript -->
<script src="/pages-back/assets/bundles/libscripts.bundle.js"></script>    
<script src="/pages-back/assets/bundles/vendorscripts.bundle.js"></script>

<script src="/pages-back/assets/bundles/datatablescripts.bundle.js"></script>
<script src="/pages-back/assets/vendor/sweetalert/sweetalert.min.js"></script> <!-- SweetAlert Plugin Js --> 

<script src="/pages-back/assets/bundles/mainscripts.bundle.js"></script>
<script src="/pages-back/assets/js/pages/tables/jquery-datatable.js"></script>
<script src="/pages-back/assets/js/pages/ui/dialogs.js"></script>
</body>
</html>

