describe('Thunder', function () {
  describe('.run', function() {
    it("calls Thunder.createAddNoteView", function() {
      spyOn(Thunder, 'createAddNoteView');
      Thunder.run();
      expect(Thunder.createAddNoteView).toHaveBeenCalled();
    });
  });
});

