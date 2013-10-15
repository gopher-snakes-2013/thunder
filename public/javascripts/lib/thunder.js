Thunder = {
  run: function() {
    $('.add-note-form').addClass('hidden');

    $('.add-note-link').on('click', function() {
      $('.add-note-form').removeClass('hidden');
      $(this).addClass('hidden');
    });
  }
}
