describe('Thunder', function () {
  describe('.run', function() {
    it("calls Thunder.createTalkView", function() {
      spyOn(Thunder, 'createTalkView');
      Thunder.run();
      expect(Thunder.createTalkView).toHaveBeenCalled();
    });
  });
});

