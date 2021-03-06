<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	
<div class="portlet light bordered" >
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-bubble font-green-sharp"></i> <span
				class="caption-subject font-green-sharp bold uppercase">Popover
				Confirmation Demos</span>
		</div>
		<div class="actions">
			<div class="btn-group">
				<a class="btn green-haze btn-outline btn-circle btn-sm"
					href="javascript:;" data-toggle="dropdown" data-hover="dropdown"
					data-close-others="true"> Actions <i class="fa fa-angle-down"></i>
				</a>
				<ul class="dropdown-menu pull-right">
					<li><a href="javascript:;"> Option 1</a></li>
					<li class="divider"></li>
					<li><a href="javascript:;">Option 2</a></li>
					<li><a href="javascript:;">Option 3</a></li>
					<li><a href="javascript:;">Option 4</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="portlet-body">
		<h3>Basic Usage</h3>
		<p>Add small overlays with "Yes" and "No" buttons, like those on
			the iPad, to any element. Click the button to trigger the
			confirmation.</p>
		<button class="btn green-sharp btn-large" data-toggle="confirmation"
			data-original-title="Are you sure ?" title="">Default
			configuration</button>
		<h3>Custom Buttons</h3>
		<button class="btn red-mint" data-toggle="confirmation"
			data-placement="right" data-btn-ok-label="Continue"
			data-btn-ok-icon="icon-like" data-btn-ok-class="btn-success"
			data-btn-cancel-label="Stoooop!" data-btn-cancel-icon="icon-close"
			data-btn-cancel-class="btn-danger" data-original-title="" title="">Action
			confirmation!</button>
		<h3>Directions</h3>
		<button class="btn btn-outline green-sharp  uppercase"
			data-toggle="confirmation" data-placement="left"
			data-original-title="" title="">Confirmation on left</button>
		<button class="btn btn-outline red-mint  uppercase"
			data-toggle="confirmation" data-placement="top"
			data-original-title="" title="">Confirmation on top</button>
		<button class="btn btn-outline yellow-mint  uppercase"
			data-toggle="confirmation" data-placement="bottom"
			data-original-title="" title="">Confirmation on bottom</button>
		<button class="btn btn-outline purple-sharp  uppercase"
			data-toggle="confirmation" data-placement="right"
			data-original-title="" title="">Confirmation on right</button>
		<h3>Singleton</h3>
		<p>Only one boxe visible at once.</p>
		<button class="btn btn-outline green-sharp  uppercase"
			data-toggle="confirmation" data-singleton="true"
			data-original-title="" title="">Confirmation 1</button>
		<button class="btn btn-outline red-mint  uppercase"
			data-toggle="confirmation" data-singleton="true"
			data-original-title="" title="">Confirmation 2</button>
		<h3>Popout</h3>
		<p>Click anywhere on the page to close all boxes.</p>
		<button class="btn green-sharp btn-circle" data-toggle="confirmation"
			data-popout="true" data-original-title="" title="">Confirmation
			1</button>
		<button class="btn red-mint btn-circle" data-toggle="confirmation"
			data-popout="true" data-original-title="" title="">Confirmation
			2</button>
		<h3>Event Handling</h3>
		<p>All events from Bootstrap Popover are available but suffixed
			with bs.confirmation.</p>
		<button class="btn yellow-mint uppercase btn-circle"
			data-toggle="confirmation" id="bs_confirmation_demo_1"
			data-original-title="" title="">Confirmation 1</button>
		<button class="btn grey-mint uppercase btn-circle"
			data-toggle="confirmation" id="bs_confirmation_demo_2"
			data-original-title="" title="">Confirmation 2</button>
	</div>
</div>
