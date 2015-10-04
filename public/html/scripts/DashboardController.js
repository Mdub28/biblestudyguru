(function(){
    var app = angular.module("bibleStudyGuru");

	var DashboardController = function($scope) {        
        //Queries the API for the activity list
        var queryRawActivityList = function(){
            //TODO: This is going to end up being a promise object generated from the HTTP service
            //return {"status":"success","message":null,"data":[{"id":14,"description":"This is a user action test","link_text":"test link","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:55.453Z","updated_at":"2015-10-04T00:38:55.453Z"},{"id":13,"description":"This is a user action test","link_text":"test link","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:54.524Z","updated_at":"2015-10-04T00:38:54.524Z"},{"id":12,"description":"This is a user action test","link_text":"test link","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:53.892Z","updated_at":"2015-10-04T00:38:53.892Z"},{"id":11,"description":"This is a user action test","link_text":"test link","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:53.598Z","updated_at":"2015-10-04T00:38:53.598Z"},{"id":10,"description":"This is a user action test","link_text":"test link","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:53.351Z","updated_at":"2015-10-04T00:38:53.351Z"},{"id":9,"description":"This is a user action test","link_text":"test link","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:53.043Z","updated_at":"2015-10-04T00:38:53.043Z"},{"id":8,"description":"This is a user action test","link_text":"test link","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:52.637Z","updated_at":"2015-10-04T00:38:52.637Z"},{"id":7,"description":"This is a user action test","link_text":"test link","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:52.392Z","updated_at":"2015-10-04T00:38:52.392Z"},{"id":6,"description":"This is a user action test","link_text":"test link","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:52.145Z","updated_at":"2015-10-04T00:38:52.145Z"},{"id":5,"description":"This is a user action test","link_text":"test link","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:51.889Z","updated_at":"2015-10-04T00:38:51.889Z"}]};
            return {"status":"success","message":null,"data":[
                {"id":14,"description":"just added an annotation to John 3:16","link_text":"an annotation","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:55.453Z","updated_at":"2015-10-04T00:38:55.453Z"},
                {"id":13,"description":"just created a new course The Epistle of James and Giant Squid","link_text":"The Epistle of James and Giant Squid","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:54.524Z","updated_at":"2015-10-04T00:38:54.524Z"},
                {"id":12,"description":"just liked Michael's annotation","link_text":"annotation","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:53.892Z","updated_at":"2015-10-04T00:38:53.892Z"},
                {"id":11,"description":"just created a new course Reddit Philosophizes on Ephesians 5","link_text":"Reddit Philosophizes on Ephesians 5","link":"http://test/","user_id":1,"weight":1,"created_at":"2015-10-04T00:38:54.524Z","updated_at":"2015-10-04T00:38:54.524Z"},
                ]};
        };
        
        //Returns an array of view-ready activities
        var getActivityList = function(){
            var rawActivityList = queryRawActivityList();
            
            if (rawActivityList.status != "success")
                return [];
                
            var activityList = [];
            rawActivityList.data.forEach(function(rawActivity) {
                var pre_link_text_length = rawActivity.description.search(rawActivity.link_text);
                
                var activity = { "name": userIDToName(rawActivity.user_id),
                                 "name_link": "user/" + rawActivity.user_id,
                                 "pre_link_text": rawActivity.description.substring(0, pre_link_text_length),
                                 "link_text": rawActivity.link_text,
                                 "post_link_text": rawActivity.description.substring(pre_link_text_length + rawActivity.link_text.length), 
                                 "link_url": rawActivity.link,
                                 "avatar_url": userIDToAvatarURL(rawActivity.user_id)
                };
                
                activityList.push(activity);
            });

            return activityList;
        };
        

        //Handles clicking the "search" button
        $scope.onClickBiblePassageSearch = function() {
            if ($scope.biblePassageSearchTerm)
                alert("You searched for " + $scope.biblePassageSearchTerm);
        };

        //Saves the activity list.  (News feed.) 
        $scope.activityList = getActivityList();
	};
	
	app.controller("DashboardController", DashboardController);
}());