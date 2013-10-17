describe('AddTalkFormView', function () {
  describe('When the #suggest-talk-form is submitted', function() {
    beforeEach(function() {
      affix('form#suggest-talk-form input#talk-name');
      // Here we're injecting a form into the DOM to test against.
 
      // Test code does not have access to the HTML  our sinatra application
      // creates. This is a good thing, TM, as it forces us to think about how
      // to structure our HTML to interact with the JavaScript


      jasmine.JQuery.events.spyOn('#suggest-talk-form', 'submit');
      // Here we're using jasmine-jquery to spy on the submit event for the
      // form we created.

      new AddTalkFormView();
      // Now we're actually creating a new AddTalkFormView!
    });

    it("preventsDefault", function() {

      $('#suggest-talk-form').submit();
      expect('submit').toHaveBeenPreventedOn('#suggest-talk-form');
    });

    it("creates a new talk with the data in the form", function() {
      spyOn(window, 'Talk')
      // Here we're saying let's spy on the global Talk object so we can tell
      // what it was called with.

      // This allows us to make assertions that we're interacting with the Talk
      // object appropriately.

      // This is a form of coupling, but it allows us to test the TalkFormView
      // without testing the behavior of the Talk object.

      // This makes our life much easier, as we no longer have to worry about
      // AJAX in our views.

      $('#talk-name').val('The secret world of object espionage');
      // Update the form in the DOM to have a known value we can assert against.

      $('#suggest-talk-form').submit();
      // Here's our "act" in the arrange/act/assert cycle.

      expect(Talk).toHaveBeenCalledWith({ name: "The secret world of object espionage" });
      // And finally, our assert. Here we're ensuring submitting the form creates
      // a new Talk with the attributes it pulled from the DOM.

      // A lot of work, huh?
    });
  });
});

