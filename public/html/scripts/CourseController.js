(function(){
    var app = angular.module("bibleStudyGuru");

	//var CourseController = function($scope, ModalService) {
    var CourseController = function($scope) {
        //Queries the API for the activity list
        var queryRawCourses = function(){
            //TODO: This is going to end up being a promise object generated from the HTTP service
            return {"status":"success","message":null,"data":[
                {"id":3,"user_id":1,"name":"test","description":"test","created_at":"2015-10-03T19:12:19.426Z","updated_at":"2015-10-03T19:12:19.426Z","studies":[]},
                {"id":4,"user_id":null,"name":"Name","description":"The description","created_at":"2015-10-04T05:38:41.403Z","updated_at":"2015-10-04T05:38:41.403Z","studies":[]},
                {"id":5,"user_id":null,"name":"Name","description":"The description","created_at":"2015-10-04T05:40:07.108Z","updated_at":"2015-10-04T05:40:07.108Z","studies":[{"id":1,"course_id":5,"position":null,"created_at":"2015-10-04T05:40:08.061Z","updated_at":"2015-10-04T05:40:08.061Z","name":"Name","description":"The description"}]}
                ]};
        };

        var getCourses = function(){
            var rawCourses = queryRawCourses();

            if (rawCourses.status != "success")
                return [];

            var courses = [];
            rawCourses.data.forEach(function(rawCourse) {
                var studies = [];
                rawCourse.studies.forEach(function(rawStudy) {
                    var study = { "name": rawStudy.name,
                                  "description": rawStudy.description,
                                  "show_url": "study/" + rawStudy.id
                    };
                    studies.push(study);
                });

                var course = { "name": rawCourse.name,
                               "description": rawCourse.description,
                               "studies": studies
                };

                courses.push(course);
            });

            return courses;
        };
        
        
        // $scope.onClickAddStudy = function(){
            // ModalService.showModal({
            // templateUrl: "html/AddStudyDialogue.html",
            // controller: "AddStudyDialogueController"
          // }).then(function(modal) {
            // modal.close.then(function(result) {
              // console.log(result);
            // });
          // });
        // };
                
        
        $scope.courses = getCourses();
	};
	
	app.controller("CourseController", CourseController);
}());