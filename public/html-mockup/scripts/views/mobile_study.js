var currentPassageIndex = 0;
var studyTimer;
var passages;

$(function() {
    studyTimer = new Timer(qs('.timer-btn'), 0);
    listenForSwipes();
    fetchData();
});

function listenForSwipes() {
    $(document).on('swiperight', function(e) {
        if (currentPassageIndex > 0) {
            currentPassageIndex--;
            bindCurrentPassage()
        }
    });

    $(document).on('swipeleft', function(e) {
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
            var study = response.data;
            $('#studyTitle').text(study.name);
            passages = study.study_passages;
            bindCurrentPassage();
        }
        else {
            alert('Error fetching study');
        }
    });
}

function renderStudy(data) {
    var study_passage = data.passage;
    var prefix = data.prefix;

    var $docFrag = $(document.createDocumentFragment());

    var $h2 = $('<h2 class="content-col"/>').text(prefix + ' ' + buildPassageReference(study_passage.bible_passage));
    $docFrag.append($h2);

    $.each(study_passage.bible_passage.chapters, function(index, chapter) {
        var $chapterTitle = $('<p class="content-col"/>').text(chapter.chapter_title).attr('data-filter', 3);
        $docFrag.append($chapterTitle);

        $.each(chapter.verses, function(index, verse) {
            var $verse = $('<p class="content-col"/>').attr('data-filter', 3);
            $docFrag.append($verse);

            var $verseNumber = $('<sup/>').text(verse.verse_number);
            var $verseText = $('<span/>').text(verse.content);
            $verse.append($verseNumber);
            $verse.append($verseText);
        });
    });

    if (study_passage.annotations.length !== 0) {
        $annotationList = $('<ul class="verse-notes no-bullets content-col"></ul>');
        $.each(study_passage.annotations, function(index, annotation) {
            var $label = $('<label/>').append($('<input type="checkbox">')).append(annotation.annotation_type.description + ': ' + annotation.content);
            var $annotationElement = $('<li class="passageAnnotation"/>').attr('data-filter', annotation.annotation_type.description).append($label);
            $annotationElement.on('change', function() {
                $annotationElement.toggleClass('annotationRead');
            });

            $annotationList.append($annotationElement);
        });

        $docFrag.append($annotationList);
    }
    return $docFrag;
}

function buildPassageReference(bible_passage) {
    var firstChapter = bible_passage.chapters[0];
    var firstVerseNo = firstChapter.verses[0].verse_number;
    var lastChapter = bible_passage.chapters[bible_passage.chapters.length - 1];
    var lastVerseNo = lastChapter.verses[lastChapter.verses.length - 1].verse_number;

    var firstChapterNo = firstChapter.chapter_id;
    var lastChapterNo = lastChapter.chapter_id;

    if (firstChapterNo === lastChapterNo) {
        return bible_passage.description + ' ' + firstChapterNo + ':' + firstVerseNo + '-' + lastVerseNo;
    }
    else {
        return bible_passage.description + ' ' + firstChapterNo + ':' + firstVerseNo + '-' + lastChapterNo + ':' + lastVerseNo;
    }
}

function bindCurrentPassage() {
    $checkboxes.prop('checked', true);

    var $studyContent = $('#studyContent');
    $studyContent.fadeOut('fast', function() {
        var prefix = '';
        if (passages.length > 1) {
            prefix = 'Reading ' + (currentPassageIndex + 1) + '/' + passages.length + ':';
        }

        var passage = passages[currentPassageIndex];
        $studyContent.empty();

        if (passage) {
            $studyContent.append(renderStudy({
                prefix: prefix,
                passage: passage
            }));

            studyTimer.reset(passage.duration_in_minutes);
        }
        else {
            var $noPassagesMessage = $('<em class="content-col"/>').text('No passages found in this Study :,-(');
            $studyContent.append($noPassagesMessage);
        }
        $studyContent.fadeIn('fast');
    });
}

// setup modal
var filterModal = new Modal('filter');
$('.show-filters-btn').click(function() {
    filterModal.show();
});


// filtering
var $checkboxes = $('.filters input[type=checkbox]');
$checkboxes.change(function() {
    // hide all filterable content
    $('#studyContent').find('[data-filter]').hide();


    // show content that matches a checked checkbox

    // turn names of checked checkboxes into a selector:
    // [data-filter=name1],[data-filter=name2]
    var selector = $checkboxes.filter(function(i, checkbox) {
        return checkbox.checked;
    }).map(function(i, checkbox) {
        return '[data-filter=' + checkbox.name + ']';
    }).get().join(',');

    $('#studyContent').find(selector).show();
})