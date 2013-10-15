describe('Thunder.createTalkView', function () {
  var talk1DOM, talk2DOM;

  function buildOutTalkDom(num) {
    var talkDOM = affix('#talk-'+num+'.talk');
    talkDOM.affix('.add-note-link');

    var addNoteFormDOM = talkDOM.affix('.add-note-form')
    addNoteFormDOM.affix('.cancel');
    return talkDOM;
  }
  beforeEach(function () {
    talk1DOM = buildOutTalkDom(1);
    talk2DOM = buildOutTalkDom(2);

    // Think of the DOM like a database. We're inserting HTML into it so we
    // can actually test that it behaves properly given the  structure of the
    // data

    // That's what affix does for us. It inserts HTML into the DOM which it
    // reverse engineers from CSS Selectors.
    Thunder.createTalkView();
  });

  it("hides all talks add-note-form", function() {
    expect($('.add-note-form')).toHaveClass('hidden');
  })

  context("After clicking talk1s add-note-link", function() {
    beforeEach(function() {
      talk1DOM.find('.add-note-link').click();
    });

    it("shows talk-1s add-note-form", function() {
      expect(talk1DOM.find('.add-note-form')).not.toHaveClass('hidden');
    });

    it("hides talk-1s add-note-link", function() {
      expect(talk1DOM.find('.add-note-link')).toHaveClass('hidden');
    });

    it("doesn't hide talk-2s add-note-link", function() {
      expect(talk2DOM.find('.add-note-link')).not.toHaveClass('hidden');
    });
    it("doesn't show talk-2s add-note-form", function() {
      expect(talk2DOM.find('.add-note-form')).toHaveClass('hidden');

    });

    context("and canceling the note adding", function() {
      beforeEach(function() {
        talk1DOM.find('.add-note-form .cancel').click();
      });

      it("hides the add-note-form", function() {
        expect(talk1DOM.find('.add-note-form')).toHaveClass('hidden');
      });

      it("shows the add-note-link", function() {
        expect(talk1DOM.find('.add-note-link')).not.toHaveClass('hidden');
      });
    });
  });
});

