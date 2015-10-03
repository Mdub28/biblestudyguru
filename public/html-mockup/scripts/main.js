(function(){
	var app = angular.module("bibleStudyGuru", []);

	var IndexController = function($scope) {
		var getGreeting = function(){
			return "Hello!";
		};

		$scope.greeting = getGreeting();
	};
	
	app.controller("IndexController", IndexController);
}());