describe('AddTalkFormView', function () {
  describe('When the #suggest-talk-form is submitted', function() {
    it("preventsDefault", function() {
      var $suggestTalkForm = affix('form#suggest-talk-form');
      // Here we're injecting a form into the DOM to test against.
 
      // Test code does not have access to the HTML  our sinatra application
      // creates. This is a good thing, TM, as it forces us to think about how
      // to structure our HTML to interact with the JavaScript


      jasmine.JQuery.events.spyOn('#suggest-talk-form', 'submit');
      // Here we're using jasmine-jquery to spy on the submit event for the
      // form we created.

      var talkFormView = new AddTalkFormView();
      // Now we're actually creating a new AddTalkFormView!

      $('#suggest-talk-form').submit();

      expect('submit').toHaveBeenPreventedOn('#suggest-talk-form');
    });

  });
});

