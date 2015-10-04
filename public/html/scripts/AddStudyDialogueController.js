(function(){
    var app = angular.module("bibleStudyGuru");

	var AddStudyDialogueController = function($scope, close) {
        $scope.close = close;
	};
	
	app.controller("AddStudyDialogueController", AddStudyDialogueController);
}());