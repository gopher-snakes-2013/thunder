describe('Thunder', function () {
  describe('.run', function() {
    beforeEach(function() {
      var talkDOM = affix('.talk');
      talkDOM.affix('.add-note-link');
      talkDOM.affix('.add-note-form')

      // Think of the DOM like a database. We're inserting HTML into it so we
      // can actually test that it behaves properly given the  structure of the
      // data

      // That's what affix does for us. It inserts HTML into the DOM which it
      // reverse engineers from CSS Selectors.


      Thunder.run();
    });

    it("hides the add-note-form", function() {
      expect($('.add-note-form')).toHaveClass('hidden');
    })

    it("shows the add-note-form when the add-note-link is clicked", function() {
      $('.add-note-link').click();

      expect($('.add-note-form')).not.toHaveClass('hidden');
    });
    it("hides the add-note-link when it is clicked", function() {
      $('.add-note-link').click();

      expect($('.add-note-link')).toHaveClass('hidden');
    });
  });
});

