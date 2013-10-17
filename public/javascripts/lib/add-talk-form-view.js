function AddTalkFormView() {
  this.$form = $('#suggest-talk-form');
  var self = this;
  // We're caching access to `this` because the fail callback changes what
  // `this` is.

  this.$form.on('submit', function(e) {
    e.preventDefault();
    self.saveTalk();
  });
}

AddTalkFormView.prototype.saveTalk = function() {
  var talk = new Talk({ name: $('#talk-name').val() });

  var self = this;
  talk.save().done(function(response) {
    self.appendTalk(response);
  }).fail(function(response) {
    self.appendError(response);
  });
}

AddTalkFormView.prototype.appendTalk = function(talkHtml) {
  $('#suggested-talks .talks').prepend(talkHtml);
}

AddTalkFormView.prototype.appendError = function(errorHtml) {
  this.$form.find('.errors').append(errorHtml);
}
