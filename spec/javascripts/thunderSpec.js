describe('Thunder', function () {
  describe('.run', function() {
    it("sets up it's talksView", function() {
      Thunder.run();
      expect(Thunder.talksView instanceof TalksView).toBeTruthy();
    });
  });
});

