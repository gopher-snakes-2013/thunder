describe('AddTalkFormView', function () {
  var $suggestedTalkForm, addTalkFormView;
  beforeEach(function() {
    $suggestedTalkForm = affix('form#suggest-talk-form input#talk-name');
    $suggestedTalkForm.affix('.errors');
    affix('#suggested-talks .talks');

    // Here we're setting up a fake version of the DOM

    // Test code does not have access to the HTML  our sinatra application
    // creates. This is a good thing, TM, as it forces us to explicitely
    // declare in our tests what the JavaScript expects the DOM to look like.


    addTalkFormView = new AddTalkFormView();
    // Now we're actually creating a new AddTalkFormView!


  });

  describe('When the #suggest-talk-form is submitted', function() {

    beforeEach(function() {
      jasmine.JQuery.events.spyOn('#suggest-talk-form', 'submit');
      // Here we're using jasmine-jquery to spy on the submit event for the
      // form we created.
      spyOn(addTalkFormView, 'saveTalk')
      $('#suggest-talk-form').submit();
    });

    it("preventsDefault", function() {
      expect('submit').toHaveBeenPreventedOn('#suggest-talk-form');
    });
    it("saves the talk", function() {
      expect(addTalkFormView.saveTalk).toHaveBeenCalled();
    });
  });

  describe('#saveTalk', function() {
    var fakeTalk, saveTalkRequest;
    beforeEach(function() {

      fakeTalk = new FakeTalk();
      // We're creating a fake Talk so we can intercept interactions to save
      // and prevent it from actually trying to send the data to the server.

      spyOn(window, 'Talk').andReturn(fakeTalk);
      // We're spying on the global Talk object so we can tell what it was
      // called with, as well as make sure it returns a fake talk that doesn't
      // actually hit the server.

      $('#talk-name').val('The secret world of object espionage');

      addTalkFormView.saveTalk();
    });
    describe("when the save completes successfuly", function() {
      it("prepends the servers response to the suggested talks list.", function() {
        var serverResponse = "<h1>The secret world of object espionage</h1>";

        fakeTalk.pretendSaveWorked(serverResponse);

        expect($('#suggested-talks .talks:eq(0)')).toHaveHtml(serverResponse)
      });
    });
    describe("when the save fails", function() {
      it("adds an error to the #suggested-talk-form .errors", function() {
        var serverResponse = "Nope, chuck testa";

        fakeTalk.pretendSaveFailed(serverResponse);

        expect($('#suggest-talk-form .errors')).toHaveText(serverResponse)
      });
    });
  });
});
