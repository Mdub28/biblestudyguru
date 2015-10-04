(function(){
    var app = angular.module("bibleStudyGuru");

	var CreateCourseDialogueController = function($scope) {
        $scope.close = close;
	};
	
	app.controller("CreateCourseDialogueController", CreateCourseDialogueController);
}());