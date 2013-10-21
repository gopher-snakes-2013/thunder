function TalksView() {
  this.addTalkFormView = new AddTalkFormView();
  var $talks = $('.talk');
  // Note that the $ is just a convention to indicate that this is a cached
  // reference to a jQuery Element.

  $talks.each(function(k, talkHTMLElement) {
    $talk = $(talkHTMLElement);
    var $addNoteForm = $talk.find('.add-note-form');
    var $addNoteLink = $talk.find('.add-note-link');

    $addNoteForm.addClass('hidden');
    $addNoteLink.on('click', function(evnt) {
      evnt.preventDefault();
      // event is a reserved word in JavaScript

      $addNoteForm.removeClass('hidden');
      $addNoteLink.addClass('hidden');
    });

    $addNoteForm.find('.cancel').on('click', function(evnt) {
      evnt.preventDefault();
      $addNoteForm.addClass('hidden');
      $addNoteLink.removeClass('hidden');
    });
  });
}
