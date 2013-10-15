Thunder = {
  run: function() {
    $('.add-note-form').addClass('hidden');

    $('.add-note-link').on('click', function(evnt) {
      evnt.preventDefault();
      $('.add-note-form').removeClass('hidden');
      $(this).addClass('hidden');
    });
  }
}
