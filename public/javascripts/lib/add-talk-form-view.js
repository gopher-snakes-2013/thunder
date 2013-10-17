function AddTalkFormView() {
  this.$form = $('#suggest-talk-form');
  this.$form.on('submit', function(e) {
    e.preventDefault();
    talk = new Talk({ name: $('#talk-name').val() });
    talk.save().done(function(response) {
      $('#suggested-talks .talks').prepend(response);
    });
  });

}
