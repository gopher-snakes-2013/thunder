Thunder.createAddNoteView = function() {
  var $addNoteForm = $('.add-note-form');
  var $addNoteLink = $('.add-note-link');
  // Note that the $ is just a convention to indicate that this is a cached
  // reference to a jQuery Element.

  $addNoteForm.addClass('hidden');
  $addNoteLink.on('click', function(evnt) {
    evnt.preventDefault();
    // event is a reserved word in JavaScript

    $addNoteForm.removeClass('hidden');
    $(this).addClass('hidden');
    // What do you think `this` references?
  });

  $addNoteForm.find('.cancel').on('click', function(evnt) {
    evnt.preventDefault();
    $addNoteForm.addClass('hidden');
    $addNoteLink.removeClass('hidden');
  });
}
