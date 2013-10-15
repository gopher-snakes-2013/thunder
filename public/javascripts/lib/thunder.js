Thunder = {
  run: function() {
    $('.add-note-form').addClass('hidden');

    $('.add-note-link').on('click', function(evnt) {
      evnt.preventDefault();
      // event is a reserved word in JavaScript

      $('.add-note-form').removeClass('hidden');
      $(this).addClass('hidden');
    });

    $('.add-note-form .cancel').on('click', function(evnt) {
      evnt.preventDefault();
      $('.add-note-form').addClass('hidden');
      $('.add-note-link').removeClass('hidden');
    });
  }
}
