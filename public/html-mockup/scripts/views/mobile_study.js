var currentPassageIndex = 0;
var passages;
var studyTimer;

var passages = [
    {
        name: 'Acts 2:1-4',
        text: 'When the day of Pentecost had come, they were all together in one place. 2 And suddenly a sound came from heaven like the rush of a mighty wind, and it filled all the house where they were sitting. 3 And there appeared to them tongues as of fire, distributed and resting on each one of them. 4 And they were all filled with the Holy Spirit and began to speak in other tongues, as the Spirit gave them utterance.',
        duration: 30 * 60,
        annotations: [
            {text: 'Question 1 which is very long and will test to see what happens with wordwrap here.', annotationType: 1},
            {text: 'Question 2', annotationType: 1},
            {text: 'Question 3', annotationType: 1}
        ]
    },
    {
        name: '1 Cor 13:1-3',
        text: 'If I speak in the tongues of men and of angels, but have not love, I am a noisy gong or a clanging cymbal. 2 And if I have prophetic powers, and understand all mysteries and all knowledge, and if I have all faith, so as to remove mountains, but have not love, I am nothing. 3 If I give away all I have, and if I deliver my body to be burned,[a] but have not love, I gain nothing.',
        duration: 60,
        annotations: [
            {text: 'Question 4', annotationType: 1},
            {text: 'Note 1', annotationType: 2},
            {text: 'Question 5', annotationType: 1}
        ]
    },
    {
        name: 'John 3:1-3',
        text: ' Now there was a man of the Pharisees, named Nicode′mus, a ruler of the Jews. 2 This man came to Jesus[a] by night and said to him, “Rabbi, we know that you are a teacher come from God; for no one can do these signs that you do, unless God is with him.” 3 Jesus answered him, “Truly, truly, I say to you, unless one is born anew,[b] he cannot see the kingdom of God.”',
        duration: 10,
        annotations: [
            {text: 'Note 2', annotationType: 2},
            {text: 'Note 3', annotationType: 1}
        ]
    }
];

$(function() {
    studyTimer = new Timer(qs('.timer-btn'), 0);
    listenForSwipes();
    fetchData();
});

function listenForSwipes() {
    $('#studyBody').on('swiperight', function(e) {
        if (currentPassageIndex > 0) {
            currentPassageIndex--;
            bindCurrentPassage()
        }
    });

    $('#studyBody').on('swipeleft', function(e) {
        if (currentPassageIndex < passages.length-1) {
            currentPassageIndex++;
            bindCurrentPassage()
        }
    });
}

function fetchData() {
    var url = window.location.search;
    var queryParameter = '?studyId=';
    var studyId = url.substring(url.indexOf(queryParameter) + queryParameter.length);

    var serviceUrl = '/api/v1/studies/' + studyId;
    $.getJSON(serviceUrl, function(response) {
        if (response.status == 'success') {
            bindData(response.data);
        }
        else {
            alert('Error fetching study');
        }
    });
}

function renderStudy(data) {
    var prefix = data.prefix;
    var passage = data.passage;

    var docFrag = document.createDocumentFragment();

    var $h2 = $('<h2 class="content-col"/>').text(prefix + ' ' + passage.name);
    var $p = $('<p class="content-col"/>').text(passage.text);
    var $docFrag = $(docFrag);
    $docFrag.append($h2).append($p);

    if (passage.annotations.length !== 0) {
        $annotationList = $('<ul class="verse-notes no-bullets content-col"></ul>');
        $.each(passage.annotations, function(index, annotation) {
            var $label = $('<label/>').append($('<input type="checkbox">')).append(annotation.text);
            var $annotationElement = $('<li class="passageAnnotation"/>').append($label);
            $annotationElement.on('change', function() {
                $annotationElement.toggleClass('annotationRead');
            });

            $annotationList.append($annotationElement);
        })

        $docFrag.append($annotationList);
    }
    return $docFrag;
}

function bindCurrentPassage() {
    var $studyContent = $('#studyContent');
    $studyContent.fadeOut('fast', function() {
        var prefix = '';
        if (passages.length > 1) {
            prefix = 'Reading ' + (currentPassageIndex + 1) + '/' + passages.length + ':';
        }

        var passage = passages[currentPassageIndex];
        $studyContent.empty();

        $studyContent.append(renderStudy({
            prefix: prefix,
            passage: passage
        }));

        studyTimer.reset(passage.duration);
        $studyContent.fadeIn('fast');
    });
}

function bindData(study) {
    // Set name.
    $('#studyTitle').text(study.name);

    bindCurrentPassage();
}

// setup modal
var filterModal = new Modal('filter');
on(qs('.show-filters-btn'), 'click', function filterButtonClick() {
    filterModal.show();
});