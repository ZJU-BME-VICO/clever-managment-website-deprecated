<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html ng-app="cleverManagementApp">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
		<title>CLEVER Management</title>
		<!-- css init -->
		<%@ include file="jspf/css-init.jspf"%>
	</head>
	<body ng-controller="AppCtrl">
		<!-- header -->
		<%@ include file="jspf/header.jspf"%>
		<div class="container content-container" >
			<div class="row" style="max-height: 800px">
				<div class="col-xs-12 col-md-12 col-lg-12 hbox">
					<!-- left side navbar -->
					<nav ng-show="!isNavbarCollapsed" id="navbar" class="vbox">
						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title row">
										<input type="text" placeholder="Filter by name" class="form-control pull-left" style="width: 50%;margin-left: 15px;" ng-model="archetypeListFilter">
										<a class="pull-right" data-toggle="collapse" data-parent="#accordion" href="#collapseAdvancedSearch" style="vertical-align: middle;padding: 6px 12px;">Advanced</a>
									</div>
								</div>
								<div id="collapseAdvancedSearch" class="panel-collapse collapse">
									<div class="panel-body">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
									</div>
								</div>
							</div>
						</div>
						<!-- archetype list -->
						<div class="flexBox">
							<div class="list-group" ng-show="archetypeList.length > 0" style="max-height: 750px; overflow: auto;">
								<a href class="list-group-item" ng-click="selectOverview()" ng-class="{'active': selectedArchetypeId == 0}"><b>Overview</b></a>
								<span ng-show="archetypeList.length == 0"><img src="/clever-management-website/img/loading.gif" style="max-height: 20px;"></img> Loading...</span>
								<a href ng-show="archetypeList.length > 0" class="list-group-item" ng-repeat="archetype in archetypeList | filter:archetypeListFilter | orderBy:'name'" ng-click="selectArchetype(archetype)" ng-class="{'active': archetype.id == selectedArchetypeId}">{{archetype.name}}</a>
							</div>
						</div>
					</nav>
					<!-- splitter -->
					<splitter is-adjust-enabled="!isNavbarCollapsed" style="height: 800px;">
						<i style="cursor: pointer" ng-click="expandNavbar()" ng-show="isNavbarCollapsed"><span class="glyphicon glyphicon-chevron-right" ></span></i>
						<i style="cursor: pointer" ng-click="collapseNavbar()" ng-show="!isNavbarCollapsed"><span class="glyphicon glyphicon-chevron-left" ></span></i>
					</splitter>
					<!-- content display -->
					<div class="flexBox">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs">
							<li ng-class="{'active': selectedArchetypeId == 0}">
								<a ng-click="selectOverview()" style="cursor: pointer;"><b>&nbsp;Overview&nbsp;</b></a>
							</li>
							<li ng-repeat="tab in tabs" ng-class="{'active': tab.id == selectedArchetypeId}">
								<a ng-click="selectTab(tab)" style="cursor: pointer;" tooltip-placement="bottom" tooltip-popup-delay='500' tooltip='{{tab.title}}'>{{getTabTitle(tab)}}&nbsp;<span class="close" ng-click="closeTab(tab)"> &times; </span></a>
							</li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane" ng-class="{'active': selectedArchetypeId == 0}" style="height: 750px;">
								<span ng-show="archetypeList.length == 0"><img src="/clever-management-website/img/loading.gif" style="max-height: 20px;"></img> Loading...</span>
								<div overview ng-show="archetypeList.length > 0" archetype-list="archetypeList" double-click="selectArchetype(selectedArchetype)"></div>
							</div>
							<div class="tab-pane" ng-class="{'active': tab.id == selectedArchetypeId}" ng-repeat="tab in tabs" ng-controller="ArchetypeDisplayCtrl" ng-init="init(tab)">
								<h4>{{tab.title}}</h4>
								<!-- Nav tabs -->
								<ul class="nav nav-tabs">
									<li ng-class="{'active': selectedTab == 'Definition'}">
										<a ng-click="selectTab('Definition')" style="cursor: pointer;">Definition</a>
									</li>
									<li ng-class="{'active': selectedTab == 'Xml'}">
										<a ng-click="selectTab('Xml')" style="cursor: pointer;">XML</a>
									</li>
									<li ng-class="{'active': selectedTab == 'Adl'}">
										<a ng-click="selectTab('Adl')" style="cursor: pointer;">ADL</a>
									</li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<div class="tab-pane" ng-class="{'active': selectedTab == 'Definition'}" style="height: 700px;">
										<span ng-show="!tab.xml"><img src="/clever-management-website/img/loading.gif" style="max-height: 20px;"></img> Loading...</span>
										<archetype-treeview ng-show="tab.xml" archetype-xml="tab.xml"></archetype-treeview>
									</div>
									<div class="tab-pane" ng-class="{'active': selectedTab == 'Xml'}" style="overflow: auto;height: 700px;">
										<span ng-show="!tab.xml"><img src="/clever-management-website/img/loading.gif" style="max-height: 20px;"></img> Loading...</span>
										<pre ng-show="tab.xml" ng-bind-html-unsafe="text|pretty">{{tab.xml}}</pre>
									</div>
									<div class="tab-pane" ng-class="{'active': selectedTab == 'Adl'}" style="overflow: auto;height: 700px;">
										<span ng-show="!tab.adl"><img src="/clever-management-website/img/loading.gif" style="max-height: 20px;"></img> Loading...</span>
										<pre ng-show="tab.adl" ng-bind-html-unsafe="text|pretty">{{tab.adl}}</pre>
									</div>
								</div>						
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<!-- footer -->
		<%@ include file="jspf/footer.jspf"%>
		<!-- js init -->
		<%@ include file="jspf/js-init.jspf"%>
	</body>
</html>
