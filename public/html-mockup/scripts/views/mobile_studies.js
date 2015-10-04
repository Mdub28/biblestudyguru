$(function() {
    var serviceUrl = '/api/v1/courses/';
    $.getJSON(serviceUrl, function(response) {
        if (response.status == 'success') {
            bindData(response.data);
        }
        else {
            alert('Error fetching courses');
        }
    });
});

function bindData(courses) {
    $.each(courses, function(index, course) {
        var $courseListItem = $('<li class="box"></li>');
        $courseListItem.append('<h2>' + course.name + '</h2>');
        $courseListItem.append('<p>' + course.description + '</p>');

        if (course.studies.length === 0) {
            $courseListItem.append('<p class="no-links-msg">There are no studies for this course</p>')
        }
        else {
            var $studyList = $('<ul class="study-link-list"></ul>');
            $courseListItem.append($studyList);

            $.each(course.studies, function(index, study) {
                $studyList.append('<li><a href="/html-mockup/mobile_study.html?studyId=' + study.id + '">' + study.name + '</a></li>');
            });
        }

        $('#courseList').append($courseListItem);
    });
}