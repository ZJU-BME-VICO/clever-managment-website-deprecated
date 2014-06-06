function AppCtrl($scope, $modal, archetypeRetrieveService) {

	$scope.isNavbarCollapsed = true;

	$scope.archetypeList = [];

	retrieveArchetypeFileList();

	$scope.tabs = [];

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
				'content' : ''
			});
			archetypeRetrieveService.getArchetypeById(archetype.id).then(function(archetypeXml) {
				$scope.tabs[index - 1].content = archetypeXml;
			});
		}
		$scope.selectedArchetypeId = archetype.id;
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

	$scope.openUploadModal = function(size) {
		var modalInstance = $modal.open({
			templateUrl : 'js/upload-modal/upload-modal.html',
			controller : uploadModalCtrl,
			backdrop : 'static',
			size : size,
		});

		modalInstance.result.then(function(uploadedFileCount) {
			if (uploadedFileCount > 0) {
				retrieveArchetypeFileList();
			}
		});
	};

	function retrieveArchetypeFileList() {
		archetypeRetrieveService.getArchetypeList().then(function(archetypeList) {
			$scope.archetypeList = archetypeList;
		});
	}

}