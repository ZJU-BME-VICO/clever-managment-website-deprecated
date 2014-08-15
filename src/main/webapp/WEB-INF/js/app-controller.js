angular.module('clever.management.controllers.app', []).controller('appCtrl', function($scope, $translate, $timeout) {

	$scope.windowHeight

	$scope.windowWidth

	$scope.alerts = [];

	$scope.addAlert = function(alert) {
		$scope.alerts.push(alert);
		$timeout(function() {
			if ($scope.alerts.length > 0) {
				$scope.alerts.pop();
			}
		}, 5000);
	};

	$scope.closeAlert = function(index) {
		$scope.alerts.splice(index, 1);
	};

	$scope.changeLanguage = function(key) {
		$translate.use(key);
	};
	
	$scope.getCurrentLanguage = function(){
		return $translate.use();
	};
});
