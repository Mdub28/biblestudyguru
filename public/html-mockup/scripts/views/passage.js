$(document).on('mouseup', function() {
    var selection = document.getSelection();
    if (selection.toString() != '') {
        var selectedText = selection.toString();

        var $startParent = $(selection.baseNode.parentNode);
        var startReference = $startParent.data('reference');
        var startOffset = selection.baseOffset;

        var $endParent = $(selection.extentNode.parentNode);
        var endReference = $endParent.data('reference');
        var endOffset = selection.extentOffset;

        if (startReference && endReference) {
            // alert('Start: ' + startReference + ' (Character ' + startOffset + ') \n Ends: ' + endReference + ' (Character ' + endOffset + ')');
            $('.add-annotation-form blockquote').text(selectedText);
            addAnnotationModal.show();
        }
    }
});

var addAnnotationModal = new Modal('add-annotation');
$('.add-annotation-form').submit(function(event) {
    event.preventDefault();

});