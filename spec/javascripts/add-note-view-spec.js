describe('Thunder.createAddNoteView', function () {
  beforeEach(function () {
    var talkDOM = affix('.talk');
    talkDOM.affix('.add-note-link');
    var addNoteFormDOM = talkDOM.affix('.add-note-form')
    addNoteFormDOM.affix('.cancel');

    // Think of the DOM like a database. We're inserting HTML into it so we
    // can actually test that it behaves properly given the  structure of the
    // data

    // That's what affix does for us. It inserts HTML into the DOM which it
    // reverse engineers from CSS Selectors.
    Thunder.createAddNoteView();
  });
  it("hides the add-note-form", function() {
    expect($('.add-note-form')).toHaveClass('hidden');
  })

  context("After clicking the add-note-link", function() {
    beforeEach(function() {
      $('.add-note-link').click();
    });

    it("shows the add-note-form", function() {
      expect($('.add-note-form')).not.toHaveClass('hidden');
    });

    it("hides the add-note-link", function() {
      expect($('.add-note-link')).toHaveClass('hidden');
    });

    context("and canceling the note adding", function() {
      beforeEach(function() {
        $('.add-note-form .cancel').click();
      });

      it("hides the add-note-form", function() {
        expect($('.add-note-form')).toHaveClass('hidden');
      });

      it("shows the add-note-link", function() {
        expect($('.add-note-link')).not.toHaveClass('hidden');
      });
    });
  });
});

