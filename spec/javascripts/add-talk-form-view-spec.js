describe('AddTalkFormView', function () {
  describe('When the #suggest-talk-form is submitted', function() {
    var fakeTalk, saveTalkRequest;

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


      saveTalkRequest = $.Deferred()
      // We know save returns a deferred object, so let's give it one we
      // control. This let's us say whether or not the save worked or not.

      fakeTalk = {
        save: sinon.stub().returns(saveTalkRequest)
      };
      // We're creating a fake Talk so we can intercept interactions to save
      // and prevent it from actually trying to send the data to the server.

      spyOn(window, 'Talk').andReturn(fakeTalk);
      // We're spying on the global Talk object so we can tell what it was
      // called with, as well as make sure it returns a fake talk that doesn't
      // actually hit the server.

        $('#talk-name').val('The secret world of object espionage');

        $('#suggest-talk-form').submit();
    });

    it("preventsDefault", function() {
      expect('submit').toHaveBeenPreventedOn('#suggest-talk-form');
    });

    it("creates a new talk with the data in the form", function() {
      expect(Talk).toHaveBeenCalledWith({ name: "The secret world of object espionage" });
    });

    it("saves the new talk object", function() {
      expect(fakeTalk.save).toHaveBeenCalled();
    });

    describe("when the save completes successfuly", function() {
      it("prepends the servers response to the suggested talks list.", function() {

        affix('#suggested-talks .talks');
        var serverResponse = "<h1>The secret world of object espionage</h1>"
        saveTalkRequest.resolve(serverResponse);
        // The `deferred.resolve` method says that the save completed
        // successfuly.

        expect($('#suggested-talks .talks:eq(0)')).toHaveHtml(serverResponse)
      });

    });
  });
});

