function HomeCtrl($scope, $modal, archetypeRetrieveService) {

	var undefined;

	$scope.isNavbarCollapsed = true;

	$scope.archetypeList = [];

	retrieveArchetypeFileList();

	$scope.tabs = [];

	$scope.tabTitleLength = 15;

	$scope.selectedArchetypeId = 0;

	$scope.expandNavbar = function() {
		$scope.isNavbarCollapsed = false;
	};

	$scope.collapseNavbar = function() {
		$scope.isNavbarCollapsed = true;
	};

	$scope.selectOverview = function() {
		$scope.selectedArchetypeId = 0;
	};

	$scope.selectArchetype = function(archetype) {
		var contained = false;
		angular.forEach($scope.tabs, function(tab, index) {
			if (tab.id == archetype.id) {
				contained = true;
			}
		});
		if (!contained) {
			var index = $scope.tabs.push({
				'id' : archetype.id,
				'title' : archetype.name,
				'xmlPromise' : archetypeRetrieveService.getArchetypeXmlById(archetype.id),
				'adlPromise' : archetypeRetrieveService.getArchetypeAdlById(archetype.id),
			});
		}
		$scope.selectedArchetypeId = archetype.id;
	};

	$scope.getTabTitle = function(tab) {
		if (tab.title.length > $scope.tabTitleLength) {
			return tab.title.substring(0, $scope.tabTitleLength / 2) + '...' + tab.title.substring(tab.title.length - $scope.tabTitleLength / 2, tab.title.length);
		}
	};

	$scope.selectTab = function(tab) {
		$scope.selectedArchetypeId = tab.id;
	};

	$scope.closeTab = function(tab) {
		var index = $scope.tabs.indexOf(tab);
		if ($scope.selectedArchetypeId == tab.id && $scope.tabs.length > 1) {
			var newSelectedIndex = index == $scope.tabs.length - 1 ? index - 1 : index + 1;
			$scope.selectedArchetypeId = $scope.tabs[newSelectedIndex].id;
		}
		$scope.tabs.splice(index, 1);
		if ($scope.tabs.length == 0) {
			$scope.selectedArchetypeId = 0;
		}
	};

	function retrieveArchetypeFileList() {
		archetypeRetrieveService.getArchetypesBriefInfo().then(function(info) {
			//$scope.archetypeList = info;
		});
	}

}